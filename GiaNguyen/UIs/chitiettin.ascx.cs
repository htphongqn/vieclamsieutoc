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
    public partial class chitiettin : System.Web.UI.UserControl
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private Function fun = new Function();
        private VL_Category vl = new VL_Category();
        private VL_News vlnews = new VL_News();
        private Account acount = new Account();
        private List_product list_pro = new List_product();
        News_details ndetail = new News_details();
        string _sNews_Seo_Url = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            _sNews_Seo_Url = Utils.CStrDef(Request.QueryString["purl"]);
            hplPrint.HRef = "/in/" + _sNews_Seo_Url + ".html";
            LoadInfo();
            LoadOther();
        }
        public void LoadInfo()
        {
            string _sCat_Seo_Url = Utils.CStrDef(Request.QueryString["curl"]);
            if(!string.IsNullOrEmpty(_sCat_Seo_Url))
            {
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where c.CAT_SEO_URL == _sCat_Seo_Url
                            select new { b.NEWS_TITLE, b.NEWS_PUBLISHDATE, c.CAT_NAME }).ToList();
                if (list != null && list.ToList().Count > 0)
                {
                    lbTitleCat.Text = list.ToList()[0].CAT_NAME;
                    lbTitle.Text = list.ToList()[0].NEWS_TITLE;
                    lbDate.Text = getDate(list.ToList()[0].NEWS_PUBLISHDATE);

                    lbHtml.Text = ndetail.Showfilehtm(_sCat_Seo_Url, _sNews_Seo_Url, "-vi.htm");
                }
            }
            if (!string.IsNullOrEmpty(_sNews_Seo_Url))
            {
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where b.NEWS_SEO_URL == _sNews_Seo_Url
                            select new { b.NEWS_TITLE, b.NEWS_PUBLISHDATE, c.CAT_NAME }).ToList();
                if (list != null && list.ToList().Count > 0)
                {
                    lbTitleCat.Text = list.ToList()[0].CAT_NAME;
                    lbTitle.Text = list.ToList()[0].NEWS_TITLE;
                    lbDate.Text = getDate(list.ToList()[0].NEWS_PUBLISHDATE);

                    lbHtml.Text = ndetail.Showfilehtm(_sCat_Seo_Url, _sNews_Seo_Url, "-vi.htm");
                }
            }
        }

        public void LoadOther()
        {
            try
            {
                if (_sNews_Seo_Url != "")
                {
                    var _tinTucKhac = ndetail.Load_othernews(_sNews_Seo_Url);
                    if (_tinTucKhac.ToList().Count > 0)
                    {
                        rptNewsother.DataSource = _tinTucKhac;
                        rptNewsother.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public string getDate(object News_PublishDate)
        {
            return fun.getDate(News_PublishDate);
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
            foreach (var item in litem)
            {
                var itemArea = db.VL_AREAs.Where(n => n.ARE_ID == item.AREA_ID);
                if (itemArea != null && itemArea.ToList().Count > 0)
                {
                    s += itemArea.ToList()[0].ARE_NAME;
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