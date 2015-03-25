using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using vpro.functions;
using Model;
using System.Web.UI.HtmlControls;
using Controller;

namespace CatTrang.vi_vn
{
    public partial class quanlytimviecNTV : System.Web.UI.Page
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private VL_News news = new VL_News(); 
        private Function fun = new Function();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null && Session["user_fullname"] != null && Session["user_quyen"] != null && Utils.CIntDef(Session["user_quyen"]) == 1)
                {
                    LoadVieclamdaluu(Utils.CIntDef(Session["userId"]), 0, 0, 0, 0, 0, 0, 1);
                    LoadVieclamdaungtuyen(Utils.CIntDef(Session["userId"]), 0, 0, 0, 0, 0, 0, 1);
                    LoadVieclamdaxem(Utils.CIntDef(Session["userId"]), 0, 0, 0, 0, 0, 0, 1);
                    LoadNTDXemHoso();
                    LoadVieclamNTD(Utils.CIntDef(Session["userId"]), 0, 0, 0, 0, 0, 0, 5);
                    Load_hosoDadang(Utils.CIntDef(Session["userId"]), 0, 0, 1);
                }
                else
                {
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản người tìm việc!');location.href='/trang-chu.html'</script>");
                }
            }
        }
        private void LoadVieclamdaluu(int customerId, int nganhnghe, int mucluong, int capbac, int diadiem, int bangcap, int kinhnghiem, int sortId)
        {
            var list = news.GetCustomer_EshopNewsByCustomerId(customerId, nganhnghe, mucluong, capbac, diadiem, bangcap, kinhnghiem, 1);//1 lưu, 2 ứng tuyển, 3 đã xem
            Session["NewsList"] = DataUtil.LINQToDataTable(list);
            switch (sortId)
            {
                //case 1:
                //    list = list.OrderByDescending(n => n.NEWS_UPDATE).ToList();
                //    break;
                //case 2:
                //    list = list.OrderBy(n => n.NEWS_UPDATE).ToList();
                //    break;
                case 5:
                    list = list.OrderByDescending(n => n.NEWS_PUBLISHDATE).ToList();
                    break;
                case 6:
                    list = list.OrderBy(n => n.NEWS_UPDATEFRERESH).ToList();
                    break;
                case 7:
                    list = list.OrderByDescending(n => n.NEWS_DEALINE).ToList();
                    break;
                case 8:
                    list = list.OrderBy(n => n.NEWS_DEALINE).ToList();
                    break;
                case 9:
                    list = list.OrderByDescending(n => n.NEWS_COUNT).ToList();
                    break;
                case 10:
                    list = list.OrderBy(n => n.NEWS_COUNT).ToList();
                    break;
                default:
                    break;
            }

            lbCountVLDaluu.Text = Utils.CStrDef(list.Count);
            GridItemListVLDaluu.DataSource = list;
            GridItemListVLDaluu.DataBind();
        }
        public string getTenCongty(object ott)
        {
            int tt = Utils.CIntDef(ott);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == tt);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].CUSTOMER_FULLNAME;
            }
            return "";
        }
        public string getnoilamviec(object ott)
        {
            string s = "";
            int tt = Utils.CIntDef(ott);
            var litem = db.VL_AREA_ESHOP_NEWs.Where(n => n.NEWS_ID == tt);
            foreach (var item in litem)
            {
                var itemArea = db.VL_AREAs.Where(n => n.ARE_ID == item.AREA_ID);
                if (itemArea != null && itemArea.ToList().Count > 0)
                {
                    s += "<br />" + itemArea.ToList()[0].ARE_NAME;
                }

            }
            return s;
        }
        public string getMucluong(object ott)
        {
            int id = Utils.CIntDef(ott);
            var item = db.VL_MUCLUONGs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getNgayluu(object newsId, object customerId)
        {
            int _newsId = Utils.CIntDef(newsId);
            int _customerId = Utils.CIntDef(customerId);
            var item = db.VL_CUSTOMER_ESHOP_NEWs.Where(n => n.CUSTOMER_ID == _customerId && n.NEWS_ID == _newsId);
            if (item != null && item.ToList().Count > 0)
            {
                return string.Format("{0:dd/MM/yyyy}", item.ToList()[0].PUBLISHDATE);
            }
            return "";
        }
        protected void lnkXoaVLDaluu_Click(object sender, EventArgs e)
        {
            LinkButton lnkXoa = (LinkButton)sender;
            int newsId = Utils.CIntDef(lnkXoa.CommandArgument);
            int customerId = Utils.CIntDef(Session["userId"]);
            var g_delete = db.GetTable<VL_CUSTOMER_ESHOP_NEW>().Where(g => g.NEWS_ID == newsId && g.CUSTOMER_ID == customerId && g.TYPE == 1);

            db.VL_CUSTOMER_ESHOP_NEWs.DeleteAllOnSubmit(g_delete);
            db.SubmitChanges();

            LoadVieclamdaluu(Utils.CIntDef(Session["userId"]), 0, 0, 0, 0, 0, 0, 1);
        }
        protected void lnkUngtuyenVLDaluu_Click(object sender, EventArgs e)
        {
            LinkButton lnkUngtuyen = (LinkButton)sender;
            int newsId = Utils.CIntDef(lnkUngtuyen.CommandArgument);
            int customerId = Utils.CIntDef(Session["userId"]);
            var g_ungtuyen = db.GetTable<VL_CUSTOMER_ESHOP_NEW>().Where(g => g.NEWS_ID == newsId && g.CUSTOMER_ID == customerId && g.TYPE == 2);

            if (g_ungtuyen != null && g_ungtuyen.ToList().Count > 0)
            {
            }
            else
            {
                VL_CUSTOMER_ESHOP_NEW g_ins = new VL_CUSTOMER_ESHOP_NEW();
                g_ins.CUSTOMER_ID = customerId;
                g_ins.NEWS_ID = newsId;
                g_ins.PUBLISHDATE = DateTime.Now;
                g_ins.TYPE = 2;
                db.VL_CUSTOMER_ESHOP_NEWs.InsertOnSubmit(g_ins);
                db.SubmitChanges();
            }
            LoadVieclamdaungtuyen(Utils.CIntDef(Session["userId"]), 0, 0, 0, 0, 0, 0, 1);
        }
        private void LoadVieclamdaungtuyen(int customerId, int nganhnghe, int mucluong, int capbac, int diadiem, int bangcap, int kinhnghiem, int sortId)
        {
            var list = news.GetCustomer_EshopNewsByCustomerId(customerId, nganhnghe, mucluong, capbac, diadiem, bangcap, kinhnghiem, 2);//1 lưu, 2 ứng tuyển
            Session["NewsList"] = DataUtil.LINQToDataTable(list);
            switch (sortId)
            {
                //case 1:
                //    list = list.OrderByDescending(n => n.NEWS_UPDATE).ToList();
                //    break;
                //case 2:
                //    list = list.OrderBy(n => n.NEWS_UPDATE).ToList();
                //    break;
                case 5:
                    list = list.OrderByDescending(n => n.NEWS_PUBLISHDATE).ToList();
                    break;
                case 6:
                    list = list.OrderBy(n => n.NEWS_UPDATEFRERESH).ToList();
                    break;
                case 7:
                    list = list.OrderByDescending(n => n.NEWS_DEALINE).ToList();
                    break;
                case 8:
                    list = list.OrderBy(n => n.NEWS_DEALINE).ToList();
                    break;
                case 9:
                    list = list.OrderByDescending(n => n.NEWS_COUNT).ToList();
                    break;
                case 10:
                    list = list.OrderBy(n => n.NEWS_COUNT).ToList();
                    break;
                default:
                    break;
            }

            lbCountVLDaungtuyen.Text = Utils.CStrDef(list.Count);
            var listConhan = list.Where(n => n.NEWS_DEALINE != null && n.NEWS_DEALINE.Value.Date >= DateTime.Today).ToList();
            lbCountConhanVLDaungtuyen.Text = Utils.CStrDef(listConhan.Count);
            var listHethan = list.Where(n => n.NEWS_DEALINE != null && n.NEWS_DEALINE.Value.Date < DateTime.Today).ToList();
            lbCountHetnhanVLDaungtuyen.Text = Utils.CStrDef(listHethan.Count);
            GridItemListVLDaungtuyen.DataSource = list;
            GridItemListVLDaungtuyen.DataBind();
        }
        protected void lnkHuyungtuyenVLDaungtuyen_Click(object sender, EventArgs e)
        {
            LinkButton lnkHuyUngtuyen = (LinkButton)sender;
            int newsId = Utils.CIntDef(lnkHuyUngtuyen.CommandArgument);
            int customerId = Utils.CIntDef(Session["userId"]);
            var g_delete = db.GetTable<VL_CUSTOMER_ESHOP_NEW>().Where(g => g.NEWS_ID == newsId && g.CUSTOMER_ID == customerId && g.TYPE == 2);

            db.VL_CUSTOMER_ESHOP_NEWs.DeleteAllOnSubmit(g_delete);
            db.SubmitChanges();

            LoadVieclamdaungtuyen(Utils.CIntDef(Session["userId"]), 0, 0, 0, 0, 0, 0, 1);
        }
        private void LoadVieclamdaxem(int customerId, int nganhnghe, int mucluong, int capbac, int diadiem, int bangcap, int kinhnghiem, int sortId)
        {
            var list = news.GetCustomer_EshopNewsByCustomerId(customerId, nganhnghe, mucluong, capbac, diadiem, bangcap, kinhnghiem, 3);//1 lưu, 2 ứng tuyển, , 3 VL đã xem, 4 NTD đã xem, 5 NTD đã lưu
            Session["NewsList"] = DataUtil.LINQToDataTable(list);
            switch (sortId)
            {
                //case 1:
                //    list = list.OrderByDescending(n => n.NEWS_UPDATE).ToList();
                //    break;
                //case 2:
                //    list = list.OrderBy(n => n.NEWS_UPDATE).ToList();
                //    break;
                case 5:
                    list = list.OrderByDescending(n => n.NEWS_PUBLISHDATE).ToList();
                    break;
                case 6:
                    list = list.OrderBy(n => n.NEWS_UPDATEFRERESH).ToList();
                    break;
                case 7:
                    list = list.OrderByDescending(n => n.NEWS_DEALINE).ToList();
                    break;
                case 8:
                    list = list.OrderBy(n => n.NEWS_DEALINE).ToList();
                    break;
                case 9:
                    list = list.OrderByDescending(n => n.NEWS_COUNT).ToList();
                    break;
                case 10:
                    list = list.OrderBy(n => n.NEWS_COUNT).ToList();
                    break;
                default:
                    break;
            }
            rptVLDaxem.DataSource = list;
            rptVLDaxem.DataBind();
        }
        public string GetLinkNTV(object newsId)
        {
            try
            {
                int _newsId = Utils.CIntDef(newsId);
                var item = db.ESHOP_NEWs.FirstOrDefault(n => n.NEWS_ID == _newsId);
                string News_Url = "", News_Seo_Url = "", cat_seo = "";
                if (item != null)
                {
                    News_Url = item.NEWS_URL;
                    News_Seo_Url = item.NEWS_SEO_URL;
                    var item_2 = db.ESHOP_NEWS_CATs.FirstOrDefault(n => n.NEWS_ID == _newsId);
                    if (item_2 != null)
                    {
                        cat_seo = item_2.ESHOP_CATEGORy.CAT_SEO_URL;
                    }
                }
                return fun.Getlink_News(News_Url, News_Seo_Url, cat_seo);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        private void LoadNTDXemHoso()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            int newsId = 0;
            var list = news.GetCustomerByCustomerId(customerId, newsId, 4);

            GridItemListNTDXemHoso.DataSource = list;
            GridItemListNTDXemHoso.DataBind();
        }
        public string getTenHoso(object ott)
        {
            int tt = Utils.CIntDef(ott);
            var item = db.ESHOP_NEWs.Where(n => n.NEWS_ID == tt);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NEWS_TITLE;
            }
            return "";
        }
        public string getLuuhoso(object newsId, object customerId)
        {
            int _newsId = Utils.CIntDef(newsId);
            int _customerId = Utils.CIntDef(customerId);
            var list = db.VL_CUSTOMER_ESHOP_NEWs.Where(n => n.CUSTOMER_ID == _customerId && n.NEWS_ID == _newsId && n.TYPE == 5);
            if (list != null && list.ToList().Count > 0)
            {
                return "Đã lưu";
            }
            else
            {
                return "Chưa lưu";
            }
        }
        private void LoadVieclamNTD(int customerId, int nganhnghe, int mucluong, int capbac, int diadiem, int bangcap, int kinhnghiem, int sortId)
        {
            var list = news.GetEshopNewsByCustomerNTDId(customerId, nganhnghe, mucluong, capbac, diadiem, bangcap, kinhnghiem);
            Session["NewsList"] = DataUtil.LINQToDataTable(list);
            switch (sortId)
            {
                case 5:
                    list = list.OrderByDescending(n => n.NEWS_PUBLISHDATE).ToList();
                    break;
                case 6:
                    list = list.OrderBy(n => n.NEWS_PUBLISHDATE).ToList();
                    break;
                default:
                    break;
            }

            GridItemListNTDcuatoi.DataSource = list;
            GridItemListNTDcuatoi.DataBind();
            lbCountTinNTDcuatoi.Text = Utils.CStrDef(list.Count);
            var listNTD = db.VL_CUSTOMER_CUSTOMERs.Where(n => n.CUSTOMER_ID == customerId);
            if (listNTD != null && listNTD.ToList().Count > 0)
            {
                lbCountNTDcuatoi.Text = lbCountNTDcuatoi_2.Text = Utils.CStrDef(listNTD.ToList().Count);
            }
            var listHomnay = list.Where(n => (n.NEWS_PUBLISHDATE.Value.Date - DateTime.Today).Days == 0);
            if (listHomnay != null && listHomnay.ToList().Count > 0)
            {
                lbCountTinHomnayNTDcuatoi.Text = Utils.CStrDef(listHomnay.ToList().Count);
            }
        }
        protected void lnkUngtuyenNTDcuatoi_Click(object sender, EventArgs e)
        {
            LinkButton lnkUngtuyen = (LinkButton)sender;
            int newsId = Utils.CIntDef(lnkUngtuyen.CommandArgument);
            int customerId = Utils.CIntDef(Session["userId"]);
            var g_ungtuyen = db.GetTable<VL_CUSTOMER_ESHOP_NEW>().Where(g => g.NEWS_ID == newsId && g.CUSTOMER_ID == customerId && g.TYPE == 2);

            if (g_ungtuyen != null && g_ungtuyen.ToList().Count > 0)
            {
            }
            else
            {
                VL_CUSTOMER_ESHOP_NEW g_ins = new VL_CUSTOMER_ESHOP_NEW();
                g_ins.CUSTOMER_ID = customerId;
                g_ins.NEWS_ID = newsId;
                g_ins.PUBLISHDATE = DateTime.Now;
                g_ins.TYPE = 2;
                db.VL_CUSTOMER_ESHOP_NEWs.InsertOnSubmit(g_ins);
                db.SubmitChanges();
            }
        }
        private void Load_hosoDadang(int customerId, int nganhnghe, int loaihoso, int sortId)
        {
            var list = news.GetEshopNewsByCustomerId(customerId, nganhnghe, loaihoso);
            switch (sortId)
            {
                case 1:
                    list = list.OrderByDescending(n => n.NEWS_UPDATE).ToList();
                    break;
                case 2:
                    list = list.OrderBy(n => n.NEWS_UPDATE).ToList();
                    break;
                case 3:
                    list = list.OrderByDescending(n => n.NEWS_UPDATEFRERESH).ToList();
                    break;
                case 4:
                    list = list.OrderBy(n => n.NEWS_UPDATEFRERESH).ToList();
                    break;
                case 5:
                    list = list.OrderByDescending(n => n.NEWS_PUBLISHDATE).ToList();
                    break;
                case 6:
                    list = list.OrderBy(n => n.NEWS_PUBLISHDATE).ToList();
                    break;
                case 7:
                    list = list.OrderByDescending(n => n.NEWS_DEALINE).ToList();
                    break;
                case 8:
                    list = list.OrderBy(n => n.NEWS_DEALINE).ToList();
                    break;
                case 9:
                    list = list.OrderByDescending(n => n.NEWS_COUNT).ToList();
                    break;
                case 10:
                    list = list.OrderBy(n => n.NEWS_COUNT).ToList();
                    break;
                default:
                    break;
            }

            GridItemListHosodadang.DataSource = list;
            GridItemListHosodadang.DataBind();
            LoadLoaiHoso();
        }
        public string getTinhtranghoso(object ott)
        {
            int tt = Utils.CIntDef(ott);
            switch (tt)
            {
                case 1:
                    return "Đang chờ duyệt";
                case 2:
                    return "Đã đăng";
                case 3:
                    return "Đang ẩn";
                case 4:
                    return "Nháp";
                case 5:
                    return "Xóa tạm";
                case 6:
                    return "Hết hạn";
                default:
                    return "N/A";
            }
        }
        private void LoadLoaiHoso()
        {
            var list = news.GetEshopNewsByCustomerId(Utils.CIntDef(Session["userId"]), 0, 0);
            if(list != null && list.Count > 0)
            {
                lbCountTao_HosoDadang.Text = list.Count.ToString();
            }
            var listDangchoduyet = list.Where(n => n.TINHTRANGHOSO == 1);
            if (listDangchoduyet != null && listDangchoduyet.ToList().Count > 0)
            {
                lbCountChoduyet_HosoDadang.Text = listDangchoduyet.ToList().Count.ToString();
            }
            var listDadang = list.Where(n => n.TINHTRANGHOSO == 2);
            if (listDadang != null && listDadang.ToList().Count > 0)
            {
                lbCountDadang_HosoDadang.Text = listDadang.ToList().Count.ToString();
            }
            var listDangan = list.Where(n => n.TINHTRANGHOSO == 3);
            if (listDangan != null && listDangan.ToList().Count > 0)
            {
                lbCountAn_HosoDadang.Text = listDangan.ToList().Count.ToString();
            }
            var listNhap = list.Where(n => n.TINHTRANGHOSO == 4);
            if (listNhap != null && listNhap.ToList().Count > 0)
            {
                lbCountNhap_HosoDadang.Text = listNhap.ToList().Count.ToString();
            }
            var listXoatam = list.Where(n => n.TINHTRANGHOSO == 5);
            if (listXoatam != null && listXoatam.ToList().Count > 0)
            {
                lbCountXoatam_HosoDadang.Text = listXoatam.ToList().Count.ToString();
            }
            var listHethan = list.Where(n => n.TINHTRANGHOSO == 6);
            if (listHethan != null && listHethan.ToList().Count > 0)
            {
                lbCountHethan_HosoDadang.Text = listHethan.ToList().Count.ToString();
            }
        }
        public string GetShortName(object obj, int lenght)
        {
            string strObj = Utils.CStrDef(obj);
            if (strObj.Length >= lenght)
            {
                return strObj.Substring(0, lenght - 3) + "...";
            }
            return strObj;
        }
    }
}