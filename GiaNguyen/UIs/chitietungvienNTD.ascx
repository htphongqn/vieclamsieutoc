<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="chitietungvienNTD.ascx.cs" Inherits="CatTrang.UIs.chitietungvienNTD" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<%@ Register src="~/UIs/sidebar_NTD.ascx" tagname="sidebar_NTD" tagprefix="uc2" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>
<%@ Register src="~/UIs/MessageBox.ascx" tagname="MessageBox" tagprefix="uc3" %>
<script type="text/javascript">
    var gAutoPrint = true;
    function processPrint(printpage) {

        if (document.getElementById != null) {
            var html = '<HTML>\n<HEAD>\n';
            if (document.getElementsByTagName != null) {
                var headTags = document.getElementsByTagName("head");
                if (headTags.length > 0) html += headTags[0].innerHTML;
            }

            html += '\n</HE' + 'AD>\n<BODY>\n';
            var printReadyElem = document.getElementById(printpage);

            if (printReadyElem != null) html += printReadyElem.innerHTML;
            else {
                alert("Error, no contents.");
                return;
            }

            html += '\n</BO' + 'DY>\n</HT' + 'ML>';
            var printWin = window.open("", "processPrint");
            printWin.document.open();
            printWin.document.write(html);
            printWin.document.close();

            if (gAutoPrint) printWin.print();
        } else alert("Browser not supported.");

    }
</script>

<div class="page" id="recruitment"> 
    <!--Main-->
    <div id="main">
      <div style="float: left; width: 670px" id="content_1"> 
        <!--thong tin ung vien-->
        <div id="divPrint">
        <table style="width:670px;margin:15px auto 15px auto" cellpadding="0" cellspacing="0" border="0">
          <tbody>
            <tr>
              <td class="tbInfo-header_ntd br-L_ntd br-R_ntd" colspan="2"><h2>Chi tiết hồ sơ ứng viên</h2></td>
            </tr>
            <tr>
              <td align="left" height="40">Ngày làm mới: <b><asp:Literal ID="lbNgaylammoi" runat ="server"></asp:Literal></b></td>
              <td align="right">
              <%--Mã: <b><asp:Literal ID="lbMaNTD" runat ="server"></asp:Literal></b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%> 
              Số lượt xem: <b><asp:Literal ID="lbLuotxem" runat ="server"></asp:Literal></b>
              </td>
            </tr>
            <tr>
              <td class="tbInfo-header_ntd br-L_ntd br-R_ntd" colspan="2"><h2>Thông tin cá nhân</h2></td>
            </tr>
            <tr>
              <td width="140" class="tbUser-row_ntd br-L_ntd" valign="top" style="padding-top:20px">
              <asp:Image ID="imgLogo" runat="server" CssClass="userImg" Width="130" Height="160" ImageUrl="../Images/noimage.jpg"/>
              </td>
              <td width="100%" valign="top" class="padTop10_ntd br-R_ntd"><table width="100%" cellpadding="0" cellspacing="0" border="0">
                  <tbody>
                    <tr>
                      <td width="125" valign="top" class="tbUser-info_ntd" align="right"><b>Họ và tên:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbHoTen" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Ngày sinh:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbNgaysinh" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Giới tính:</b></td>
                      <td class="tbUser-info"><asp:Literal ID="lbGioitinh" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Tình trạng hôn nhân:</b></td>
                      <td class="tbUser-info"><asp:Literal ID="lbTinhtranghonnhan" runat ="server"></asp:Literal></td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
            <tr>
              <td class="tbInfo-header_ntd br-L_ntd br-R_ntd" colspan="2"><h2>Trình độ học vấn</h2></td>
            </tr>
            <tr>
              <td valign="top" class="padTop10_ntd br-L_ntd br-R_ntd" colspan="2">
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                  <tbody>
                    <tr>
                      <td width="180" valign="top" class="tbUser-info_ntd" align="right"><b>Trình độ học vấn:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbBangcap" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Ngành học:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbNganhhoc" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Tốt nghiệp năm:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbTotnghiepnam" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Tốt nghiệp tại trường:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbTotnghieptaitruong" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Ngoại ngữ:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbNgoaingu" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Trình độ tin học:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbTrinhdotinhoc" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Các bằng cấp/ chứng chỉ khác:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbBangcapkhac" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td colspan="2" height="10"></td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
            <tr>
              <td class="tbInfo-header_ntd br-L_ntd br-R_ntd" colspan="2"><h2>Kinh nghiệm làm việc</h2></td>
            </tr>
            <tr>
              <td valign="top" class="padTop10_ntd br-L_ntd br-R_ntd" colspan="2">
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                  <tbody>
                    <tr>
                      <td width="180" valign="top" class="tbUser-info_ntd" align="right"><b>Số năm kinh nghiệm:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbSonamkinhnghiem" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Kinh nghiệm:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbKinhnghiem" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Các kỹ năng:</b></td>
                      <td class="tbUser-info_ntd">
                        <asp:Literal ID="lbCackynang" runat ="server"></asp:Literal>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" height="10"></td>
                    </tr>
                  </tbody>
                </table>
                </td>
            </tr>
            <tr>
              <td class="tbInfo-header_ntd br-L_ntd br-R_ntd" colspan="2"><h2>Công việc mong muốn</h2></td>
            </tr>
            <tr>
              <td valign="top" class="padTop10_ntd br-L_ntd br-R_ntd" colspan="2">
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                  <tbody>
                    <tr>
                      <td width="180" valign="top" class="tbUser-info_ntd" align="right"><b>Vị trí mong muốn:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbVitrimongmuon" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Cấp bậc mong muốn:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbCapbacmongmuon" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Ngành nghề:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbNgangnghe" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Hình thức làm việc:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbHinhthuclamviec" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Địa điểm làm việc:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbDiadiemlamviec" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Mức lương mong muốn:</b></td>
                      <td class="tbUser-info_ntd"><asp:Literal ID="lbMucluongmongmuon" runat ="server"></asp:Literal></td>
                    </tr>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" align="right"><b>Mục tiêu nghề nghiệp:</b></td>
                      <td class="tbUser-info_ntd">
                      <asp:Literal ID="lbMuctieunghenghiep" runat ="server"></asp:Literal>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" height="10"></td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
            <tr>
              <td class="tbInfo-header_ntd br-L_ntd br-R_ntd" colspan="2"><h2>Thông tin liên hệ</h2></td>
            </tr>
            <tr>
              <td valign="top" class="padTop10_ntd br-L_ntd br-R_ntd" colspan="2">
              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                  <tbody>
                    <tr>
                      <td valign="top" class="tbUser-info_ntd" colspan="2" align="left">
                      <p style="text-align: justify;">Nhằm chăm sóc tốt hơn tới từng Nhà tuyển dụng có nhu cầu tuyển dụng và nâng cao chất lượng ứng viên, Việc làm siêu tốc ngừng miễn phí tính năng xem hồ sơ người tìm việc.</p>
                        <p style="text-align: justify;"><font style="color: rgb(255, 0, 0);"><strong style="color:#f10000;">Để xem thông tin liên hệ của ứng viên này và XEM KHÔNG GIỚI HẠN HÀNG NGÀN</strong></font> hồ sơ ứng viên khác trên việc làm siêu tốc, Quý khách vui lòng liên hệ HOTLINE hoặc <a href="/ntd-dang-ky-tu-van" style="text-decoration: underline;">
                        <strong style="color:#3E03A7;">Đăng ký để được tư vấn</strong></a> trong <strong style="color:#f10000;">24h tới</strong>.</p></td>
                    </tr>
                    <tr>
                      <td colspan="2" height="10"></td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
            <tr>
              <td class="borderBot_ntd" colspan="2" height="1"></td>
            </tr>
            <tr>
              <td class="borderBot_ntd" colspan="2" height="1"></td>
            </tr>
          </tbody>
        </table>
        </div>
        <!--End thong tin ung vien--> 
        <!--share thong tin -->        
        <!--share thong tin --> 
        <!--luu ho so-->
        <div class="padLeft10_ntd marBot7_ntd padTop10_ntd"> 
        <asp:LinkButton ID="lnkLuutin" runat="server" CssClass="luuTin_ntd" onclick="lnkLuutin_Click" 
                  >Lưu hồ sơ</asp:LinkButton>
        <asp:LinkButton CssClass="inTin_ntd" ID="lbtnPrint" ToolTip="Print" 
                            runat="server" OnClientClick="return processPrint('divPrint');">In tin này</asp:LinkButton>
        </div>
        <!--luu ho so--> 
        <!--List Most Viewed jobs-->
        <div class="block">
          <div class="title_rec_home"><b>Hồ sơ ứng viên được nhiều người xem</b></div>
          <div class="block_rec">
            <ul id="list_most_viewed_jobs">
              <asp:Repeater ID="rptHoso_XemNhieu" runat="server">
                <ItemTemplate>
                    <li class="col_rec_item">
                        <div class="col_rec_item_ct"><a href="<%# GetLinkNTD(Eval("NEWS_ID")) %>" class="position_job"><%# Eval("NEWS_TITLE")%></a>
                            <h4 class="recruiter_name"><%# getCusName(Eval("CUSTOMER_ID"))%></h4>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
            <div><a href="/ung-vien-nhieu-nguoi-xem" class="view_more_rec">&raquo; Xem danh sách chi tiết</a></div>
            <div class="clearfix"> </div>
          </div>
        </div>        
        <!--List Most Viewed jobs-->
        <div class="block">
          <div class="title_rec_home"><b>Hồ sơ ứng viên tương tự</b></div>
          <div class="block_rec">
            <ul id="list_most_viewed_jobs">
              <asp:Repeater ID="rptHoso_Tuongtu" runat="server">
                <ItemTemplate>
                    <li class="col_rec_item">
                        <div class="col_rec_item_ct"><a href="<%# GetLinkNTD(Eval("NEWS_ID")) %>" class="position_job"><%# Eval("NEWS_TITLE")%></a>
                            <h4 class="recruiter_name"><%# getCusName(Eval("CUSTOMER_ID"))%></h4>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
            <div><a id="linkUngvientuongtu" runat="server" class="view_more_rec">&raquo; Xem danh sách chi tiết</a></div>
            <div class="clearfix"> </div>
          </div>
        </div>
      </div>
      <uc2:sidebar_NTD ID="sidebar_NTD1" runat="server" />
      <div class="clearfix"></div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
  <uc3:MessageBox ID="MessageBox1" runat="server" />