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
                    LoadVieclamdaxem();
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
            int i = 0;
            foreach (var item in litem)
            {
                var itemArea = db.VL_AREAs.Where(n => n.ID == item.AREA_ID);
                if (itemArea != null && itemArea.ToList().Count > 0)
                {
                    if (i == 0)
                    {
                        s += itemArea.ToList()[0].NAME;
                    }
                    else
                    {
                        s += "<br />" + itemArea.ToList()[0].NAME;
                    }
                    i++;
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
        public string getNgayluu(object newsId)
        {
            int _customerId = Utils.CIntDef(Session["userId"]);
            int _newsId = Utils.CIntDef(newsId);
            var item = db.VL_CUSTOMER_ESHOP_NEWs.Where(n => n.CUSTOMER_ID == _customerId && n.NEWS_ID == _newsId && n.TYPE == 1);
            if (item != null && item.ToList().Count > 0)
            {
                return string.Format("{0:dd/MM/yyyy}", item.ToList()[0].PUBLISHDATE);
            }
            return "";
        }
        public string getNgayungtuyen(object newsId)
        {
            int _newsId = Utils.CIntDef(newsId);
            int _customerId = Utils.CIntDef(Session["userId"]);
            var item = db.VL_CUSTOMER_ESHOP_NEWs.Where(n => n.CUSTOMER_ID == _customerId && n.NEWS_ID == _newsId && n.TYPE == 2);
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
        private void LoadVieclamdaxem()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            var list = news.GetCustomerByCustomerId(customerId, 0, 3);

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
        public string GetLinkNopHSNTV(object _sNews_Seo_Url)
        {
            return "/ntv-nop-ho-so-truc-tuyen/" + _sNews_Seo_Url;
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
            var list = db.VL_CUSTOMER_ESHOP_NEWs.Where(n => n.CUSTOMER_NTD_ID == _customerId && n.NEWS_ID_UNGTUYEN == _newsId && n.TYPE == 5);
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
                    return "Tin nháp";
                case 5:
                    return "<span style='color:red'>Xóa tạm</span>";
                case 6:
                    return "Hết hạn";
                default:
                    return "N/A";
            }
        }
        public bool setTinhtranghoso(object ott, int intTT)
        {
            int tt = Utils.CIntDef(ott);
            return tt == intTT;
        }
        #region function grid ho so da dang
        protected void lnkLammoi_Click(object sender, EventArgs e)
        {
            LinkButton lnkLammoi = (LinkButton)sender;
            int newsId = Utils.CIntDef(lnkLammoi.CommandArgument);

            var g_update = db.GetTable<ESHOP_NEW>().Where(g => g.NEWS_ID == newsId);
            if (g_update != null && g_update.ToList().Count > 0)
            {
                g_update.ToList()[0].NEWS_UPDATEFRERESH = DateTime.Now;

                db.SubmitChanges();
            }
            Response.Write("<script>alert('Tin đã làm mới thành công!');location.href='/ntv-quan-ly-tim-viec'</script>");
        }
        protected void lnkXoa_Click(object sender, EventArgs e)
        {
            LinkButton lnkXoa = (LinkButton)sender;
            int newsId = Utils.CIntDef(lnkXoa.CommandArgument);

            var g_update = db.GetTable<ESHOP_NEW>().Where(g => g.NEWS_ID == newsId);
            if (g_update != null && g_update.ToList().Count > 0)
            {
                g_update.ToList()[0].TINHTRANGHOSO = 5;

                db.SubmitChanges();
            }
            Response.Write("<script>alert('Xóa tạm hồ sơ thành công!');location.href='/ntv-quan-ly-tim-viec'</script>");
        }
        protected void lnkXoahan_Click(object sender, EventArgs e)
        {
            LinkButton lnkXoa = (LinkButton)sender;
            int newsId = Utils.CIntDef(lnkXoa.CommandArgument);

            var g_delete = db.GetTable<ESHOP_NEW>().Where(g => g.NEWS_ID == newsId);
            if (g_delete != null && g_delete.ToList().Count > 0)
            {
                db.ESHOP_NEWs.DeleteOnSubmit(g_delete.ToList()[0]);

                db.SubmitChanges();
            }
            var g_delete2 = db.GetTable<VL_CUSTOMER_ESHOP_NEW>().Where(g => g.NEWS_ID_UNGTUYEN == newsId);
            if (g_delete2 != null && g_delete2.ToList().Count > 0)
            {
                db.VL_CUSTOMER_ESHOP_NEWs.DeleteAllOnSubmit(g_delete2);

                db.SubmitChanges();
            }
            Response.Write("<script>alert('Xóa hồ sơ thành công!');location.href='/ntv-quan-ly-tim-viec'</script>");
        }
        protected void lnkKhoiphuc_Click(object sender, EventArgs e)
        {
            LinkButton lnkXoa = (LinkButton)sender;
            int newsId = Utils.CIntDef(lnkXoa.CommandArgument);

            var g_update = db.GetTable<ESHOP_NEW>().Where(g => g.NEWS_ID == newsId);
            if (g_update != null && g_update.ToList().Count > 0)
            {
                g_update.ToList()[0].TINHTRANGHOSO = 4;

                db.SubmitChanges();
            }
            Response.Write("<script>alert('Khôi phục hồ sơ thành công!');location.href='/ntv-quan-ly-tim-viec'</script>");
        }
        protected void lnkHuydanghoso_Click(object sender, EventArgs e)
        {
            LinkButton lnkXoa = (LinkButton)sender;
            int newsId = Utils.CIntDef(lnkXoa.CommandArgument);

            var g_update = db.GetTable<ESHOP_NEW>().Where(g => g.NEWS_ID == newsId);
            if (g_update != null && g_update.ToList().Count > 0)
            {
                g_update.ToList()[0].TINHTRANGHOSO = 4;

                db.SubmitChanges();
            }
            Response.Write("<script>alert('Hồ sơ đã hủy thành công!');location.href='/ntv-quan-ly-tim-viec'</script>");
        }
        protected void lnkDanghoso_Click(object sender, EventArgs e)
        {
            LinkButton lnkXoa = (LinkButton)sender;
            int newsId = Utils.CIntDef(lnkXoa.CommandArgument);

            var g_update = db.GetTable<ESHOP_NEW>().Where(g => g.NEWS_ID == newsId);
            if (g_update != null && g_update.ToList().Count > 0)
            {
                g_update.ToList()[0].TINHTRANGHOSO = 1;

                db.SubmitChanges();
            }
            Response.Write("<script>alert('Hồ sơ đã đăng thành công. Sau khi duyệt sẽ được xuất bản lên website!');location.href='/ntv-quan-ly-tim-viec'</script>");
        }
        protected void lnkAnHoso_Click(object sender, EventArgs e)
        {
            LinkButton lnkXoa = (LinkButton)sender;
            int newsId = Utils.CIntDef(lnkXoa.CommandArgument);

            var g_update = db.GetTable<ESHOP_NEW>().Where(g => g.NEWS_ID == newsId);
            if (g_update != null && g_update.ToList().Count > 0)
            {
                g_update.ToList()[0].TINHTRANGHOSO = 3;

                db.SubmitChanges();
            }
            Response.Write("<script>alert('Hồ sơ đã ẩn thành công!');location.href='/ntv-quan-ly-tim-viec'</script>");
        }
        protected void lnkHienthihoso_Click(object sender, EventArgs e)
        {
            LinkButton lnkXoa = (LinkButton)sender;
            int newsId = Utils.CIntDef(lnkXoa.CommandArgument);

            var g_update = db.GetTable<ESHOP_NEW>().Where(g => g.NEWS_ID == newsId);
            if (g_update != null && g_update.ToList().Count > 0)
            {
                g_update.ToList()[0].TINHTRANGHOSO = 2;

                db.SubmitChanges();
            }
            Response.Write("<script>alert('Hồ sơ đã hiển thị thành công!');location.href='/ntv-quan-ly-tim-viec'</script>");
        }
        #endregion
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
        public string GetLinkNTD(object newsId)
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
                return fun.Getlink_News_NTD(News_Url, News_Seo_Url, cat_seo);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetCusNameNTV(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].CUSTOMER_FULLNAME;
            }
            return "";
        }
        public string GetCusSexNTV(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                int sexid = Utils.CIntDef(item.ToList()[0].CUSTOMER_SEX);
                return sexid == 1 ? "Nam" : (sexid == 2 ? "Nữ" : "Khác");
            }
            return "";
        }
        public string GetCusTuoiNTV(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                int tuoi = DateTime.Now.Year - Utils.CDateDef(item.ToList()[0].CUSTOMER_BIRTHDAY, DateTime.Now).Year;
                return tuoi != 0 ? Utils.CStrDef(tuoi) : "N/A";
            }
            return "";
        }
        public string GetCusEmailNTV(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].CUSTOMER_EMAIL;
            }
            return "";
        }
        public string GetCusPhoneNTV(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].CUSTOMER_PHONE1;
            }
            return "";
        }
        public string GetShortName(object obj, int lenght)
        {
            string strObj = Utils.CStrDef(obj).Replace("\r\n", "<br />");
            if (strObj.Length >= lenght)
            {
                return strObj.Substring(0, lenght - 3) + "...";
            }
            return strObj;
        }
    }
}