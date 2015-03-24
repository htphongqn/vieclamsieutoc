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

                }
                else
                {
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
                cblChkOptionDiadiem.DataSource = vl.GetAllArea().Where(n => arr.Contains(n.ARE_ID));
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
            //news_insert. = txtmuc_tieu_nghe_nghiep.Value;
            news_insert.NEWS_DEALINE = Utils.CDateDef(txtPickerDenngay.Value, DateTime.Now);
            news_insert.VL_TRINHDOHOCVAN_ID = Utils.CIntDef(ddlTrinhdohocvan.SelectedValue);
            //news_insert. = txtnganh_hoc.Value;
            //news_insert. = Utils.CIntDef(ddlNamtotnghiep.SelectedValue);
            //news_insert. = Utils.CIntDef(ddlLoaitotnghiep.SelectedValue);
            news_insert.VL_TRUONGTOTNGHIEP_ID = Utils.CIntDef(ddlTruongtotnghiep.SelectedValue);
            news_insert.VL_NGOAINGU_ID = Utils.CIntDef(ddlNgoaingu.SelectedValue);
            news_insert.VL_TRINHDONGOAINGU_ID = Utils.CIntDef(ddlTrinhdongoaingu.SelectedValue);
            //news_insert. = txttrinh_do_tin_hoc.Value;
            //news_insert. = txtbang_cap_khac.Value;
            news_insert.VL_KINHNGHIEM_ID = Utils.CIntDef(ddKinhnghiem.SelectedValue);
            //news_insert. = txt_kinh_nghiem.Value;
            //news_insert. = txtky_nang.SelectedValue;
            //news_insert. = txt_nguon_tham_khao.SelectedValue;
            
            news_insert.TINHTRANGHOSO = tthoso;

            news_insert.NEWS_TYPE = 1;
            news_insert.NEWS_SHOWTYPE = 1;
            news_insert.NEWS_SHOWINDETAIL = 1;
            news_insert.NEWS_COUNT = 0;
            news_insert.CUSTOMER_ID = Utils.CIntDef(Session["userId"]);
            
            news_insert.NEWS_PUBLISHDATE = DateTime.Now;

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

    }
}