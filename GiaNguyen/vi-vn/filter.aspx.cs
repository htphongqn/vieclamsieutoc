using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace CatTrang.vi_vn
{
    public partial class filter : System.Web.UI.Page
    {
        protected string ChkCount = string.Empty;
        protected string RdoCount = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            binddate();
        }
        void binddate()
        {
            Hashtable ht = new Hashtable();
            ht.Add(1, "System");
            ht.Add(2, "Collections");
            ht.Add(3, "Generic");
            ht.Add(4, "Linq");
            ht.Add(5, "Web");
            ht.Add(6, "UI");
            ht.Add(7, "WebControls");
            ChkCount = ht.Count + " items";
            RdoCount = ht.Count + " items";
            cblChkOption.DataSource = ht;
            cblChkOption.DataBind();
            cblRdoOption.DataSource = ht;
            cblRdoOption.DataBind();
        }
    }
}