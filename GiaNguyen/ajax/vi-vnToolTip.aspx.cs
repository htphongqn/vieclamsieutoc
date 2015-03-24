using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using Model;

namespace MVC_Kutun.ajax
{
    public partial class vi_vnToolTip : System.Web.UI.Page
    {
        #region Declare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        List_product lpro = new List_product();
        Function fun = new Function();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            Load_tooltip();
        }
        private void Load_tooltip()
        {
            string str = string.Empty;
            int oid =Utils.CIntDef(Request.QueryString["oid"]);
            var item = db.ESHOP_NEWs.Where(a => a.NEWS_ID == oid).ToList();
            if (item.Count > 0)
            {
                str += "<div style='margin-top: 5px; padding: 0px 5px 5px 5px;background-color:White;width:300px;'>";
                str += "<div class='headerTooltip' style='color: #cfb461;font-size: 120%;'>" + item[0].NEWS_TITLE + "</div>";
                str += "<div class='orderTooltip'><img src='" + GetImageT(item[0].NEWS_ID, item[0].NEWS_IMAGE3) + "' style='width:295px;'/></div>";
                str += "<div class='contentTooltip'>" + item[0].NEWS_DESC + "</div>";
                str += "</div>";
            }
            
            ltrInfo.Text = str;
        }
        //private string GetPrice1(object News_Price1, object News_Price2, object news_id)
        //{
        //    try
        //    {
        //        return fun.Getprice1(News_Price1, News_Price2, news_id);
        //    }
        //    catch (Exception ex)
        //    {
        //        clsVproErrorHandler.HandlerError(ex);
        //        return null;
        //    }
        //}
        private string GetImageT(object News_Id, object News_Image1)
        {

            try
            {
                return fun.GetImageT_News(News_Id, News_Image1);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
    }
}