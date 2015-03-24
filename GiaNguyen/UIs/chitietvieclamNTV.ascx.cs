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

namespace CatTrang.UIs
{
    public partial class chitietvieclamNTV : System.Web.UI.UserControl
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private Function fun = new Function();
        private VL_Category vl = new VL_Category();
        private VL_News vlnews = new VL_News();
        private Account acount = new Account();
        private List_product list_pro = new List_product();
        string _sNews_Seo_Url = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            _sNews_Seo_Url = Utils.CStrDef(Request.QueryString["purl"]);
            if (!IsPostBack)
            {
                LoadInfo();
                Load_Vieclam();
            }
        }
        private void LoadInfo()
        {
            var item = vlnews.GetEshopNewsByNews_seo_url(_sNews_Seo_Url);
            if (item != null)
            {
                lbTitle.Text = Utils.CStrDef(item.NEWS_TITLE);
                lbLuotxem.Text = Utils.CStrDef(item.NEWS_COUNT);
                lbMaNTD.Text = Utils.CStrDef(item.NEWS_CODE);
                lbNgaylammoi.Text = string.Format("{0:dd/MM/yyyy}", item.NEWS_UPDATEFRERESH);
                lbChucvu.Text = getCapbac(item.VL_CAOBAC_ID);
                lbNganhnghe.Text = getNganhnghe(item.NEWS_ID);
                lbHinhthuclamviec.Text = getHinhthuclamviec(item.VL_HINHTHUCLAMVIEC_ID);
                lbDiadiemlamviec.Text = getDiadiemlamviec(item.NEWS_ID);
                lbMucluong.Text = getMucluong(item.VL_MUCLUONG_ID);
                lbQuyenloi.Text = Utils.CStrDef(item.QUYENLOI);
                lbYeucaukhac.Text = Utils.CStrDef(item.YEUCAUKHAC);
                lbHosogom.Text = Utils.CStrDef(item.HOSO);
                lbHannop.Text = string.Format("{0:dd/MM/yyyy}", item.NEWS_DEALINE);
                lbHinhthucnophoso.Text = getHinhthucnop(item.VL_HINHTHUCNOPHOSO_ID);
                lbKinhnghiem.Text = getKinhnghiem(item.VL_KINHNGHIEM_ID);
                lbBangcap.Text = getTrinhdohocvan(item.VL_TRINHDOHOCVAN_ID);
                lbGioitinh.Text = Utils.CIntDef(item.YEUCAUGIOITINH, 3) == 1 ? "Nam" : (Utils.CIntDef(item.YEUCAUGIOITINH, 3) == 2 ? "Nữ" : "Không yêu cầu");
                lbDotuoi.Text = getDotuoi(item.VL_DOTUOI_ID);
                lbSoluongtuyen.Text = Utils.CStrDef(item.SOLUONGTUYEN);

                int customerId = Utils.CIntDef(item.CUSTOMER_ID);
                var customer = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == customerId);
                if (customer != null && customer.ToList().Count > 0)
                {
                    lbNguoilienhe.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_CONTACTNAME);
                    lbDiachilienhe.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_CONTACTADDRESS);
                    lbEmaillienhe.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_CONTACTEMAIL);
                    lbDienthoailienhe.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_CONTACTPHONE);

                    lbTencongty.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_FULLNAME);
                    lbDiachicongty.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_ADDRESS);
                    lbWebsite.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_WEBSITE);
                    lbDienthoaicongty.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_PHONE1);
                    lbGioithieucongty.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_GIOITHIEU);
                    //lbQuymoconty.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_CONTACTPHONE);
                }
                var list2 = vlnews.GetEshopNewsByOther(_sNews_Seo_Url, Utils.CIntDef(item.CUSTOMER_ID));
                if (list2 != null && list2.Count > 0)
                {
                    rptViecLam_Other.DataSource = list2.OrderByDescending(n => n.NEWS_COUNT);
                    rptViecLam_Other.DataBind();
                }
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
        public string getCapbac(object ott)
        {
            int id = Utils.CIntDef(ott);
            var item = db.VL_CAPBACs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getNganhnghe(object newsId)
        {
            int id = Utils.CIntDef(newsId);
            var item = db.ESHOP_NEWS_CATs.Where(n => n.NEWS_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].ESHOP_CATEGORy.CAT_NAME;
            }
            return "";
        }
        public string getHinhthuclamviec(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_HINHTHUCLAMVIECs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getDiadiemlamviec(object newsId)
        {
            string s = "";
            int tt = Utils.CIntDef(newsId);
            var litem = db.VL_AREA_ESHOP_NEWs.Where(n => n.NEWS_ID == tt);
            foreach (var item in litem)
            {
                var itemArea = db.VL_AREAs.Where(n => n.ARE_ID == item.AREA_ID);
                if (itemArea != null && itemArea.ToList().Count > 0)
                {
                    s += ", " + itemArea.ToList()[0].ARE_NAME;
                }

            }
            return s;
        }
        public string getHinhthucnop(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_HINHTHUCNOPHOSOs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getKinhnghiem(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_KINHNGHIEMs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getTrinhdohocvan(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_TRINHDOHOCVANs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getDotuoi(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_DOTUOIs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
    }
}