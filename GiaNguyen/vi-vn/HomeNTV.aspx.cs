using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using GiaNguyen.Components;
using Model;

namespace CatTrang.vi_vn
{
    public partial class HomeNTV : System.Web.UI.Page
    {
        private Propertity per = new Propertity();
        private Function fun = new Function();
        private List_product list_pro = new List_product();
        private Pageindex_chage change = new Pageindex_chage();
        private VL_Category vl = new VL_Category();
        private dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_VL_Category();
                Load_VL_Nganhnghe();
                Load_Vieclam();
                Load_Banner();
            }
        }
        private void Load_VL_Category()
        {
            ddlDiadiemVLMoi.DataSource = vl.GetAllArea();
            ddlDiadiemVLMoi.DataBind();
        }
        private void Load_VL_Nganhnghe()
        {
            rptNganhngheABC.DataSource = vl.GetAllNganhnghe_ABC();
            rptNganhngheABC.DataBind();
            rptNganhngheHot.DataSource = vl.GetAllNganhnghe();
            rptNganhngheHot.DataBind();
            rptNganhngheGroup.DataSource = vl.GetAllNganhnghe_Group();
            rptNganhngheGroup.DataBind();
        }
        protected IQueryable Load_NganhngheGroup2(object cat_parent_id)
        {
            try
            {
                var list = per.Menu2(cat_parent_id);
                return list;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
        private void Load_Vieclam()
        {
            var list = list_pro.Load_listprobyPeriod(1, 2, 0, -1);
            if (list != null && list.Count > 0)
            {
                rptViecLam_Hot.DataSource = list.Take(24);
                rptViecLam_Hot.DataBind();
            }
            var list2 = list_pro.Load_listprobytype(2, 0, -1);
            if (list2 != null && list2.Count > 0)
            {
                rptViecLam_XemNhieu.DataSource = list2.OrderByDescending(n => n.NEWS_COUNT).Take(15);
                rptViecLam_XemNhieu.DataBind();
            }
            LoadVieclamMoi();
        }
        private void LoadVieclamMoi()
        {
            int areaId = Utils.CIntDef(ddlDiadiemVLMoi.SelectedValue);
            var list = (from a in db.ESHOP_NEWS_CATs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                        join d in db.VL_AREA_ESHOP_NEWs on b.NEWS_ID equals d.NEWS_ID
                        where b.NEWS_SHOWTYPE == 1
                         && b.NEWS_TYPE == 2
                         && (d.AREA_ID == areaId || areaId == 0)
                        select b).Distinct().OrderByDescending(n => n.NEWS_PUBLISHDATE).Take(150).ToList();
            //if (list != null && list.Count > 0)
            //{
                CollectionPager5.MaxPages = 5;
                CollectionPager5.PageSize = 30;
                CollectionPager5.Visible = true;
                CollectionPager5.DataSource = list;
                CollectionPager5.BindToControl = rptViecLam_MoiNhat;
                rptViecLam_MoiNhat.DataSource = CollectionPager5.DataSourcePaged;
                rptViecLam_MoiNhat.DataBind();
            //}
        }
        private void Load_Banner()
        {
            try
            {
                var bannerGiua1 = per.Load_slider1(1, 1, -1);
                var bannerGiua2 = per.Load_slider1(2, 1, -1);
                var bannerGiua3 = per.Load_slider1(3, 1, -1);

                rptBannerGiua1.DataSource = bannerGiua1;
                rptBannerGiua2.DataSource = bannerGiua2;
                rptBannerGiua3.DataSource = bannerGiua3;

                rptBannerGiua1.DataBind();
                rptBannerGiua2.DataBind();
                rptBannerGiua3.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        
        public string GetLink(object News_Url, object News_Seo_Url, object cat_seo)
        {
            try
            {
                return fun.Getlink_News(News_Url, News_Seo_Url, cat_seo);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetLinkCat(object Cat_Url, object Cat_Seo_Url, object Cat_Type)
        {
            try
            {
                string temp = fun.Getlink_Cat(Cat_Url, Cat_Seo_Url);
                return temp;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string GetLinkNTV(object newsId)
        {
            try
            {
                int _newsId = Utils.CIntDef(newsId);
                var item = db.ESHOP_NEWs.FirstOrDefault(n => n.NEWS_ID == _newsId);
                string News_Url = "", News_Seo_Url = "", cat_seo = "";
                if (item != null)
                {
                    News_Url = item.NEWS_URL;
                    News_Seo_Url = item.NEWS_SEO_URL;
                    var item_2 = db.ESHOP_NEWS_CATs.FirstOrDefault(n => n.NEWS_ID == _newsId);
                    if (item_2 != null)
                    {
                        cat_seo = item_2.ESHOP_CATEGORy.CAT_SEO_URL;
                    }
                }
                return fun.Getlink_News(News_Url, News_Seo_Url, cat_seo);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetImageT(object News_Id, object News_Image1)
        {

            try
            {
                return fun.GetImageT_News(News_Id, News_Image1);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetImageAd(object Ad_Id, object Ad_Image1, object Ad_Target, object Ad_Url, object AD_ITEM_DESC)
        {
            try
            {
                string temp;
                temp = fun.GetImageAd(Ad_Id, Ad_Image1, Ad_Target, Ad_Url, AD_ITEM_DESC);
                return temp;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
        public string getCusName(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].CUSTOMER_FULLNAME;
            }
            return "";
        }
        public int getCount(object oid)
        {
            int id = Utils.CIntDef(oid);
            var list = (from a in db.ESHOP_NEWS_CATs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                        where b.NEWS_SHOWTYPE == 1 && c.CAT_ID == id
                        && b.NEWS_TYPE == 2//1 tim viec, 2 tuyen dụng
                        select new { b.NEWS_ID });
            if (list != null)
            {
                return list.ToList().Count;
            }                
            return 0;
        }

        protected void ddlDiadiemVLMoi_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadVieclamMoi();
        }
    }
}