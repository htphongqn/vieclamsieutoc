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
using System.Collections;

namespace CatTrang.vi_vn
{
    public partial class taohosotimviecNTV : System.Web.UI.Page
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private VL_Category vl = new VL_Category();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null && Session["user_fullname"] != null && Session["user_quyen"] != null && Utils.CIntDef(Session["user_quyen"]) == 1)
                {
                    Load_VL_Category();
                    LoadThongtincanhan();
                    AddQuatrinhlamviec();
                    AddThamkhao();
                    if (Request.QueryString["id"] != null)
                    {
                        loadInfo();
                    }
                    if (Request.QueryString["idcoppy"] == null && Request.QueryString["id"] != null)
                    {
                        btnCapnhat.Visible = true;
                        btnDanghoso.Visible = false;
                        btnLuutam.Visible = false;
                    }
                    else
                    {
                        btnCapnhat.Visible = false;
                        btnDanghoso.Visible = true;
                        btnLuutam.Visible = true;
                    }
                }
                else
                {
                    Session.Abandon();
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản người tìm việc!');location.href='/trang-chu.html'</script>");
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
            ddlTrinhdohocvan.DataSource = vl.GetAllTrinhdohocvan();
            ddlTrinhdohocvan.DataBind();
            LoadNamtotnghiep();
            ddlTruongtotnghiep.DataSource = vl.GetAllTruongtotnghiep();
            ddlTruongtotnghiep.DataBind();
            ddlNgoaingu.DataSource = vl.GetAllNgoaingu();
            ddlNgoaingu.DataBind();
            ddlTrinhdongoaingu.DataSource = vl.GetAllTrinhdoNgoaingu();
            ddlTrinhdongoaingu.DataBind();
            ddKinhnghiem.DataSource = vl.GetAllKinhnghiem();
            ddKinhnghiem.DataBind();
        }
        private void LoadNamtotnghiep()
        {
            for (int i = DateTime.Now.Year; i > DateTime.Now.Year - 20; i--)
            {
                ddlNamtotnghiep.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }
        private void LoadThongtincanhan()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            var item = db.ESHOP_CUSTOMERs.Where(c => c.CUSTOMER_ID == customerId);
            if (item != null && item.ToList().Count > 0)
            {
                lbFullname.Text = item.ToList()[0].CUSTOMER_FULLNAME;
                lbBirthday.Text = Utils.CDateDef(item.ToList()[0].CUSTOMER_BIRTHDAY, DateTime.MinValue).ToString("dd/MM/yyyy");
                lbSex.Text = Utils.CIntDef(item.ToList()[0].CUSTOMER_SEX, 3) == 1 ? "Nam" : (Utils.CIntDef(item.ToList()[0].CUSTOMER_SEX, 3) == 2 ? "Nữ" : "Khác");
                lbTinhtranghonnha.Text = Utils.CIntDef(item.ToList()[0].CUSTOMER_HONNHAN) == 1 ? "Độc thân" : "Đã có gia đình";

                lbContactName.Text = item.ToList()[0].CUSTOMER_CONTACTNAME;
                lbContactAddress.Text = item.ToList()[0].CUSTOMER_ADDRESS;
                lbContactEmail.Text = item.ToList()[0].CUSTOMER_EMAIL;
                lbContactPhone.Text = item.ToList()[0].CUSTOMER_PHONE1;
            }
        }
        private void AddQuatrinhlamviec()
        {
            string s = "";
            s += "Tên công ty:\n";
            s += "Vị trí công việc:\n";
            s += "Ngành nghề:\n";
            s += "Thời gian bắt đầu:\n";
            s += "Thời gian kết thúc:\n";
            s += "Mô tả công việc:\n";
            s += "Lý do thôi việc:\n";
            s += "Thành tích đạt được:\n";
            s += "Mức lương:\n";
            txt_kinh_nghiem.Value = s;
        }
        private void AddThamkhao()
        {
            string s = "";
            s += "Họ và tên:\n";
            s += "Địa chỉ:\n";
            s += "Điện thoại:\n";
            s += "Nghề nghiệp:\n";
            s += "Quan hệ:\n";
            s += "Thời gian quen biết:\n";
            txt_nguon_tham_khao.Value = s;
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
                txtmuc_tieu_nghe_nghiep.Value = news_insert.ToList()[0].MUCTIEUNGHENGHIEP;
                txtPickerDenngay.Value = news_insert.ToList()[0].NEWS_DEALINE.Value.ToString("dd/MM/yyyy");
                ddlTrinhdohocvan.SelectedValue = Utils.CStrDef(news_insert.ToList()[0].VL_TRINHDOHOCVAN_ID);
                txtnganh_hoc.Value = news_insert.ToList()[0].NGANHHOC;
                ddlNamtotnghiep.SelectedValue = Utils.CStrDef(news_insert.ToList()[0].NAMTOTNGHIEP);
                ddlLoaitotnghiep.SelectedValue = Utils.CStrDef(news_insert.ToList()[0].LOAITOTNGHIEP);
                ddlTruongtotnghiep.SelectedValue = Utils.CStrDef(news_insert.ToList()[0].VL_TRUONGTOTNGHIEP_ID);
                ddlNgoaingu.SelectedValue = Utils.CStrDef(news_insert.ToList()[0].VL_NGOAINGU_ID);
                ddlTrinhdongoaingu.SelectedValue = Utils.CStrDef(news_insert.ToList()[0].VL_TRINHDONGOAINGU_ID);
                txttrinh_do_tin_hoc.Value = news_insert.ToList()[0].TRINHDOTINHOC;
                txtbang_cap_khac.Value = news_insert.ToList()[0].BANGCAPKHAC;
                ddKinhnghiem.SelectedValue = Utils.CStrDef(news_insert.ToList()[0].VL_KINHNGHIEM_ID);
                txt_kinh_nghiem.Value = news_insert.ToList()[0].QUATRINHLAMVIEC;
                txtky_nang.Value = news_insert.ToList()[0].KYNANG;
                txt_nguon_tham_khao.Value = news_insert.ToList()[0].NGUONTHAMKHAO;

                var news_cats = db.ESHOP_NEWS_CATs.Where(n=>n.NEWS_ID == news_insert.ToList()[0].NEWS_ID);
                if(news_cats != null && news_cats.ToList().Count > 0)
                {
                    cblRdoOptionNganhnghe.SelectedValue = news_cats.ToList()[0].CAT_ID.ToString();
                }

                var news_area = db.VL_AREA_ESHOP_NEWs.Where(n => n.NEWS_ID == news_insert.ToList()[0].NEWS_ID);
                foreach(var item in news_area)
                {
                    for (int i = 0; i < cblChkOptionDiadiem.Items.Count; i++)
                    {
                        if(item.AREA_ID.ToString() == cblChkOptionDiadiem.Items[i].Value)
                            cblChkOptionDiadiem.Items[i].Selected = true;    
                    }
                }               
            }
        }
        protected void lnkAddKinhnghiem_Click(object sender, EventArgs e)
        {
            string s = "=========================================================\n";
            s += "Tên công ty:\n";
            s += "Vị trí công việc:\n";
            s += "Ngành nghề:\n";
            s += "Thời gian bắt đầu:\n";
            s += "Thời gian kết thúc:\n";
            s += "Mô tả công việc:\n";
            s += "Lý do thôi việc:\n";
            s += "Thành tích đạt được:\n";
            s += "Mức lương:\n";
            txt_kinh_nghiem.Value += s;
        }

        protected void lnkAddThamkhao_Click(object sender, EventArgs e)
        {
            string s = "=========================================================\n";
            s += "Họ và tên:\n";
            s += "Địa chỉ:\n";
            s += "Điện thoại:\n";
            s += "Nghề nghiệp:\n";
            s += "Quan hệ:\n";
            s += "Thời gian quen biết:\n";
            txt_nguon_tham_khao.Value += s;
        }

        protected void cblRdoOptionNganhngheDislay_SelectedIndexChanged(object sender, EventArgs e)
        {
            string valueSelect = cblRdoOptionNganhnghe.SelectedValue;
            if (cblRdoOptionNganhngheDislay.SelectedValue == "1")
            {
                cblRdoOptionNganhnghe.DataSource = vl.GetAllNganhnghe().Where(n=>n.CAT_ID == Utils.CIntDef(valueSelect));
                cblRdoOptionNganhnghe.DataBind();
                if (!string.IsNullOrEmpty(valueSelect))
                    cblRdoOptionNganhnghe.SelectedValue = valueSelect;
            }
            else if (cblRdoOptionNganhngheDislay.SelectedValue == "2")
            {
                cblRdoOptionNganhnghe.DataSource = vl.GetAllNganhnghe();
                cblRdoOptionNganhnghe.DataBind();
                if(!string.IsNullOrEmpty(valueSelect))
                    cblRdoOptionNganhnghe.SelectedValue = valueSelect;
            }
        }

        protected void cblRdoOptionDiadiemDislay_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<decimal> arr = new List<decimal>();
            for(int i =0;i<cblChkOptionDiadiem.Items.Count;i++)
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

        protected void ddlTruongtotnghiepDislay_SelectedIndexChanged(object sender, EventArgs e)
        {
            string valueSelect = ddlTruongtotnghiep.SelectedValue;
            if (ddlTruongtotnghiepDislay.SelectedValue == "1")
            {
                ddlTruongtotnghiep.DataSource = vl.GetAllTruongtotnghiep().Where(n => n.ID == Utils.CIntDef(valueSelect));
                ddlTruongtotnghiep.DataBind();
                if (!string.IsNullOrEmpty(valueSelect))
                    ddlTruongtotnghiep.SelectedValue = valueSelect;
            }
            else if (ddlTruongtotnghiepDislay.SelectedValue == "2")
            {
                ddlTruongtotnghiep.DataSource = vl.GetAllTruongtotnghiep();
                ddlTruongtotnghiep.DataBind();
                if (!string.IsNullOrEmpty(valueSelect))
                    ddlTruongtotnghiep.SelectedValue = valueSelect;
            }
        }

        protected void btnDanghoso_Click(object sender, EventArgs e)
        {
            DangHoso(1);
        }
        protected void btnLuutam_Click(object sender, EventArgs e)
        {
            DangHoso(4);
        }
        protected void btnCapnhat_Click(object sender, EventArgs e)
        {
            if (this.txt_ma_xac_minh.Value != this.Session["CaptchaImageText"].ToString())
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
                news_insert.ToList()[0].MUCTIEUNGHENGHIEP = txtmuc_tieu_nghe_nghiep.Value;
                DateTime deadline = DateTime.ParseExact(txtPickerDenngay.Value, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                news_insert.ToList()[0].NEWS_DEALINE = deadline;
                news_insert.ToList()[0].VL_TRINHDOHOCVAN_ID = Utils.CIntDef(ddlTrinhdohocvan.SelectedValue);
                news_insert.ToList()[0].NGANHHOC = txtnganh_hoc.Value;
                news_insert.ToList()[0].NAMTOTNGHIEP = Utils.CIntDef(ddlNamtotnghiep.SelectedValue);
                news_insert.ToList()[0].LOAITOTNGHIEP = Utils.CIntDef(ddlLoaitotnghiep.SelectedValue);
                news_insert.ToList()[0].VL_TRUONGTOTNGHIEP_ID = Utils.CIntDef(ddlTruongtotnghiep.SelectedValue);
                news_insert.ToList()[0].VL_NGOAINGU_ID = Utils.CIntDef(ddlNgoaingu.SelectedValue);
                news_insert.ToList()[0].VL_TRINHDONGOAINGU_ID = Utils.CIntDef(ddlTrinhdongoaingu.SelectedValue);
                news_insert.ToList()[0].TRINHDOTINHOC = txttrinh_do_tin_hoc.Value;
                news_insert.ToList()[0].BANGCAPKHAC = txtbang_cap_khac.Value;
                news_insert.ToList()[0].VL_KINHNGHIEM_ID = Utils.CIntDef(ddKinhnghiem.SelectedValue);
                news_insert.ToList()[0].QUATRINHLAMVIEC = txt_kinh_nghiem.Value;
                news_insert.ToList()[0].KYNANG = txtky_nang.Value;
                news_insert.ToList()[0].NGUONTHAMKHAO = txt_nguon_tham_khao.Value;

                //news_insert.TINHTRANGHOSO = tthoso;

                //news_insert.NEWS_TYPE = 1;
                //news_insert.NEWS_SHOWTYPE = 1;
                //news_insert.NEWS_SHOWINDETAIL = 1;
                //news_insert.NEWS_COUNT = 0;
                //news_insert.CUSTOMER_ID = Utils.CIntDef(Session["userId"]);

                //news_insert.NEWS_PUBLISHDATE = DateTime.Now;
                news_insert.ToList()[0].NEWS_UPDATE = DateTime.Now;
                //news_insert.NEWS_UPDATEFRERESH = DateTime.Now;


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
                if(news_seo_url != txtSeoUrl.Value)
                    updateNewsSeoUrl(news_insert.ToList()[0].NEWS_ID);

                Response.Write("<script>alert('Cập nhật hồ sơ tìm việc thành công!');location.href='/ntv-ho-so-da-dang'</script>");
            }
            else
                Response.Write("<script>alert('Đường dẫn không hợp lệ!');location.href='/ntv-ho-so-da-dang'</script>");
        }
        private void DangHoso(int tthoso)
        {
            if (this.txt_ma_xac_minh.Value != this.Session["CaptchaImageText"].ToString())
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
            news_insert.MUCTIEUNGHENGHIEP = txtmuc_tieu_nghe_nghiep.Value;
            DateTime deadline = DateTime.ParseExact(txtPickerDenngay.Value, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            news_insert.NEWS_DEALINE = deadline;
            news_insert.VL_TRINHDOHOCVAN_ID = Utils.CIntDef(ddlTrinhdohocvan.SelectedValue);
            news_insert.NGANHHOC = txtnganh_hoc.Value;
            news_insert.NAMTOTNGHIEP = Utils.CIntDef(ddlNamtotnghiep.SelectedValue);
            news_insert.LOAITOTNGHIEP = Utils.CIntDef(ddlLoaitotnghiep.SelectedValue);
            news_insert.VL_TRUONGTOTNGHIEP_ID = Utils.CIntDef(ddlTruongtotnghiep.SelectedValue);
            news_insert.VL_NGOAINGU_ID = Utils.CIntDef(ddlNgoaingu.SelectedValue);
            news_insert.VL_TRINHDONGOAINGU_ID = Utils.CIntDef(ddlTrinhdongoaingu.SelectedValue);
            news_insert.TRINHDOTINHOC = txttrinh_do_tin_hoc.Value;
            news_insert.BANGCAPKHAC = txtbang_cap_khac.Value;
            news_insert.VL_KINHNGHIEM_ID = Utils.CIntDef(ddKinhnghiem.SelectedValue);
            news_insert.QUATRINHLAMVIEC = txt_kinh_nghiem.Value;
            news_insert.KYNANG = txtky_nang.Value;
            news_insert.NGUONTHAMKHAO = txt_nguon_tham_khao.Value;
            
            news_insert.TINHTRANGHOSO = tthoso;

            news_insert.NEWS_TYPE = 1;
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

            Response.Write("<script>alert('Tạo hồ sơ tìm việc thành công!');location.href='/ntv-ho-so-da-dang'</script>");

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
                var list = db.ESHOP_NEWS_CATs.Where(n => n.NEWS_ID == NewsId);
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
    }
}