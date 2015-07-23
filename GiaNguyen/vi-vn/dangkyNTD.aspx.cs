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
using System.IO;

namespace CatTrang.vi_vn
{
    public partial class dangkyNTD : System.Web.UI.Page
    {
        private dbVuonRauVietDataContext DB = new dbVuonRauVietDataContext();
        private VL_Category vl = new VL_Category();
        private Account acount = new Account();
        private SendMailSMTP _mail = new SendMailSMTP();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
                    Response.Redirect("/trang-chu.html");
                }
                Load_VL_City();
                Load_VL_Quymo();
            }
        }
        private void Load_VL_City()
        {
            ddlCity.DataSource = vl.GetAllCity();
            ddlCity.DataBind();
        }
        private void Load_VL_Quymo()
        {
            ddlQuymo.DataSource = vl.GetAllQuymo();
            ddlQuymo.DataBind();
        }
        protected void btnDangky_Click(object sender, EventArgs e)
        {
            string strSecView = LookCookie().ToLower();
            string strSecurity = txtCaptcha.Value.ToString().ToLower();
            if (strSecurity != strSecView)
            {
                Response.Write("<script>alert('Nhập mã bảo mật sai!');</script>");
                return;
            }
            if (!chkAcept.Checked)
            {
                Response.Write("<script>alert('Bạn chưa đồng ý với thỏa thuận sử dụng của vieclamsieutoc!');</script>");
                return;
            }
            bool isExistEmail = acount.CheckExitsEmail(txtEmailUser.Value);
            if (isExistEmail)
            {
                Response.Write("<script>alert('Email đăng nhập đã có người sử dụng!');</script>");
                return;
            }
            string logo = "";
            if (file_logo_cong_ty.HasFile)
            {
                logo = DateTime.Now.ToString("ddMMyyyyHHmmss_") + Path.GetFileName(file_logo_cong_ty.PostedFile.FileName);
                string pathfile = Server.MapPath("/data/customer/logo/");
                string fullpathfile = pathfile + "/" + logo;
                if (!Directory.Exists(pathfile))
                {
                    Directory.CreateDirectory(pathfile);
                }
                file_logo_cong_ty.PostedFile.SaveAs(fullpathfile);
            }
            string giayphep = "";
            if (file_giay_phep_kd.HasFile)
            {
                giayphep = DateTime.Now.ToString("ddMMyyyyHHmmss_") + Path.GetFileName(file_giay_phep_kd.PostedFile.FileName);
                string pathfile = Server.MapPath("/data/customer/giayphep/");
                string fullpathfile = pathfile + "/" + giayphep;
                if (!Directory.Exists(pathfile))
                {
                    Directory.CreateDirectory(pathfile);
                }
                file_giay_phep_kd.PostedFile.SaveAs(fullpathfile);
            }
            int result = acount.insertCustomerNTD(txtEmailUser.Value, txtPassword.Value, txt_ten_cty.Value, Utils.CIntDef(ddlQuymo.SelectedItem.Value),
                txt_mo_ta_cty.Value, logo, giayphep, txt_ma_so_thue.Value,
                txt_dia_chi_cong_ty.Value, Utils.CIntDef(ddlCity.SelectedItem.Value), txt_website.Value, txt_ten_lien_he.Value, txt_dia_chi_nguoi_lien_he.Value, txt_dien_thoai_lien_he.Value, txt_email_lien_he.Value);
            if (result == 1)
            {
                string strEmail = txtEmailUser.Value;
                string strTitle = "Đăng ký nhà tuyển dụng thành công‏";
                string strMessage = "Chào " + txt_ten_lien_he.Value + ",<br /><br />";
                strMessage += "Bạn đã đăng ký tài khoản Nhà Tuyển dụng của website vieclamsieutoc.com với địa chỉ e-mail "+txtEmailUser.Value+".<br /><br />";
                strMessage += "<span style='FONT-STYLE:italic;font-size: 80%;'>Lưu ý: Xin thứ lỗi nếu bạn nhận được email này do nhầm lẫn; hoặc nếu bạn không muốn đăng ký, xin vui lòng xóa email này.</span><br /><br />";
                strMessage += "Thông tin tài khoản của bạn như sau: <br />";
                strMessage += "- Tài khoản đăng nhập: "+txtEmailUser.Value+"  <br />";
                strMessage += "- Mật khẩu : "+txtPassword.Value+" <br />";
                strMessage += "Nếu bạn có bất kỳ thắc mắc nào, hãy liên hệ với chúng tôi để nhận được sự hỗ trợ nhanh nhất.<br /><br />";
                strMessage += "Tổng đài hỗ trợ: Giờ hành chính 0908.169.044<br /><br />";
                strMessage += "Email liên hệ: <a href='mailto:vieclam@vieclamsieutoc.com'>vieclam@vieclamsieutoc.com</a><br /><br />";
                strMessage += "------------------------------------------------------------</br>";
                strMessage += "Vieclamsieutoc.com<br /><br />";
                strMessage += "<span style='FONT-STYLE:italic;FONT-WEIGHT:bold'>Luôn nỗ lực đem lợi ích thiết thực tới cộng đồng!</span>";
                string strDislay = "Vieclamsieutoc";
                
                result = _mail.SendMailAll(strEmail, "", strTitle, strMessage, strDislay);

                if (result == 1)
                {
                    Response.Write("<script>alert('Cám ơn bạn đã đăng ký tài khoản tại website của chúng tôi.Tài khoản của bạn đã được đăng ký thành công!');location.href='/nha-tuyen-dung.html'</script>");
                }
                else if (result == 0)
                {
                    Response.Write("<script>alert('Lỗi gửi mail kích hoạt, hãy thử lại!');</script>");
                }
            }
            else if (result == 0)
            {
                Response.Write("<script>alert('Lỗi trong quá trình đăng ký, hãy thử lại!');</script>");
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