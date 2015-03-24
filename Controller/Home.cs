using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using vpro.functions;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Diagnostics;

namespace Controller
{
    public class Home
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion
        //Pro or news hien thi trang chu
        public List<Pro_details_entity> Loadindex(int type, int period, int limit, int lang)
        {
            try
            {
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where b.NEWS_PERIOD == period && b.NEWS_TYPE == type
                            && c.CAT_LANGUAGE == lang
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3,b.NEWS_PRICE1, b.NEWS_DESC, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, c.CAT_SEO_URL }).OrderByDescending(n => n.NEWS_PUBLISHDATE).Distinct().OrderByDescending(n => n.NEWS_ORDER_PERIOD).Take(limit).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    pro.CAT_SEO_URL = i.CAT_SEO_URL;
                    l.Add(pro);
                }
               
                return l;
                
            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<Pro_details_entity> loadlistcarousel(int limit, int lang)
        {
            try
            {
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where 
                            //b.NEWS_PERIOD == period 
                            (b.NEWS_TYPE == 2 || b.NEWS_TYPE == 1)
                            && c.CAT_LANGUAGE == lang
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_IMAGE4, b.NEWS_PRICE1, b.NEWS_DESC, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, c.CAT_SEO_URL }).OrderByDescending(n => n.NEWS_PUBLISHDATE).Distinct().OrderByDescending(n => n.NEWS_ORDER_PERIOD).Take(limit).ToList();
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
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    pro.CAT_SEO_URL = i.CAT_SEO_URL;
                    l.Add(pro);
                }

                return l;

            }
            catch (Exception)
            {

                throw;
            }
        }
        //Lấy sản phẩm theo CatSeoUrl 
        public List<Pro_details_entity> LoadindexSafeOff(object _cat_seo_url , int limit , int lang)
        {
            try
            {
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where c.CAT_SEO_URL == _cat_seo_url
                            && c.CAT_LANGUAGE == lang
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_PRICE1, b.NEWS_DESC, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, c.CAT_SEO_URL }).OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER_PERIOD).Take(limit).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    pro.CAT_SEO_URL = i.CAT_SEO_URL;
                    l.Add(pro);
                }

                return l;

            }
            catch (Exception)
            {

                throw;
            }
        }
        //Categories hien tri trang chu
        public List<ESHOP_CATEGORy> Load_cate_index(int limit, int type, int lang)
        {
            try
            {
                var list = db.ESHOP_CATEGORies.Where(n => n.CAT_STATUS == 1 && n.CAT_PERIOD == 1 && n.CAT_TYPE == type && n.CAT_LANGUAGE == lang).Take(limit).ToList();
                return list;
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        public List<ESHOP_CATEGORy> Load_cate_indexOrder(int limit, int type, int per, int lang)
        {
            try
            {
                var list = db.ESHOP_CATEGORies.Where(n => n.CAT_STATUS == 1
                    && (n.CAT_PERIOD == per || n.CAT_PERIOD == 3)
                    && n.CAT_TYPE == type
                    && n.CAT_LANGUAGE == lang).OrderByDescending(n => n.CAT_ORDER).Take(limit).ToList();
                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<ESHOP_CATEGORy> Load_cate_indexCatSeoUrl(int limit, int type, string catSeoUrl, int lang)
        {
            try
            {
                var list = db.ESHOP_CATEGORies.Where(n => n.CAT_STATUS == 1 
                    && n.CAT_SEO_URL == catSeoUrl 
                    && n.CAT_TYPE == type
                    && n.CAT_LANGUAGE == lang).Take(limit).ToList();
                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<ESHOP_CATEGORy> Load_cate_index_all(int limit, int lang)
        {
            try
            {
                var list = db.ESHOP_CATEGORies.Where(n => n.CAT_STATUS == 1 && n.CAT_PERIOD == 1 && n.CAT_LANGUAGE == lang).Take(limit).ToList();
                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<Pro_details_entity> Load_pro_index_cate(object catid, int limit, int per, int lang)
        {
            try
            {
                int id = Utils.CIntDef(catid);
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where (c.CAT_ID==id||c.CAT_PARENT_PATH.Contains(id.ToString()))
                                    && b.NEWS_PERIOD == per
                                    && c.CAT_LANGUAGE == lang
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_DESC, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, c.CAT_SEO_URL }).OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER_PERIOD).Take(limit).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    pro.CAT_SEO_URL = i.CAT_SEO_URL;
                    l.Add(pro);
                }
                return l.ToList();
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        //Tin hiển thị tức thời trang chủ
        public string Gettitle_Showfilehtml_index(int period)
        {
            try
            {
                string _result = string.Empty;
                var getnewsid = db.ESHOP_NEWs.Where(n => n.NEWS_PERIOD == period).Select(n => new { n.NEWS_TITLE }).Take(1).ToList();
                if (getnewsid.Count > 0)
                {
                    _result = getnewsid[0].NEWS_TITLE;
                }
                return _result;
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        public string Showfilehtml_index(int period, int lang)
        {
            try
            {
                int _newsID = 0;
                string _result = string.Empty;
                //var getnewsid = db.ESHOP_NEWs.Where(n => n.NEWS_PERIOD == period).Select(n => new { n.NEWS_ID }).Take(1).ToList();
                var getnewsid = (from a in db.ESHOP_NEWS_CATs
                                 join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                                 join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                                 where b.NEWS_PERIOD == period
                                 && c.CAT_LANGUAGE == lang
                                 select b).Select(b => new { b.NEWS_ID }).Take(1).ToList();
                if (getnewsid.Count > 0)
                {
                    _newsID = getnewsid[0].NEWS_ID;
                }
                string pathFile;
                string strHTMLContent;

                if (_newsID > 0)
                {

                    var newsInfo = db.GetTable<ESHOP_NEW>().Where(n => n.NEWS_ID == _newsID);

                    if (newsInfo.ToList().Count > 0)
                    {

                        pathFile =HttpContext.Current.Server.MapPath(PathFiles.GetPathNews(_newsID) + "/" + newsInfo.ToList()[0].NEWS_FILEHTML);
                        if ((File.Exists(pathFile)))
                        {
                            StreamReader objNewsReader;
                            objNewsReader = new StreamReader(pathFile);
                            strHTMLContent = objNewsReader.ReadToEnd();
                            objNewsReader.Close();
                            _result = strHTMLContent;
                        }

                    }

                }
                return _result;
            }
            catch (Exception)
            {

                throw;
            }
        }
        //Danh muc cate theo vi tri
        public List<ESHOP_CATEGORy> Load_danhmuc(int type, int postion, int limit, int lang)
        {
            try
            {
                var list = db.ESHOP_CATEGORies.Where(n => n.CAT_TYPE == type && n.CAT_STATUS == 1 && n.CAT_POSITION == postion && n.CAT_LANGUAGE == lang).Take(limit).ToList();
                return list;
            }
            catch (Exception)
            {
                
                throw;
            }    
        }
        

    }
}
