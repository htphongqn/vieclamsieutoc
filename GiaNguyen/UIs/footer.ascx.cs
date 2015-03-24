using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using Model;
using CatTrang.Components;

namespace CatTrang.UIs
{
    public partial class footer : System.Web.UI.UserControl
    {
        Propertity per = new Propertity();
        Function fun = new Function();
        private Config cf = new Config();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_logo();
                Show_Footer_HTML();
            }
        }
        protected void load_logo()
        {
            var _logoSlogan = per.Load_logo_and_sologan(2, -1);
            if (_logoSlogan.ToList().Count > 0)
            {
                rptLogo.DataSource = _logoSlogan;
                rptLogo.DataBind();
            }
        }
        public string Getbanner(object Banner_type, object banner_field, object Banner_ID, object Banner_Image)
        {
            return fun.Getbanner(Banner_type, banner_field, Banner_ID, Banner_Image);
        }
        private void Show_Footer_HTML()
        {
            lbCoppyRightInfo.Text = cf.Show_File_HTML("footer-vi.htm", "/Data/footer/");
        }
    }
}