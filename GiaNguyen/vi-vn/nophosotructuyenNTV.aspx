<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTV.Master" AutoEventWireup="true" CodeBehind="nophosotructuyenNTV.aspx.cs" Inherits="CatTrang.vi_vn.nophosotructuyenNTV" %>
<%@ Register src="~/UIs/sidebar_NTV.ascx" tagname="sidebar_NTV" tagprefix="uc2" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="page" id="recruitment"> 
    <!--Main-->
    <div id="main">
      <div style="float: left; width: 670px" id="content_1"> 
        <!--NavBar-->
        <div class="navBar navDetailNews">
          <div class="navBarLeft">
            <h2><span class="navBarTxt"> &raquo; Nộp hồ sơ trực tuyến</span></h2>
          </div>
           
          <div class="clear"></div>
        </div>
        <div class="box">
        <div class="boxTitle2">NỘP ĐƠN TRỰC TUYẾN CHO NHÀ TUYỂN DỤNG</div>
        <div class="lineHeight10"><i><u style="color:red;font-weight:bold;">*** Chú ý:</u></i> Bạn vui lòng kiểm tra lại hồ sơ cá nhân và cập nhật thông tin mới nhất trước khi gửi hồ sơ ứng tuyển cho Nhà tuyển dụng  bằng cách <b><a href="/ntv-ho-so-da-dang" title="">BẤM VÀO ĐÂY</a></b></div>
        
       <h2 style="margin:10px 0;"> <b class="red text17">THƯ GIỚI THIỆU</b></h2>
        <p style="margin-bottom:15px;"><span>Để tạo ấn tượng cho nhà tuyển dụng, hãy tự giới thiệu bản thân với nhà tuyển dụng. Bạn nên sử dụng thư giới thiệu gửi kèm theo hồ sơ ứng tuyển.</span></p>
        
<table width="100%" cellpadding="0" cellspacing="0" border="1">
  <tbody>
    <tr>
      <%--<td class="tbInfo-header" width="60" align="center"><input type="checkbox" id="checkbox_ut_all" title="Chọn/Bỏ chọn tất cả" checked="" onClick=" "></td>--%>
      <td class="tbInfo-header">Vị trí tuyển dụng</td>
      <td class="tbInfo-header">Công ty ứng tuyển</td>
      <td class="tbInfo-header" width="120">Người liên hệ</td>
    </tr>
    <tr>
      <%--<td valign="center" style="padding: 5px 10px 5px 10px;line-height: 23px;" align="center"><input type="checkbox" name="checkbox_ut[]" id="checkbox_ut[0]" checked="" value="1633812"></td>--%>
      <td valign="top" class="tbUser-row" style="padding: 5px 10px 5px 10px;line-height: 23px;"><asp:Literal ID="lbVitrituyendung" runat="server"></asp:Literal></td>
      <td valign="top" class="tbUser-row" style="padding: 5px 10px 5px 10px;line-height: 23px;"><asp:Literal ID="lbCongtyungtuyen" runat="server"></asp:Literal></td>
      <td valign="top" class="tbUser-row" style="padding: 5px 10px 5px 10px;line-height: 23px;"><asp:Literal ID="lbNguoilienhe" runat="server"></asp:Literal></td>
    </tr>
  </tbody>
</table>


<div class="block nopHS_ungtuyen">
          <h3 class="blocktitle main-title">Thông tin ứng tuyển</h3>
          <div class="block_rec bl_white">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Họ tên người ứng tuyển:	<span class="red">*</span></b></div>
              <div class="tbUser_col col_r">
                <asp:Literal ID="lbHotenungtuyen" runat="server"></asp:Literal>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Tiêu đề:	<span class="red">*</span></b></div>
              <div class="tbUser_col col_r">
                <input type="text" title="Nhập tiêu đề" style="width:310px" id="txtTieude" runat="server" name=" " class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập tiêu đề"
                            ControlToValidate="txtTieude" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
              </div>
            </div>
            
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Nội dung thư:	<span class="red">*</span></b></div>
              <div class="tbUser_col col_r">
                  <textarea id="txtNoidung" runat="server"  style="width:310px; border:solid 1px #C6DBE0;"></textarea>
                <p style="color:red;font-size:10px"><i>(tối đa 2000 ký tự)</i></p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập Nội dung thư"
                            ControlToValidate="txtNoidung" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
              </div>
              
            </div>
            
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Hồ sơ tìm việc:	<span class="red">*</span></b></div>
              <div class="tbUser_col col_r">
                <asp:DropDownList id="ddlHoso" runat="server" DataTextField="NEWS_TITLE" DataValueField="NEWS_ID" AppendDataBoundItems="true" CssClass="dropbox">    
                    <asp:ListItem Value="0" Text="-- Chọn hồ sơ --"></asp:ListItem>                    
                </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa chọn Hồ sơ tìm việc"
                            ControlToValidate="ddlHoso" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                <p style="font-size:11px"><i>(Bạn chỉ có thể chọn hồ sơ tìm việc đã được duyệt. Nếu bạn chưa có hồ sơ,vui lòng bấm vào <a href="/ntv-tao-ho-so-tim-viec" title="">đây</a> để tạo.)</i></p>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Mã bảo mật:</b> </div>
              <div class="tbUser_col col_r"> <asp:Image ID="Image1" runat="server" ImageUrl="~/vi-vn/CImage.aspx" height="35px" /> </div>
            </div>
             <div class="tbUser_row">
              <div class="tbUser_col"><b>Nhập mã bảo mật (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" id="txt_ma_xac_minh" runat="server" name="txt_ma_xac_minh" class="textbox">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Chưa nhập mã catpcha"
                            ControlToValidate="txt_ma_xac_minh" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
              </div>
            </div>
             <div class="tbUser_row padding1 btnNopHS">
              <asp:Button ID="btnNopdon" runat="server" Text="Nộp đơn" ValidationGroup="G40" CssClass="btn_green02" 
                        onclick="btnNopdon_Click" />
              &nbsp;&nbsp;
              <input type="button" title=" " onclick="window.history.go(-1); return false;" value="Quay lại" class="btn_green02">                  
                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="G40" />

            </div>
            <div class="clearfix"> </div>
          </div>
        </div>

          <!--End box_ct--> 
        </div>
        <!--End box--> 
      </div>
      <uc2:sidebar_NTV ID="sidebar_NTV1" runat="server" />
      <div class="clearfix"></div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
