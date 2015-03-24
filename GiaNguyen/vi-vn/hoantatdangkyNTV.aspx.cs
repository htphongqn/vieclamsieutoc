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

namespace CatTrang.vi_vn
{
    public partial class hoantatdangkyNTV : System.Web.UI.Page
    {
        private dbVuonRauVietDataContext DB = new dbVuonRauVietDataContext();
        private VL_Category vl = new VL_Category();
        private Account acount = new Account();
        private string email = "", code = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            email = Utils.CStrDef(Request.QueryString["email"]);
            code = Utils.CStrDef(Request.QueryString["code"]);

            var item = DB.ESHOP_CUSTOMERs.Where(c => c.CUSTOMER_UN_EMAIL == email && c.CODE_REGISTER == code);
            if (item != null && item.ToList().Count > 0)
            {
                item.ToList()[0].ISACTIVE = 1;//1 Kích hoạt, 2 khóa, 3 chưa kích hoạt
                item.ToList()[0].CODE_REGISTER = "";
                DB.SubmitChanges();
                Response.Write("<script>alert('Cám ơn bạn đã đăng ký tài khoản tại website của chúng tôi, Tài khoản của bạn đã được kích hoạt!');location.href='/trang-chu.html'</script>");
            }
            else
            {
                Response.Write("<script>alert('Lỗi, Hãy kiểm tra lại email kích hoạt để hoàn tất tài khoản!!');location.href='/trang-chu.html'</script>");
            }
        }
        
    }
}