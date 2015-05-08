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
    public partial class chitietvieclamNTV : System.Web.UI.UserControl
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private Function fun = new Function();
        private VL_Category vl = new VL_Category();
        private VL_News vlnews = new VL_News();
        private Account acount = new Account();
        private List_product list_pro = new List_product();
        private clsFormat cls = new clsFormat();
        string _sNews_Seo_Url = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            _sNews_Seo_Url = Utils.CStrDef(Request.QueryString["purl"]);
            if (!IsPostBack)
            {
                LoadInfo();
                Load_Vieclam();
                Load_Comment();
            }
        }
        private void LoadInfo()
        {
            var item = vlnews.GetEshopNewsByNews_seo_url(_sNews_Seo_Url);
            if (item != null)
            {
                //+ số lần xem việc làm
                var listcount = db.ESHOP_NEWs.Where(a =>a.NEWS_ID == item.NEWS_ID);
                if (listcount != null && listcount.ToList().Count > 0)
                {
                    listcount.ToList()[0].NEWS_COUNT++;

                    db.SubmitChanges();
                }

                Session["newsid"] = item.NEWS_ID;
                linkNophoso.HRef = linkNophoso2.HRef = "/ntv-nop-ho-so-truc-tuyen/" + _sNews_Seo_Url;

                lbTitle.Text = lbVitrituyendung.Text = lbVitrituyendung2.Text = Utils.CStrDef(item.NEWS_TITLE);
                lbLuotxem.Text = cls.FormatMoneyNoVND(listcount.ToList()[0].NEWS_COUNT);
                //lbMaNTD.Text = Utils.CStrDef(item.NEWS_CODE);
                lbNgaylammoi.Text = string.Format("{0:dd/MM/yyyy}", item.NEWS_UPDATEFRERESH);
                lbChucvu.Text = getCapbac(item.VL_CAOBAC_ID);
                lbNganhnghe.Text = getNganhnghe(item.NEWS_ID);
                lbHinhthuclamviec.Text = getHinhthuclamviec(item.VL_HINHTHUCLAMVIEC_ID);
                lbDiadiemlamviec.Text = getDiadiemlamviec(item.NEWS_ID);
                lbMucluong.Text = getMucluong(item.VL_MUCLUONG_ID);
                lbMotacongviec.Text = Utils.CStrDef(item.MOTACONGVIEC).Replace("\r\n", "<br />");
                lbQuyenloi.Text = Utils.CStrDef(item.QUYENLOI).Replace("\r\n", "<br />");
                lbYeucaukhac.Text = Utils.CStrDef(item.YEUCAUKHAC).Replace("\r\n", "<br />");
                lbHosogom.Text = Utils.CStrDef(item.HOSO).Replace("\r\n", "<br />");
                lbHannop.Text = string.Format("{0:dd/MM/yyyy}", item.NEWS_DEALINE);
                lbHinhthucnophoso.Text = getHinhthucnop(item.VL_HINHTHUCNOPHOSO_ID);
                lbKinhnghiem.Text = getKinhnghiem(item.VL_KINHNGHIEM_ID);
                lbBangcap.Text = getTrinhdohocvan(item.VL_TRINHDOHOCVAN_ID);
                lbGioitinh.Text = Utils.CIntDef(item.YEUCAUGIOITINH, 3) == 1 ? "Nam" : (Utils.CIntDef(item.YEUCAUGIOITINH, 3) == 2 ? "Nữ" : "Không yêu cầu");
                lbDotuoi.Text = getDotuoi(item.VL_DOTUOI_ID);
                lbSoluongtuyen.Text = Utils.CStrDef(item.SOLUONGTUYEN);

                Lbface.Text = "<div class='fb-like' data-href='" + Request.ServerVariables["HTTP_REFERER"] + "' data-layout='button_count' data-action='like' data-show-faces='true' data-share='true'></div>";

                int customerId = Utils.CIntDef(item.CUSTOMER_ID);
                Session["customerId"] = customerId;
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
                    lbGioithieucongty.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_GIOITHIEU).Replace("\r\n", "<br />");
                    lbQuymoconty.Text = Utils.CStrDef(customer.ToList()[0].CUSTOMER_QUYMO);
                    if (customer.ToList()[0].CUSTOMER_LOGO != "" && customer.ToList()[0].CUSTOMER_LOGO != null)
                        imgLogo.ImageUrl = "~/data/customer/logo/" + customer.ToList()[0].CUSTOMER_LOGO;
                }
                var list2 = vlnews.GetEshopNewsByOtherOfNTD(_sNews_Seo_Url, Utils.CIntDef(item.CUSTOMER_ID));
                if (list2 != null && list2.Count > 0)
                {
                    rptViecLam_Other.DataSource = list2.OrderByDescending(n => n.NEWS_COUNT);
                    rptViecLam_Other.DataBind();
                }

                //check người tìm việc xem tuyển dụng
                if (Utils.CIntDef(Session["user_quyen"]) == Cost.QUYEN_NTV)
                {
                    int userId = Utils.CIntDef(Session["userId"]);
                    var list = db.VL_CUSTOMER_ESHOP_NEWs.Where(a => a.CUSTOMER_ID == userId
                        && a.NEWS_ID == item.NEWS_ID && a.TYPE == 3);
                    if (list != null && list.ToList().Count > 0)
                    {
                        list.ToList()[0].PUBLISHDATE = DateTime.Now;

                        db.SubmitChanges();
                    }
                    else
                    {
                        VL_CUSTOMER_ESHOP_NEW insert = new VL_CUSTOMER_ESHOP_NEW();
                        insert.CUSTOMER_ID = userId;
                        insert.CUSTOMER_NTD_ID = customerId;
                        insert.NEWS_ID = item.NEWS_ID;
                        insert.TYPE = 3;
                        insert.PUBLISHDATE = DateTime.Now;

                        db.VL_CUSTOMER_ESHOP_NEWs.InsertOnSubmit(insert);
                        db.SubmitChanges();
                    }
                }
                
            }
        }
        private void Load_Vieclam()
        {
            var list = list_pro.Load_listprobyPeriod(1, 2, 0, 2, -1);
            if (list != null && list.Count > 0)
            {
                rptViecLam_Hot.DataSource = list.Take(24);
                rptViecLam_Hot.DataBind();
            }
        }
        #region function
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
        public string GetLinkNopHSNTV(object _sNews_Seo_Url)
        {
            return "/ntv-nop-ho-so-truc-tuyen/" + _sNews_Seo_Url;
        }
        public string GetCusNameNTV(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].CUSTOMER_FULLNAME;
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
            string strObj = Utils.CStrDef(obj).Replace("\r\n", "<br />").Replace("\n", "<br />"); ;
            if (strObj.Length >= lenght)
            {
                return strObj.Substring(0, lenght - 3) + "...";
            }
            return strObj;
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
        #endregion

        protected void lnkLuutin_Click(object sender, EventArgs e)
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            int newsId = Utils.CIntDef(Session["newsid"]);
            if (customerId == 0 || Utils.CIntDef(Session["user_quyen"]) != Cost.QUYEN_NTV)
            {
                MessageBox1.ShowMessage("Bạn cần đăng nhập tài khoản người tìm việc để sử dụng chức năng này!", "Thông báo");
                //Response.Write("<script>alert('Bạn cần đăng nhập tài khoản người tìm việc để sử dụng chức năng này!');'</script>");
                return;
            }
            var list = db.VL_CUSTOMER_ESHOP_NEWs.Where(a => a.CUSTOMER_ID == customerId
                        && a.TYPE == 1
                        && a.NEWS_ID == newsId);
            if (list != null && list.ToList().Count > 0)
            {
                //Response.Write("<script>alert('Bạn lưu tin này trước đó!');'</script>");
                MessageBox1.ShowMessage("Bạn đã lưu tin này trước đó!", "Thông báo");
                return;
            }
            if (newsId > 0)
            {
                VL_CUSTOMER_ESHOP_NEW insert = new VL_CUSTOMER_ESHOP_NEW();
                insert.CUSTOMER_ID = customerId;
                insert.NEWS_ID = newsId;
                insert.TYPE = 1;
                insert.PUBLISHDATE = DateTime.Now;

                db.VL_CUSTOMER_ESHOP_NEWs.InsertOnSubmit(insert);
                db.SubmitChanges();
                MessageBox1.ShowMessage("Lưu tin thành công!", "Thông báo");
            }
            else
            {
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void btnTheodoi_Click(object sender, EventArgs e)
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            int customerId2 = 0;
            int newsId = Utils.CIntDef(Session["newsid"]);
            if (customerId == 0 || Utils.CIntDef(Session["user_quyen"]) != Cost.QUYEN_NTV)
            {
                MessageBox1.ShowMessage("Bạn cần đăng nhập tài khoản người tìm việc để sử dụng chức năng này!", "Thông báo");
                //Response.Write("<script>alert('Bạn cần đăng nhập tài khoản người tìm việc để sử dụng chức năng này!');'</script>");
                return;
            }
            var listnews = db.ESHOP_NEWs.Where(n => n.NEWS_ID == newsId);
            if (listnews != null && listnews.ToList().Count > 0)
            {
                customerId2 = Utils.CIntDef(listnews.ToList()[0].CUSTOMER_ID);
            }
            var list = db.VL_CUSTOMER_CUSTOMERs.Where(n => n.CUSTOMER_ID == customerId && n.CUSTOMER_ID_2 == customerId2);
            if (list != null && list.ToList().Count > 0)
            {
                //Response.Write("<script>alert('Bạn lưu tin này trước đó!');'</script>");
                MessageBox1.ShowMessage("Đã cập nhật trước đó!", "Thông báo");
                return;
            }
            if (customerId2 > 0)
            {
                VL_CUSTOMER_CUSTOMER insert = new VL_CUSTOMER_CUSTOMER();
                insert.CUSTOMER_ID = customerId;
                insert.CUSTOMER_ID_2 = customerId2;

                db.VL_CUSTOMER_CUSTOMERs.InsertOnSubmit(insert);
                db.SubmitChanges();
                MessageBox1.ShowMessage("Cập nhật dữ liệu thành công!", "Thông báo");
            }
            else
            {
                Response.Redirect(Request.RawUrl);
            }           
        }

        private void Load_Comment()
        {
            int userId = Utils.CIntDef(Session["customerId"]);
            var list = from a in db.ESHOP_CUSTOMERs
                       join b in db.VL_CUSTOMER_COMMENTs on a.CUSTOMER_ID equals b.CUSTOMER_NTV_ID
                       where b.CUSTOMER_NTD_ID == userId
                       orderby b.DATE_CREATE descending
                       select b;
                rptcomment.DataSource = list;
                rptcomment.DataBind();
                //lbCountComment.Text = cls.FormatMoneyNoVND(list.ToList().Count);
        }

        protected void btnComment_Click(object sender, EventArgs e)
        {
            int userId = Utils.CIntDef(Session["userId"]);
            int customerId = Utils.CIntDef(Session["customerId"]);
            if (userId == 0 || Utils.CIntDef(Session["user_quyen"]) != Cost.QUYEN_NTV)
            {
                MessageBox1.ShowMessage("Bạn cần đăng nhập tài khoản người tìm việc để sử dụng chức năng này!", "Thông báo");
                //Response.Write("<script>alert('Bạn cần đăng nhập tài khoản người tìm việc để sử dụng chức năng này!');'</script>");
                return;
            }
            if (txtcomment.Value.Length <50)
            {
                MessageBox1.ShowMessage("Bình luận phải dài hơn 50 ký tự!", "Thông báo");
                
                return;
            }
            if (customerId > 0 && userId > 0)
            {
                VL_CUSTOMER_COMMENT insert = new VL_CUSTOMER_COMMENT();
                insert.CUSTOMER_NTD_ID = customerId;
                insert.CUSTOMER_NTV_ID = userId;
                insert.DATE_CREATE = DateTime.Now;
                insert.DESCRIPTION = txtcomment.Value;
                insert.ACTIVE = 1;
                insert.PRIORITY = 1;

                db.VL_CUSTOMER_COMMENTs.InsertOnSubmit(insert);
                db.SubmitChanges();
                MessageBox1.ShowMessage("Gửi bình luận thành công!", "Thông báo");
                Load_Comment();
                txtcomment.Value = "Nhập ý kiến của bạn ở đây";
            }
            else
            {
                Response.Redirect(Request.RawUrl);
            }    
        }


    }
}