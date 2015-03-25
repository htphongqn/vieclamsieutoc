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
    public partial class quanlyhosoungvienNTD : System.Web.UI.Page
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
                    Load_ListTuyendung();
                    Load_hosoungvien(Utils.CIntDef(Session["userId"]), 0, 0, 1);
                    //LoadLoaiTin();
                    string logoUrl = GetCusLogo(Utils.CIntDef(Session["userId"]));
                    lbLogo.Text = "<img style='max-width: 100%' src='" + logoUrl + "'>";
                }
                else
                {
                    Session.Abandon();
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản nhà tuyển dụng!');location.href='/nha-tuyen-dung.html'</script>");
                }
            }
        }
        private void Load_hosoungvien(int customerId, int nganhnghe, int loaihoso, int sortId)
        {
            int newsId = Utils.CIntDef(cblRdoOptionVitrituyendung.SelectedValue);
            var list = news.GetCustomerByCustomerId(customerId, newsId, 2);
            Session["NewsList"] = DataUtil.LINQToDataTable(list);


            //var list = news.GetEshopNewsByCustomerId(customerId, nganhnghe, loaihoso);
            //switch (sortId)
            //{
            //    case 1:
            //        list = list.OrderByDescending(n => n.NEWS_UPDATE).ToList();
            //        break;
            //    case 2:
            //        list = list.OrderBy(n => n.NEWS_UPDATE).ToList();
            //        break;
            //    default:
            //        break;
            //}

            GridItemList.DataSource = list;
            GridItemList.DataBind();
        }
        private void Load_ListTuyendung()
        {
            int userId = Utils.CIntDef(Session["userId"]);
            var list = news.GetEshopNewsByCustomerId(userId);
            cblRdoOptionVitrituyendung.DataSource = list;
            cblRdoOptionVitrituyendung.DataBind();
        }
        //private void LoadLoaiTin()
        //{
        //    var list = news.GetEshopNewsByCustomerId(Utils.CIntDef(Session["userId"]), 0, 0);
        //    if (list != null && list.ToList().Count > 0)
        //    {
        //        lbCountTin.Text = list.ToList().Count.ToString();
        //    }
        //    var listDangchoduyet = list.Where(n => n.TINHTRANGHOSO == 1);
        //    if (listDangchoduyet != null && listDangchoduyet.ToList().Count > 0)
        //    {
        //        lbCountChoduyet.Text = listDangchoduyet.ToList().Count.ToString();
        //    }
        //    var listDadang = list.Where(n => n.TINHTRANGHOSO == 2);
        //    if (listDadang != null && listDadang.ToList().Count > 0)
        //    {
        //        lbCountTindadang.Text = listDadang.ToList().Count.ToString();
        //    }
        //    var listDangan = list.Where(n => n.TINHTRANGHOSO == 3);
        //    if (listDangan != null && listDangan.ToList().Count > 0)
        //    {
        //        lbCountTinan.Text = listDangan.ToList().Count.ToString();
        //    }
        //    var listNhap = list.Where(n => n.TINHTRANGHOSO == 4);
        //    if (listNhap != null && listNhap.ToList().Count > 0)
        //    {
        //        lbCountTinnhap.Text = listNhap.ToList().Count.ToString();
        //    }
        //    var listXoatam = list.Where(n => n.TINHTRANGHOSO == 5);
        //    if (listXoatam != null && listXoatam.ToList().Count > 0)
        //    {
        //        lbCountTinxoatam.Text = listXoatam.ToList().Count.ToString();
        //    }
        //    var listHethan = list.Where(n => n.TINHTRANGHOSO == 6);
        //    if (listHethan != null && listHethan.ToList().Count > 0)
        //    {
        //        lbCountTinhethan.Text = listHethan.ToList().Count.ToString();
        //    }
        //}
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
                    return "Xóa tạm";
                case 6:
                    return "Hết hạn";
                default:
                    return "N/A";
            }
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
        public string GetCusSexNTV(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                int sexid = Utils.CIntDef( item.ToList()[0].CUSTOMER_SEX);
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
        public string getMucluongByNewsId(object ott)
        {
            int id = Utils.CIntDef(ott);
            var news = db.ESHOP_NEWs.Where(n => n.NEWS_ID == id);
            if (news != null && news.ToList().Count > 0)
            {
                var item = db.VL_MUCLUONGs.Where(n => n.ID == news.ToList()[0].VL_MUCLUONG_ID);
                if (item != null && item.ToList().Count > 0)
                {
                    return item.ToList()[0].NAME;
                }
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
        public string getKinhnghiemByNewsId(object ott)
        {
            int tt = Utils.CIntDef(ott);
            var news = db.ESHOP_NEWs.Where(n => n.NEWS_ID == tt);
            if (news != null && news.ToList().Count > 0)
            {
                var item = db.VL_KINHNGHIEMs.Where(n => n.ID == news.ToList()[0].VL_KINHNGHIEM_ID);
                if (item != null && item.ToList().Count > 0)
                {
                    return item.ToList()[0].NAME;
                }
            }
            return "";
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
        #region Grid Events
        #region properties

        public SortDirection sortProperty
        {
            get
            {
                if (ViewState["SortingState"] == null)
                {
                    ViewState["SortingState"] = SortDirection.Ascending;
                }
                return (SortDirection)ViewState["SortingState"];
            }
            set
            {
                ViewState["SortingState"] = value;
            }
        }

        #endregion
        protected void GridItemList_SortCommand(object source, DataGridSortCommandEventArgs e)
        {
            string sortingDirection = string.Empty;
            if (sortProperty == SortDirection.Ascending)
            {
                sortProperty = SortDirection.Descending;
                sortingDirection = "Desc";
            }
            else
            {
                sortProperty = SortDirection.Ascending;
                sortingDirection = "Asc";
            }

            DataTable dataTable = Session["NewsList"] as DataTable;
            DataView sortedView = new DataView(dataTable);
            sortedView.Sort = e.SortExpression + " " + sortingDirection;
            GridItemList.DataSource = sortedView;
            GridItemList.DataBind();
        }

        protected void GridItemList_ItemCommand(object source, DataGridCommandEventArgs e)
        {

        }

        protected void GridItemList_ItemDataBound(object sender, DataGridItemEventArgs e)
        {

        }

        protected void GridItemList_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            GridItemList.CurrentPageIndex = e.NewPageIndex;
            GridItemList.DataSource = Session["NewsList"] as DataTable;
            GridItemList.DataBind();
        }
        #endregion
        protected void btnTimkiem_Click(object sender, EventArgs e)
        {
            int newsId = Utils.CIntDef(cblRdoOptionVitrituyendung.SelectedValue);
            Session["newsId"] = newsId;
            var list = (from a in db.ESHOP_NEWs
                        where a.NEWS_ID == newsId
                        && a.NEWS_SHOWTYPE == 1
                        select a).ToList();
            if (list != null && list.ToList().Count > 0)
            {
                var item = list.ToList()[0];
                lbVitrituyendung.Text = item.NEWS_TITLE;
                lbHannophoso.Text = "";
                lbYeucau.Text = "";
                lbSoluongtuyen.Text = "";
                lbDiadiemlamviec.Text = "";
                lbVitrituyendung.Text = "";
            }            
        }

        protected void btnHuytimkiem_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ntd-quan-ly-ho-so-ung-vien");
        }

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlSort_2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}