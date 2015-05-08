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
    public partial class dangkytuvanNTV : System.Web.UI.Page
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private VL_Category vl = new VL_Category();
        private Account acount = new Account();
        private Config cf = new Config();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_CustomerInfo();
            }
        }
        private void Load_CustomerInfo()
        {
            string email = Utils.CStrDef(Session["user"]);
            var item = acount.GetCustomerByEmailUser(email);
            if (item != null && item.CUSTOMER_QUYEN == Cost.QUYEN_NTV)
            {
                txtHoten.Value = item.CUSTOMER_FULLNAME;
                txtDiachi.Value = item.CUSTOMER_ADDRESS;
                txtPhone.Value = item.CUSTOMER_PHONE1;
                txtEmail.Value = item.CUSTOMER_EMAIL;
            }
        }
        protected void btnDangly_Click(object sender, EventArgs e)
        {
            int result = cf.Insert_contact(txtHoten.Value, txtEmail.Value, txtDiachi.Value, txtPhone.Value, Utils.CIntDef(ddlArea.SelectedItem.Value), 1);
            if (result == 1)
            {
                Response.Write("<script>alert('Đăng ký tư vấn thành công!');location.href='/trang-chu.html'</script>");
            }
            else if (result == 0)
            {
                Response.Write("<script>alert('Lỗi gửi thông tin, hãy thử lại!');</script>");
            }
        }
    }
}