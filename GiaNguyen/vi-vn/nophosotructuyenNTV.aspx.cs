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
    public partial class nophosotructuyenNTV : System.Web.UI.Page
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private VL_Category vl = new VL_Category();
        private Account acount = new Account();
        private VL_News news = new VL_News();
        string _sNews_Seo_Url = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            _sNews_Seo_Url = Utils.CStrDef(Request.QueryString["purl"]);
            if (!IsPostBack)
            {
                if (Session["user"] != null && Session["user_quyen"] != null && Utils.CIntDef(Session["user_quyen"]) == Cost.QUYEN_NTV)
                {
                    Load_Ungtuyen();
                    Load_CustomerInfo();
                }
                else
                {
                    Session.Abandon();
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản người tìm việc!');location.href='/trang-chu.html'</script>");
                }
            }
        }
        private void Load_Ungtuyen()
        {
            var item = news.GetEshopNewsByNews_seo_url(_sNews_Seo_Url);
            if (item != null)
            {
                Session["newsId"] = Utils.CIntDef(item.NEWS_ID);
                lbVitrituyendung.Text = Utils.CStrDef(item.NEWS_TITLE);
                int customerId = Utils.CIntDef(item.CUSTOMER_ID);
                var customer = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == customerId);
                if (customer != null && customer.ToList().Count > 0)
                {
                    lbNguoilienhe.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_CONTACTNAME);
                    lbCongtyungtuyen.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_FULLNAME);
                }
            }
        }
        private void Load_CustomerInfo()
        {
            string email = Utils.CStrDef(Session["user"]);
            var item = acount.GetCustomerByEmailUser(email);
            if (item != null)
            {
                lbHotenungtuyen.Text = item.CUSTOMER_FULLNAME;
                Load_Hoso(item.CUSTOMER_ID);
            }
        }
        private void Load_Hoso(int customerId)
        {
            ddlHoso.DataSource = news.GetEshopNewsByCustomerId(customerId);//.Where(n => n.TINHTRANGHOSO == 2);
            ddlHoso.DataBind();
        }
        protected void btnNopdon_Click(object sender, EventArgs e)
        {
            if (this.txt_ma_xac_minh.Value != Utils.CStrDef(this.Session["CaptchaImageText"]))
            {
                Response.Write("<script>alert('Nhập mã bảo mật sai!');</script>");
                return;
            }
            int customerId = Utils.CIntDef(Session["userId"]);
            int customerNTDId = Utils.CIntDef(Session["customerId"]);
            int newsId = Utils.CIntDef(Session["newsId"]);
            var item = db.VL_CUSTOMER_ESHOP_NEWs.Where(n=>n.CUSTOMER_ID == customerId && n.NEWS_ID == newsId && n.TYPE == 2);
            if (item != null && item.ToList().Count > 0)
            {
                Response.Write("<script>alert('Bạn đã nộp đơn cho vị trí tuyển dụng này!');location.href='/ntv-viec-lam-da-ung-tuyen'</script>");
                return;
            }
            int result = news.Nopdonungtuyen(customerId, customerNTDId, newsId, Utils.CIntDef(ddlHoso.SelectedValue), 2, txtTieude.Value, txtNoidung.Value);
            if (result == 1)
            {
                Response.Write("<script>alert('Nộp đơn trực tuyến cho nhà tuyển dụng thành công!');location.href='/ntv-viec-lam-da-ung-tuyen'</script>");
            }
            else if (result == 0)
            {
                Response.Write("<script>alert('Lỗi cập nhật thông tin, hãy thử lại!');</script>");
            }
        }
    }
}