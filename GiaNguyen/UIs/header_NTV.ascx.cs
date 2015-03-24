using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using Model;
using CatTrang.Components;

namespace CatTrang.UIs
{
    public partial class header_NTV : System.Web.UI.UserControl
    {
        Propertity per = new Propertity();
        Function fun = new Function();
        private Account account = new Account();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                setLogin();
                load_logo();
            }
        }
        private void setLogin()
        {
            if (Session["user"] != null)
            {
                divlogin.Visible = false;
                divtaikhoan.Visible = true;
                int quyenId = Utils.CIntDef(Session["user_quyen"]);
                if (quyenId == Cost.QUYEN_NTD)
                {
                    divNTD.Visible = true;
                    divNTV.Visible = false;
                }
                else
                {
                    divNTD.Visible = false;
                    divNTV.Visible = true;
                }                
                lbFullName.Text = Utils.CStrDef(Session["user_fullname"]);
                txtEmail.Value = "";
                txtPassword.Value = "";
            }
            else
            {
                divlogin.Visible = true;
                divtaikhoan.Visible = false;
            }
        }
        protected void load_logo()
        {
            var _logoSlogan = per.Load_logo_and_sologan(2, -1);
            if (_logoSlogan.ToList().Count > 0)
            {
                rptLogo.DataSource = _logoSlogan;
                rptLogo.DataBind();
            }
        }
        public string Getbanner(object Banner_type, object banner_field, object Banner_ID, object Banner_Image)
        {
            return fun.Getbanner(Banner_type, banner_field, Banner_ID, Banner_Image);
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            int b = account.Login(txtEmail.Value.Trim(), txtPassword.Value.Trim());

            if (b == 1)//1 Kích hoạt, 2 khóa, 3 chưa kích hoạt, -1 thông tin login sai
            {
                int quyenId = Utils.CIntDef(Session["user_quyen"]);
                if (quyenId == Cost.QUYEN_NTD)
                {
                    Response.Redirect("/nha-tuyen-dung.html");
                }
                else
                {
                    Response.Redirect("/trang-chu.html");
                }
            }
            else
            {
                string s = "N/A";
                if (b == -1)
                    s = "Thông tin đăng nhập không đúng!";
                else if (b == 2)
                    s = "Tài khoản của bạn đã bị khóa!";
                else if (b == 3)
                    s = "Tài khoản chưa được kích hoạt, Vui lòng kiểm tra lại email đã đăng ký!";
                Response.Write("<script>alert('" + s + "');</script>");
            }
        }

        protected void lnkThoat_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect(Request.RawUrl);
        }
    }
}