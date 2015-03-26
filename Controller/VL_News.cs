using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using vpro.functions;

namespace Controller
{
    public class VL_News
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion

        public List<ESHOP_NEW> GetEshopNewsByCustomerId(int customerId, int catId, int tthoso)//sap xep order -> group
        {
            try
            {
                var list = db.ESHOP_NEWs.Where(n => n.NEWS_SHOWTYPE == 1 && n.CUSTOMER_ID == customerId
                    && (n.ESHOP_NEWS_CATs.Single(y=>y.CAT_ID == catId) != null || catId == 0)
                    && (n.TINHTRANGHOSO == tthoso || tthoso == 0)
                    ).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<ESHOP_NEW> GetCustomer_EshopNewsByCustomerId(int customerId, int catId, int mucluong, int capbac, int diadiem, int bangcap, int kinhnghiem, int type)
        {
            try
            {
                var list = (from a in db.VL_CUSTOMER_ESHOP_NEWs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID                            
                            where a.CUSTOMER_ID == customerId
                            && (b.ESHOP_NEWS_CATs.Single(y=>y.CAT_ID == catId) != null || catId == 0)
                            && (b.VL_MUCLUONG_ID == mucluong || mucluong == 0)
                            && (b.VL_CAOBAC_ID == capbac || capbac == 0)
                            && (b.VL_AREA_ESHOP_NEWs.Single(z=>z.AREA_ID == diadiem) != null || diadiem == 0)
                            && (b.VL_TRINHDOHOCVAN_ID == bangcap || bangcap == 0)
                            && (b.VL_KINHNGHIEM_ID == kinhnghiem || kinhnghiem == 0)
                            && a.TYPE == type
                            && b.NEWS_SHOWTYPE == 1
                            select b).ToList();
                
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<ESHOP_NEW> GetEshopNewsByCustomerNTDId(int customerId, int catId, int mucluong, int capbac, int diadiem, int bangcap, int kinhnghiem)
        {
            try
            {
                var list = (from a in db.VL_CUSTOMER_CUSTOMERs
                            join b in db.ESHOP_NEWs on a.CUSTOMER_ID_2 equals b.CUSTOMER_ID
                            where a.CUSTOMER_ID == customerId
                            && (b.ESHOP_NEWS_CATs.Single(y => y.CAT_ID == catId) != null || catId == 0)
                            && (b.VL_MUCLUONG_ID == mucluong || mucluong == 0)
                            && (b.VL_CAOBAC_ID == capbac || capbac == 0)
                            && (b.VL_AREA_ESHOP_NEWs.Single(z => z.AREA_ID == diadiem) != null || diadiem == 0)
                            && (b.VL_TRINHDOHOCVAN_ID == bangcap || bangcap == 0)
                            && (b.VL_KINHNGHIEM_ID == kinhnghiem || kinhnghiem == 0)
                            && b.NEWS_SHOWTYPE == 1
                            select b).ToList();

                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<ESHOP_NEW> GetEshopNewsByCustomerId(int customerId)
        {
            try
            {
                var list = (from a in db.ESHOP_NEWs
                            where a.CUSTOMER_ID == customerId
                            && a.NEWS_SHOWTYPE == 1
                            select a).ToList();

                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<VL_CUSTOMER_ESHOP_NEW> GetCustomerByCustomerId(int customerId, int newsId, int type)//4 ntd đã xem hồ sơ
        {
            try
            {
                var list = (from a in db.ESHOP_NEWs
                            join b in db.VL_CUSTOMER_ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            where a.CUSTOMER_ID == customerId
                            && (a.NEWS_ID == newsId || newsId == 0)
                            && a.NEWS_SHOWTYPE == 1
                            && b.TYPE == type
                            select b).ToList();

                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<VL_CUSTOMER_ESHOP_NEW> GetCustomerByCustomerId(int customerId, int newsId, int trangthaihoso, int mucluong, int trinhdohocvan, int gioitinh, int tinhtranghonnhan, int kinhnghiem)
        {
            try
            {
                var list = (from a in db.VL_CUSTOMER_ESHOP_NEWs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            where b.CUSTOMER_ID == customerId 
                            && (b.NEWS_ID == newsId || newsId == 0)
                            && (b.VL_MUCLUONG_ID == mucluong || mucluong == 0)
                            && (b.VL_TRINHDOHOCVAN_ID == trinhdohocvan || trinhdohocvan == 0)
                            && (a.ESHOP_CUSTOMER.CUSTOMER_SEX == gioitinh || gioitinh == 0)
                            && (a.ESHOP_CUSTOMER.CUSTOMER_HONNHAN == tinhtranghonnhan || tinhtranghonnhan == 0)
                            && (b.VL_KINHNGHIEM_ID == kinhnghiem || kinhnghiem == 0)
                            && (a.TYPE == trangthaihoso || trangthaihoso == 0)
                            && b.NEWS_SHOWTYPE == 1
                            select a).ToList();

                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<ESHOP_NEW> GetEshopNewsBySearch(string tieu_de, int nganh_nghe, int dia_diem, int muc_luong, int kinh_nghiem, int type)
        {
            try
            {
                var list = db.ESHOP_NEWs.Where(n => n.NEWS_SHOWTYPE == 1
                    && (n.NEWS_TITLE.Contains(tieu_de) || tieu_de == "")
                    && (n.ESHOP_NEWS_CATs.Single(y => y.CAT_ID == nganh_nghe) != null || nganh_nghe == 0)
                    && (n.VL_AREA_ESHOP_NEWs.Single(y => y.AREA_ID == dia_diem) != null || dia_diem == 0)
                    && (n.VL_MUCLUONG_ID == muc_luong || muc_luong == 0)
                    && (n.VL_KINHNGHIEM_ID == kinh_nghiem || kinh_nghiem == 0)
                    && n.NEWS_TYPE == type
                    ).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<ESHOP_NEW> GetEshopNewsByType(int type)
        {
            try
            {
                var list = db.ESHOP_NEWs.Where(n => n.NEWS_SHOWTYPE == 1
                    && n.NEWS_TYPE == type
                    ).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public ESHOP_NEW GetEshopNewsByNews_seo_url(string news_seo_url)
        {
            try
            {
                var item = db.ESHOP_NEWs.Single(n => n.NEWS_SHOWTYPE == 1 && n.NEWS_SEO_URL == news_seo_url);
                return item;
            }
            catch
            {
                return null;
            }
        }
        public List<ESHOP_NEW> GetEshopNewsByOther(string news_seo_url, int customerId)
        {
            try
            {
                var list = db.ESHOP_NEWs.Where(n => n.NEWS_SHOWTYPE == 1 
                    && n.NEWS_SEO_URL != news_seo_url
                    && (n.CUSTOMER_ID == customerId || customerId == 0)).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
    }
}
