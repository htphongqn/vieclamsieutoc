using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Controller;
using GiaNguyen.Components;
using System.Web.UI.HtmlControls;
using System.IO;
using vpro.functions;
using CatTrang.Components;

namespace CatTrang.vi_vn
{
    public partial class contactus : System.Web.UI.Page
    {
        #region Declare
        Config cf = new Config();
        SendMail sm = new SendMail();
        List_product list_pro = new List_product();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        private News_details ndetail = new News_details();
        Product_Details pro_detail = new Product_Details();
        Pageindex_chage change = new Pageindex_chage();
        int _Catid = 0;
        string _sNews_Seo_Url = string.Empty;
        int _page = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _Catid = Utils.CIntDef(Session["Cat_id"]);
                _sNews_Seo_Url = Request.QueryString["purl"];
                _page = Utils.CIntDef(Request.QueryString["page"]);

                Loadlist();
                loaddetail();
            }
        }

        private void loaddetail()
        {
            string _sCat_Seo_Url = Utils.CStrDef(Request.QueryString["curl"]);
            if (!string.IsNullOrEmpty(_sCat_Seo_Url))
            {
                _sNews_Seo_Url = ndetail.Get_News_seo_url(_sCat_Seo_Url);
            }
            var list = pro_detail.Load_Product_Detail(_sNews_Seo_Url);
            if (list != null && list.Count > 0)
            {
                lbImage.Text = GetImage(list[0].NEWS_ID, list[0].NEWS_IMAGE4);
                lbHotline.Text = list[0].PHONE;
                if (!string.IsNullOrEmpty(list[0].GOOGLEMAPSLINK))
                {
                    hplGooglemap.Visible = true;
                    hplGooglemap.NavigateUrl = list[0].GOOGLEMAPSLINK;
                }
                lbEmail.Text = list[0].EMAIL;
                lbAddress.Text = list[0].ADDRESS;
                liHtml.Text = ndetail.Showfilehtm(_sCat_Seo_Url, _sNews_Seo_Url, "-vi.htm");
            } 
        }
        public void Loadlist()
        {
            try
            {
                //int sotin = list_pro.Getsotin(_Catid);
                //if (sotin == 0)
                //int sotin = 150;
                var list = list_pro.Load_listpro(_Catid);
                //var list = list_pro.Load_listprobytype(4, Cost.VI);
                if (list.Count > 0)
                {
                    //if (_page != 0)
                    //{
                    //    rptListProjectLeft.DataSource = list.Skip(sotin * _page - sotin).Take(sotin);
                    //    rptListProjectLeft.DataBind();
                    //}
                    //else
                    //{
                        //rptListProjectLeft.DataSource = list.Take(sotin);
                    rptListProjectLeft.DataSource = list;    
                    rptListProjectLeft.DataBind();
                    //}

                    //ltrPage.Text = change.result(list.Count, sotin, _cat_seo_url, 0, _page, 1);

                }
            }
            catch
            {

            }
        }
        public string GetImage(object News_Id, object News_Image1)
        {

            try
            {
                return fun.GetImageT_News_Hasclass(News_Id, News_Image1, "");
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetLink(object News_Url, object News_Seo_Url, object cat_seo)
        {
            try
            {
                return fun.Getlink_NewsContract(News_Url, News_Seo_Url, cat_seo);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }

        protected void Lbthanhtoan_Click(object sender, EventArgs e)
        {
            try
            {

                if (this.txtCapcha.Value != this.Session["CaptchaImageText"].ToString())
                {
                    lblresult.Text = "Mã bảo vệ không đúng.";
                    //mp1.Show();
                }
                else
                {

                    string _sEmailCC = string.Empty;
                    string _sEmail = txtEmail.Value;
                    string _sName = Txtname.Value;
                    string _add = Txtaddress.Value;
                    string _phone = Txtphone.Value;
                    string _content = txtContent.Value;
                    //string _title = txttitle.Value;
                    cf.Insert_contact(_sName, _sEmail, "", _content, _add, _phone);
                    string _mailBody = string.Empty;
                    _mailBody += "<br/><br/><strong>Tên khách hàng</strong>: " + _sName;
                    _mailBody += "<br/><br/><strong>Email</strong>: " + _sEmail;
                    _mailBody += "<br/><br/><strong>Số điện thoại</strong>: " + _phone;
                    _mailBody += "<br/><br/><strong>Địa chỉ</strong>: " + _add;
                    //_mailBody += "<br/><br/><strong>Tiêu đề</strong>: " + _title;
                    _mailBody += "<br/><br/><strong>Nội dung</strong>: " + _content + "<br/><br/>";
                    string _sMailBody = string.Empty;
                    _sMailBody += "Cám ơn quý khách: " + _sName + " đã đặt liên hệ với chúng tôi. Đây là email được gửi từ website của " + System.Configuration.ConfigurationManager.AppSettings["EmailDisplayName"] + " <br>" + _mailBody;
                    _sEmailCC = cf.Getemail(2).Count > 0 ? cf.Getemail(2)[0].EMAIL_TO : "";
                    sm.SendEmailSMTP("Thông báo: Bạn đã liên hệ thành công", _sEmail, _sEmailCC, "", _sMailBody, true, false);
                    string strScript = "<script>";
                    strScript += "alert(' Đã gửi thành công!');";
                    strScript += "window.location='/trang-chu.html';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
    }
}