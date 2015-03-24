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
    public partial class sidebar_NTD : System.Web.UI.UserControl
    {
        private Propertity per = new Propertity();
        private Function fun = new Function();
        private List_product list_pro = new List_product();
        private Pageindex_chage change = new Pageindex_chage();
        private VL_Category vl = new VL_Category();
        private dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        int nganh_nghe = 0, dia_diem = 0, muc_luong = 0, kinh_nghiem = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            nganh_nghe = Utils.CIntDef(Request.QueryString["nganh_nghe"]);
            dia_diem = Utils.CIntDef(Request.QueryString["dia_diem"]);
            muc_luong = Utils.CIntDef(Request.QueryString["muc_luong"]);
            kinh_nghiem = Utils.CIntDef(Request.QueryString["kinh_nghiem"]);
            if (!IsPostBack)
            {
                Load_VL_Category();
                Load_Vieclam();
                Load_Banner();
            }
        }
        private void Load_VL_Category()
        {
            cblRdoOptionNganhnghe.DataSource = vl.GetAllNganhnghe();
            cblRdoOptionNganhnghe.DataBind();
            cblChkOptionDiadiem.DataSource = vl.GetAllArea();
            cblChkOptionDiadiem.DataBind();
            ddlMucluong.DataSource = vl.GetAllMucluong();
            ddlMucluong.DataBind();
            ddlKinhnghiem.DataSource = vl.GetAllKinhnghiem();
            ddlKinhnghiem.DataBind();

            cblRdoOptionNganhnghe.SelectedValue = nganh_nghe.ToString();
            cblChkOptionDiadiem.SelectedValue = dia_diem.ToString();
            ddlMucluong.SelectedValue = muc_luong.ToString();
            ddlKinhnghiem.SelectedValue = kinh_nghiem.ToString();
        }
        private void Load_Vieclam()
        {
            //var listCamnang = list_pro.Load_listprobytype(3, 0, -1);
            //rptCamnang.DataSource = listCamnang;
            //rptCamnang.DataBind();
        }
        private void Load_Banner()
        {
            try
            {
                var bannerPhai1 = per.Load_slider1(14, 1, -1);
                var bannerPhai2 = per.Load_slider1(15, 1, -1);
                var bannerPhai3 = per.Load_slider1(16, 1, -1);
                var bannerPhai4 = per.Load_slider1(17, 1, -1);
                var bannerPhai5 = per.Load_slider1(18, 1, -1);
                var bannerPhai6 = per.Load_slider1(19, 1, -1);

                rptBannerPhai1.DataSource = bannerPhai1;
                rptBannerPhai2.DataSource = bannerPhai2;
                rptBannerPhai3.DataSource = bannerPhai3;
                rptBannerPhai4.DataSource = bannerPhai4;
                rptBannerPhai5.DataSource = bannerPhai5;
                rptBannerPhai6.DataSource = bannerPhai6;

                rptBannerPhai1.DataBind();
                rptBannerPhai2.DataBind();
                rptBannerPhai3.DataBind();
                rptBannerPhai4.DataBind();
                rptBannerPhai5.DataBind();
                rptBannerPhai6.DataBind();
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

        protected void btnHuytimkiem_Click(object sender, EventArgs e)
        {
            txtFilterNganhnghe.Text = "";
            txtFilterDiadiem.Text = "";
            Load_VL_Category();
        }

        protected void btnTimkiem_Click(object sender, EventArgs e)
        {
            string s = "/tim-kiem-ung-vien-sieu-toc?page=0";
            if (cblRdoOptionNganhnghe.SelectedIndex != -1)
                s += "&nganh_nghe=" + cblRdoOptionNganhnghe.SelectedValue;
            if (cblChkOptionDiadiem.SelectedIndex != -1)
                s += "&dia_diem=" + cblChkOptionDiadiem.SelectedValue;
            if (ddlMucluong.SelectedValue != "0")
                s += "&muc_luong=" + ddlMucluong.SelectedValue;
            if (ddlKinhnghiem.SelectedValue != "0")
                s += "&kinh_nghiem=" + ddlKinhnghiem.SelectedValue;
            Response.Redirect(s);
        }
    }
}