using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using System.Web.UI.HtmlControls;
using vpro.functions;

namespace CatTrang
{
    public partial class deufult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("trang-chu.html");
        }
    }
}