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
    public partial class dangkyNTV : System.Web.UI.Page
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
            }
        }
        private void Load_VL_City()
        {
            ddlCity.DataSource = vl.GetAllCity();
            ddlCity.DataBind();
        }

        protected void btnDangky_Click(object sender, EventArgs e)
        {
            if (this.txtCaptcha.Value != this.Session["CaptchaImageText"].ToString())
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
            DateTime birthday = DateTime.ParseExact(txtBirthday.Value, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            int result = acount.insertCustomerNTV(txtEmailUser.Value, txtPassword.Value, txtFullName.Value, birthday, Utils.CIntDef(rdblSex.SelectedItem.Value),
                Utils.CIntDef(ddlTinhtrangHonnhan.SelectedItem.Value), txtAddress.Value, Utils.CIntDef(ddlCity.SelectedValue), txtPhone.Value, txtEmail.Value);
            if (result == 1)
            {
                string code = _mail.GenerateRandomCode(); 
                var item = DB.ESHOP_CUSTOMERs.Where(c => c.CUSTOMER_UN_EMAIL == txtEmailUser.Value);
                item.ToList()[0].ISACTIVE = 3;//1 Kích hoạt, 2 khóa, 3 chưa kích hoạt
                item.ToList()[0].CODE_REGISTER = code;
                DB.SubmitChanges();               

                string strEmail = txtEmailUser.Value;
                string strTitle = "Kích hoạt tài khoản";
                string strLink = "http://" + Request.Url.Authority + "/ntv-hoan-tat-dang-ky?email=" + txtEmailUser.Value + "&code=" + code;
                string strMessage = "Chào " + txtFullName.Value + ",<br /><br />";
                strMessage += "Bạn vừa đăng ký tài khoản tại vieclamsieutoc.com để hoàn tất việc đăng ký. Vui lòng <a href='" + strLink + "'>nhấp vào đây</a> trước khi đăng nhập.<br /><br />";
                strMessage += "<span style='FONT-STYLE:italic;font-size: 80%;'>Lưu ý: Xin thứ lỗi nếu bạn nhận được email này do nhầm lẫn; hoặc nếu bạn không muốn đăng ký, xin vui lòng xóa email này.</span><br /><br />";
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
                    Response.Write("<script>alert('Cám ơn bạn đã đăng ký tài khoản tại website của chúng tôi. Vui lòng kiểm tra email của bạn để kích hoạt tài khoản!');location.href='/trang-chu.html'</script>");
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
    }
}