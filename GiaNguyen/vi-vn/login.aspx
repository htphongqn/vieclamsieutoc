<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Default.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CatTrang.vi_vn.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../vi-vn/Ajax/login.js" type="text/javascript"></script>
    <link rel="Stylesheet" href="../vi-vn/Styles/process_payment.css" type="text/css" />
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
    <div class="path"> <a href="/">Trang chủ</a> » <a href="login.html">Đăng nhập</a></div>
    <div class="account">
      <!--Login-->
      <div class="login_form form">
        <div class="form_header"> <span class="form_subtitle">Đăng nhập bằng tài khoản Tường Linh</span> </div>
        <div class="row">
          <label class="item_title" for="formEmail">Email</label>
          <input class="inputbox" placeholder="Vui lòng nhập email" type="text" name="formEmail" id="txtEmail" runat="server"/>
        </div>
        <div class="row">
          <label class="item_title" for="formPassword">Mật khẩu</label>
          <input class="inputbox" placeholder="Vui lòng nhập mật khẩu" type="password" name="formPassword" id="Txtpass" runat="server" />
        </div>
        <div class="row text"> <a href="javascript:void(0)" onclick="showquyenmk()" class="form_link">Bạn quên mật khẩu?</a> </div>
        <div class="row text"> 
            <asp:LinkButton id="bt_login" runat="server" OnClientClick="ajaxlogin();" class="btn_detail" href="javascript:void(0)"><b>Đăng nhập</b></asp:LinkButton>
            <a href="dang-ky.html" class="link_register">Bạn chưa có tài khoản?</a>
        </div>
        <div class="row text"> 
            <p class="text-error"><span id="loading-errors"></span></p>
            <p class="text-error"><span class="errors" style="color: #FF0000;"></span></p>
        </div>
      </div>
      <!--End Login-->
      <div class="cf"></div>
    </div>
  </div>
</asp:Content>
