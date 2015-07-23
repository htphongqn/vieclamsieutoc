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
    public partial class thongtinnhatuyendungNTD : System.Web.UI.Page
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private VL_Category vl = new VL_Category();
        private Account acount = new Account();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null && Session["user_fullname"] != null && Session["user_quyen"] != null && Utils.CIntDef(Session["user_quyen"]) == Cost.QUYEN_NTD)
                {
                    Load_VL_City();
                    Load_VL_Quymo();
                    Load_CustomerInfo();
                }
                else
                {
                    Session.Abandon();
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản nhà tuyển dụng!');location.href='/nha-tuyen-dung.html'</script>");
                }
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
        private void Load_CustomerInfo()
        {
            string email = Utils.CStrDef(Session["user"]);
            var item = acount.GetCustomerByEmailUser(email);
            if (item != null)
            {
                lbEmailUser.Text = item.CUSTOMER_UN_EMAIL;
                txt_ten_cty.Value = item.CUSTOMER_FULLNAME;
                ddlQuymo.SelectedValue = Utils.CStrDef(item.VL_QUYMOCONGTY_ID);
                txt_mo_ta_cty.Value = item.CUSTOMER_SOLUOC;
                if (item.CUSTOMER_LOGO != "" && item.CUSTOMER_LOGO != null)
                    imgLogo.ImageUrl = "~/data/customer/logo/" + item.CUSTOMER_LOGO;
                txt_ma_so_thue.Value = item.CUSTOMER_MASOTHUE;
                txt_dia_chi_cong_ty.Value = item.CUSTOMER_ADDRESS;
                ddlCity.SelectedValue = Utils.CStrDef(item.CUSTOMER_CITY);
                txt_website.Value = item.CUSTOMER_WEBSITE;

                txt_ten_lien_he.Value = item.CUSTOMER_CONTACTNAME;
                txt_dia_chi_nguoi_lien_he.Value = item.CUSTOMER_CONTACTADDRESS;
                txt_dien_thoai_lien_he.Value = item.CUSTOMER_CONTACTPHONE;
                txt_email_lien_he.Value = item.CUSTOMER_CONTACTEMAIL;
            }
        }
        protected void btnCapnhat_Click(object sender, EventArgs e)
        {
            if (this.txtCaptcha.Value != Utils.CStrDef(this.Session["CaptchaImageText"]))
            {
                Response.Write("<script>alert('Nhập mã bảo mật sai!');</script>");
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
            int result = acount.updateCustomerNTD(lbEmailUser.Text, txt_ten_cty.Value, Utils.CIntDef(ddlQuymo.SelectedItem.Value), txt_mo_ta_cty.Value, logo,giayphep, txt_ma_so_thue.Value,
                txt_dia_chi_cong_ty.Value, Utils.CIntDef(ddlCity.SelectedItem.Value), txt_website.Value, txt_ten_lien_he.Value, txt_dia_chi_nguoi_lien_he.Value, txt_dien_thoai_lien_he.Value, txt_email_lien_he.Value);
            if (result == 1)
            {
                var item = acount.GetCustomerByEmailUser(lbEmailUser.Text);
                acount.Load_All_Cuss(item);
                Response.Write("<script>alert('Cập nhật thông tin thành công!');location.href='/ntd-thong-tin-tai-khoan'</script>");
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
            Response.Redirect("/ntd-thong-tin-tai-khoan");
        }
    }
}