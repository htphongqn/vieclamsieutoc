using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using System.Web;
using System.Web.UI;
using vpro.functions;

namespace Controller
{
    public class Account
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion
        public int Login(string Email, string MatKhau)
        {
            var dangnhap = from a in db.ESHOP_CUSTOMERs
                           where a.CUSTOMER_UN_EMAIL == Email && a.CUSTOMER_PW == MatKhau
                           select a;
            if (dangnhap != null && dangnhap.ToList().Count > 0)
            {
                int activeId = Utils.CIntDef(dangnhap.ToList()[0].ISACTIVE);//1 Kích hoạt, 2 khóa, 3 chưa kích hoạt
                if (activeId == 1)
                    Load_All_Cuss(dangnhap.ToList()[0]);
                return activeId;
            }
            else
                return -1;
        }
        public void Load_All_Cuss(ESHOP_CUSTOMER _cus)
        {
            try
            {
                HttpContext.Current.Session["user"] = _cus.CUSTOMER_UN_EMAIL;
                HttpContext.Current.Session["userId"] = _cus.CUSTOMER_ID;
                HttpContext.Current.Session["user_quyen"] = _cus.CUSTOMER_QUYEN;
                HttpContext.Current.Session["user_fullname"] = _cus.CUSTOMER_FULLNAME;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public int Doimatkhau(string emailuser, string pass)
        {
            try
            {
                ESHOP_CUSTOMER user = GetCustomerByEmailUser(emailuser);
                if (user != null)
                {
                    user.CUSTOMER_UN_EMAIL = emailuser;

                    user.CUSTOMER_PW = pass;
                    user.CUSTOMER_UPDATE = DateTime.Now;

                    db.SubmitChanges();
                    return 1;
                }
                return 0;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return 0;
            }
        }   
        public bool CheckExitsEmail(string mail)
        {
            try
            {
                var _user = db.GetTable<ESHOP_CUSTOMER>().Where(u => u.CUSTOMER_UN_EMAIL == mail.Trim());

                if (_user.ToList().Count > 0)
                    return true;

                return false;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return true;
            }
        }
        public ESHOP_CUSTOMER GetCustomerByEmailUser(string emailUser)
        {
            try
            {
                var _user = db.ESHOP_CUSTOMERs.Single(u => u.CUSTOMER_UN_EMAIL == emailUser.Trim());
                return _user;
            }
            catch
            {
                return null;
            }
        }
        public int insertCustomerNTV(string emailuser, string pass, string fullname, DateTime birthday, int sex, int tthonnhan, string address, int cityId, string phone, string email)
        {
            try
            {
                ESHOP_CUSTOMER user = new ESHOP_CUSTOMER();
                user.CUSTOMER_UN_EMAIL = emailuser;
                user.CUSTOMER_PW = pass;

                user.CUSTOMER_FULLNAME = fullname;
                user.CUSTOMER_CONTACTNAME = fullname;
                user.CUSTOMER_BIRTHDAY = birthday;
                user.CUSTOMER_SEX = sex;
                user.CUSTOMER_HONNHAN = tthonnhan;
                user.CUSTOMER_ADDRESS = address;
                user.CUSTOMER_CITY = cityId;
                user.CUSTOMER_PHONE1 = phone;
                user.CUSTOMER_EMAIL = email;
                user.CUSTOMER_QUYEN = 1;
                user.CUSTOMER_PUBLISHDATE = DateTime.Now;
                db.ESHOP_CUSTOMERs.InsertOnSubmit(user);
                user.ISACTIVE = 1;

                db.SubmitChanges();
                return 1;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return 0;
            }
        }
        public int insertCustomerNTD(string emailuser, string pass, string fullname, int quymoId, string soluoc, string logo, string giayphep, string masothue, string address, int cityId, string website, string contactname, string contactaddress, string contactphone, string contactemail)
        {
            try
            {
                ESHOP_CUSTOMER user = new ESHOP_CUSTOMER();
                user.CUSTOMER_UN_EMAIL = emailuser;
                user.CUSTOMER_PW = pass;

                user.CUSTOMER_FULLNAME = fullname;
                user.VL_QUYMOCONGTY_ID = quymoId;
                user.CUSTOMER_SOLUOC = soluoc;
                if (logo != "")
                    user.CUSTOMER_LOGO = logo;
                if (giayphep != "")
                    user.CUSTOMER_GIAYPHEP = giayphep;
                user.CUSTOMER_MASOTHUE = masothue;
                user.CUSTOMER_ADDRESS = address;
                user.CUSTOMER_CITY = cityId;
                user.CUSTOMER_WEBSITE = website;

                user.CUSTOMER_CONTACTNAME = contactname;
                user.CUSTOMER_CONTACTADDRESS = contactaddress;
                user.CUSTOMER_CONTACTPHONE = contactphone;
                user.CUSTOMER_CONTACTEMAIL = contactemail;

                user.CUSTOMER_QUYEN = 2;
                user.CUSTOMER_PUBLISHDATE = DateTime.Now;
                user.ISACTIVE = 1;//1 Kích hoạt, 2 khóa, 3 chưa kích hoạt

                db.ESHOP_CUSTOMERs.InsertOnSubmit(user);

                db.SubmitChanges();
                return 1;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return 0;
            }
        }
        public int updateCustomerNTV(string emailuser, string fullname, DateTime birthday, string logo, int sex, int tthonnhan, string address, int cityId, string phone, string email)
        {
            try
            {
                ESHOP_CUSTOMER user = GetCustomerByEmailUser(emailuser);
                if (user != null)
                {
                    user.CUSTOMER_UN_EMAIL = emailuser;

                    user.CUSTOMER_FULLNAME = fullname;
                    user.CUSTOMER_CONTACTNAME = fullname;
                    user.CUSTOMER_BIRTHDAY = birthday;
                    user.CUSTOMER_SEX = sex; 
                    if (logo != "")
                        user.CUSTOMER_LOGO = logo;
                    user.CUSTOMER_HONNHAN = tthonnhan;
                    user.CUSTOMER_ADDRESS = address;
                    user.CUSTOMER_CITY = cityId;
                    user.CUSTOMER_PHONE1 = phone;
                    user.CUSTOMER_EMAIL = email;
                    user.CUSTOMER_QUYEN = 1;
                    user.CUSTOMER_PUBLISHDATE = DateTime.Now;

                    db.SubmitChanges();
                    return 1;
                }
                return 0;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return 0;
            }
        }
        public int updateCustomerNTD(string emailuser, string fullname, int quymoId, string soluoc, string logo,string giayphep, string masothue, string address, int cityId, string website, string contactname, string contactaddress, string contactphone, string contactemail)
        {
            try
            {
                ESHOP_CUSTOMER user = GetCustomerByEmailUser(emailuser);
                if (user != null)
                {
                    user.CUSTOMER_UN_EMAIL = emailuser;

                    user.CUSTOMER_FULLNAME = fullname;
                    user.VL_QUYMOCONGTY_ID = quymoId;
                    user.CUSTOMER_SOLUOC = soluoc;
                    if(logo != "")
                        user.CUSTOMER_LOGO = logo;
                    if (giayphep != "")
                        user.CUSTOMER_GIAYPHEP = giayphep;
                    user.CUSTOMER_MASOTHUE = masothue;
                    user.CUSTOMER_ADDRESS = address;
                    user.CUSTOMER_CITY = cityId;
                    user.CUSTOMER_WEBSITE = website;

                    user.CUSTOMER_CONTACTNAME = contactname;
                    user.CUSTOMER_CONTACTADDRESS = contactaddress;
                    user.CUSTOMER_CONTACTPHONE = contactphone;
                    user.CUSTOMER_CONTACTEMAIL = contactemail;

                    user.CUSTOMER_QUYEN = 2;
                    user.CUSTOMER_PUBLISHDATE = DateTime.Now;

                    db.SubmitChanges();
                    return 1;
                }
                return 0;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return 0;
            }
        }
    }
}
