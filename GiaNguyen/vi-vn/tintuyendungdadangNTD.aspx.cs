using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using System.Data;
using Model;
using CatTrang.Components;

namespace CatTrang.vi_vn
{
    public partial class tintuyendungdadangNTD : System.Web.UI.Page
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
                    LoadNganhnghe();
                    LoadLoaiTin();
                    Load_tin(Utils.CIntDef(Session["userId"]), 0, 0, 1);

                }
                else
                {
                    Session.Abandon();
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản nhà tuyển dụng!');location.href='/nha-tuyen-dung.html'</script>");

                }
            }
        }
        private void Load_tin(int customerId,int nganhnghe, int loaihoso, int sortId)
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
        private void LoadNganhnghe()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            //var list = news.GetEshopNewsByCustomerId(customerId);
            var list = (from a in db.ESHOP_NEWS_CATs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                                 where (b.CUSTOMER_ID == customerId)
                        && b.NEWS_SHOWTYPE == 1
                        select new { c.CAT_ID, c.CAT_NAME, }).ToList();
            var listNganhnghe = list.Distinct().ToList();

            //var qry = from a in db.ESHOP_NEWS_CATs
            //            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
            //            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
            //                     where (b.CUSTOMER_ID == customerId) && b.NEWS_SHOWTYPE == 1
            //      group c by c.CAT_ID
            //      into grp
            //      select new
            //      {
            //          CAT_ID = grp.Key, 
            //          Count = grp.Select(x => x.CAT_ID).Distinct().Count()
            //      };



            foreach (var item in listNganhnghe)
            {
                var itemin = list.Where(n => n.CAT_ID == item.CAT_ID);
                if (itemin != null)
                {
                    ckhblNganhnghe.Items.Add(new ListItem(item.CAT_NAME + " (" + itemin.ToList().Count + ")", item.CAT_ID.ToString()));
                }
                else
                {
                    ckhblNganhnghe.Items.Add(new ListItem(item.CAT_NAME + " (0)", item.CAT_ID.ToString()));
                }
            }
            //ckhblNganhnghe.DataSource = listNganhnghe;
            //ckhblNganhnghe.DataBind();

        }
        private void LoadLoaiTin()
        {
            var list = news.GetEshopNewsByCustomerId(Utils.CIntDef(Session["userId"]), 0, 0);
            var listDangchoduyet = list.Where(n => n.TINHTRANGHOSO == 1);
            if (listDangchoduyet != null && listDangchoduyet.ToList().Count > 0)
            {
                ckhblLoaiTin.Items.Add(new ListItem("Tin chờ duyệt (" + listDangchoduyet.ToList().Count + ")", "1".ToString()));
            }
            var listDadang = list.Where(n => n.TINHTRANGHOSO == 2);
            if (listDadang != null && listDadang.ToList().Count > 0)
            {
                ckhblLoaiTin.Items.Add(new ListItem("Tin đã đăng (" + listDadang.ToList().Count + ")", "2".ToString()));
            }
            var listDangan = list.Where(n => n.TINHTRANGHOSO == 3);
            if (listDangan != null && listDangan.ToList().Count > 0)
            {
                ckhblLoaiTin.Items.Add(new ListItem("Tin ẩn (" + listDangan.ToList().Count + ")", "3".ToString()));
            }
            var listNhap = list.Where(n => n.TINHTRANGHOSO == 4);
            if (listNhap != null && listNhap.ToList().Count > 0)
            {
                ckhblLoaiTin.Items.Add(new ListItem("Tin nháp (" + listNhap.ToList().Count + ")", "4".ToString()));
            }
            var listXoatam = list.Where(n => n.TINHTRANGHOSO == 5);
            if (listXoatam != null && listXoatam.ToList().Count > 0)
            {
                ckhblLoaiTin.Items.Add(new ListItem("Tin xóa tạm (" + listXoatam.ToList().Count + ")", "5".ToString()));
            }
            var listHethan = list.Where(n => n.TINHTRANGHOSO == 6);
            if (listHethan != null && listHethan.ToList().Count > 0)
            {
                ckhblLoaiTin.Items.Add(new ListItem("Tin hết hạn (" + listHethan.ToList().Count + ")", "6".ToString()));
            }
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

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            ddlSort_2.SelectedValue = sortid.ToString(); ;
            Load_tin(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue), Utils.CIntDef(ckhblLoaiTin.SelectedValue), sortid);
        }
        protected void ddlSort_2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int sortid = Utils.CIntDef(ddlSort_2.SelectedItem.Value);
            ddlSort.SelectedValue = sortid.ToString();
            Load_tin(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue), Utils.CIntDef(ckhblLoaiTin.SelectedValue), sortid);
        }

        protected void btnCancel_filter_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ntd-tin-tuyen-dung-da-dang");
        }

        protected void ckhblLoaiTin_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = string.Empty;

            string result = Request.Form["__EVENTTARGET"];

            string[] checkedBox = result.Split('$'); ;

            int index = int.Parse(checkedBox[checkedBox.Length - 1]);

            //if (ckhblLoaiHoso.Items[index].Selected)
            //{
            //    value = ckhblLoaiHoso.Items[index].Value;
            //}
            //else
            //{

            //}
            for (int i = 0; i < ckhblLoaiTin.Items.Count; i++)
            {
                if (i != index)
                {
                    ckhblLoaiTin.Items[i].Selected = false;
                }
            }
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            Load_tin(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue), Utils.CIntDef(ckhblLoaiTin.SelectedValue), sortid);
        }

        protected void ckhblNganhnghe_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = string.Empty;

            string result = Request.Form["__EVENTTARGET"];

            string[] checkedBox = result.Split('$'); ;

            int index = int.Parse(checkedBox[checkedBox.Length - 1]);

            //if (ckhblNganhnghe.Items[index].Selected)
            //{
            //    value = ckhblNganhnghe.Items[index].Value;
            //}
            //else
            //{

            //}
            for (int i = 0; i < ckhblNganhnghe.Items.Count; i++)
            {
                if (i != index)
                {
                    ckhblNganhnghe.Items[i].Selected = false;
                }
            }
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            Load_tin(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue), Utils.CIntDef(ckhblLoaiTin.SelectedValue), sortid);
        }
    }
}