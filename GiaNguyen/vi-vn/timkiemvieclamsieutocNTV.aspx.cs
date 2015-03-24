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
    public partial class timkiemvieclamsieutocNTV : System.Web.UI.Page
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private Function fun = new Function();
        private VL_Category vl = new VL_Category();
        private VL_News vlNews = new VL_News();
        private Account acount = new Account();
        private List_product list_pro = new List_product();
        private string tieu_de = "";
        private int nganh_nghe = 0, dia_diem = 0, muc_luong = 0, kinh_nghiem = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            tieu_de = Utils.CStrDef(Request.QueryString["tieu_de"]);
            nganh_nghe = Utils.CIntDef(Request.QueryString["nganh_nghe"]);
            dia_diem = Utils.CIntDef(Request.QueryString["dia_diem"]);
            muc_luong = Utils.CIntDef(Request.QueryString["muc_luong"]);
            kinh_nghiem = Utils.CIntDef(Request.QueryString["kinh_nghiem"]);
            if (!IsPostBack)
            {
                Load_VL_Category();
                Load_Vieclam();
            }
        }
        protected override void Render(HtmlTextWriter writer)
        {
            litTopPager_Timkiem.Text = CollectionPager5.RenderedHtml;

            base.Render(writer);
        }
        private void Load_VL_Category()
        {
            ddlDiadiemVLMoi.DataSource = vl.GetAllArea();
            ddlDiadiemVLMoi.DataBind();
        }
        private void Load_Vieclam()
        {
            var list2 = vlNews.GetEshopNewsBySearch(tieu_de, nganh_nghe, dia_diem, muc_luong, kinh_nghiem, 2);//1 tim viec, 2 tuyen dung
            if (list2 != null && list2.Count > 0)
            {
                var list = list2.OrderByDescending(n => n.NEWS_COUNT);
                CollectionPager5.MaxPages = 5;
                CollectionPager5.PageSize = 30;
                CollectionPager5.Visible = true;
                CollectionPager5.DataSource = list.ToList();
                CollectionPager5.BindToControl = GridItemList;
                GridItemList.DataSource = CollectionPager5.DataSourcePaged;
                GridItemList.DataBind();                
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
            foreach (var item in litem)
            {
                var itemArea = db.VL_AREAs.Where(n => n.ARE_ID == item.AREA_ID);
                if (itemArea != null && itemArea.ToList().Count > 0)
                {
                    s += itemArea.ToList()[0].ARE_NAME;
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

        protected void ddlDiadiemVLMoi_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadVieclamMoi();
        }
    }
}