<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTV.Master" AutoEventWireup="true" CodeBehind="hoantatdangkyNTV.aspx.cs" Inherits="CatTrang.vi_vn.hoantatdangkyNTV" %>
<%@ Register src="~/UIs/sidebar_NTV.ascx" tagname="sidebar_NTV" tagprefix="uc2" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="page" id="recruitment"> 
    <!--Main-->
    <div id="main">
      <div style="float: left; width: 670px" id="content_1"> 
        <!--Change Password-->
        <div class="block">
          <h3 class="blocktitle main-title"><asp:Literal ID="lbMessage" runat="server"></asp:Literal></h3>          
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
