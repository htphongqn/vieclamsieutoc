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
    public partial class boxPhone : System.Web.UI.UserControl
    {
        private Propertity per = new Propertity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_Online();
            }
        }
        private void Load_Online()
        {
            var list = per.Load_Online();
            if (list != null && list.Count > 0)
            {
                var listHotlineMienNam = list.Where(n => n.ONLINE_TYPE == 1);
                rptHotlineMienNam.DataSource = listHotlineMienNam;
                rptHotlineMienNam.DataBind();
                var listHotlineMienBac = list.Where(n => n.ONLINE_TYPE == 2);
                rptHotlineMienBac.DataSource = listHotlineMienBac;
                rptHotlineMienBac.DataBind();
                var HotroMienNam = list.Where(n => n.ONLINE_TYPE == 3);
                var HotroMienBac = list.Where(n => n.ONLINE_TYPE == 4);
                if (HotroMienNam != null && HotroMienNam.ToList().Count > 0)
                {
                    lbHotroMienNam.Text = HotroMienNam.ToList()[0].ONLINE_FIELD2;
                }
                if (HotroMienBac != null && HotroMienBac.ToList().Count > 0)
                {
                    lbHotroMienBac.Text = HotroMienBac.ToList()[0].ONLINE_FIELD2;
                }
            }
        }
    }
}