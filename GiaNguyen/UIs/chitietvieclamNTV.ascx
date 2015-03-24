<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="chitietvieclamNTV.ascx.cs" Inherits="CatTrang.UIs.chitietvieclamNTV" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<%@ Register src="~/UIs/sidebar_NTV.ascx" tagname="sidebar_NTV" tagprefix="uc2" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>

<div class="page" id="recruitment"> 
    <!--Main-->
    <div id="main">
      <div style="float: left; width: 670px" id="content_1"> 
        <!--NavBar-->
        <div class="navBar">
          <div class="navBarLeft">
            <h2><span class="navBarTxt"><asp:Literal ID="lbTitle" runat ="server"></asp:Literal></span></h2>
          </div>
          <div class="navBarRight red"><a href="#" title="" onclick=""><img src="../images/btnNopHS.gif" height="30" alt=""></a></div>
          <div class="clear"></div>
        </div>
        <p class="views_c">
        <span>Lượt xem: <asp:Literal ID="lbLuotxem" runat ="server"></asp:Literal></span> 
        <span>Mã: <asp:Literal ID="lbMaNTD" runat ="server"></asp:Literal></span> 
        <span>Ngày làm mới: <asp:Literal ID="lbNgaylammoi" runat ="server"></asp:Literal></span></p>
        <!-- Thông tin tuyển dụng-->
        <div class="detail_w">
          <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tbody>
              <tr class="tbInfo-header">
                <td colspan="4"><h3>Thông tin tuyển dụng</h3></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Vị trí tuyển dụng</b></td>
                <td class="br-L" colspan="3"><asp:Literal ID="lbVitrituyendung" runat ="server"></asp:Literal></td>
              </tr>
              <tr class="tbInfo-row">
                <td width="146"><b>Chức vụ</b></td>
                <td class="br-L" width="190"><asp:Literal ID="lbChucvu" runat ="server"></asp:Literal></td>
                <td width="130"><b>Số năm kinh nghiệm</b></td>
                <td class="br-L"><asp:Literal ID="lbKinhnghiem" runat ="server"></asp:Literal></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Ngành nghề</b></td>
                <td class="br-L"><asp:Literal ID="lbNganhnghe" runat ="server"></asp:Literal></td>
                <td><b>Yêu cầu bằng cấp</b></td>
                <td class="br-L"><asp:Literal ID="lbBangcap" runat ="server"></asp:Literal></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Hình thức làm việc</b></td>
                <td class="br-L"><asp:Literal ID="lbHinhthuclamviec" runat ="server"></asp:Literal></td>
                <td><b>Yêu cầu giới tính</b></td>
                <td class="br-L"><asp:Literal ID="lbGioitinh" runat ="server"></asp:Literal> </td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Địa điểm làm việc</b></td>
                <td class="br-L"><asp:Literal ID="lbDiadiemlamviec" runat ="server"></asp:Literal></td>
                <td><b>Yêu cầu độ tuổi</b></td>
                <td class="br-L"><asp:Literal ID="lbDotuoi" runat ="server"></asp:Literal></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Mức lương</b></td>
                <td class="br-L"><asp:Literal ID="lbMucluong" runat ="server"></asp:Literal></td>
                <td><b>Số lượng cần tuyển</b></td>
                <td class="br-L"><asp:Literal ID="lbSoluongtuyen" runat ="server"></asp:Literal></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Mô tả công việc</b></td>
                <td class="br-L" colspan="3"><asp:Literal ID="lbMotacongviec" runat ="server"></asp:Literal></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Quyền lợi được hưởng</b></td>
                <td class="br-L" colspan="3"><asp:Literal ID="lbQuyenloi" runat ="server"></asp:Literal></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Yêu cầu khác</b></td>
                <td class="br-L" colspan="3"><asp:Literal ID="lbYeucaukhac" runat ="server"></asp:Literal></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Hồ sơ bao gồm</b></td>
                <td class="br-L" colspan="3">
                <asp:Literal ID="lbHosogom" runat ="server"></asp:Literal>
                </td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Hạn nộp Hồ sơ</b></td>
                <td class="br-L" colspan="3"><b class="redTxt"><asp:Literal ID="lbHannop" runat ="server"></asp:Literal></b></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Hình thức nộp hồ sơ</b></td>
                <td class="br-L"><asp:Literal ID="lbHinhthucnophoso" runat ="server"></asp:Literal></td>
                <td colspan="2" align="right"><a href="#" title="" onclick=""><img src="../images/btnNopHS.gif" width="251" height="40" alt=""></a></td>
              </tr>
              <tr class="tbInfo-header">
                <td colspan="4">Thông tin liên hệ</td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Người liên hệ</b></td>
                <td class="br-L" colspan="3"><asp:Literal ID="lbNguoilienhe" runat ="server"></asp:Literal></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Địa chỉ liên hệ</b></td>
                <td class="br-L" colspan="3"><asp:Literal ID="lbDiachilienhe" runat ="server"></asp:Literal></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Email liên hệ</b></td>
                <td class="br-L" colspan="3"><asp:Literal ID="lbEmaillienhe" runat ="server"></asp:Literal></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Điện thoại liên hệ</b></td>
                <td class="br-L" colspan="3"><asp:Literal ID="lbDienthoailienhe" runat ="server"></asp:Literal></td>
              </tr>
              <tr>
                <td colspan="4"><div class="marTB10">
                    <div class="fLeft"> <a href="javascript:gui_mail_ban_be();" title="" class="guiBanBe">Gửi bạn bè</a> <a href="javascript: print_preview('/ajax/ntv_chi_tiet_viec_lam/index/1698185/1/','width=700,height=1000,scrollbars=yes');" title="" class="inTin">In tin này</a> <a href="javascript:ntv_to_cao();" title="" class="toCao">Tố cáo</a> </div>
                    <div class="fRight"><a href="javascript:ntv_luu_tin();" title="" class="luuTin" style="margin-right:0">Lưu tin</a></div>
                    <div class="clear"></div>
                  </div></td>
              </tr>
              <tr>
                <td colspan="4"><div class="marB10">
                    <div class="fLeft"><span class="canhBao">Người tìm việc cảnh giác khi có bất kỳ yêu cầu thu phí từ phía nhà tuyển dụng</span></div>
                    <div class="fRight padT5"><a href="http://vieclam.24h.com.vn/listscam" title="" class="xemChiTiet">Xem thêm</a></div>
                    <div class="clear"></div>
                  </div></td>
              </tr>
              <tr class="tbInfo-header">
                <td colspan="4"><h3>Thông tin nhà tuyển dụng</h3></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Tên công ty</b></td>
                <td class="br-L" colspan="3"><asp:Literal ID="lbTencongty" runat ="server"></asp:Literal></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Địa chỉ</b></td>
                <td class="br-L" colspan="3"><asp:Literal ID="lbDiachicongty" runat ="server"></asp:Literal></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Website</b></td>
                <td class="br-L" colspan="3"><asp:Literal ID="lbWebsite" runat ="server"></asp:Literal></td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Điện thoại</b></td>
                <td class="br-L" colspan="3"><asp:Literal ID="lbDienthoaicongty" runat ="server"></asp:Literal></td>
              </tr>
              <tr class="tbInfo-row">
                <td valign="top"><b>Giới thiệu</b>
                  <p><img src="http://hcm.vieclam.24h.com.vn/images/default_logo.jpg" width="120" height="60" alt=""></p>
                  <p><img src="http://hcm.vieclam.24h.com.vn/images/xac-thuc.gif" width="120" height="120" alt=""></p></td>
                <td class="br-L" colspan="3">
                <asp:Literal ID="lbGioithieucongty" runat ="server"></asp:Literal>
                </td>
              </tr>
              <tr class="tbInfo-row">
                <td><b>Quy mô công ty</b></td>
                <td class="br-L" colspan="3"><asp:Literal ID="lbQuymoconty" runat ="server"></asp:Literal></td>
              </tr>
            </tbody>
          </table>
          <div class="aRight marTB10"><a class="xemChiTiet" title="" href="/danh-sach-cac-tin-tuyen-dung--ntd2693190p1.html">Xem đầy đủ thông tin về công ty này</a></div>
        </div>
        <!-- End Thông tin tuyển dụng--> 
        <!--share-->
        <div class="share-left"> 
        <span style="display:inline-block; vertical-align:50%;"> <b>Gửi và chia sẻ thông tin việc làm <u>Nhân Viên Kinh Doanh</u> qua:</b> </span> 
            <span style="display:inline-block;"> 
            <div id="fb-root"></div>
            <script>                (function (d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) return;
                    js = d.createElement(s); js.id = id;
                    js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&appId=1578997885661619&version=v2.0";
                    fjs.parentNode.insertBefore(js, fjs);
                } (document, 'script', 'facebook-jssdk'));</script>
                <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button_count" data-action="like" data-show-faces="true" data-share="true"></div>
            </span> 
          </div>
        <!--share--> 
        <!--List jobs-->
        <div class="block">
          <div class="title_rec_home"><b>Việc làm cùng nhà Tuyển dụng</b></div>
          <div class="block_rec bl_white">
            <ul id="list_most_viewed_jobs">
              <asp:Repeater ID="rptViecLam_Other" runat="server">
                    <ItemTemplate>
                        <li class="col_rec_item width50">
                            <div class="col_rec_item_ct"><a href="<%# GetLinkNTV(Eval("NEWS_ID")) %>" class="position_job"><%# Eval("NEWS_TITLE")%></a>
                                <h4 class="recruiter_name"><%# getTenCongty(Eval("CUSTOMER_ID"))%></h4>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <%--<div><a href="" class="view_more_rec">&raquo; Xem danh sách chi tiết</a></div>--%>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--End List jobs--> 
        
        <!--List jobs-->
        <div class="block">
          <div class="title_rec_home"><b>Việc làm HOT</b></div>
          <div class="block_rec bl_white">
            <ul id="list_most_viewed_jobs">
              <asp:Repeater ID="rptViecLam_Hot" runat="server">
                    <ItemTemplate>
                        <li class="col_rec_item width50">
                            <div class="col_rec_item_ct"><a href="<%# GetLinkNTV(Eval("NEWS_ID")) %>" class="position_job"><%# Eval("NEWS_TITLE")%></a>
                                <h4 class="recruiter_name"><%# getTenCongty(Eval("CUSTOMER_ID"))%></h4>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div><a href="" class="view_more_rec">&raquo; Xem danh sách chi tiết</a></div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--End List jobs--> 
        
      </div>
      <uc2:sidebar_NTV ID="sidebar_NTV1" runat="server" />
      <div class="clearfix"></div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>