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
using CatTrang.Components;

namespace CatTrang.vi_vn
{
    public partial class quanlytuyendungNTD : System.Web.UI.Page
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private VL_News news = new VL_News(); 
        private Function fun = new Function();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null && Session["user_fullname"] != null && Session["user_quyen"] != null && Utils.CIntDef(Session["user_quyen"]) == Cost.QUYEN_NTD)
                {
                    Load_Comment();
                    Load_tin(Utils.CIntDef(Session["userId"]), 0, 0, 1);
                    LoadLoaiTin();
                }
                else
                {
                    //Response.Write("<script>alert('Bạn cần đăng nhập tài khoản nhà tuyển dụng!');location.href='/nha-tuyen-dung.html'</script>");
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản nhà tuyển dụng!');</script>");
                }
            }
        }
        private void Load_tin(int customerId, int nganhnghe, int loaihoso, int sortId)
        {
            var list = news.GetEshopNewsByCustomerId(customerId, nganhnghe, loaihoso);
            Session["NewsList"] = DataUtil.LINQToDataTable(list);
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
                //case 11:
                //    list = list.OrderByDescending(n => n.NEWS_COUNT).ToList();
                //    break;
                //case 12:
                //    list = list.OrderBy(n => n.NEWS_COUNT).ToList();
                //    break;
                default:
                    break;
            }

            GridItemList.DataSource = list;
            GridItemList.DataBind();
        }
        private void Load_Comment()
        {
            int userId = Utils.CIntDef(Session["userId"]);
            var list = from a in db.ESHOP_CUSTOMERs
                       join b in db.VL_CUSTOMER_COMMENTs on a.CUSTOMER_ID equals b.CUSTOMER_NTV_ID
                       where b.CUSTOMER_NTD_ID == userId
                       orderby b.DATE_CREATE descending
                       select b;
            rptcomment.DataSource = list;
            rptcomment.DataBind();
        }
        private void LoadLoaiTin()
        {
            var list = news.GetEshopNewsByCustomerId(Utils.CIntDef(Session["userId"]), 0, 0);
            if (list != null && list.ToList().Count > 0)
            {
                lbCountTin.Text = list.ToList().Count.ToString();
            }
            var listDangchoduyet = list.Where(n => n.TINHTRANGHOSO == 1);
            if (listDangchoduyet != null && listDangchoduyet.ToList().Count > 0)
            {
                lbCountChoduyet.Text = listDangchoduyet.ToList().Count.ToString();
            }
            var listDadang = list.Where(n => n.TINHTRANGHOSO == 2);
            if (listDadang != null && listDadang.ToList().Count > 0)
            {
                lbCountTindadang.Text = listDadang.ToList().Count.ToString();
            }
            var listDangan = list.Where(n => n.TINHTRANGHOSO == 3);
            if (listDangan != null && listDangan.ToList().Count > 0)
            {
                lbCountTinan.Text = listDangan.ToList().Count.ToString();
            }
            var listNhap = list.Where(n => n.TINHTRANGHOSO == 4);
            if (listNhap != null && listNhap.ToList().Count > 0)
            {
                lbCountTinnhap.Text = listNhap.ToList().Count.ToString();
            }
            var listXoatam = list.Where(n => n.TINHTRANGHOSO == 5);
            if (listXoatam != null && listXoatam.ToList().Count > 0)
            {
                lbCountTinxoatam.Text = listXoatam.ToList().Count.ToString();
            }
            var listHethan = list.Where(n => n.TINHTRANGHOSO == 6);
            if (listHethan != null && listHethan.ToList().Count > 0)
            {
                lbCountTinhethan.Text = listHethan.ToList().Count.ToString();
            }
        }
        public string getTinhtrangtin(object ott)
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
        public string GetLink(object newsId)
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
        public string GetCusLogo(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                if (item.ToList()[0].CUSTOMER_LOGO != "" && item.ToList()[0].CUSTOMER_LOGO != null)
                    return "/data/customer/logo/" + item.ToList()[0].CUSTOMER_LOGO;
            }
            return "../Images/person.jpg";
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

        public string GetShortName(object obj, int lenght)
        {
            string strObj = Utils.CStrDef(obj).Replace("\r\n", "<br />").Replace("\n", "<br />");
            if (strObj.Length >= lenght)
            {
                return strObj.Substring(0, lenght - 3) + "...";
            }
            return strObj;
        }

        #region function grid tin tuyen da dang
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
            Response.Write("<script>alert('Tin đã làm mới thành công!');location.href='/ntd-quan-ly-tuyen-dung'</script>");
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
            Response.Write("<script>alert('Xóa tạm tin thành công!');location.href='/ntd-quan-ly-tuyen-dung'</script>");
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
            Response.Write("<script>alert('Xóa hẳn tin tuyển dụng thành công!');location.href='/ntd-quan-ly-tuyen-dung'</script>");
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
            Response.Write("<script>alert('Khôi phục tin tuyển dụng thành công!');location.href='/ntd-quan-ly-tuyen-dung'</script>");
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
            Response.Write("<script>alert('Tin tuyển dụng đã hủy thành công!');location.href='/ntd-quan-ly-tuyen-dung'</script>");
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
            Response.Write("<script>alert('Tin tuyển dụng đã đăng thành công. Sau khi duyệt sẽ được xuất bản lên website!');location.href='/ntd-quan-ly-tuyen-dung'</script>");
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
            Response.Write("<script>alert('Tin tuyển dụng đã ẩn thành công!');location.href='/ntd-quan-ly-tuyen-dung'</script>");
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
            Response.Write("<script>alert('Tin tuyển dụng đã hiển thị thành công!');location.href='/ntd-quan-ly-tuyen-dung'</script>");
        }
        #endregion
    }
}