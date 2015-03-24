using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using CatTrang.Components;

namespace CatTrang.UIs
{
    public partial class BannerTopNTD : System.Web.UI.UserControl
    {
        Propertity per = new Propertity();
        Function fun = new Function();
        List_product list_pro = new List_product();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_banner();
                Load_marquee();
            }
        }
        public void Load_banner()
        {
            try
            {
                rptbannertop.DataSource = per.Load_slider1(20, 1, -1);
                rptbannertop.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public void Load_marquee()
        {
            try
            {
                var list = list_pro.Load_listprobytype(7, 0, -1);
                if (list.Count > 0)
                {
                    rptMarquee.DataSource = list.OrderByDescending(n => n.NEWS_PUBLISHDATE).Take(1);
                    rptMarquee.DataBind();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string GetImage(object Ad_Id, object Ad_Image1, object Ad_Target, object Ad_Url, object AD_ITEM_DESC)
        {
            try
            {
                string temp;
                temp = fun.GetImageAd(Ad_Id, Ad_Image1, Ad_Target, Ad_Url, AD_ITEM_DESC);
                return temp;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
    }
}