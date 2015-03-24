using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using vpro.functions;

namespace Controller
{
    public class Booking_result
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion
        public void Add_booking(int hotelId, DateTime? day1, DateTime? day2, int Classtype, int quantity, int peop1, int peop2, string fullname, string phone, string email, bool ISOwnership)
        {
            ESHOP_CONTACT_BOOKING _contact = new ESHOP_CONTACT_BOOKING();
            _contact.NEWS_ID = hotelId;
            _contact.CONT_DAY1 = day1;
            _contact.CONT_DAY2 = day2;
            _contact.CONT_CLASS_TYPE = Classtype;
            _contact.CONT_PEOPLE1 = peop1;
            _contact.CONT_PEOPLE2 = peop2;
            _contact.CONT_PEOPLE3 = quantity;
            _contact.CONT_FULLNAME = fullname;
            _contact.CONT_PHONE = phone;
            _contact.CONT_MAIL = email;
            _contact.ORDER_STATUS = 0;
            _contact.ISOwnership = ISOwnership; 
            _contact.CONT_PUBLISDATE = DateTime.Now;
            db.ESHOP_CONTACT_BOOKINGs.InsertOnSubmit(_contact);
            db.SubmitChanges();
        }
        public void Add_booking2(int projectId, string fullname, string phone, string email, string CONTENT, string company, string address)
        {
            ESHOP_ORDER _contact = new ESHOP_ORDER();
            _contact.NEWS_ID = projectId;
            _contact.ORDER_FULLNAME = fullname;
            _contact.ORDER_PHONE = phone;
            _contact.ORDER_EMAIL = email;
            _contact.ORDER_CONTENT = CONTENT;
            _contact.ORDER_COMPANY = company;
            _contact.ORDER_ADDRESS = address;
            _contact.ORDER_STATUS = 0;
            _contact.ORDER_PUBLISHDATE = DateTime.Now;
            db.ESHOP_ORDERs.InsertOnSubmit(_contact);
            db.SubmitChanges();
        }
    }
}
