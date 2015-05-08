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
using CatTrang.Components;

namespace CatTrang.vi_vn
{
    public partial class phanhoitunguoitimviecNTD : System.Web.UI.Page
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private Function fun = new Function();
        private List_product list_pro = new List_product();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null && Session["user_fullname"] != null && Session["user_quyen"] != null && Utils.CIntDef(Session["user_quyen"]) == Cost.QUYEN_NTD)
                {
                    Load_Comment();
                }
                else
                {
                    Session.Abandon();
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản nhà tuyển dụng!');location.href='/nha-tuyen-dung.html'</script>");
                }
            }
        }
        private void Load_Comment()
        {
            int userId =Utils.CIntDef(Session["userId"]);
            var list = from a in db.ESHOP_CUSTOMERs
                       join b in db.VL_CUSTOMER_COMMENTs on a.CUSTOMER_ID equals b.CUSTOMER_NTV_ID
                       where b.CUSTOMER_NTD_ID == userId
                       orderby b.DATE_CREATE descending
                       select b;
            rptcomment.DataSource = list;
            rptcomment.DataBind();
        }
        public string GetCusNameNTV(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].CUSTOMER_FULLNAME;
            }
            return "";
        }
        public string GetCusLogo(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                if (item.ToList()[0].CUSTOMER_LOGO != "" && item.ToList()[0].CUSTOMER_LOGO != null)
                    return "/data/customer/logo/" + item.ToList()[0].CUSTOMER_LOGO;
            }
            return "../Images/person.jpg";
        }
        public string GetShortName(object obj, int lenght)
        {
            string strObj = Utils.CStrDef(obj).Replace("\r\n", "<br />").Replace("\n", "<br />");
            if (strObj.Length >= lenght)
            {
                return strObj.Substring(0, lenght - 3) + "...";
            }
            return strObj;
        }
    }
}