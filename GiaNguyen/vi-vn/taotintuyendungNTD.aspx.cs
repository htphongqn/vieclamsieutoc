using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using vpro.functions;
using Model;
using System.Web.UI.HtmlControls;
using Controller;
using CatTrang.Components;

namespace CatTrang.vi_vn
{
    public partial class taotintuyendungNTD : System.Web.UI.Page
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private VL_Category vl = new VL_Category();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null && Session["user_fullname"] != null && Session["user_quyen"] != null && Utils.CIntDef(Session["user_quyen"]) == Cost.QUYEN_NTD)
                {
                    Load_VL_Category();
                    LoadThongtincanhan();
                    
                    string logoUrl = GetCusLogo(Utils.CIntDef(Session["userId"]));
                    lbLogo.Text = "<img width='104' height='79' src='" + logoUrl + "'>";

                    if (Request.QueryString["id"] != null)
                    {
                        loadInfo();
                    }
                    if (Request.QueryString["idcoppy"] == null && Request.QueryString["id"] != null)
                    {
                        btnCapnhat.Visible = true;
                        btnDangtuyen.Visible = false;
                        btnLuutam.Visible = false;
                    }
                    else
                    {
                        btnCapnhat.Visible = false;
                        btnDangtuyen.Visible = true;
                        btnLuutam.Visible = true;
                    }
                }
                else
                {
                    Session.Abandon();
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản nhà tuyển dụng!');location.href='/nha-tuyen-dung.html'</script>");
                }
            }
        }
        private void Load_VL_Category()
        {
            ddlCapbacmongmuon.DataSource = vl.GetAllCapbac();
            ddlCapbacmongmuon.DataBind();
            cblRdoOptionNganhnghe.DataSource = vl.GetAllNganhnghe();
            cblRdoOptionNganhnghe.DataBind();
            cblChkOptionDiadiem.DataSource = vl.GetAllArea();
            cblChkOptionDiadiem.DataBind();
            ddlHinhthuclamviec.DataSource = vl.GetAllHinhthuclamviec();
            ddlHinhthuclamviec.DataBind();
            ddlMucluongmongmuon.DataSource = vl.GetAllMucluong();
            ddlMucluongmongmuon.DataBind();
            ddKinhnghiem.DataSource = vl.GetAllKinhnghiem();
            ddKinhnghiem.DataBind();
            ddlTrinhdohocvan.DataSource = vl.GetAllTrinhdohocvan();
            ddlTrinhdohocvan.DataBind();
            ddlDotuoi.DataSource = vl.GetAllDotuoi();
            ddlDotuoi.DataBind();
            ddlHinhthucnophoso.DataSource = vl.GetAllHinhthucnophoso();
            ddlHinhthucnophoso.DataBind();
        }
        private void LoadThongtincanhan()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            var item = db.ESHOP_CUSTOMERs.Where(c => c.CUSTOMER_ID == customerId);
            if (item != null && item.ToList().Count > 0)
            {
                lbCompanyname.Text = item.ToList()[0].CUSTOMER_FULLNAME;
                lbQuymocongty.Text = GetQuymocongty(item.ToList()[0].VL_QUYMOCONGTY_ID);
                lbSoluoccongty.Text = item.ToList()[0].CUSTOMER_SOLUOC;
                lbDiachicongty.Text = item.ToList()[0].CUSTOMER_ADDRESS;
                lbMasothue.Text = item.ToList()[0].CUSTOMER_MASOTHUE;
                lbWebsite.Text = item.ToList()[0].CUSTOMER_WEBSITE;

                lbNguoilienhe.Text = item.ToList()[0].CUSTOMER_CONTACTNAME;
                lbDiachilienhe.Text = item.ToList()[0].CUSTOMER_ADDRESS;
                lbEmailLienhe.Text = item.ToList()[0].CUSTOMER_EMAIL;
                lbDienthoailienhe.Text = item.ToList()[0].CUSTOMER_PHONE1;
            }
        }
        private void loadInfo()
        {
            int id = Utils.CIntDef(Request.QueryString["id"]);
            var news_insert = db.ESHOP_NEWs.Where(n => n.NEWS_ID == id);
            if (news_insert != null && news_insert.ToList().Count > 0)
            {
                if (Request.QueryString["idcoppy"] == null)
                {
                    txttieu_de.Value = news_insert.ToList()[0].NEWS_TITLE;
                    txtSeoUrl.Value = news_insert.ToList()[0].NEWS_SEO_URL;
                }
                ddlCapbacmongmuon.SelectedValue = Utils.CStrDef(news_insert.ToList()[0].VL_CAOBAC_ID);
                ddlHinhthuclamviec.SelectedValue = Utils.CStrDef(news_insert.ToList()[0].VL_HINHTHUCLAMVIEC_ID);
                ddlMucluongmongmuon.SelectedValue = Utils.CStrDef(news_insert.ToList()[0].VL_MUCLUONG_ID);

                txt_so_luong_tuyen.Value = Utils.CStrDef(news_insert.ToList()[0].SOLUONGTUYEN);
                txt_quyen_loi.Value = news_insert.ToList()[0].QUYENLOI;
                txt_mo_ta_cong_viec.Value = news_insert.ToList()[0].MOTACONGVIEC;
                ddKinhnghiem.SelectedValue = Utils.CStrDef(news_insert.ToList()[0].VL_KINHNGHIEM_ID);
                ddlTrinhdohocvan.SelectedValue = Utils.CStrDef(news_insert.ToList()[0].VL_TRINHDOHOCVAN_ID);
                ddlGioitinh.SelectedValue = Utils.CStrDef(news_insert.ToList()[0].YEUCAUGIOITINH);
                ddlDotuoi.SelectedValue = Utils.CStrDef(news_insert.ToList()[0].VL_DOTUOI_ID);
                txt_yeu_cau_khac.Value = news_insert.ToList()[0].YEUCAUKHAC;
                txt_ho_so_gom.Value = news_insert.ToList()[0].HOSO;
                txtPickerHannop.Value = news_insert.ToList()[0].NEWS_DEALINE.Value.ToString("dd/MM/yyyy");
                ddlHinhthucnophoso.SelectedValue = Utils.CStrDef(news_insert.ToList()[0].VL_HINHTHUCNOPHOSO_ID);          
                

                var news_cats = db.ESHOP_NEWS_CATs.Where(n => n.NEWS_ID == news_insert.ToList()[0].NEWS_ID);
                if (news_cats != null && news_cats.ToList().Count > 0)
                {
                    cblRdoOptionNganhnghe.SelectedValue = news_cats.ToList()[0].CAT_ID.ToString();
                }

                var news_area = db.VL_AREA_ESHOP_NEWs.Where(n => n.NEWS_ID == news_insert.ToList()[0].NEWS_ID);
                foreach (var item in news_area)
                {
                    for (int i = 0; i < cblChkOptionDiadiem.Items.Count; i++)
                    {
                        if (item.AREA_ID.ToString() == cblChkOptionDiadiem.Items[i].Value)
                            cblChkOptionDiadiem.Items[i].Selected = true;
                    }
                }
            }
        }
        public string GetQuymocongty(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_QUYMOCONGTies.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string GetCusLogo(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                if (item.ToList()[0].CUSTOMER_LOGO != "" && item.ToList()[0].CUSTOMER_LOGO != null)
                    return "/data/customer/logo/" + item.ToList()[0].CUSTOMER_LOGO;
            }
            return "../Images/person.jpg";
        }
        public string GetShortName(object obj, int lenght)
        {
            string strObj = Utils.CStrDef(obj);
            if (strObj.Length >= lenght)
            {
                return strObj.Substring(0, lenght - 3) + "...";
            }
            return strObj;
        }
        protected void cblRdoOptionNganhngheDislay_SelectedIndexChanged(object sender, EventArgs e)
        {
            string valueSelect = cblRdoOptionNganhnghe.SelectedValue;
            if (cblRdoOptionNganhngheDislay.SelectedValue == "1")
            {
                cblRdoOptionNganhnghe.DataSource = vl.GetAllNganhnghe().Where(n => n.CAT_ID == Utils.CIntDef(valueSelect));
                cblRdoOptionNganhnghe.DataBind();
                if (!string.IsNullOrEmpty(valueSelect))
                    cblRdoOptionNganhnghe.SelectedValue = valueSelect;
            }
            else if (cblRdoOptionNganhngheDislay.SelectedValue == "2")
            {
                cblRdoOptionNganhnghe.DataSource = vl.GetAllNganhnghe();
                cblRdoOptionNganhnghe.DataBind();
                if (!string.IsNullOrEmpty(valueSelect))
                    cblRdoOptionNganhnghe.SelectedValue = valueSelect;
            }
        }

        protected void cblRdoOptionDiadiemDislay_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<decimal> arr = new List<decimal>();
            for (int i = 0; i < cblChkOptionDiadiem.Items.Count; i++)
            {
                if (cblChkOptionDiadiem.Items[i].Selected)
                    arr.Add(Utils.CDecDef(cblChkOptionDiadiem.Items[i].Value));
            }
            if (cblRdoOptionDiadiemDislay.SelectedValue == "1")
            {
                cblChkOptionDiadiem.DataSource = vl.GetAllArea().Where(n => arr.Contains(n.ID));
                cblChkOptionDiadiem.DataBind();
            }
            else if (cblRdoOptionDiadiemDislay.SelectedValue == "2")
            {
                cblChkOptionDiadiem.DataSource = vl.GetAllArea();
                cblChkOptionDiadiem.DataBind();
            }
            for (int i = 0; i < cblChkOptionDiadiem.Items.Count; i++)
            {
                for (int j = 0; j < arr.Count; j++)
                {
                    if (cblChkOptionDiadiem.Items[i].Value == Utils.CStrDef(arr[j]))
                        cblChkOptionDiadiem.Items[i].Selected = true;
                }
            }
        }
        protected void btnDangtuyen_Click(object sender, EventArgs e)
        {
            DangTuyen(1);
        }
        protected void btnLuutam_Click(object sender, EventArgs e)
        {
            DangTuyen(4);
        }
        protected void btnCapnhat_Click(object sender, EventArgs e)
        {
            string strSecView = LookCookie().ToLower();
            string strSecurity = txt_ma_xac_minh.Value.ToString().ToLower();
            if (strSecurity != strSecView)
            {
                Response.Write("<script>alert('Nhập mã bảo mật sai!');</script>");
                return;
            }
            string news_seo_url = "";
            int id = Utils.CIntDef(Request.QueryString["id"]);
            var news_insert = db.ESHOP_NEWs.Where(n => n.NEWS_ID == id);
            if (news_insert != null && news_insert.ToList().Count > 0)
            {
                news_seo_url = news_insert.ToList()[0].NEWS_SEO_URL;
                news_insert.ToList()[0].NEWS_TITLE = txttieu_de.Value;
                news_insert.ToList()[0].NEWS_SEO_KEYWORD = txttieu_de.Value;
                news_insert.ToList()[0].NEWS_SEO_TITLE = txttieu_de.Value;
                news_insert.ToList()[0].NEWS_SEO_URL = txtSeoUrl.Value;
                news_insert.ToList()[0].VL_CAOBAC_ID = Utils.CIntDef(ddlCapbacmongmuon.SelectedValue);
                news_insert.ToList()[0].VL_HINHTHUCLAMVIEC_ID = Utils.CIntDef(ddlHinhthuclamviec.SelectedValue);
                news_insert.ToList()[0].VL_MUCLUONG_ID = Utils.CIntDef(ddlMucluongmongmuon.SelectedValue);


                news_insert.ToList()[0].SOLUONGTUYEN = Utils.CIntDef(txt_so_luong_tuyen.Value);
                news_insert.ToList()[0].QUYENLOI = Utils.CStrDef(txt_quyen_loi.Value);
                news_insert.ToList()[0].MOTACONGVIEC = Utils.CStrDef(txt_mo_ta_cong_viec.Value);
                news_insert.ToList()[0].VL_KINHNGHIEM_ID = Utils.CIntDef(ddKinhnghiem.SelectedValue);
                news_insert.ToList()[0].VL_TRINHDOHOCVAN_ID = Utils.CIntDef(ddlTrinhdohocvan.SelectedValue);
                news_insert.ToList()[0].YEUCAUGIOITINH = Utils.CIntDef(ddlGioitinh.SelectedValue);
                news_insert.ToList()[0].VL_DOTUOI_ID = Utils.CIntDef(ddlDotuoi.SelectedValue);
                news_insert.ToList()[0].YEUCAUKHAC = Utils.CStrDef(txt_yeu_cau_khac.Value);
                news_insert.ToList()[0].HOSO = Utils.CStrDef(txt_ho_so_gom.Value);
                DateTime deadline = DateTime.ParseExact(txtPickerHannop.Value, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                news_insert.ToList()[0].NEWS_DEALINE = deadline;
                news_insert.ToList()[0].VL_HINHTHUCNOPHOSO_ID = Utils.CIntDef(ddlHinhthucnophoso.SelectedValue);

                news_insert.ToList()[0].NEWS_UPDATE = DateTime.Now;

                db.SubmitChanges();

                //delete old
                DeleteNewsCategory(news_insert.ToList()[0].NEWS_ID);
                SaveNewsCategory(news_insert.ToList()[0].NEWS_ID, Utils.CIntDef(cblRdoOptionNganhnghe.SelectedValue));
                DeleteNewsArea(news_insert.ToList()[0].NEWS_ID);
                for (int i = 0; i < cblChkOptionDiadiem.Items.Count; i++)
                {
                    if (cblChkOptionDiadiem.Items[i].Selected)
                    {
                        SaveNewsArea(news_insert.ToList()[0].NEWS_ID, Utils.CIntDef(cblChkOptionDiadiem.Items[i].Value));
                    }
                }
                if (news_seo_url != txtSeoUrl.Value)
                    updateNewsSeoUrl(news_insert.ToList()[0].NEWS_ID);

                Response.Write("<script>alert('Cập nhật tin tuyển dụng thành công!');location.href='/ntd-tin-tuyen-dung-da-dang'</script>");
            }
            else
                Response.Write("<script>alert('Đường dẫn không hợp lệ!');location.href='/ntd-tin-tuyen-dung-da-dang'</script>");
        }
        private void DangTuyen(int tthoso)
        {
            string strSecView = LookCookie().ToLower();
            string strSecurity = txt_ma_xac_minh.Value.ToString().ToLower();
            if (strSecurity != strSecView)
            {
                Response.Write("<script>alert('Nhập mã bảo mật sai!');</script>");
                return;
            }

            ESHOP_NEW news_insert = new ESHOP_NEW();
            news_insert.NEWS_TITLE = txttieu_de.Value;
            news_insert.NEWS_SEO_KEYWORD = txttieu_de.Value;
            news_insert.NEWS_SEO_TITLE = txttieu_de.Value;
            news_insert.NEWS_SEO_URL = txtSeoUrl.Value;
            news_insert.VL_CAOBAC_ID = Utils.CIntDef(ddlCapbacmongmuon.SelectedValue);
            news_insert.VL_HINHTHUCLAMVIEC_ID = Utils.CIntDef(ddlHinhthuclamviec.SelectedValue);
            news_insert.VL_MUCLUONG_ID = Utils.CIntDef(ddlMucluongmongmuon.SelectedValue);
            news_insert.SOLUONGTUYEN = Utils.CIntDef(txt_so_luong_tuyen.Value);
            news_insert.QUYENLOI = Utils.CStrDef(txt_quyen_loi.Value);
            news_insert.MOTACONGVIEC = Utils.CStrDef(txt_mo_ta_cong_viec.Value);
            news_insert.VL_KINHNGHIEM_ID = Utils.CIntDef(ddKinhnghiem.SelectedValue);
            news_insert.VL_TRINHDOHOCVAN_ID = Utils.CIntDef(ddlTrinhdohocvan.SelectedValue);
            news_insert.YEUCAUGIOITINH = Utils.CIntDef(ddlGioitinh.SelectedValue);
            news_insert.VL_DOTUOI_ID = Utils.CIntDef(ddlDotuoi.SelectedValue);
            news_insert.YEUCAUKHAC = Utils.CStrDef(txt_yeu_cau_khac.Value);
            news_insert.HOSO = Utils.CStrDef(txt_ho_so_gom.Value);
            DateTime deadline = DateTime.ParseExact(txtPickerHannop.Value, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            news_insert.NEWS_DEALINE = deadline;
            news_insert.VL_HINHTHUCNOPHOSO_ID = Utils.CIntDef(ddlHinhthucnophoso.SelectedValue);

            news_insert.TINHTRANGHOSO = tthoso;

            news_insert.NEWS_TYPE = 2;
            news_insert.NEWS_SHOWTYPE = 1;
            news_insert.NEWS_SHOWINDETAIL = 1;
            news_insert.NEWS_COUNT = 0;
            news_insert.CUSTOMER_ID = Utils.CIntDef(Session["userId"]);

            news_insert.NEWS_PUBLISHDATE = DateTime.Now;
            news_insert.NEWS_UPDATE = DateTime.Now;
            news_insert.NEWS_UPDATEFRERESH = DateTime.Now;

            db.ESHOP_NEWs.InsertOnSubmit(news_insert);
            db.SubmitChanges();



            SaveNewsCategory(news_insert.NEWS_ID, Utils.CIntDef(cblRdoOptionNganhnghe.SelectedValue));
            for (int i = 0; i < cblChkOptionDiadiem.Items.Count; i++)
            {
                if (cblChkOptionDiadiem.Items[i].Selected)
                {
                    SaveNewsArea(news_insert.NEWS_ID, Utils.CIntDef(cblChkOptionDiadiem.Items[i].Value));
                }
            }
            updateNewsSeoUrl(news_insert.NEWS_ID);

            Response.Write("<script>alert('Tạo tin tuyển dụng thành công. Sau khi kiểm duyệt sẽ được xuất bản lên website!');location.href='/ntd-tin-tuyen-dung-da-dang'</script>");

        }

        private void updateNewsSeoUrl(int newsId)
        {
            var itemshopnews = db.ESHOP_NEWs.Where(n => n.NEWS_ID == newsId);
            if (itemshopnews != null && itemshopnews.ToList().Count > 0)
            {
                itemshopnews.ToList()[0].NEWS_SEO_URL = txtSeoUrl.Value + "-" + newsId;
                db.SubmitChanges();
            }
        }
        private void SaveNewsCategory(int NewsId, int catId)
        {
            try
            {
                ESHOP_NEWS_CAT nc = new ESHOP_NEWS_CAT();
                nc.CAT_ID = catId;
                nc.NEWS_ID = NewsId;

                db.ESHOP_NEWS_CATs.InsertOnSubmit(nc);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private void DeleteNewsCategory(int NewsId)
        {
            try
            {
                var list = db.ESHOP_NEWS_CATs.Where(n=>n.NEWS_ID == NewsId);
                db.ESHOP_NEWS_CATs.DeleteAllOnSubmit(list);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private void SaveNewsArea(int NewsId, int areaId)
        {
            try
            {
                VL_AREA_ESHOP_NEW nc = new VL_AREA_ESHOP_NEW();
                nc.AREA_ID = areaId;
                nc.NEWS_ID = NewsId;

                db.VL_AREA_ESHOP_NEWs.InsertOnSubmit(nc);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private void DeleteNewsArea(int NewsId)
        {
            try
            {
                var list = db.VL_AREA_ESHOP_NEWs.Where(n => n.NEWS_ID == NewsId);
                db.VL_AREA_ESHOP_NEWs.DeleteAllOnSubmit(list);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        public string querys()
        {
            return LookCookie();
        }

        private string LookCookie()
        {
            HttpCookie Cookie = new HttpCookie("slmsrcd1");
            Cookie = Request.Cookies["slmsrcd1"];
            string strUser = "";
            if (Cookie != null && Cookie.Value != "" &&
                 Cookie.Value != null)
            {
                strUser = Cookie.Value.ToString();
            }
            return strUser;
        }
    }
}