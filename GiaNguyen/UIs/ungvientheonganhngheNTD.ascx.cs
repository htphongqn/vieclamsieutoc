using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using GiaNguyen.Components;
using Model;
using System.Web.UI.HtmlControls;
using CatTrang.Components;

namespace CatTrang.UIs
{
    public partial class ungvientheonganhngheNTD : System.Web.UI.UserControl
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private Function fun = new Function();
        private VL_Category vl = new VL_Category();
        private Account acount = new Account();
        private List_product list_pro = new List_product();
        int _Catid = 0;
        string _cat_seo_url = string.Empty;
        int _page = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            _Catid = Utils.CIntDef(Session["Cat_id"]);
            _cat_seo_url = Request.QueryString["curl"];
            _page = Utils.CIntDef(Request.QueryString["page"]);
            if (!IsPostBack)
            {
                LoadTitle();
            }
            Load_Vieclam();
        }
        protected override void Render(HtmlTextWriter writer)
        {
            litTopPager.Text = CollectionPager5.RenderedHtml;

            base.Render(writer);
        }
        private void LoadTitle()
        {
            string s = list_pro.Loadtitle(_cat_seo_url);
            lbTitle.Text= lbTitle2.Text = " ngành " + s;
        }
        private void Load_Vieclam()
        {
            //var list = list_pro.Load_listprobyPeriod(1, 2, _Catid, - 1);
            //if (list != null && list.Count > 0)
            //{
            //    rptViecLam_Hot.DataSource = list.Take(6);
            //    rptViecLam_Hot.DataBind();
            //}
            var list2 = list_pro.Load_listprobytype(1, _Catid, 2, -1);
            if (list2 != null && list2.Count > 0)
            {
                rptUngvien_XemNhieu.DataSource = list2.OrderByDescending(n => n.NEWS_COUNT).Take(6);
                rptUngvien_XemNhieu.DataBind();
            }
            var list = list_pro.Load_listprobytype(1, _Catid, 2, -1);
            if (list != null && list.Count > 0)
            {
                CollectionPager5.MaxPages = 5;
                CollectionPager5.PageSize = 30;
                CollectionPager5.Visible = true;
                CollectionPager5.DataSource = list.OrderByDescending(n => n.NEWS_UPDATEFRERESH).Take(150).ToList();
                CollectionPager5.BindToControl = GridItemList;
                GridItemList.DataSource = CollectionPager5.DataSourcePaged;
                GridItemList.DataBind();
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
        public string getKinhnghiem(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_KINHNGHIEMs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getMucluong(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_MUCLUONGs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
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
        public string GetShortName(object obj, int lenght)
        {
            string strObj = Utils.CStrDef(obj);
            if (strObj.Length >= lenght)
            {
                return strObj.Substring(0, lenght - 3) + "...";
            }
            return strObj;
        }

        protected void lnkLuutin_Click(object sender, EventArgs e)
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            if (customerId == 0 || Utils.CIntDef(Session["user_quyen"]) != Cost.QUYEN_NTD)
            {
                MessageBox1.ShowMessage("Bạn cần đăng nhập tài khoản nhà tuyển để sử dụng chức năng này!", "Thông báo");
                return;
            }
            int i = 0;
            int j = 0;
            HtmlInputCheckBox check = new HtmlInputCheckBox();
            //int[] items = new int[GridItemList_Xemnhieu.Items.Count];

            foreach (DataGridItem item in GridItemList.Items)
            {
                check = new HtmlInputCheckBox();
                check = (HtmlInputCheckBox)item.Cells[1].FindControl("chkSelect");
                HiddenField hddCusId = (HiddenField)item.Cells[1].FindControl("hddCusId");
                if (check.Checked)
                {
                    //items[j] = Utils.CIntDef(GridItemList_Xemnhieu.DataKeys[i]);
                    j++;
                    int newsId = Utils.CIntDef(GridItemList.DataKeys[i]);
                    var list = db.VL_CUSTOMER_ESHOP_NEWs.Where(a => a.CUSTOMER_NTD_ID == customerId
                    && a.NEWS_ID_UNGTUYEN == newsId && a.TYPE == 5);
                    if (list != null && list.ToList().Count > 0)
                    {
                        //
                    }
                    else
                    {
                        VL_CUSTOMER_ESHOP_NEW insert = new VL_CUSTOMER_ESHOP_NEW();
                        insert.CUSTOMER_ID = Utils.CIntDef(hddCusId.Value);
                        insert.CUSTOMER_NTD_ID = customerId;
                        insert.NEWS_ID_UNGTUYEN = newsId;
                        insert.TYPE = 5;
                        insert.PUBLISHDATE = DateTime.Now;
                        insert.DATE_XULY = DateTime.Now;

                        db.VL_CUSTOMER_ESHOP_NEWs.InsertOnSubmit(insert);
                        db.SubmitChanges();
                    }
                    
                }

                i++;
            }
            if (j > 0)
            {
                MessageBox1.ShowMessage("Lưu hồ sơ thành công!", "Thông báo");
            }
            else
            {
                MessageBox1.ShowMessage("Chưa chọn hồ sơ để lưu!", "Thông báo");
            }
        }
    }
}