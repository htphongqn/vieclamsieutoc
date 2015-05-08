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
    public partial class BannerHomeNTV : System.Web.UI.UserControl
    {
        private Propertity per = new Propertity();
        private Function fun = new Function();
        private VL_Category vl = new VL_Category();
        private VL_News vlNews = new VL_News();
        private clsFormat cls = new clsFormat();
        string tieu_de = "";
        int nganh_nghe = 0, dia_diem = 0, muc_luong = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            tieu_de = Utils.CStrDef(Request.QueryString["tieu_de"]);
            nganh_nghe = Utils.CIntDef(Request.QueryString["nganh_nghe"]);
            dia_diem = Utils.CIntDef(Request.QueryString["dia_diem"]);
            muc_luong = Utils.CIntDef(Request.QueryString["muc_luong"]);
            if (!IsPostBack)
            {
                txtSearch.Value = tieu_de;
                LoadUpdateDaily();
                Load_Online();
                Load_VL_Category();

            }
        }
        private void LoadUpdateDaily()
        {
            var list = vlNews.GetEshopNewsByType(2).Where(b=>b.TINHTRANGHOSO == 2);//1 tim viec, 2 tuyen dung
            if (list != null && list.ToList().Count > 0)
            {
                lbTotalNews.Text = cls.FormatMoneyNoVND(list.ToList().Count);
                var list2 = list.Where(n => n.NEWS_PUBLISHDATE != null && (n.NEWS_PUBLISHDATE.Value.Date - DateTime.Today).Days == 0);
                lbTotalTodayNews.Text = cls.FormatMoneyNoVND(list2.ToList().Count);
            }                
        }
        private void Load_VL_Category()
        {
            ddlNganhnghe.DataSource = vl.GetAllNganhnghe();
            ddlNganhnghe.DataBind();
            ddlNganhnghe.SelectedValue = nganh_nghe.ToString();
            ddlDiadiem.DataSource = vl.GetAllArea();
            ddlDiadiem.DataBind();
            ddlDiadiem.SelectedValue = dia_diem.ToString();
            ddlMucluong.DataSource = vl.GetAllMucluong();
            ddlMucluong.DataBind();
            ddlMucluong.SelectedValue = muc_luong.ToString();
        }
        private void Load_Online()
        {
            var list = per.Load_Online();
            if (list != null && list.Count > 0)
            {
                var HotroMienNam = list.Where(n => n.ONLINE_TYPE == 3);
                var HotroMienBac = list.Where(n => n.ONLINE_TYPE == 4);
                if (HotroMienNam != null && HotroMienNam.ToList().Count > 0)
                {
                    lbHotroMienNam.Text = HotroMienNam.ToList()[0].ONLINE_FIELD2;
                }
                if (HotroMienBac != null && HotroMienBac.ToList().Count > 0)
                {
                    lbHotroMienBac.Text = HotroMienBac.ToList()[0].ONLINE_FIELD2;
                }
            }
        }

        protected void lnkTimngay_Click(object sender, EventArgs e)
        {
            string s = "/tim-kiem-viec-lam-sieu-toc?page=0";
            if (txtSearch.Value.Length > 0)
                s += "&tieu_de=" + txtSearch.Value;
            if (ddlNganhnghe.SelectedValue != "0")
                s += "&nganh_nghe=" + ddlNganhnghe.SelectedValue;
            if (ddlDiadiem.SelectedValue != "0")
                s += "&dia_diem=" + ddlDiadiem.SelectedValue;
            if (ddlMucluong.SelectedValue != "0")
                s += "&muc_luong=" + ddlMucluong.SelectedValue;
            Response.Redirect(s);
        }
    }
}