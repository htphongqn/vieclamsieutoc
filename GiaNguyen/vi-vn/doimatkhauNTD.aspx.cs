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
    public partial class doimatkhauNTD : System.Web.UI.Page
    {
        private VL_Category vl = new VL_Category();
        private Account acount = new Account();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null && Session["user_quyen"] != null && Utils.CIntDef(Session["user_quyen"]) == Cost.QUYEN_NTD)
                {

                }
                else
                {
                    Session.Abandon();
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản nhà tuyển dụng!');location.href='/nha-tuyen-dung.html'</script>");
                }
            }
        }

        protected void btnDoimatkhau_Click(object sender, EventArgs e)
        {
            if (this.txt_ma_xac_minh.Value != this.Session["CaptchaImageText"].ToString())
            {
                Response.Write("<script>alert('Nhập mã bảo mật sai!');</script>");
                return;
            }
            var b = acount.Login(Utils.CStrDef(Session["user"]), txt_mat_khau_cu.Value);
            if (b == -1)
            {
                Response.Write("<script>alert('Mật khẩu củ sai!');</script>");
                return;
            }
            var result = acount.Doimatkhau(Utils.CStrDef(Session["user"]), txt_mat_khau.Value);
            if (result == 1)
            {
                Response.Write("<script>alert('Đổi mật khẩu thành công!');location.href='/ntd-thong-tin-tai-khoan'</script>");
            }
            else if (result == 0)
            {
                Response.Write("<script>alert('Lỗi đổi mật khẩu, hãy thử lại!');</script>");
            }
        }
    }
}