<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTD.Master" AutoEventWireup="true" CodeBehind="lienhequangcao.aspx.cs" Inherits="CatTrang.vi_vn.lienhequangcao" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="page" id="recruitment">
    <div id="main"> 
      <div class="block">
        <div class="box">
          <div id="detail_news">
            <div id="info_g">
              <h1><asp:Literal ID="lbTitle" runat ="server"></asp:Literal></h1>
              <%--<p class="date"><asp:Literal ID="lbDate" runat ="server"></asp:Literal></p>--%>
              <p><asp:Literal ID="lbHtml" runat ="server"></asp:Literal></p>
            </div>
          </div>
      </div>        
    </div>
    </div>
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
