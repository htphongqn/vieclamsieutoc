using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GiaNguyen.Components;
using Controller;
using vpro.functions;
using System.Web.Services;

namespace CatTrang.vi_vn
{
    public partial class Ajax_customer : System.Web.UI.Page
    {
        #region Declare
        static Account acc = new Account();
        static clsFormat fm = new clsFormat();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string login(string email, string pass)
        {
            try
            {
                if (acc.Login(email, fm.MaHoaMatKhau(pass)))
                {

                    return "success";
                }
                else
                {
                    return "errors";
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return "";
            }
        }
        [WebMethod]
        public static string regis_mail(string email)
        {
            Register_email rg = new Register_email();
            Config cf = new Config();
            SendMail semail = new SendMail();
            if (rg.Add_email(email))
            {
                string _sMailBody = string.Empty;
                string _sEmailCC = string.Empty;
                _sMailBody += "Cám ơn bạn đã đăng ký nhận khuyến mãi của chúng tôi.";
                var _ccMail = cf.Getemail(2);
                if (_ccMail.ToList().Count > 0)
                {
                    _sEmailCC = _ccMail.ToList()[0].EMAIL_TO;
                }
                semail.SendEmailSMTP("Thông báo: Bạn đã đăng ký nhận khuyến mãi thành công", email, _sEmailCC, "", _sMailBody, true, false);
                return "success";
            }
            else return "errors";
        }
    }
}