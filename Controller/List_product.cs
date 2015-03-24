using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using vpro.functions;

namespace Controller
{
    public class List_product
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion
        public List<Pro_details_entity> Load_listpro(int _Catid)
        {
            try
            {
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where (c.CAT_ID == _Catid || c.CAT_PARENT_PATH.Contains(_Catid.ToString()))
                            && b.NEWS_TYPE == c.CAT_TYPE
                            && b.NEWS_SHOWTYPE == 1
                            //&& c.CAT_LANGUAGE == lang
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_IMAGE4, b.NEWS_DESC, b.NEWS_PRICE1, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, c.CAT_SEO_URL, c.CAT_ORDER, b.PHONE, b.ADDRESS, b.GOOPMAPSLINK }).OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.CAT_ORDER).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_IMAGE4 = i.NEWS_IMAGE4;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_ORDER = Utils.CIntDef(i.NEWS_ORDER);
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PRICE1 =Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    pro.CAT_SEO_URL = i.CAT_SEO_URL;
                    pro.PHONE = i.PHONE;
                    pro.ADDRESS = i.ADDRESS;
                    pro.GOOGLEMAPSLINK = i.GOOPMAPSLINK;
                    l.Add(pro);
                }
                return l;

            }
            catch (Exception)
            {
                
                throw;
            }
        }
        public List<Pro_details_entity> Load_listprobytype(int type, int _Catid, int lang)
        {
            try
            {
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where b.NEWS_SHOWTYPE == 1 //&& b.NEWS_LANGUAGE == lang
                            && (c.CAT_ID == _Catid || c.CAT_PARENT_PATH.Contains(_Catid.ToString()) || _Catid == 0)     
                             //&& b.NEWS_TYPE == c.CAT_TYPE
                             && b.NEWS_TYPE == type
                            //&& c.CAT_LANGUAGE == lang
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_IMAGE4, b.NEWS_DESC, b.NEWS_PRICE1, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, b.NEWS_COUNT, c.CAT_SEO_URL, c.CAT_ORDER, c.CAT_RANK, b.PHONE, b.ADDRESS, b.GOOPMAPSLINK, b.CUSTOMER_ID,
                                         b.NEWS_UPDATE, b.NEWS_UPDATEFRERESH, b.NEWS_DEALINE,         
                                         b.SOLUONGTUYEN, 
                                         b.MOTACONGVIEC,
                                         b.TINHTRANGHOSO,
                                         b.VL_CAOBAC_ID,
                                         b.VL_DOTUOI_ID,
                                         b.VL_HINHTHUCLAMVIEC_ID,
                                         b.VL_HINHTHUCNOPHOSO_ID,
                                         b.VL_KINHNGHIEM_ID,
                                         b.VL_MUCLUONG_ID,
                                         b.VL_NGOAINGU_ID,
                                         b.VL_TRINHDOHOCVAN_ID,
                                         b.VL_TRINHDONGOAINGU_ID,
                                         b.VL_TRUONGTOTNGHIEP_ID
                            }).OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_IMAGE4 = i.NEWS_IMAGE4;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.CAT_RANK = Utils.CIntDef(i.CAT_RANK);
                    pro.NEWS_COUNT = Utils.CIntDef(i.NEWS_COUNT);
                    pro.NEWS_ORDER = Utils.CIntDef(i.NEWS_ORDER);
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    pro.NEWS_UPDATE = Utils.CDateDef(i.NEWS_UPDATE, DateTime.Now);
                    pro.NEWS_UPDATEFRERESH = Utils.CDateDef(i.NEWS_UPDATEFRERESH, DateTime.Now);
                    pro.NEWS_DEALINE = Utils.CDateDef(i.NEWS_DEALINE, DateTime.Now);
                    pro.CAT_SEO_URL = i.CAT_SEO_URL;
                    pro.PHONE = i.PHONE;
                    pro.ADDRESS = i.ADDRESS;
                    pro.GOOGLEMAPSLINK = i.GOOPMAPSLINK;
                    pro.CUSTOMER_ID = Utils.CIntDef(i.CUSTOMER_ID);

                    pro.MOTACONGVIEC = i.MOTACONGVIEC;
                    pro.SOLUONGTUYEN = Utils.CIntDef(i.SOLUONGTUYEN);
                    pro.TINHTRANGHOSO = Utils.CIntDef(i.TINHTRANGHOSO);

                    pro.VL_CAOBAC_ID = Utils.CIntDef(i.VL_CAOBAC_ID);
                    pro.VL_HINHTHUCLAMVIEC_ID = Utils.CIntDef(i.VL_HINHTHUCLAMVIEC_ID);
                    pro.VL_MUCLUONG_ID = Utils.CIntDef(i.VL_MUCLUONG_ID);
                    pro.VL_DOTUOI_ID = Utils.CIntDef(i.VL_DOTUOI_ID);
                    pro.VL_HINHTHUCNOPHOSO_ID = Utils.CIntDef(i.VL_HINHTHUCNOPHOSO_ID);
                    pro.VL_KINHNGHIEM_ID = Utils.CIntDef(i.VL_KINHNGHIEM_ID);
                    pro.VL_TRINHDOHOCVAN_ID = Utils.CIntDef(i.VL_TRINHDOHOCVAN_ID);
                    pro.VL_NGOAINGU_ID = Utils.CIntDef(i.VL_NGOAINGU_ID);
                    pro.VL_TRINHDONGOAINGU_ID = Utils.CIntDef(i.VL_TRINHDONGOAINGU_ID);
                    pro.VL_TRUONGTOTNGHIEP_ID = Utils.CIntDef(i.VL_TRUONGTOTNGHIEP_ID);
                    l.Add(pro);
                }
                return l;

            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<Pro_details_entity> Load_listprobyPeriod(int Period, int type,int _Catid, int lang)
        {
            try
            {
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where b.NEWS_SHOWTYPE == 1 && b.NEWS_TYPE == c.CAT_TYPE
                            && b.NEWS_LANGUAGE == lang || lang == -1
                            && (c.CAT_ID == _Catid || c.CAT_PARENT_PATH.Contains(_Catid.ToString()) || _Catid == 0)                             
                             && b.NEWS_PERIOD == Period
                             && b.NEWS_TYPE == type
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_IMAGE4, b.NEWS_DESC, b.NEWS_PRICE1, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, c.CAT_SEO_URL, c.CAT_ORDER, b.PHONE, b.ADDRESS, b.GOOPMAPSLINK, b.CUSTOMER_ID, 
                                b.NEWS_COUNT, c.CAT_RANK,
                                b.NEWS_UPDATE, b.NEWS_UPDATEFRERESH, b.NEWS_DEALINE,
                                b.SOLUONGTUYEN, b.MOTACONGVIEC, b.TINHTRANGHOSO, b.VL_CAOBAC_ID, b.VL_DOTUOI_ID, b.VL_HINHTHUCLAMVIEC_ID, b.VL_HINHTHUCNOPHOSO_ID, b.VL_KINHNGHIEM_ID, b.VL_MUCLUONG_ID, b.VL_NGOAINGU_ID, b.VL_TRINHDOHOCVAN_ID, b.VL_TRINHDONGOAINGU_ID, b.VL_TRUONGTOTNGHIEP_ID }).OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_IMAGE4 = i.NEWS_IMAGE4;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.CAT_RANK = Utils.CIntDef(i.CAT_RANK);
                    pro.NEWS_COUNT = Utils.CIntDef(i.NEWS_COUNT);
                    pro.NEWS_ORDER = Utils.CIntDef(i.NEWS_ORDER);
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    pro.NEWS_UPDATE = Utils.CDateDef(i.NEWS_UPDATE, DateTime.Now);
                    pro.NEWS_UPDATEFRERESH = Utils.CDateDef(i.NEWS_UPDATEFRERESH, DateTime.Now);
                    pro.NEWS_DEALINE = Utils.CDateDef(i.NEWS_DEALINE, DateTime.Now);
                    pro.CAT_SEO_URL = i.CAT_SEO_URL;
                    pro.PHONE = i.PHONE;
                    pro.ADDRESS = i.ADDRESS;
                    pro.GOOGLEMAPSLINK = i.GOOPMAPSLINK;
                    pro.CUSTOMER_ID = Utils.CIntDef(i.CUSTOMER_ID);

                    pro.MOTACONGVIEC = i.MOTACONGVIEC;
                    pro.SOLUONGTUYEN = Utils.CIntDef(i.SOLUONGTUYEN);
                    pro.TINHTRANGHOSO = Utils.CIntDef(i.TINHTRANGHOSO);

                    pro.VL_CAOBAC_ID = Utils.CIntDef(i.VL_CAOBAC_ID);
                    pro.VL_HINHTHUCLAMVIEC_ID = Utils.CIntDef(i.VL_HINHTHUCLAMVIEC_ID);
                    pro.VL_MUCLUONG_ID = Utils.CIntDef(i.VL_MUCLUONG_ID);
                    pro.VL_DOTUOI_ID = Utils.CIntDef(i.VL_DOTUOI_ID);
                    pro.VL_HINHTHUCNOPHOSO_ID = Utils.CIntDef(i.VL_HINHTHUCNOPHOSO_ID);
                    pro.VL_KINHNGHIEM_ID = Utils.CIntDef(i.VL_KINHNGHIEM_ID);
                    pro.VL_TRINHDOHOCVAN_ID = Utils.CIntDef(i.VL_TRINHDOHOCVAN_ID);
                    pro.VL_NGOAINGU_ID = Utils.CIntDef(i.VL_NGOAINGU_ID);
                    pro.VL_TRINHDONGOAINGU_ID = Utils.CIntDef(i.VL_TRINHDONGOAINGU_ID);
                    pro.VL_TRUONGTOTNGHIEP_ID = Utils.CIntDef(i.VL_TRUONGTOTNGHIEP_ID);

                    l.Add(pro);
                }
                return l;

            }
            catch (Exception)
            {

                throw;
            }
        }
        //Load title
        public string Loadtitle(string _cat_seo_url)
        {
            try
            {
                var list = db.ESHOP_CATEGORies.Where(n => n.CAT_SEO_URL == _cat_seo_url).Select(n => new { n.CAT_NAME }).ToList();
                if (list.Count > 0)
                {
                    return list[0].CAT_NAME;
                }
                return "";
            }
            catch (Exception)
            {

                throw;
            }
        }
        //Get sotin
        public int Getsotin(int catid)
        {
            int sotin = db.ESHOP_CATEGORies.Where(n => n.CAT_ID == catid).ToList().Count > 0 ? Utils.CIntDef(db.ESHOP_CATEGORies.Where(n => n.CAT_ID == catid).First().CAT_PAGEITEM) : 0;
            return sotin;
        }
    }
}
