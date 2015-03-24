<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTV.Master" AutoEventWireup="true" CodeBehind="quenmatkhau.aspx.cs" Inherits="CatTrang.vi_vn.quenmatkhau" %>
<%@ Register src="~/UIs/sidebar_NTV.ascx" tagname="sidebar_NTV" tagprefix="uc2" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="page" id="recruitment"> 
    <!--Main-->
    <div id="main">
      <div style="float: left;" id="content_1"> 
        <!--NavBar-->
        <%--<div class="navBar">
          <div class="navBarLeft">
            <h2><span class="navBarTxt">Thông tin người tìm việc</span></h2>
          </div>
          <div class="navBarRight red" style="font-weight: 700">ĐT hỗ trợ: 1900 585 808 PHÍM 8</div>
          <div class="clear"></div>
        </div>--%>
        <p class="number_jobs">Vui lòng điền đầy đủ thông tin.
          Những mục có dấu <span class="red">*</span> là bắt buộc phải nhập </p>
        <!--Change Password-->
        <div class="block">
          <h3 class="blocktitle main-title">Yêu cầu mail lấy lại mật khẩu</h3>
          <div class="block_rec bl_white" style="margin-left: 200px;">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Email đăng nhập: <span class="red">*</span></b></div>
              <div class="tbUser_col col_r">
                <input type="text" style="width:210px" id="txt_email_dang_nhap" runat="server" class="textbox" />
                <div>Bạn hãy nhập địa chỉ email đã dùng để đăng ký tài khoản trên website </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập email đăng nhập!"
                ControlToValidate="txt_email_dang_nhap" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Mã bảo mật:</b></div>
              <div class="tbUser_col col_r">
                <div id="div_ma_xac_minh">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/vi-vn/CImage.aspx" height="35px" />
                </div>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Nhập mã bảo mật: <span class="red">*</span></b></div>
              <div class="tbUser_col col_r">
                <input type="text" style="width:210px" id="txt_ma_xac_minh" runat="server" name="txt_ma_xac_minh" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập mã bảo mật!"
                ControlToValidate="txt_ma_xac_minh" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col">&nbsp;</div>
              <div class="tbUser_col col_r" style=" padding-top: 20px">
                <asp:Button ID="btnYeucaumail" runat="server" Text="Yêu cầu mail" ValidationGroup="G40"
                      CssClass="btn_green02" onclick="btnYeucaumail_Click" />                
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="G40" />
              </div>
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
      </div>
      
      <div class="clearfix"></div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
