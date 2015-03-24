using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using GiaNguyen.Components;
using vpro.functions;

namespace CatTrang.vi_vn
{
    public partial class register : System.Web.UI.Page
    {
        #region Declare
        clsFormat fm = new clsFormat();
        SendMail semail = new SendMail();
        Account acc = new Account();

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private bool CheckError()
        {
            if (acc.CheckExitsEmail(txtEmail.Value))
            {
                string strScript = "<script>";
                strScript += "alert(' Email này đã có người sử dụng');";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
                return false;
            }
            else if (txtPassword1.Value != txtRePassword.Value)
            {
                string strScript = "<script>";
                strScript += "alert(' Mật khẩu không trùng nhau');";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
                return false;
            }
            else
            {
                return true;
            }


        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                if (CheckError())
                {
                    //Đăng kí thông tin cá nhân
                    string _sbody = string.Empty;
                    //int _iUserID = -1;
                    string _sActiveCode = string.Empty;
                    string _sCodeActive = fm.TaoChuoiTuDong(15);
                    string _sFullName = string.Empty;
                    //Định dạng ngày sinh
                    string birthday = BirthDate_Day.Value + "/" + BirthDate_Month.Value + "/" + BirthDate_Year.Value;
                    DateTime _date = DateTime.ParseExact(birthday, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                    //===============//
                    acc.insertCus(txtEmail.Value, fm.MaHoaMatKhau(txtPassword1.Value), txtName.Value, txtPhone.Value, _date);
                    acc.Load_All_Cus(txtEmail.Value);
                    #region Active
                    var _new = acc.custom();
                    if (_new.ToList().Count > 0)
                    {
                        int _iUserID = Utils.CIntDef(_new.Single().CUSTOMER_ID);
                        _sFullName = Utils.CStrDef(_new.Single().CUSTOMER_FULLNAME);

                        //SendMail send = new SendMail();

                        //String link = System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/kich-hoat.aspx?active=" + _sCodeActive + "&id=" + _iUserID;
                        //#region Mail

                        //_sbody += "";
                        //_sbody += "<table align='center' border='0' cellpadding='0' cellspacing='0' width='600'>";
                        //_sbody += "<tbody>";
                        //_sbody += "<tr>";
                        //_sbody += "<td colspan='3' style='background-color:#474747' align='center' height='11' valign=''><img style='display:block;margin:0px;padding:0px' height='11' width='600' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/holder-top.gif'></td>";
                        //_sbody += "</tr><tr>";
                        //_sbody += "<td style='background-color:#474747' align='left' height='1' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        //_sbody += "<td style='background-color:#f0f0f0;font-size:11px' align='right' valign='' width='594'><table border='0' cellpadding='0' cellspacing='0'>";
                        //_sbody += "  <tbody>";
                        //_sbody += "    <tr>";
                        //_sbody += "<td align='right' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        //_sbody += "<td align='right' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        //_sbody += "<td align='right' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        //_sbody += "      <td style='font-size:11px' align='left' valign=''><a href='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "default.aspx'><span>" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "</span></a></td>";
                        //_sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        //_sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        //_sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        //_sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        //_sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        //_sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        //_sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";

                        //_sbody += "<td style='font-size:11px' align='left' height='1' valign=''><a href='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "default.aspx'><span>";
                        //_sbody += "" + System.Configuration.ConfigurationManager.AppSettings["Hotline"] + "</span></a></td>";
                        //_sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        //_sbody += "    </tr>";
                        //_sbody += "  </tbody>";
                        //_sbody += "</table></td>";
                        //_sbody += "<td style='background-color:#474747' align='left' height='1' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        //_sbody += "    </tr><tr>";
                        //_sbody += "<td style='background-color:#474747' align='left' height='1' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        //_sbody += "<td align='left' height='8' valign='' width='594'><img alt='' style='display:block;margin:0px;padding:0px' height='8' width='594' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/top-link_bottom-border.gif'></td>";
                        //_sbody += "<td style='background-color:#474747' align='left' height='1' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        //_sbody += "</tr><tr>";
                        //_sbody += "<td style='background-color:#474747' align='left' height='1' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        //_sbody += "<td style='background:#fff' align='left' valign='' width='594'><table border='0' cellpadding='0' cellspacing='0'>";
                        //_sbody += "  <tbody>";
                        //_sbody += "    <tr>";
                        //_sbody += "      <td height='42'>&nbsp;</td>";
                        //_sbody += "      <td align='left' height='42' valign='' width='170'><h1 style='margin:0'><a href='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "' target='_blank'><span><img alt='BlauMail' style='display:block;margin:0px;padding:0px' border='0' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "vi-vn/Images/logo.png'></span></a></h1></td>";
                        //_sbody += "      <td height='42'>&nbsp;</td>";
                        //_sbody += "      <td style='font-size:11px' align='right' height='42' valign='' width='364'>Dịch vụ khách hàng - Hotline: <strong>" + System.Configuration.ConfigurationManager.AppSettings["Phone"] + "</strong></td>";
                        //_sbody += "      <td height='42'>&nbsp;</td>";
                        //_sbody += "    </tr>";
                        //_sbody += "  </tbody>";
                        //_sbody += "</table>";
                        //_sbody += "<table border='0' cellpadding='0' cellspacing='0'>";
                        //_sbody += "  <tbody>";
                        //_sbody += "    <tr>";
                        //_sbody += "      <td height='20' width='594'><img alt='' style='display:block;margin:0px;padding:0px' height='20' width='594' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/header-bottom-border.gif'></td>";
                        //_sbody += "    </tr>";
                        //_sbody += "  </tbody>";
                        //_sbody += "</table></td>";
                        //_sbody += "<td style='background-color:#474747' align='left' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        //_sbody += "</tr>";
                        //_sbody += "<tr>";
                        //_sbody += "<td style='background-color:#474747' align='left' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        //_sbody += "<td style='background:#fff' align='left' valign='' width='594'><table border='0' cellpadding='0' cellspacing='0'>";
                        //_sbody += "  <tbody>";
                        //_sbody += "    <tr>";
                        //_sbody += "      <td align='left' valign='' width='20'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_content.gif'></td>";
                        //_sbody += "      <td align='left' valign='' width='20'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_content.gif'></td>";
                        //_sbody += "    </tr>";
                        //_sbody += "  </tbody>";
                        //_sbody += "</table>";
                        //_sbody += "<table border='0' cellpadding='0' cellspacing='0' width='100%'>";
                        //_sbody += "  <tbody>";
                        //_sbody += "    <tr>";
                        //_sbody += "      <td align='left' valign='' width='20'><img alt='' style='display:block;margin:0px;padding:0px' height='20' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_content.gif'></td>";
                        //_sbody += "      <td align='left' valign='' width='100%'><h2 style='font-weight:bold;font-size:12px'>Thư xác nhận đăng ký tài khoản từ <a href='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "' target='_blank'>Phương Nam</a></h2></td>";
                        //_sbody += "      <td align='left' valign='' width='20'><img style='display:block;margin:0px;padding:0px' alt='' height='20' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_content.gif'></td>";
                        //_sbody += "      <td align='left' valign='' width='20'><img style='display:block;margin:0px;padding:0px' alt='' height='20' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_content.gif'></td>";
                        //_sbody += "    </tr>";
                        //_sbody += "    <tr>";
                        //_sbody += "      <td>&nbsp;</td>";
                        //_sbody += "      <td style='line-height:26px;font-size:12px' align='left' valign='' width='360'><p style='margin:0px;padding:0px;text-align:justify'>Xin chào, <span style='font-size:14px; color:#006600; font-weight:bold'>" + _sFullName + "</span> <br></p>";
                        //_sbody += "        <p>Chúc mừng bạn đã đăng ký  thành công.<br />";
                        //_sbody += "          Để xác nhận và kích hoạt tài  khoản vui lòng nhấn vào <a href='" + link + "'>đây</a>. <br />";
                        //_sbody += "          Nếu không nhấn vào được, bạn  có thể chép đường dẫn <br />";
                        //_sbody += "<a href='" + link + "'> " + link + " </a><br />";
                        //_sbody += "          và dán lên ô địa chỉ trong  trình duyệt của bạn.<br />";
                        //_sbody += "          Mọi chi tiết xin vui lòng  tham khảo tại website <a href='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "'>" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "</a> hoặc liên hệ  bộ phận hỗ trợ trực tuyến qua số điện thoại " + System.Configuration.ConfigurationManager.AppSettings["Phone"] + " để  được hỗ trợ.<br />";
                        //_sbody += "    <em>Rất hân hạnh được phục vụ</em></p>";

                        //#endregion

                        //send.SendMail_Active_Account(txtEmail.Value, "", "", _sbody);

                        //    Response.Redirect("~/vi-vn/deal/thong-bao.aspx");
                        string strScript = "<script>";
                        strScript += "alert(' Đăng kí thành công!');";
                        strScript += "window.location='/';";
                        strScript += "</script>";
                        Page.RegisterClientScriptBlock("strScript", strScript);
                    #endregion
                    }
                }
                else
                {

                }


            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
    }
}