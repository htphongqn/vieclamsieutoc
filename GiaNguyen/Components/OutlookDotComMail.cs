using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace GiaNguyen.Components
{
    public class OutlookDotComMail
    {
        string _sender = "";
        string _password = "";
        public OutlookDotComMail(string sender, string password)
        {
            _sender = sender;
            _password = password;
        }

        public void SendMail(string recipient, string subject, string message)
        {
            SmtpClient client = new SmtpClient("smtp-mail.outlook.com");

            client.Port = 587;           
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            System.Net.NetworkCredential credentials =
                new System.Net.NetworkCredential(_sender, _password);
            client.EnableSsl = true;
            client.Credentials = credentials;
            try
            {
               using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress(_sender, System.Configuration.ConfigurationManager.AppSettings["EmailDisplayName"]);
                    mail.To.Add(recipient);
                    //if (ccAddress != "")
                    //{
                    //    mail.CC.Add(ccAddress);
                    //}
                    //if (bccAddress != "")
                    //{
                    //    mail.Bcc.Add(bccAddress);
                    //}
                    mail.Subject = subject;

                    string str = message;
                    mail.Body = str;
                    client.Send(mail);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw ex;
            }
        }

    }
}