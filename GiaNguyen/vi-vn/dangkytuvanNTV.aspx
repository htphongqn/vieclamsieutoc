<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTV.Master" AutoEventWireup="true" CodeBehind="dangkytuvanNTV.aspx.cs" Inherits="CatTrang.vi_vn.dangkytuvanNTV" %>
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
        <div class="navBar">
          <div class="navBarLeft">
            <h2><span class="navBarTxt">Người tìm việc đăng ký tư vấn</span></h2>
          </div>
          <div class="navBarRight red" style="font-weight: 700">ĐT hỗ trợ: 1900 585 808</div>
          <div class="clear"></div>
        </div>
        <h2>Mời bạn nhập thông tin để bộ phận Hỗ trợ Người tìm việc của Vieclamsieutoc liên hệ lại</h2>
        <p class="number_jobs">Vui lòng điền đầy đủ thông tin<br />
          Những mục có dấu <span class="red">*</span> là bắt buộc phải nhập </p>
        <!--Login Infomation-->
        <div class="block">
          <h3 class="blocktitle main-title">Thông tin đăng ký</h3>
          <div class="block_rec bl_white">
          <div class="tbUser_row">
              <div class="tbUser_col"><b>Họ và tên (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text"  id="txtHoten" runat="server" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập Họ và tên"
                            ControlToValidate="txtHoten" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Địa chỉ (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" id="txtDiachi" runat="server" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập Địa chỉ"
                            ControlToValidate="txtDiachi" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
              </div>
            </div>
             <div class="tbUser_row">
              <div class="tbUser_col"><b>Số điện thoại(<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" id="txtPhone" runat="server" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập Số điện thoại"
                            ControlToValidate="txtPhone" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Email: <span class="red">*</span></b></div>
              <div class="tbUser_col col_r">
                <input type="text" title="Nhập email đăng nhập vào đây" id="txtEmail" runat="server" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập e-mail"
                            ControlToValidate="txtEmail" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
              </div>
            </div>
             <div class="tbUser_row">
              <div class="tbUser_col"><b>Tư vấn tại(<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <asp:DropDownList id="ddlArea" runat="server" CssClass="dropbox">    
                    <asp:ListItem Value="1" Text="Miền Bắc"></asp:ListItem>    
                    <asp:ListItem Value="2" Text="Miền Nam"></asp:ListItem>                  
                </asp:DropDownList>
              </div>
            </div>
             
            <div class="clearfix"> </div>
            <div class="tbUser_row text-center marginT10">
              <asp:Button ID="btnDangly" runat="server" Text="Đăng ký ngay" ValidationGroup="G40" CssClass="btn_green02" 
                        onclick="btnDangly_Click" />
              &nbsp;&nbsp;
              <input type="button" title=" " onclick="window.history.go(-1); return false;" value="Quay lại" class="btn_green02">               
                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="G40" />
            </div>
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
