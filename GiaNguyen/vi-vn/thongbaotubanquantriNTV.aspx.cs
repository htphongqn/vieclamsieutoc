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
    public partial class thongbaotubanquantriNTV : System.Web.UI.Page
    {
        private Function fun = new Function();
        private List_product list_pro = new List_product();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null && Session["user_fullname"] != null && Session["user_quyen"] != null && Utils.CIntDef(Session["user_quyen"]) == 1)
                {
                    Load_Thongbao();
                }
                else
                {
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản người tìm việc!');location.href='/trang-chu.html'</script>");
                }
            }
        }
        private void Load_Thongbao()
        {
            var list = list_pro.Load_listprobytype(6, 0, 0, -1);
            rptThongbao.DataSource = list;
            rptThongbao.DataBind();
        }
        public string GetLink(object News_Url, object News_Seo_Url, object cat_seo)
        {
            try
            {
                return fun.Getlink_News(News_Url, News_Seo_Url, cat_seo);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
    }
}