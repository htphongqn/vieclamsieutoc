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
    public partial class vieclamnhieunguoixemNTV : System.Web.UI.Page
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private Function fun = new Function();
        private VL_Category vl = new VL_Category();
        private Account acount = new Account();
        private List_product list_pro = new List_product();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_VL_Category();
            }
            Load_Vieclam();
        }
        protected override void Render(HtmlTextWriter writer)
        {
            litTopPager_Xemnhieu.Text = CollectionPager5.RenderedHtml;

            base.Render(writer);
        }
        private void Load_VL_Category()
        {
            ddlDiadiemVLMoi.DataSource = vl.GetAllArea();
            ddlDiadiemVLMoi.DataBind();
        }
        private void Load_Vieclam()
        {
            //var list = list_pro.Load_listprobyPeriod(1, 1, -1);
            //if (list != null && list.Count > 0)
            //{
            //    CollectionPager5.MaxPages = 5;
            //    CollectionPager5.PageSize = 30;
            //    CollectionPager5.Visible = true;
            //    CollectionPager5.DataSource = list.ToList();
            //    CollectionPager5.BindToControl = GridItemList_Xemnhieu;
            //    GridItemList_Xemnhieu.DataSource = CollectionPager5.DataSourcePaged;
            //    GridItemList_Xemnhieu.DataBind();
            //}
            var list2 = list_pro.Load_listprobytype(2, 0, 2, -1);//1 tim viec, 2 tuyen dung
            if (list2 != null && list2.Count > 0)
            {
                //rptViecLam_XemNhieu.DataSource = list2.OrderByDescending(n => n.NEWS_COUNT).Take(10);
                //rptViecLam_XemNhieu.DataBind();
                var list = list2.OrderByDescending(n => n.NEWS_COUNT);
                CollectionPager5.MaxPages = 5;
                CollectionPager5.PageSize = 30;
                CollectionPager5.Visible = true;
                CollectionPager5.DataSource = list.ToList();
                CollectionPager5.BindToControl = GridItemList_Xemnhieu;
                GridItemList_Xemnhieu.DataSource = CollectionPager5.DataSourcePaged;
                GridItemList_Xemnhieu.DataBind();                
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
                        && (b.TINHTRANGHOSO == 2)
                         && b.NEWS_TYPE == 2//1 tim viec, 2 tuyen dung
                         && (d.AREA_ID == areaId || areaId == 0)
                        select b).Distinct().OrderByDescending(n => n.NEWS_PUBLISHDATE).Take(150).ToList();
            //if (list != null && list.ToList().Count > 0)
            //{
                CollectionPager1.MaxPages = 5;
                CollectionPager1.PageSize = 30;
                CollectionPager1.Visible = true;
                CollectionPager1.DataSource = list;
                CollectionPager1.BindToControl = rptViecLam_MoiNhat;
                rptViecLam_MoiNhat.DataSource = CollectionPager1.DataSourcePaged;
                rptViecLam_MoiNhat.DataBind();
            //}
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
        public string getTenCongty(object ott)
        {
            int tt = Utils.CIntDef(ott);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == tt);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].CUSTOMER_FULLNAME;
            }
            return "";
        }
        public string getnoilamviec(object ott)
        {
            string s = "";
            int tt = Utils.CIntDef(ott);
            var litem = db.VL_AREA_ESHOP_NEWs.Where(n => n.NEWS_ID == tt);
            int i = 0;
            foreach (var item in litem)
            {
                var itemArea = db.VL_AREAs.Where(n => n.ID == item.AREA_ID);
                if (itemArea != null && itemArea.ToList().Count > 0)
                {
                    if (i == 0)
                    {
                        s += itemArea.ToList()[0].NAME;
                    }
                    else
                    {
                        s += "<br />" + itemArea.ToList()[0].NAME;
                    }
                    i++;
                }

            }
            return s;
        }
        public string getMucluong(object ott)
        {
            int id = Utils.CIntDef(ott);
            var item = db.VL_MUCLUONGs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string GetShortName(object obj, int lenght)
        {
            string strObj = Utils.CStrDef(obj).Replace("\r\n", "<br />");
            if (strObj.Length >= lenght)
            {
                return strObj.Substring(0, lenght - 3) + "...";
            }
            return strObj;
        }
        protected void ddlDiadiemVLMoi_SelectedIndexChanged(object sender, EventArgs e)
        {
            CollectionPager1.CurrentPage = 1;
            LoadVieclamMoi();
        }
    }
}