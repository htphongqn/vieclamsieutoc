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
    public partial class nhatuyendungcuatoiNTV : System.Web.UI.Page
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
                    LoadMucluong();
                    LoadCapbac();
                    LoadDiadiem();
                    LoadBangcap();
                    LoadKinhnghiem();
                    LoadVieclamNTD(Utils.CIntDef(Session["userId"]), 0, 0, 0, 0, 0, 0, 5);
                }
                else
                {
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản người tìm việc!');location.href='/trang-chu.html'</script>");
                }
            }
        }
        protected void btnCancel_filter_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ntv-nha-tuyen-dung-cua-toi");
        }
        private void LoadNganhnghe()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            var list = (from a in db.ESHOP_NEWS_CATs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                        join d in db.VL_CUSTOMER_CUSTOMERs on b.CUSTOMER_ID equals d.CUSTOMER_ID_2
                        where (d.CUSTOMER_ID == customerId)
                            && b.NEWS_SHOWTYPE == 1
                        select new { c.CAT_ID, c.CAT_NAME, }).ToList();
            var listNganhnghe = list.Distinct().ToList();

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
        }
        private void LoadMucluong()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            var list = (from a in db.VL_MUCLUONGs
                        join b in db.ESHOP_NEWs on a.ID equals b.VL_MUCLUONG_ID
                        join d in db.VL_CUSTOMER_CUSTOMERs on b.CUSTOMER_ID equals d.CUSTOMER_ID_2
                        where (d.CUSTOMER_ID == customerId)
                            && b.NEWS_SHOWTYPE == 1
                        select new { a.ID, a.NAME, }).ToList();
            var listMucluong = list.Distinct().ToList();

            foreach (var item in listMucluong)
            {
                var itemin = list.Where(n => n.ID == item.ID);
                if (itemin != null)
                {
                    ckhbMucluong.Items.Add(new ListItem(item.NAME + " (" + itemin.ToList().Count + ")", item.ID.ToString()));
                }
                else
                {
                    ckhbMucluong.Items.Add(new ListItem(item.NAME + " (0)", item.ID.ToString()));
                }
            }
        }
        private void LoadCapbac()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            var list = (from a in db.VL_CAPBACs
                        join b in db.ESHOP_NEWs on a.ID equals b.VL_CAOBAC_ID
                        join d in db.VL_CUSTOMER_CUSTOMERs on b.CUSTOMER_ID equals d.CUSTOMER_ID_2
                        where (d.CUSTOMER_ID == customerId)
                            && b.NEWS_SHOWTYPE == 1
                        select new { a.ID, a.NAME, }).ToList();
            var listCapbac = list.Distinct().ToList();

            foreach (var item in listCapbac)
            {
                var itemin = list.Where(n => n.ID == item.ID);
                if (itemin != null)
                {
                    ckhbCapbac.Items.Add(new ListItem(item.NAME + " (" + itemin.ToList().Count + ")", item.ID.ToString()));
                }
                else
                {
                    ckhbCapbac.Items.Add(new ListItem(item.NAME + " (0)", item.ID.ToString()));
                }
            }
        }
        private void LoadDiadiem()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            var list = (from a in db.VL_AREA_ESHOP_NEWs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        join c in db.VL_AREAs on a.AREA_ID equals c.ID
                        join d in db.VL_CUSTOMER_CUSTOMERs on b.CUSTOMER_ID equals d.CUSTOMER_ID_2
                        where (d.CUSTOMER_ID == customerId)
                            && b.NEWS_SHOWTYPE == 1
                        select new { c.ID, c.NAME, }).ToList();
            var listDiadiem = list.Distinct().ToList();

            foreach (var item in listDiadiem)
            {
                var itemin = list.Where(n => n.ID == item.ID);
                if (itemin != null)
                {
                    ckhbDiadiem.Items.Add(new ListItem(item.NAME + " (" + itemin.ToList().Count + ")", item.ID.ToString()));
                }
                else
                {
                    ckhbDiadiem.Items.Add(new ListItem(item.NAME + " (0)", item.ID.ToString()));
                }
            }
        }
        private void LoadBangcap()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            var list = (from a in db.VL_TRINHDOHOCVANs
                        join b in db.ESHOP_NEWs on a.ID equals b.VL_TRINHDOHOCVAN_ID
                        join d in db.VL_CUSTOMER_CUSTOMERs on b.CUSTOMER_ID equals d.CUSTOMER_ID_2
                        where (d.CUSTOMER_ID == customerId)
                            && b.NEWS_SHOWTYPE == 1
                        select new { a.ID, a.NAME, }).ToList();
            var listBangcap = list.Distinct().ToList();

            foreach (var item in listBangcap)
            {
                var itemin = list.Where(n => n.ID == item.ID);
                if (itemin != null)
                {
                    ckhbBangcap.Items.Add(new ListItem(item.NAME + " (" + itemin.ToList().Count + ")", item.ID.ToString()));
                }
                else
                {
                    ckhbBangcap.Items.Add(new ListItem(item.NAME + " (0)", item.ID.ToString()));
                }
            }
        }
        private void LoadKinhnghiem()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            var list = (from a in db.VL_KINHNGHIEMs
                        join b in db.ESHOP_NEWs on a.ID equals b.VL_KINHNGHIEM_ID
                        join d in db.VL_CUSTOMER_CUSTOMERs on b.CUSTOMER_ID equals d.CUSTOMER_ID_2
                        where (d.CUSTOMER_ID == customerId)
                            && b.NEWS_SHOWTYPE == 1
                        select new { a.ID, a.NAME, }).ToList();
            var listKinhnghiem = list.Distinct().ToList();

            foreach (var item in listKinhnghiem)
            {
                var itemin = list.Where(n => n.ID == item.ID);
                if (itemin != null)
                {
                    ckhbKinhnghiem.Items.Add(new ListItem(item.NAME + " (" + itemin.ToList().Count + ")", item.ID.ToString()));
                }
                else
                {
                    ckhbKinhnghiem.Items.Add(new ListItem(item.NAME + " (0)", item.ID.ToString()));
                }
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

            GridItemList.DataSource = list;
            GridItemList.DataBind();
            lbCountTinNTD.Text = Utils.CStrDef(list.Count);
            var listNTD = db.VL_CUSTOMER_CUSTOMERs.Where(n => n.CUSTOMER_ID == customerId);
            if (listNTD != null && listNTD.ToList().Count > 0)
            {
                lbCountNTD.Text = lbCountNTD_2.Text = Utils.CStrDef(listNTD.ToList().Count);
            }
            var listHomnay = list.Where(n => (n.NEWS_PUBLISHDATE.Value.Date - DateTime.Today).Days == 0);
            if (listHomnay != null && listHomnay.ToList().Count > 0)
            {
                lbCountTinHomnayNTD.Text = Utils.CStrDef(listHomnay.ToList().Count);
            }
        }
        protected void lnkUngtuyen_Click(object sender, EventArgs e)
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
        protected void lnkUngtuyentin_Click(object sender, EventArgs e)
        {
            int i = 0;
            int j = 0;
            HtmlInputCheckBox check = new HtmlInputCheckBox();
            int customerId = Utils.CIntDef(Session["userId"]);
            try
            {
                foreach (DataGridItem item in GridItemList.Items)
                {
                    check = new HtmlInputCheckBox();
                    check = (HtmlInputCheckBox)item.Cells[1].FindControl("chkSelect");

                    if (check.Checked)
                    {
                        int newsId = Utils.CIntDef(GridItemList.DataKeys[i]);

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
                    i++;
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
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
        public string GetShortName(object obj, int lenght)
        {
            string strObj = Utils.CStrDef(obj).Replace("\r\n", "<br />");
            if (strObj.Length >= lenght)
            {
                return strObj.Substring(0, lenght - 3) + "...";
            }
            return strObj;
        }
        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            ddlSort_2.SelectedValue = sortid.ToString(); ;
            LoadVieclamNTD(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue),
                Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbCapbac.SelectedValue),
                Utils.CIntDef(ckhbDiadiem.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue),
                Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }
        protected void ddlSort_2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int sortid = Utils.CIntDef(ddlSort_2.SelectedItem.Value);
            ddlSort.SelectedValue = sortid.ToString();
            LoadVieclamNTD(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue),
                Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbCapbac.SelectedValue),
                Utils.CIntDef(ckhbDiadiem.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue),
                Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }
        #region checkbox_change
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
            LoadVieclamNTD(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue),
                Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbCapbac.SelectedValue),
                Utils.CIntDef(ckhbDiadiem.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue),
                Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }

        protected void ckhbMucluong_SelectedIndexChanged(object sender, EventArgs e)
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
            for (int i = 0; i < ckhbMucluong.Items.Count; i++)
            {
                if (i != index)
                {
                    ckhbMucluong.Items[i].Selected = false;
                }
            }
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            LoadVieclamNTD(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue),
                Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbCapbac.SelectedValue),
                Utils.CIntDef(ckhbDiadiem.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue),
                Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }

        protected void ckhbCapbac_SelectedIndexChanged(object sender, EventArgs e)
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
            for (int i = 0; i < ckhbCapbac.Items.Count; i++)
            {
                if (i != index)
                {
                    ckhbCapbac.Items[i].Selected = false;
                }
            }
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            LoadVieclamNTD(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue),
                Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbCapbac.SelectedValue),
                Utils.CIntDef(ckhbDiadiem.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue),
                Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }

        protected void ckhbDiadiem_SelectedIndexChanged(object sender, EventArgs e)
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
            for (int i = 0; i < ckhbDiadiem.Items.Count; i++)
            {
                if (i != index)
                {
                    ckhbDiadiem.Items[i].Selected = false;
                }
            }
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            LoadVieclamNTD(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue),
                Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbCapbac.SelectedValue),
                Utils.CIntDef(ckhbDiadiem.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue),
                Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }

        protected void ckhbBangcap_SelectedIndexChanged(object sender, EventArgs e)
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
            for (int i = 0; i < ckhbBangcap.Items.Count; i++)
            {
                if (i != index)
                {
                    ckhbBangcap.Items[i].Selected = false;
                }
            }
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            LoadVieclamNTD(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue),
                Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbCapbac.SelectedValue),
                Utils.CIntDef(ckhbDiadiem.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue),
                Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }

        protected void ckhbKinhnghiem_SelectedIndexChanged(object sender, EventArgs e)
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
            for (int i = 0; i < ckhbKinhnghiem.Items.Count; i++)
            {
                if (i != index)
                {
                    ckhbKinhnghiem.Items[i].Selected = false;
                }
            }
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            LoadVieclamNTD(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblNganhnghe.SelectedValue),
                Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbCapbac.SelectedValue),
                Utils.CIntDef(ckhbDiadiem.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue),
                Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }
        #endregion
    }
}