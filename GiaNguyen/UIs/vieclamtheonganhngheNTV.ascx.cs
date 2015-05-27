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

namespace CatTrang.UIs
{
    public partial class vieclamtheonganhngheNTV : System.Web.UI.UserControl
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
            litTopPager_Moinhat.Text = CollectionPager5.RenderedHtml;

            base.Render(writer);
        }
        private void LoadTitle()
        {
            string s = list_pro.Loadtitle(_cat_seo_url);
            lbTitle.Text = lbTitle1.Text = lbTitle2.Text = " ngành " + s;
        }
        private void Load_Vieclam()
        {
            var list = list_pro.Load_listprobyPeriod(1, 2, _Catid, 2, - 1);
            if (list != null && list.Count > 0)
            {
                rptViecLam_Hot.DataSource = list.Take(6);
                rptViecLam_Hot.DataBind();
            }
            var list2 = list_pro.Load_listprobytype(2, _Catid, 2, -1);
            if (list2 != null && list2.Count > 0)
            {
                rptViecLam_XemNhieu.DataSource = list2.OrderByDescending(n => n.NEWS_COUNT).Take(6);
                rptViecLam_XemNhieu.DataBind();
            }
            LoadVieclamMoi();
        }
        private void LoadVieclamMoi()
        {
            var list = (from a in db.ESHOP_NEWS_CATs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                        join d in db.VL_AREA_ESHOP_NEWs on b.NEWS_ID equals d.NEWS_ID
                        where b.NEWS_SHOWTYPE == 1
                        && (b.TINHTRANGHOSO == 2)
                         && b.NEWS_TYPE == 2
                         && (c.CAT_ID == _Catid || c.CAT_PARENT_PATH.Contains(_Catid.ToString()) || _Catid == 0)
                        select b).Distinct().OrderByDescending(n => n.NEWS_UPDATEFRERESH).Take(150).ToList();
            //if (list != null && list.ToList().Count > 0)
            //{
            CollectionPager5.MaxPages = 5;
            CollectionPager5.PageSize = 30;
            CollectionPager5.Visible = true;
            CollectionPager5.DataSource = list;
            CollectionPager5.BindToControl = GridItemList_Moinhat;
            GridItemList_Moinhat.DataSource = CollectionPager5.DataSourcePaged;
            GridItemList_Moinhat.DataBind();
            //}
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
    }
}