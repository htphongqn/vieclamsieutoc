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
    public partial class quenmatkhau : System.Web.UI.Page
    {
        private dbVuonRauVietDataContext DB = new dbVuonRauVietDataContext();
        private VL_Category vl = new VL_Category();
        private Account acount = new Account();
        private SendMailSMTP _mail = new SendMailSMTP();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        protected void btnYeucaumail_Click(object sender, EventArgs e)
        {
            string strSecView = LookCookie().ToLower();
            string strSecurity = txt_ma_xac_minh.Value.ToString().ToLower();
            if (strSecurity != strSecView)
            {
                Response.Write("<script>alert('Nhập mã bảo mật sai!');</script>");
                return;
            }

            var item = DB.ESHOP_CUSTOMERs.Where(c=>c.CUSTOMER_UN_EMAIL == txt_email_dang_nhap.Value);
            if (item != null && item.ToList().Count > 0)
            {
                string code = _mail.GenerateRandomCode();
                item.ToList()[0].CODE_FORGOTPASS = code;
                DB.SubmitChanges();

                string strEmail = txt_email_dang_nhap.Value;
                string strTitle = "Hướng dẫn tạo lại mật khẩu";
                string strLink = "http://" + Request.Url.Authority + "/ntv-lay-lai-mat-khau?email=" + txt_email_dang_nhap.Value + "&code=" + code;
                string strMessage = "Chào " + txt_email_dang_nhap.Value + ",<br /><br />";
                strMessage += "Đây là email giúp tạo lại mật khẩu mới trên Việc làm siêu tốc theo yêu cầu của bạn. Vui lòng <a href='" + strLink + "'>nhấp vào đây</a> để tạo mật khẩu mới.<br /><br />";
                strMessage += "<span style='FONT-STYLE:italic;font-size: 80%;'>Lưu ý: Xin thứ lỗi nếu bạn nhận được email này do nhầm lẫn; hoặc nếu bạn không muốn thay đổi mật khẩu, xin vui lòng xóa email này và tiếp tục sử dụng mật khẩu hiện tại.</span><br /><br />";
                strMessage += "Nếu bạn có bất kỳ thắc mắc nào, hãy liên hệ với chúng tôi để nhận được sự hỗ trợ nhanh nhất.<br /><br />";
                strMessage += "Tổng đài hỗ trợ: Giờ hành chính 0908.169.044<br /><br />";
                strMessage += "Email liên hệ: <a href='mailto:vieclam@vieclamsieutoc.com'>vieclam@vieclamsieutoc.com</a><br /><br />";
                strMessage += "------------------------------------------------------------<br />";
                strMessage += "Vieclamsieutoc.com<br /><br />";
                strMessage += "<span style='FONT-STYLE:italic;FONT-WEIGHT:bold'>Luôn nỗ lực đem lợi ích thiết thực tới cộng đồng!</span>";
                string strDislay = "Vieclamsieutoc";

                int result = _mail.SendMailAll(strEmail, "", strTitle, strMessage, strDislay);

                if (result == 1)
                {
                    Response.Write("<script>alert('Đã gửi mail hướng dẫn lấy lại mật khẩu tài khoản: htphongqn@gmail.com thành công! Vui lòng kiểm tra email của bạn để được hướng dẫn cách lấy lại mật khẩu!');location.href='/trang-chu.html'</script>");
                }
                else if (result == 0)
                {
                    Response.Write("<script>alert('Lỗi gửi mail yêu cầu, hãy thử lại!');location.href='/trang-chu.html'</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Email đăng nhâp không tồn tại trong hệ thống!');location.href='/trang-chu.html'</script>");
            }
        }
        
        public string querys()
        {
            return LookCookie();
        }

        private string LookCookie()
        {
            HttpCookie Cookie = new HttpCookie("slmsrcd1");
            Cookie = Request.Cookies["slmsrcd1"];
            string strUser = "";
            if (Cookie != null && Cookie.Value != "" &&
                 Cookie.Value != null)
            {
                strUser = Cookie.Value.ToString();
            }
            return strUser;
        }
    }
}