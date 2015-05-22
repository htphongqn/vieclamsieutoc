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
using CatTrang.Components;

namespace CatTrang.UIs
{
    public partial class chitietungvienNTD : System.Web.UI.UserControl
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private Function fun = new Function();
        private VL_Category vl = new VL_Category();
        private VL_News vlnews = new VL_News();
        private Account acount = new Account();
        private clsFormat cls = new clsFormat();
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
                int news_count = Utils.CIntDef(item.NEWS_COUNT);
                //+ số lần xem việc làm
                List<int> arr = new List<int>();
                if (Session["viewCount"] != null)
                    arr = (List<int>)Session["viewCount"];
                int i = arr.Find(a => a == item.NEWS_ID);
                if (i != item.NEWS_ID)
                {
                    arr.Add(item.NEWS_ID);
                    Session["viewCount"] = arr;
                    var listcount = db.ESHOP_NEWs.Where(a => a.NEWS_ID == item.NEWS_ID);
                    if (listcount != null && listcount.ToList().Count > 0)
                    {
                        listcount.ToList()[0].NEWS_COUNT++;
                        news_count = Utils.CIntDef(listcount.ToList()[0].NEWS_COUNT);
                        db.SubmitChanges();
                    }
                }
                Session["newsid"] = item.NEWS_ID;

                lbLuotxem.Text = cls.FormatMoneyNoVND(news_count);
                //lbMaNTD.Text = Utils.CStrDef(item.NEWS_CODE);
                lbNgaylammoi.Text = string.Format("{0:dd/MM/yyyy}", item.NEWS_UPDATEFRERESH);
                                
                lbBangcap.Text = getTrinhdohocvan(item.VL_TRINHDOHOCVAN_ID);
                lbNganhhoc.Text = item.NGANHHOC;
                string loaitotnghiep = GetCusLoaitotnghiepNTV(item.LOAITOTNGHIEP);
                lbTotnghiepnam.Text = Utils.CStrDef(item.NAMTOTNGHIEP) + " (" + loaitotnghiep + ")";
                lbTotnghieptaitruong.Text = getTruongtotnghiep(item.VL_TRUONGTOTNGHIEP_ID);
                lbNgoaingu.Text = getNgoaingu(item.VL_TRUONGTOTNGHIEP_ID);
                lbTrinhdotinhoc.Text = Utils.CStrDef(item.TRINHDOTINHOC).Replace("\r\n", "<br />");
                lbBangcapkhac.Text = Utils.CStrDef(item.BANGCAPKHAC).Replace("\r\n", "<br />");
                lbSonamkinhnghiem.Text = getKinhnghiem(item.VL_KINHNGHIEM_ID);
                lbKinhnghiem.Text = Utils.CStrDef(item.QUATRINHLAMVIEC).Replace("\r\n", "<br />");
                lbCackynang.Text = Utils.CStrDef(item.KYNANG).Replace("\r\n", "<br />");
                
                lbVitrimongmuon.Text = Utils.CStrDef(item.NEWS_TITLE);
                lbCapbacmongmuon.Text = getCapbac(item.VL_CAOBAC_ID);
                lbNgangnghe.Text = getNganhnghe(item.NEWS_ID);
                lbHinhthuclamviec.Text = getHinhthuclamviec(item.VL_HINHTHUCLAMVIEC_ID);
                lbDiadiemlamviec.Text = getDiadiemlamviec(item.NEWS_ID);
                lbMucluongmongmuon.Text = getMucluong(item.VL_MUCLUONG_ID);
                lbMuctieunghenghiep.Text = Utils.CStrDef(item.MUCTIEUNGHENGHIEP);

                int customerId = Utils.CIntDef(item.CUSTOMER_ID);
                Session["customerid"] = customerId;
                var customer = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == customerId);
                if (customer != null && customer.ToList().Count > 0)
                {
                    lbHoTen.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_FULLNAME);
                    DateTime birthday = Utils.CDateDef(customer.ToList()[0].CUSTOMER_BIRTHDAY, DateTime.MinValue);
                    lbNgaysinh.Text = "";
                    if (birthday != DateTime.MinValue)
                        lbNgaysinh.Text = birthday.ToString("dd/MM/yyyy");
                    lbGioitinh.Text =GetCusSexNTV(customer.ToList()[0].CUSTOMER_SEX);
                    lbTinhtranghonnhan.Text = GetCusHonnhanNTV(customer.ToList()[0].CUSTOMER_HONNHAN);
                    if (customer.ToList()[0].CUSTOMER_LOGO != "" && customer.ToList()[0].CUSTOMER_LOGO != null)
                        imgLogo.ImageUrl = "~/data/customer/logo/" + customer.ToList()[0].CUSTOMER_LOGO;
                }
                int catId = getNganhngheID(item.NEWS_ID);
                var list2 = vlnews.GetEshopNewsByOtherOfCat(_sNews_Seo_Url, catId);
                if (list2 != null && list2.Count > 0)
                {
                    rptHoso_Tuongtu.DataSource = list2;//.OrderByDescending(n => n.NEWS_COUNT);
                    rptHoso_Tuongtu.DataBind();
                }

                var itemCat = db.ESHOP_CATEGORies.Where(n=>n.CAT_ID == catId);
                if (itemCat != null && itemCat.ToList().Count > 0)
                {
                    linkUngvientuongtu.HRef = GetLinkCat(itemCat.ToList()[0].CAT_URL, itemCat.ToList()[0].CAT_SEO_URL, 1);
                }
                //check nhà tuyển dung xem hồ sơ
                if (Utils.CIntDef(Session["user_quyen"]) == Cost.QUYEN_NTD)
                {
                    int userId = Utils.CIntDef(Session["userId"]);
                    var list = db.VL_CUSTOMER_ESHOP_NEWs.Where(a => a.CUSTOMER_NTD_ID == userId
                        && a.NEWS_ID_UNGTUYEN == item.NEWS_ID && a.TYPE == 4);
                    if (list != null && list.ToList().Count > 0)
                    {
                        list.ToList()[0].VIEWCOUNT++;
                        list.ToList()[0].PUBLISHDATE = DateTime.Now;

                        db.SubmitChanges();
                    }
                    else
                    {
                        VL_CUSTOMER_ESHOP_NEW insert = new VL_CUSTOMER_ESHOP_NEW();
                        insert.CUSTOMER_ID = customerId;
                        insert.CUSTOMER_NTD_ID = userId;
                        insert.NEWS_ID_UNGTUYEN = item.NEWS_ID;
                        insert.TYPE = 4;
                        insert.VIEWCOUNT = 1;
                        insert.PUBLISHDATE = DateTime.Now;

                        db.VL_CUSTOMER_ESHOP_NEWs.InsertOnSubmit(insert);
                        db.SubmitChanges();
                    }
                }
            }
        }
        private void Load_Vieclam()
        {
            var list2 = list_pro.Load_listprobytype(1, 0, 2, -1);
            if (list2 != null && list2.Count > 0)
            {
                rptHoso_XemNhieu.DataSource = list2.OrderByDescending(n => n.NEWS_COUNT).Take(24);
                rptHoso_XemNhieu.DataBind();
            }
        }
        #region function
        public string GetLinkCat(object Cat_Url, object Cat_Seo_Url, object Cat_Type)
        {
            try
            {
                string temp = fun.Getlink_Cat_NTD(Cat_Url, Cat_Seo_Url);
                return temp;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string GetLinkNTD(object newsId)
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
                return fun.Getlink_News_NTD(News_Url, News_Seo_Url, cat_seo);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetCusSexNTV(object oid)
        {
            int sexid = Utils.CIntDef(oid);
            return sexid == 1 ? "Nam" : (sexid == 2 ? "Nữ" : "Khác");
        }
        public string GetCusHonnhanNTV(object oid)
        {
            int sexid = Utils.CIntDef(oid);
            return sexid == 1 ? "Độc thân" : (sexid == 2 ? "Đã có gia đình" : "N/A");
        }
        public string GetCusLoaitotnghiepNTV(object oid)
        {
            int sexid = Utils.CIntDef(oid);
            return sexid == 1 ? "Xuất sắc" : (sexid == 2 ? "Giỏi" : (sexid == 3 ? "Khá" : (sexid == 4 ? "Trung bình khá" : (sexid == 5 ? "Trung bình" : "N/A"))));
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
        public string getKinhnghiem(object ott)
        {
            int id = Utils.CIntDef(ott);
            var item = db.VL_KINHNGHIEMs.Where(n => n.ID == id);
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
        public int getNganhngheID(object newsId)
        {
            int id = Utils.CIntDef(newsId);
            var item = db.ESHOP_NEWS_CATs.Where(n => n.NEWS_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].ESHOP_CATEGORy.CAT_ID;
            }
            return 0;
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
        public string getDiadiemlamviec(object ott)
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
        public string getTruongtotnghiep(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_TRUONGTOTNGHIEPs.Where(n => n.ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
        }
        public string getNgoaingu(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.VL_NGOAINGUs.Where(n => n.ID == id);
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
        #endregion
        protected void lnkLuutin_Click(object sender, EventArgs e)
        {
            int userId = Utils.CIntDef(Session["userId"]);
            int newsId = Utils.CIntDef(Session["newsid"]);
            int cusId = Utils.CIntDef(Session["customerid"]);
            if (userId == 0 || Utils.CIntDef(Session["user_quyen"]) != Cost.QUYEN_NTD)
            {
                MessageBox1.ShowMessage("Bạn cần đăng nhập tài khoản nhà tuyển để sử dụng chức năng này!", "Thông báo");
                return;
            }
            var list = db.VL_CUSTOMER_ESHOP_NEWs.Where(a => a.CUSTOMER_NTD_ID == userId
                    && a.NEWS_ID_UNGTUYEN == newsId && a.TYPE == 5);
            if (list != null && list.ToList().Count > 0)
            {
                MessageBox1.ShowMessage("Bạn lưu hồ sơ này trước đó!", "Thông báo");
                return;
            }
            if (newsId > 0)
            {
                VL_CUSTOMER_ESHOP_NEW insert = new VL_CUSTOMER_ESHOP_NEW();
                insert.CUSTOMER_ID = cusId;
                insert.CUSTOMER_NTD_ID = userId;
                insert.NEWS_ID_UNGTUYEN = newsId;
                insert.TYPE = 5;
                insert.PUBLISHDATE = DateTime.Now;
                insert.DATE_XULY = DateTime.Now;

                db.VL_CUSTOMER_ESHOP_NEWs.InsertOnSubmit(insert);
                db.SubmitChanges();
                MessageBox1.ShowMessage("Lưu hồ sơ thành công!", "Thông báo");
            }
            else
            {
                Response.Redirect("/nha-tuyen-dung.html");
            }
        }
    }
}