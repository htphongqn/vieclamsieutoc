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
                            && (b.ESHOP_NEWS_CATs.Single(y => y.CAT_ID == catId) != null || catId == 0)
                            && (b.VL_MUCLUONG_ID == mucluong || mucluong == 0)
                            && (b.VL_CAOBAC_ID == capbac || capbac == 0)
                            && (b.VL_AREA_ESHOP_NEWs.Single(z => z.AREA_ID == diadiem) != null || diadiem == 0)
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
        public List<VL_CUSTOMER_ESHOP_NEW> GetCustomerByCustomerId(int customerId, int newsIdUngtuyen, int type)//4 ntd đã xem hồ sơ, 3 ntv đã xem tuyển dụng
        {
            try
            {
                var list = db.VL_CUSTOMER_ESHOP_NEWs.Where(a => a.CUSTOMER_ID == customerId
                            && (a.NEWS_ID_UNGTUYEN == newsIdUngtuyen || newsIdUngtuyen == 0)
                            && a.TYPE == type
                            ).OrderByDescending(n => n.PUBLISHDATE).Take(12).ToList();

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
                            join b in db.ESHOP_NEWs on a.NEWS_ID_UNGTUYEN equals b.NEWS_ID
                            join c in db.ESHOP_CUSTOMERs on b.CUSTOMER_ID equals c.CUSTOMER_ID
                            where a.CUSTOMER_NTD_ID == customerId
                            && (a.NEWS_ID_UNGTUYEN == newsId || newsId == 0)
                            && (b.VL_MUCLUONG_ID == mucluong || mucluong == 0)
                            && (b.VL_TRINHDOHOCVAN_ID == trinhdohocvan || trinhdohocvan == 0)
                            && (b.VL_KINHNGHIEM_ID == kinhnghiem || kinhnghiem == 0)
                            && (c.CUSTOMER_SEX == gioitinh || gioitinh == 0)
                            && (c.CUSTOMER_HONNHAN == tinhtranghonnhan || tinhtranghonnhan == 0)
                            && (a.TYPE == trangthaihoso || trangthaihoso == 0)
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
                    && (n.TINHTRANGHOSO == 2)
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
        public List<ESHOP_NEW> GetEshopNewsByOtherOfNTD(string news_seo_url, int customerId)
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
        public List<ESHOP_NEW> GetEshopNewsByOtherOfCat(string news_seo_url, int catId)
        {
            try
            {
                var list = (from a in db.ESHOP_NEWs
                           join b in db.ESHOP_NEWS_CATs on a.NEWS_ID equals b.NEWS_ID
                           where a.NEWS_SHOWTYPE == 1
                           && a.NEWS_SEO_URL != news_seo_url
                           && (b.CAT_ID == catId || catId == 0)
                           select a).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public int Nopdonungtuyen(int customerId, int customerNTDId, int newsId, int newsId_Ungtuyen, int typeId, string tieudethu, string noidungthu)
        {//customerId là ứng viên, newsId là hồ sơ tuyển dụng,
            try
            {
                VL_CUSTOMER_ESHOP_NEW insert = new VL_CUSTOMER_ESHOP_NEW();
                insert.CUSTOMER_ID = customerId;
                insert.CUSTOMER_NTD_ID = customerNTDId;
                insert.NEWS_ID = newsId;
                insert.NEWS_ID_UNGTUYEN = newsId_Ungtuyen;
                insert.TYPE = 2;//tự ứng tuyển
                insert.TIEUDETHU = tieudethu;
                insert.NOIDUNGTHU = noidungthu;
                insert.PUBLISHDATE = DateTime.Now;
                insert.DATE_XULY = DateTime.Now;

                db.VL_CUSTOMER_ESHOP_NEWs.InsertOnSubmit(insert);

                db.SubmitChanges();
                return 1;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return 0;
            }
        }

    }
}
