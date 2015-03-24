<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTD.Master" AutoEventWireup="true" CodeBehind="doimatkhauNTD.aspx.cs" Inherits="CatTrang.vi_vn.doimatkhauNTD" %>
<%@ Register src="~/UIs/sidebar_NTD.ascx" tagname="sidebar_NTV" tagprefix="uc2" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="page" id="recruitment"> 
    <!--Main-->
    <div id="main">
      <div style="float: left; width: 670px" id="content_1"> 
        <!--NavBar-->
        <%--<div class="navBar">
          <div class="navBarLeft">
            <h2><span class="navBarTxt">Thông tin người tìm việc</span></h2>
          </div>
          <div class="navBarRight red" style="font-weight: 700">ĐT hỗ trợ: 1900 585 808 PHÍM 8</div>
          <div class="clear"></div>
        </div>--%>
        <p class="number_jobs">Vui lòng điền đầy đủ thông tin<br />
          Những mục có dấu <span class="red">*</span> là bắt buộc phải nhập </p>
        <!--Change Password-->
        <div class="block">
          <h3 class="blocktitle main-title">Đổi mật khẩu</h3>
          <div class="block_rec bl_white">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Nhập mật khẩu hiện tại: <span class="red">*</span></b></div>
              <div class="tbUser_col col_r">
                <input type="password" style="width:210px" id="txt_mat_khau_cu" runat="server" name="c_mat_khau_cu" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập mật khẩu hiện tại!"
                ControlToValidate="txt_mat_khau_cu" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Mật khẩu: <span class="red">*</span></b></div>
              <div class="tbUser_col col_r">
                <input type="password" style="width:210px" id="txt_mat_khau" runat="server" name="c_mat_khau" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập mật khẩu!"
                ControlToValidate="txt_mat_khau" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Xác nhận lại mật khẩu: <span class="red">*</span></b></div>
              <div class="tbUser_col col_r">
                <input type="password" style="width:210px" id="txt_mat_khau_2" runat="server" name="c_mat_khau_2" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập xác nhận mật khẩu!"
                ControlToValidate="txt_mat_khau_2" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                      ErrorMessage="Mật khẩu xác nhận không khớp!" ValidationGroup="G40" 
                      Display="None" ControlToCompare="txt_mat_khau" ControlToValidate="txt_mat_khau_2"></asp:CompareValidator>
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
                <asp:Button ID="btnDoimatkhau" runat="server" Text="Đổi mật khẩu" name="doi_mk" ValidationGroup="G40"
                      CssClass="btn_green02" OnClick="btnDoimatkhau_Click" />
                &nbsp;&nbsp;
                <a class="btn_green02" onclick="reset();" href="javascript:void(0)">Nhập lại</a> 
                <script type="text/javascript">
                    function reset() {
                        var mkcu = document.getElementById("<%= txt_mat_khau_cu.ClientID %>");
                        var mk = document.getElementById("<%= txt_mat_khau.ClientID %>");
                        var mk2 = document.getElementById("<%= txt_mat_khau_2.ClientID %>");
                        var xm = document.getElementById("<%= txt_ma_xac_minh.ClientID %>");
                        mkcu.value = mk.value = mk2.value = xm.value = "";
                    }
                </script>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="G40" />
              </div>
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
      </div>
      <uc2:sidebar_NTV ID="sidebar_NTV1" runat="server" />
      <div class="clearfix"></div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
