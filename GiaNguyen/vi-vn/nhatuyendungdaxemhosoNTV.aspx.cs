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
    public partial class nhatuyendungdaxemhosoNTV : System.Web.UI.Page
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private VL_News news = new VL_News();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null && Session["user_fullname"] != null && Session["user_quyen"] != null && Utils.CIntDef(Session["user_quyen"]) == 1)
                {
                    LoadHoso();
                    LoadNTDXemHoso();
                }
                else
                {
                    //Response.Write("<script>alert('Bạn cần đăng nhập tài khoản người tìm việc!');location.href='/trang-chu.html'</script>");
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản người tìm việc!');</script>");
                }
            }
        }
        private void LoadHoso()
        {
            var list = news.GetEshopNewsByCustomerId(Utils.CIntDef(Session["userId"]));
            ddlHoso.DataSource = list;
            ddlHoso.DataBind();
        }
        private void LoadNTDXemHoso()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            int newsId = Utils.CIntDef(ddlHoso.SelectedValue);
            var list = news.GetCustomerByCustomerId(customerId, newsId, 4);
            Session["NewsList"] = DataUtil.LINQToDataTable(list);
            
            GridItemList.DataSource = list;
            GridItemList.DataBind();
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

        protected void ddlHoso_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadNTDXemHoso();
        }
    }
}