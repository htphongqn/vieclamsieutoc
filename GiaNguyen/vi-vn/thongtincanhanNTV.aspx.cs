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
using System.IO;

namespace CatTrang.vi_vn
{
    public partial class thongtincanhanNTV : System.Web.UI.Page
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private VL_Category vl = new VL_Category();
        private Account acount = new Account();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null && Session["user_quyen"] != null && Utils.CIntDef(Session["user_quyen"]) == Cost.QUYEN_NTV)
                {
                    Load_VL_City();
                    Load_CustomerInfo();
                }
                else
                {
                    Session.Abandon();
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản người tìm việc!');location.href='/trang-chu.html'</script>");
                }
            }
        }
        private void Load_CustomerInfo()
        {
            string email = Utils.CStrDef(Session["user"]);
            var item = acount.GetCustomerByEmailUser(email);
            if (item != null)
            {
                lbEmailUser.Text = item.CUSTOMER_UN_EMAIL;
                txtFullName.Value = item.CUSTOMER_FULLNAME;
                DateTime birthday = Utils.CDateDef(item.CUSTOMER_BIRTHDAY, DateTime.MinValue);
                txtBirthday.Value="";
                if(birthday != DateTime.MinValue)
                    txtBirthday.Value = birthday.ToString("dd/MM/yyyy");
                if (item.CUSTOMER_LOGO != "" && item.CUSTOMER_LOGO != null)
                {
                    //imgAvata.ImageUrl = "~/data/customer/logo/" + item.CUSTOMER_LOGO;
                    imgAvata.ImageUrl = "TextOnImage.aspx?file=/data/customer/logo/" + item.CUSTOMER_LOGO;
                }
                rdblSex.SelectedValue = Utils.CStrDef(item.CUSTOMER_SEX);
                ddlTinhtrangHonnhan.SelectedValue = Utils.CStrDef(item.CUSTOMER_HONNHAN);
                txtAddress.Value = item.CUSTOMER_ADDRESS;
                ddlCity.SelectedValue = Utils.CStrDef(item.CUSTOMER_CITY);
                txtPhone.Value = item.CUSTOMER_PHONE1;
                txtEmail.Value = item.CUSTOMER_EMAIL;
            }
        }
        private void Load_VL_City()
        {
            ddlCity.DataSource = vl.GetAllCity();
            ddlCity.DataBind();
        }
        protected void btnCapnhat_Click(object sender, EventArgs e)
        {
            if (this.txtCaptcha.Value != this.Session["CaptchaImageText"].ToString())
            {
                Response.Write("<script>alert('Nhập mã bảo mật sai!');</script>");
                return;
            }
            string logo = "";
            if (file_logo.HasFile)
            {
                logo = DateTime.Now.ToString("ddMMyyyyHHmmss_") + Path.GetFileName(file_logo.PostedFile.FileName);
                string pathfile = Server.MapPath("/data/customer/logo/");
                string fullpathfile = pathfile + "/" + logo;
                if (!Directory.Exists(pathfile))
                {
                    Directory.CreateDirectory(pathfile);
                }
                file_logo.PostedFile.SaveAs(fullpathfile);
            }
            DateTime birthday = DateTime.ParseExact(txtBirthday.Value, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            int result = acount.updateCustomerNTV(lbEmailUser.Text, txtFullName.Value, birthday, logo, Utils.CIntDef(rdblSex.SelectedItem.Value),
                Utils.CIntDef(ddlTinhtrangHonnhan.SelectedItem.Value), txtAddress.Value, Utils.CIntDef(ddlCity.SelectedValue), txtPhone.Value, txtEmail.Value);
            if (result == 1)
            {
                var item = acount.GetCustomerByEmailUser(lbEmailUser.Text);
                acount.Load_All_Cuss(item);
                Response.Write("<script>alert('Cập nhật thông tin thành công!');location.href='/ntv-thong-tin-ca-nhan'</script>");
            }
            else if (result == 0)
            {
                Response.Write("<script>alert('Lỗi cập nhật thông tin, hãy thử lại!');</script>");
            }
        }

        protected void lnkRemoveLogo_Click(object sender, EventArgs e)
        {
            try
            {
                string email = Utils.CStrDef(Session["user"]);
                var user = db.ESHOP_CUSTOMERs.Single(u => u.CUSTOMER_UN_EMAIL == email);
                if (user != null)
                {
                    string imagePath = Server.MapPath("/data/customer/logo/" + user.CUSTOMER_LOGO);
                    user.CUSTOMER_LOGO = "";
                    db.SubmitChanges();
                    if (File.Exists(imagePath))
                        File.Delete(imagePath);
                }
            }
            catch
            {

            }
            Response.Redirect("/ntv-thong-tin-ca-nhan");
        }
    }
}