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
    public partial class lienhequangcao : System.Web.UI.Page
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private Function fun = new Function();
        private VL_Category vl = new VL_Category();
        private VL_News vlnews = new VL_News();
        private Account acount = new Account();
        private List_product list_pro = new List_product();
        News_details ndetail = new News_details();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadInfo();
        }
        public void LoadInfo()
        {
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where b.NEWS_TYPE == 8                    
                            orderby b.NEWS_ORDER descending
                            select new { b.NEWS_TITLE, b.NEWS_PUBLISHDATE, c.CAT_NAME, b.NEWS_SEO_URL }).ToList();
                if (list != null && list.ToList().Count > 0)
                {
                    lbTitle.Text = list.ToList()[0].NEWS_TITLE;
                    //lbDate.Text = "Ngày " + getDate(list.ToList()[0].NEWS_PUBLISHDATE);

                    lbHtml.Text = ndetail.Showfilehtm("", list.ToList()[0].NEWS_SEO_URL, "-vi.htm");
                }
        }
        public string getDate(object News_PublishDate)
        {
            return fun.getDate(News_PublishDate);
        }
    }
}