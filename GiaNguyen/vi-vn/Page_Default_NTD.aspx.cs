using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using vpro.functions;
using Controller;

namespace CatTrang.vi_vn
{
    public partial class Page_Default_NTD : System.Web.UI.Page
    {
        #region Declare
        Get_session getsession = new Get_session();
        Config cf = new Config();
        #endregion
        #region Page Event
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var _configs = cf.Config_meta();

                if (_configs.ToList().Count > 0)
                {
                    if (!string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FAVICON))
                        ltrFavicon.Text = "<link rel='shortcut icon' href='" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FAVICON + "' />";
                }

                UserControl uUngviens = Page.LoadControl("../UIs/ungvientheonganhngheNTD.ascx") as UserControl;
                UserControl uUngvien = Page.LoadControl("../UIs/chitietungvienNTD.ascx") as UserControl;
                UserControl uTin = Page.LoadControl("../UIs/chitiettin.ascx") as UserControl;
                //UserControl uSearch = Page.LoadControl("../UIs/search_vi.ascx") as UserControl;
                int _type = Utils.CIntDef(Request["type"]);
                string _catSeoUrl = Utils.CStrDef(Request.QueryString["curl"]);
                string _newsSeoUrl = Utils.CStrDef(Request.QueryString["purl"]);

                switch (_type)
                {
                    case 3:
                        getsession.LoadCatInfo(_catSeoUrl);
                        Bind_meta_tags_cat();
                        if (Utils.CIntDef(Session["Cat_type"]) == 2)//2 viec lam, 
                        {
                            phdMain.Controls.Add(uUngviens);
                        }
                        else
                        {
                            //if (Utils.CIntDef(Session["Cat_showitem"]) == 1)
                            //{
                            //    phdMain.Controls.Add(uNew);
                            //}
                            //else phdMain.Controls.Add(uNews);
                        }
                        break;
                    case 5:
                        //phdMain.Controls.Add(uSearch);
                        HtmlHead header = base.Header;
                        header.Title = "Tìm kiếm";
                        break;
                    case 6:
                        getsession.LoadNewsInfo(_newsSeoUrl);
                        Bind_meta_tags_news();
                        if (getsession.Getcat_type(_newsSeoUrl) == 2)
                        {
                            phdMain.Controls.Add(uUngvien);
                        }
                        else
                        {
                            phdMain.Controls.Add(uTin);
                        }
                        break;

                    default:
                        Response.Redirect("/trang-chu.html");
                        break;
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        #endregion
        public void Bind_meta_tags_cat()
        {
            #region Bind Meta Tags
            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();

            headerDes.Name = "Description";
            headerKey.Name = "Keywords";

            header.Title = Utils.CStrDef(Session["Cat_seo_title"]);
            headerDes.Content = Utils.CStrDef(Session["Cat_seo_desc"]);
            headerKey.Content = Utils.CStrDef(Session["Cat_seo_keyword"]);


            if (string.IsNullOrEmpty(headerDes.Content))
            {
                headerDes.Content = "";
            }
            header.Controls.Add(headerDes);

            if (string.IsNullOrEmpty(headerKey.Content))
            {
                headerKey.Content = "";
            }

            header.Controls.Add(headerKey);
            #endregion
        }
        public void Bind_meta_tags_news()
        {
            #region Bind Meta Tags
            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            HtmlMeta propety = new HtmlMeta();

            headerDes.Name = "Description";
            headerKey.Name = "Keywords";
            header.Title = Utils.CStrDef(Session["News_seo_title"]);
            headerDes.Content = Utils.CStrDef(Session["News_seo_desc"]);
            headerKey.Content = Utils.CStrDef(Session["News_seo_keyword"]);
            propety.Attributes.Add("property", "og:image");
            propety.Content = "bdshoanvu.com" + PathFiles.GetPathNews(Utils.CIntDef(Session["News_id"])) + Utils.CStrDef(Session["News_image3"]);
            header.Controls.Add(propety);
            if (string.IsNullOrEmpty(headerDes.Content))
            {
                headerDes.Content = "";
            }
            header.Controls.Add(headerDes);

            if (string.IsNullOrEmpty(headerKey.Content))
            {
                headerKey.Content = "";
            }

            header.Controls.Add(headerKey);

            #endregion
        }
    }
}