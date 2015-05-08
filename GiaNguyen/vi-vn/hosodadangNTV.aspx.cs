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
using System.Web.UI.HtmlControls;

namespace CatTrang.vi_vn
{
    public partial class hosodadangNTV : System.Web.UI.Page
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
                    lbFullName.Text = Utils.CStrDef(Session["user_fullname"]);
                    LoadNganhnghe();
                    LoadLoaiHoso();
                    Load_hoso(Utils.CIntDef(Session["userId"]), 0, 0, 1);

                }
                else
                {
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản người tìm việc!');location.href='/trang-chu.html'</script>");
                }
            }
        }
        private void Load_hoso(int customerId,int nganhnghe, int loaihoso, int sortId)
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
        private void LoadLoaiHoso()
        {
            var list = news.GetEshopNewsByCustomerId(Utils.CIntDef(Session["userId"]), 0, 0);
            var listDangchoduyet = list.Where(n => n.TINHTRANGHOSO == 1);
            if (listDangchoduyet != null && listDangchoduyet.ToList().Count > 0)
            {
                ckhblLoaiHoso.Items.Add(new ListItem("Hồ sơ đang chờ duyệt (" + listDangchoduyet.ToList().Count + ")", "1".ToString()));
            }
            var listDadang = list.Where(n => n.TINHTRANGHOSO == 2);
            if (listDadang != null && listDadang.ToList().Count > 0)
            {
                ckhblLoaiHoso.Items.Add(new ListItem("Hồ sơ đã đăng (" + listDadang.ToList().Count + ")", "2".ToString()));
            }
            var listDangan = list.Where(n => n.TINHTRANGHOSO == 3);
            if (listDangan != null && listDangan.ToList().Count > 0)
            {
                ckhblLoaiHoso.Items.Add(new ListItem("Hồ sơ đang ẩn (" + listDangan.ToList().Count + ")", "3".ToString()));
            }
            var listNhap = list.Where(n => n.TINHTRANGHOSO == 4);
            if (listNhap != null && listNhap.ToList().Count > 0)
            {
                ckhblLoaiHoso.Items.Add(new ListItem("Hồ sơ nháp (" + listNhap.ToList().Count + ")", "4".ToString()));
            }
            var listXoatam = list.Where(n => n.TINHTRANGHOSO == 5);
            if (listXoatam != null && listXoatam.ToList().Count > 0)
            {
                ckhblLoaiHoso.Items.Add(new ListItem("Hồ sơ xóa tạm (" + listXoatam.ToList().Count + ")", "5".ToString()));
            }
            var listHethan = list.Where(n => n.TINHTRANGHOSO == 6);
            if (listHethan != null && listHethan.ToList().Count > 0)
            {
                ckhblLoaiHoso.Items.Add(new ListItem("Hồ sơ hết hạn (" + listHethan.ToList().Count + ")", "6".ToString()));
            }
        }
        #region funtion
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
        public string GetShortName(object obj, int lenght)
        {
            string strObj = Utils.CStrDef(obj).Replace("\r\n", "<br />");
            if (strObj.Length >= lenght)
            {
                return strObj.Substring(0, lenght - 3) + "...";
            }
            return strObj;
        }
        #endregion

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
            Load_hoso(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue), Utils.CIntDef(ckhblLoaiHoso.SelectedValue), sortid);
        }
        protected void ddlSort_2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int sortid = Utils.CIntDef(ddlSort_2.SelectedItem.Value);
            ddlSort.SelectedValue = sortid.ToString();
            Load_hoso(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue), Utils.CIntDef(ckhblLoaiHoso.SelectedValue), sortid);
        }

        protected void btnCancel_filter_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ntv-ho-so-da-dang");
        }

        protected void ckhblLoaiHoso_SelectedIndexChanged(object sender, EventArgs e)
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
            for (int i = 0; i < ckhblLoaiHoso.Items.Count; i++)
            {
                if (i != index)
                {
                    ckhblLoaiHoso.Items[i].Selected = false;
                }
            }
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            Load_hoso(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue), Utils.CIntDef(ckhblLoaiHoso.SelectedValue), sortid);
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
            Load_hoso(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue), Utils.CIntDef(ckhblLoaiHoso.SelectedValue), sortid);
        }
        

        protected void lnkXoaTam_Click(object sender, EventArgs e)
        {
            int i = 0;
            int j = 0;
            HtmlInputCheckBox check = new HtmlInputCheckBox();
            int[] items = new int[GridItemList.Items.Count];

            try
            {
                foreach (DataGridItem item in GridItemList.Items)
                {
                    check = new HtmlInputCheckBox();
                    check = (HtmlInputCheckBox)item.Cells[1].FindControl("chkSelect");

                    if (check.Checked)
                    {
                        items[j] = Utils.CIntDef(GridItemList.DataKeys[i]);

                        var g_update = db.GetTable<ESHOP_NEW>().Where(g => g.NEWS_ID == items[j]);
                        if (g_update != null && g_update.ToList().Count > 0)
                        {
                            g_update.ToList()[0].TINHTRANGHOSO = 5;

                            db.SubmitChanges();
                        }

                        j++;
                    }

                    i++;
                }

                if (j > 0)
                    Response.Write("<script>alert('Xóa tạm hồ sơ thành công!');location.href='/ntv-ho-so-da-dang'</script>");
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        protected void lnkPhucHoiXoaTam_Click(object sender, EventArgs e)
        {
            int i = 0;
            int j = 0;
            HtmlInputCheckBox check = new HtmlInputCheckBox();
            int[] items = new int[GridItemList.Items.Count];

            try
            {
                foreach (DataGridItem item in GridItemList.Items)
                {
                    check = new HtmlInputCheckBox();
                    check = (HtmlInputCheckBox)item.Cells[1].FindControl("chkSelect");

                    if (check.Checked)
                    {
                        items[j] = Utils.CIntDef(GridItemList.DataKeys[i]);

                        var g_update = db.GetTable<ESHOP_NEW>().Where(g => g.NEWS_ID == items[j] && g.TINHTRANGHOSO == 5);
                        if (g_update != null && g_update.ToList().Count > 0)
                        {
                            g_update.ToList()[0].TINHTRANGHOSO = 4;

                            db.SubmitChanges();
                            j++;
                        }
                    }

                    i++;
                }

                if (j > 0)
                    Response.Write("<script>alert('Phục hồi hồ sơ thành công!');location.href='/ntv-ho-so-da-dang'</script>");
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
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
            Response.Write("<script>alert('Tin đã làm mới thành công!');location.href='/ntv-ho-so-da-dang'</script>");
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
            Response.Write("<script>alert('Xóa tạm hồ sơ thành công!');location.href='/ntv-ho-so-da-dang'</script>");
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
            Response.Write("<script>alert('Xóa hồ sơ thành công!');location.href='/ntv-ho-so-da-dang'</script>");
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
            Response.Write("<script>alert('Khôi phục hồ sơ thành công!');location.href='/ntv-ho-so-da-dang'</script>");
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
            Response.Write("<script>alert('Hồ sơ đã hủy thành công!');location.href='/ntv-ho-so-da-dang'</script>");
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
            Response.Write("<script>alert('Hồ sơ đã đăng thành công. Sau khi duyệt sẽ được xuất bản lên website!');location.href='/ntv-ho-so-da-dang'</script>");
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
            Response.Write("<script>alert('Hồ sơ đã ẩn thành công!');location.href='/ntv-ho-so-da-dang'</script>");
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
            Response.Write("<script>alert('Hồ sơ đã hiển thị thành công!');location.href='/ntv-ho-so-da-dang'</script>");
        }
        #endregion

    }
}