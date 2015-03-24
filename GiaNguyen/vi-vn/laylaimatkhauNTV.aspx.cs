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
    public partial class laylaimatkhauNTV : System.Web.UI.Page
    {
        private dbVuonRauVietDataContext DB = new dbVuonRauVietDataContext();
        private VL_Category vl = new VL_Category();
        private Account acount = new Account();
        private string email = "", code = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            email = Utils.CStrDef(Request.QueryString["email"]);
            code = Utils.CStrDef(Request.QueryString["code"]);
            txt_email_dang_nhap.Value = email;
        }

        protected void btnYeucau_Click(object sender, EventArgs e)
        {
            if (this.txt_ma_xac_minh.Value != this.Session["CaptchaImageText"].ToString())
            {
                Response.Write("<script>alert('Nhập mã bảo mật sai!');</script>");
                return;
            }
            var item = DB.ESHOP_CUSTOMERs.Where(c => c.CUSTOMER_UN_EMAIL == email && c.CODE_FORGOTPASS == code);
            if (item != null && item.ToList().Count > 0)
            {
                item.ToList()[0].CUSTOMER_PW = txt_mat_khau.Value;
                item.ToList()[0].CODE_FORGOTPASS = "";
                DB.SubmitChanges();
                //bool b = acount.Login(email, txt_mat_khau.Value);
                Response.Write("<script>alert('Lấy lại mật khẩu thành công. Vui lòng đăng nhập với mật khẩu mới!');location.href='/trang-chu.html'</script>");
            }
            else
            {
                Response.Write("<script>alert('Lỗi, Hãy kiểm tra lại email để lấy lại mật khẩu!');</script>");
            }
        }
    }
}