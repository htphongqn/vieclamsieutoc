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
    public partial class quanlyhosoungvienNTD : System.Web.UI.Page
    {
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private VL_News news = new VL_News(); 
        private Function fun = new Function();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null && Session["user_fullname"] != null && Session["user_quyen"] != null && Utils.CIntDef(Session["user_quyen"]) == Cost.QUYEN_NTD)
                {
                    Load_ListTuyendung();
                    LoadLoaiTin();
                    LoadMucluong();
                    LoadTrinhdohocvan();
                    LoadHonnhan();
                    LoadGioitinh();
                    LoadKinhnghiem();
                    Load_hosoungvien(Utils.CIntDef(Session["userId"]), 0, 0, 0, 0, 0, 0, 1);
                    
                    string logoUrl = GetCusLogo(Utils.CIntDef(Session["userId"]));
                    lbLogo.Text = "<img style='max-width: 100%' src='" + logoUrl + "'>";
                }
                else
                {
                    Session.Abandon();
                    Response.Write("<script>alert('Bạn cần đăng nhập tài khoản nhà tuyển dụng!');location.href='/nha-tuyen-dung.html'</script>");
                }
            }
        }
        private void Load_hosoungvien(int customerId, int trangthaihoso, int mucluong, int trinhdohocvan, int gioitinh, int tinhtranghonnhan, int kinhnghiem, int sortId)
        {
            int newsId = Utils.CIntDef(Session["newsId"]);
            var list = news.GetCustomerByCustomerId(customerId, newsId, trangthaihoso, mucluong, trinhdohocvan, gioitinh, tinhtranghonnhan, kinhnghiem);
            Session["NewsList"] = DataUtil.LINQToDataTable(list);

            switch (sortId)
            {
                case 1:
                    list = list.OrderByDescending(n => n.PUBLISHDATE).ToList();
                    break;
                case 2:
                    list = list.OrderBy(n => n.PUBLISHDATE).ToList();
                    break;
                case 3:
                    list = list.OrderByDescending(n => n.DATE_XULY).ToList();
                    break;
                case 4:
                    list = list.OrderBy(n => n.DATE_XULY).ToList();
                    break;
                default:
                    break;
            }

            GridItemList.DataSource = list;
            GridItemList.DataBind();
        }
        private void Load_ListTuyendung()
        {
            int userId = Utils.CIntDef(Session["userId"]);
            var list = news.GetEshopNewsByCustomerId(userId);
            cblRdoOptionVitrituyendung.DataSource = list;
            cblRdoOptionVitrituyendung.DataBind();
        }
        private void LoadLoaiTin()
        {
            //1 NTV lưu, 2 NTV ứng tuyển, , 3 NTV đã xem, 4 NTD đã xem, 5 NTD đã lưu
            //6 NTD phỏng vấn, 7 NTD Ho so trung tuyen, 8 NTD Ho so chua dat
            var list = news.GetCustomerByCustomerId(Utils.CIntDef(Session["userId"]),Utils.CIntDef(Session["newsId"]), 0, 0, 0, 0, 0, 0);
            var listDaluu = list.Where(n => n.TYPE == 5);
            if (listDaluu != null && listDaluu.ToList().Count > 0)
            {
                ckhblLoaiTin.Items.Add(new ListItem("Hồ sơ đã lưu (" + listDaluu.ToList().Count + ")", "5".ToString()));
            }
            var listUngtuyen = list.Where(n => n.TYPE == 2);
            if (listUngtuyen != null && listUngtuyen.ToList().Count > 0)
            {
                ckhblLoaiTin.Items.Add(new ListItem("Hồ sơ tự ứng tuyển (" + listUngtuyen.ToList().Count + ")", "2".ToString()));
            }
            var listPhongvan = list.Where(n => n.TYPE == 6);
            if (listPhongvan != null && listPhongvan.ToList().Count > 0)
            {
                ckhblLoaiTin.Items.Add(new ListItem("Hồ sơ phỏng vấn (" + listPhongvan.ToList().Count + ")", "6".ToString()));
            }
            var listTrungtuyen = list.Where(n => n.TYPE == 7);
            if (listTrungtuyen != null && listTrungtuyen.ToList().Count > 0)
            {
                ckhblLoaiTin.Items.Add(new ListItem("Hồ sơ trúng tuyển (" + listTrungtuyen.ToList().Count + ")", "7".ToString()));
            }
            var listChuadat = list.Where(n => n.TYPE == 8);
            if (listChuadat != null && listChuadat.ToList().Count > 0)
            {
                ckhblLoaiTin.Items.Add(new ListItem("Hồ sơ chưa đạt (" + listChuadat.ToList().Count + ")", "8".ToString()));
            }
        }
        private void LoadMucluong()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            int newsId = Utils.CIntDef(Session["newsId"]);
            var list = (from a in db.VL_CUSTOMER_ESHOP_NEWs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        join c in db.VL_MUCLUONGs on b.VL_MUCLUONG_ID equals c.ID
                        where b.CUSTOMER_ID == customerId && b.NEWS_ID == newsId
                        && b.NEWS_SHOWTYPE == 1
                        select new { c.ID, c.NAME }).ToList();
           
            var listMucluong = list.Distinct().ToList();

            foreach (var item in listMucluong)
            {
                var itemin = list.Where(n => n.ID == item.ID);
                if (itemin != null)
                {
                    ckhbMucluong.Items.Add(new ListItem(item.NAME + " (" + itemin.ToList().Count + ")", item.ID.ToString()));
                }
                else
                {
                    ckhbMucluong.Items.Add(new ListItem(item.NAME + " (0)", item.ID.ToString()));
                }
            }
        }
        private void LoadTrinhdohocvan()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            int newsId = Utils.CIntDef(Session["newsId"]);
            var list = (from a in db.VL_CUSTOMER_ESHOP_NEWs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        join c in db.VL_TRINHDOHOCVANs on b.VL_TRINHDOHOCVAN_ID equals c.ID
                        where b.CUSTOMER_ID == customerId && b.NEWS_ID == newsId
                        && b.NEWS_SHOWTYPE == 1
                        select new { c.ID, c.NAME }).ToList();

            var listHocvan = list.Distinct().ToList();

            foreach (var item in listHocvan)
            {
                var itemin = list.Where(n => n.ID == item.ID);
                if (itemin != null)
                {
                    ckhbBangcap.Items.Add(new ListItem(item.NAME + " (" + itemin.ToList().Count + ")", item.ID.ToString()));
                }
                else
                {
                    ckhbBangcap.Items.Add(new ListItem(item.NAME + " (0)", item.ID.ToString()));
                }
            }
        }
        private void LoadGioitinh()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            int newsId = Utils.CIntDef(Session["newsId"]);
            var list = (from a in db.VL_CUSTOMER_ESHOP_NEWs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        where b.CUSTOMER_ID == customerId && b.NEWS_ID == newsId
                        && b.NEWS_SHOWTYPE == 1
                        select new { a.ESHOP_CUSTOMER.CUSTOMER_SEX }).ToList();

            var listGioitinh = list.Distinct().ToList();

            foreach (var item in listGioitinh)
            {
                string name = "Khác";
                if (item.CUSTOMER_SEX == 1)
                    name = "Nam";
                else if (item.CUSTOMER_SEX == 2)
                    name = "Nữ";
                var itemin = list.Where(n => n.CUSTOMER_SEX == item.CUSTOMER_SEX);
                if (itemin != null)
                {
                    ckhbGioitinh.Items.Add(new ListItem(name + " (" + itemin.ToList().Count + ")", item.CUSTOMER_SEX.ToString()));
                }
                else
                {
                    ckhbGioitinh.Items.Add(new ListItem(name + " (0)", item.CUSTOMER_SEX.ToString()));
                }
            }
        }
        private void LoadHonnhan()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            int newsId = Utils.CIntDef(Session["newsId"]);
            var list = (from a in db.VL_CUSTOMER_ESHOP_NEWs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        where b.CUSTOMER_ID == customerId && b.NEWS_ID == newsId
                        && b.NEWS_SHOWTYPE == 1
                        select new { a.ESHOP_CUSTOMER.CUSTOMER_HONNHAN }).ToList();

            var listHonnhan = list.Distinct().ToList();

            foreach (var item in listHonnhan)
            {
                string name = "N/A";
                if (item.CUSTOMER_HONNHAN == 1)
                    name = "Độc thân";
                else if (item.CUSTOMER_HONNHAN == 2)
                    name = "Đã có gia đình";
                var itemin = list.Where(n => n.CUSTOMER_HONNHAN == item.CUSTOMER_HONNHAN);
                if (itemin != null)
                {
                    ckhbTinhtrangHonnhan.Items.Add(new ListItem(name + " (" + itemin.ToList().Count + ")", item.CUSTOMER_HONNHAN.ToString()));
                }
                else
                {
                    ckhbTinhtrangHonnhan.Items.Add(new ListItem(name + " (0)", item.CUSTOMER_HONNHAN.ToString()));
                }
            }
        }
        private void LoadKinhnghiem()
        {
            int customerId = Utils.CIntDef(Session["userId"]);
            int newsId = Utils.CIntDef(Session["newsId"]);
            var list = (from a in db.VL_CUSTOMER_ESHOP_NEWs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        join c in db.VL_KINHNGHIEMs on b.VL_KINHNGHIEM_ID equals c.ID
                        where b.CUSTOMER_ID == customerId && b.NEWS_ID == newsId
                        && b.NEWS_SHOWTYPE == 1
                        select new { c.ID, c.NAME }).ToList();

            var listKinhnghiem = list.Distinct().ToList();

            foreach (var item in listKinhnghiem)
            {
                var itemin = list.Where(n => n.ID == item.ID);
                if (itemin != null)
                {
                    ckhbKinhnghiem.Items.Add(new ListItem(item.NAME + " (" + itemin.ToList().Count + ")", item.ID.ToString()));
                }
                else
                {
                    ckhbKinhnghiem.Items.Add(new ListItem(item.NAME + " (0)", item.ID.ToString()));
                }
            }
        }
        public string getTinhthaihoso(object ott)
        {//1 NTV lưu, 2 NTV ứng tuyển, , 3 NTV đã xem, 4 NTD đã xem, 5 NTD đã lưu
            //6 NTD phỏng vấn, 7 NTD Ho so trung tuyen, 8 NTD Ho so chua dat
            int tt = Utils.CIntDef(ott);
            switch (tt)
            {
                case 5:
                    return "Hồ sơ đã lưu";
                case 2:
                    return "Hồ sơ tự ứng tuyển";
                case 6:
                    return "Hồ sơ phỏng vấn";
                case 7:
                    return "Hồ sơ trúng tuyển";
                case 8:
                    return "Hồ sơ chưa đạt";
                default:
                    return "N/A";
            }
        }
        public string GetLink(object newsId)
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
        public string GetCusSexNTV(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                int sexid = Utils.CIntDef( item.ToList()[0].CUSTOMER_SEX);
                return sexid == 1 ? "Nam" : (sexid == 2 ? "Nữ" : "Khác");
            }
            return "";
        }
        public string GetCusTuoiNTV(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                int tuoi = DateTime.Now.Year - Utils.CDateDef(item.ToList()[0].CUSTOMER_BIRTHDAY, DateTime.Now).Year;
                return tuoi != 0 ? Utils.CStrDef(tuoi) : "N/A";
            }
            return "";
        }
        public string GetCusEmailNTV(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].CUSTOMER_EMAIL;
            }
            return "";
        }
        public string GetCusPhoneNTV(object oid)
        {
            int id = Utils.CIntDef(oid);
            var item = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_ID == id);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].CUSTOMER_PHONE1;
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
                var itemArea = db.VL_AREAs.Where(n => n.ARE_ID == item.AREA_ID);
                if (itemArea != null && itemArea.ToList().Count > 0)
                {
                    if (i == 0)
                    {
                        s += itemArea.ToList()[0].ARE_NAME;
                    }
                    else
                    {
                        s += "<br />" + itemArea.ToList()[0].ARE_NAME;
                    }
                    i++;
                }

            }
            return s;
        }
        public string getMucluongByNewsId(object ott)
        {
            int id = Utils.CIntDef(ott);
            var news = db.ESHOP_NEWs.Where(n => n.NEWS_ID == id);
            if (news != null && news.ToList().Count > 0)
            {
                var item = db.VL_MUCLUONGs.Where(n => n.ID == news.ToList()[0].VL_MUCLUONG_ID);
                if (item != null && item.ToList().Count > 0)
                {
                    return item.ToList()[0].NAME;
                }
            }
            return "";
        }
        public string getNgayluu(object newsId, object customerId)
        {
            int _newsId = Utils.CIntDef(newsId);
            int _customerId = Utils.CIntDef(customerId);
            var item = db.VL_CUSTOMER_ESHOP_NEWs.Where(n => n.CUSTOMER_ID == _customerId && n.NEWS_ID == _newsId);
            if (item != null && item.ToList().Count > 0)
            {
                return string.Format("{0:dd/MM/yyyy}", item.ToList()[0].PUBLISHDATE);
            }
            return "";
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
        
        public string getTenHoso(object ott)
        {
            int tt = Utils.CIntDef(ott);
            var item = db.ESHOP_NEWs.Where(n => n.NEWS_ID == tt);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NEWS_TITLE;
            }
            return "";
        }
        public string getKinhnghiemByNewsId(object ott)
        {
            int tt = Utils.CIntDef(ott);
            var news = db.ESHOP_NEWs.Where(n => n.NEWS_ID == tt);
            if (news != null && news.ToList().Count > 0)
            {
                var item = db.VL_KINHNGHIEMs.Where(n => n.ID == news.ToList()[0].VL_KINHNGHIEM_ID);
                if (item != null && item.ToList().Count > 0)
                {
                    return item.ToList()[0].NAME;
                }
            }
            return "";
        }
        public string getTrinhdohocvan(object ott)
        {
            int tt = Utils.CIntDef(ott);
            var item = db.VL_TRINHDOHOCVANs.Where(n => n.ID == tt);
            if (item != null && item.ToList().Count > 0)
            {
                return item.ToList()[0].NAME;
            }
            return "";
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
        #region Grid Events
        #region properties

        public SortDirection sortProperty
        {
            get
            {
                if (ViewState["SortingState"] == null)
                {
                    ViewState["SortingState"] = SortDirection.Ascending;
                }
                return (SortDirection)ViewState["SortingState"];
            }
            set
            {
                ViewState["SortingState"] = value;
            }
        }

        #endregion
        protected void GridItemList_SortCommand(object source, DataGridSortCommandEventArgs e)
        {
            string sortingDirection = string.Empty;
            if (sortProperty == SortDirection.Ascending)
            {
                sortProperty = SortDirection.Descending;
                sortingDirection = "Desc";
            }
            else
            {
                sortProperty = SortDirection.Ascending;
                sortingDirection = "Asc";
            }

            DataTable dataTable = Session["NewsList"] as DataTable;
            DataView sortedView = new DataView(dataTable);
            sortedView.Sort = e.SortExpression + " " + sortingDirection;
            GridItemList.DataSource = sortedView;
            GridItemList.DataBind();
        }

        protected void GridItemList_ItemCommand(object source, DataGridCommandEventArgs e)
        {

        }

        protected void GridItemList_ItemDataBound(object sender, DataGridItemEventArgs e)
        {

        }

        protected void GridItemList_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            GridItemList.CurrentPageIndex = e.NewPageIndex;
            GridItemList.DataSource = Session["NewsList"] as DataTable;
            GridItemList.DataBind();
        }
        #endregion
        protected void btnTimkiem_Click(object sender, EventArgs e)
        {
            int newsId = Utils.CIntDef(cblRdoOptionVitrituyendung.SelectedValue);
            Session["newsId"] = newsId;
            var list = (from a in db.ESHOP_NEWs
                        where a.NEWS_ID == newsId
                        && a.NEWS_SHOWTYPE == 1
                        select a).ToList();
            if (list != null && list.ToList().Count > 0)
            {
                var item = list.ToList()[0];
                lbVitrituyendung.Text = item.NEWS_TITLE;
                lbHannophoso.Text = Utils.CDateDef(item.NEWS_DEALINE, DateTime.MinValue).ToString("dd-MM-yyyy");
                lbYeucau.Text = getTrinhdohocvan(item.VL_TRINHDOHOCVAN_ID);
                lbSoluongtuyen.Text = Utils.CStrDef(item.SOLUONGTUYEN);
                lbDiadiemlamviec.Text = getnoilamviec(item.NEWS_ID);
            }
            ckhblLoaiTin.Items.Clear();
            ckhbMucluong.Items.Clear();
            ckhbBangcap.Items.Clear();
            ckhbTinhtrangHonnhan.Items.Clear();
            ckhbGioitinh.Items.Clear();
            ckhbKinhnghiem.Items.Clear();
            LoadLoaiTin();
            LoadMucluong();
            LoadTrinhdohocvan();
            LoadHonnhan();
            LoadGioitinh();
            LoadKinhnghiem();
            Load_hosoungvien(Utils.CIntDef(Session["userId"]), 0, 0, 0, 0, 0, 0, 1);
        }

        protected void btnHuytimkiem_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ntd-quan-ly-ho-so-ung-vien");
        }

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            ddlSort_2.SelectedValue = sortid.ToString();
            Load_hosoungvien(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblLoaiTin.SelectedValue), Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue), Utils.CIntDef(ckhbGioitinh.SelectedValue), Utils.CIntDef(ckhbTinhtrangHonnhan.SelectedValue), Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }

        protected void ddlSort_2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int sortid = Utils.CIntDef(ddlSort_2.SelectedItem.Value);
            ddlSort.SelectedValue = sortid.ToString();
            Load_hosoungvien(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblLoaiTin.SelectedValue), Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue), Utils.CIntDef(ckhbGioitinh.SelectedValue), Utils.CIntDef(ckhbTinhtrangHonnhan.SelectedValue), Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }
        protected void ckhblLoaiTin_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = string.Empty;

            string result = Request.Form["__EVENTTARGET"];

            string[] checkedBox = result.Split('$'); ;

            int index = int.Parse(checkedBox[checkedBox.Length - 1]);

            //if (ckhblLoaiHoso.Items[index].Selected)
            //{
            //    value = ckhblLoaiHoso.Items[index].Value;
            //}
            //else
            //{

            //}
            for (int i = 0; i < ckhblLoaiTin.Items.Count; i++)
            {
                if (i != index)
                {
                    ckhblLoaiTin.Items[i].Selected = false;
                }
            }
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            Load_hosoungvien(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblLoaiTin.SelectedValue), Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue), Utils.CIntDef(ckhbGioitinh.SelectedValue), Utils.CIntDef(ckhbTinhtrangHonnhan.SelectedValue), Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }

        protected void ckhbMucluong_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = string.Empty;

            string result = Request.Form["__EVENTTARGET"];

            string[] checkedBox = result.Split('$'); ;

            int index = int.Parse(checkedBox[checkedBox.Length - 1]);

            //if (ckhblLoaiHoso.Items[index].Selected)
            //{
            //    value = ckhblLoaiHoso.Items[index].Value;
            //}
            //else
            //{

            //}
            for (int i = 0; i < ckhbMucluong.Items.Count; i++)
            {
                if (i != index)
                {
                    ckhbMucluong.Items[i].Selected = false;
                }
            }
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            Load_hosoungvien(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblLoaiTin.SelectedValue), Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue), Utils.CIntDef(ckhbGioitinh.SelectedValue), Utils.CIntDef(ckhbTinhtrangHonnhan.SelectedValue), Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }

        protected void ckhbBangcap_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = string.Empty;

            string result = Request.Form["__EVENTTARGET"];

            string[] checkedBox = result.Split('$'); ;

            int index = int.Parse(checkedBox[checkedBox.Length - 1]);

            //if (ckhblLoaiHoso.Items[index].Selected)
            //{
            //    value = ckhblLoaiHoso.Items[index].Value;
            //}
            //else
            //{

            //}
            for (int i = 0; i < ckhbBangcap.Items.Count; i++)
            {
                if (i != index)
                {
                    ckhbBangcap.Items[i].Selected = false;
                }
            }
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            Load_hosoungvien(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblLoaiTin.SelectedValue), Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue), Utils.CIntDef(ckhbGioitinh.SelectedValue), Utils.CIntDef(ckhbTinhtrangHonnhan.SelectedValue), Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }

        protected void ckhbGioitinh_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = string.Empty;

            string result = Request.Form["__EVENTTARGET"];

            string[] checkedBox = result.Split('$'); ;

            int index = int.Parse(checkedBox[checkedBox.Length - 1]);

            //if (ckhblLoaiHoso.Items[index].Selected)
            //{
            //    value = ckhblLoaiHoso.Items[index].Value;
            //}
            //else
            //{

            //}
            for (int i = 0; i < ckhbGioitinh.Items.Count; i++)
            {
                if (i != index)
                {
                    ckhbGioitinh.Items[i].Selected = false;
                }
            }
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            Load_hosoungvien(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblLoaiTin.SelectedValue), Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue), Utils.CIntDef(ckhbGioitinh.SelectedValue), Utils.CIntDef(ckhbTinhtrangHonnhan.SelectedValue), Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }

        protected void ckhbTinhtrangHonnhan_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = string.Empty;

            string result = Request.Form["__EVENTTARGET"];

            string[] checkedBox = result.Split('$'); ;

            int index = int.Parse(checkedBox[checkedBox.Length - 1]);

            //if (ckhblLoaiHoso.Items[index].Selected)
            //{
            //    value = ckhblLoaiHoso.Items[index].Value;
            //}
            //else
            //{

            //}
            for (int i = 0; i < ckhbTinhtrangHonnhan.Items.Count; i++)
            {
                if (i != index)
                {
                    ckhbTinhtrangHonnhan.Items[i].Selected = false;
                }
            }
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            Load_hosoungvien(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblLoaiTin.SelectedValue), Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue), Utils.CIntDef(ckhbGioitinh.SelectedValue), Utils.CIntDef(ckhbTinhtrangHonnhan.SelectedValue), Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }

        protected void ckhbKinhnghiem_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = string.Empty;

            string result = Request.Form["__EVENTTARGET"];

            string[] checkedBox = result.Split('$'); ;

            int index = int.Parse(checkedBox[checkedBox.Length - 1]);

            //if (ckhblLoaiHoso.Items[index].Selected)
            //{
            //    value = ckhblLoaiHoso.Items[index].Value;
            //}
            //else
            //{

            //}
            for (int i = 0; i < ckhbKinhnghiem.Items.Count; i++)
            {
                if (i != index)
                {
                    ckhbKinhnghiem.Items[i].Selected = false;
                }
            }
            int sortid = Utils.CIntDef(ddlSort.SelectedItem.Value);
            Load_hosoungvien(Utils.CIntDef(Session["userId"]), Utils.CIntDef(ckhblLoaiTin.SelectedValue), Utils.CIntDef(ckhbMucluong.SelectedValue), Utils.CIntDef(ckhbBangcap.SelectedValue), Utils.CIntDef(ckhbGioitinh.SelectedValue), Utils.CIntDef(ckhbTinhtrangHonnhan.SelectedValue), Utils.CIntDef(ckhbKinhnghiem.SelectedValue), sortid);
        }
    }
}