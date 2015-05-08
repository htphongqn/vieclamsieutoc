<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTD.Master" AutoEventWireup="true" CodeBehind="phanhoitunguoitimviecNTD.aspx.cs" Inherits="CatTrang.vi_vn.phanhoitunguoitimviecNTD" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>
<%@ Register src="~/UIs/BannerTopNTD.ascx" tagname="BannerTopNTD" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
<div class="page" id="recruitment"> 
    <!--Main-->
    <div id="main"> 
      <uc2:BannerTopNTD ID="BannerTopNTD1" runat="server" />
            <div class="block"> 
        <!--NavBar-->
        <div class="navBar">
          <div class="navBarLeft">
            <h2><span class="navBarTxt">Xem phản hồi - đánh giá của Người tìm việc</span></h2>
          </div>
          <%--<div class="navBarRight"><a href="" class="effective_rec_link"><img src="../Images/arrow_l_bg_rec.png" alt="" style="margin-right: 3px" />Tuyển dụng hiệu quả</a></div>--%>
          <div class="clear"></div>
        </div>
      </div>
      <!--Feedback From Jobseeker-->
      <div class="block">
        <div class="title_rec_home"><b>Xem phản hồi - đánh giá của Người tìm việc</b></div>
        <div class="block_rec padding1">
          <ul id="feedback">            
            <asp:Repeater ID="rptcomment" runat="server">
            <ItemTemplate>
                    <li>
                        <img src="<%#GetCusLogo(Eval("CUSTOMER_NTV_ID")) %>" alt="" width="62" height="62" class="img" /> 
                        <b><%# GetCusNameNTV(Eval("CUSTOMER_NTV_ID"))%></b> 
                        - <span class="ft_11">Gửi ngày <%# Convert.ToDateTime(Eval("DATE_CREATE")).ToString("dd-MM-yyyy")%></span>
                        <div class="line_border" style="margin: 3px 0 3px 70px"></div>
                        <%# GetShortName(Eval("DESCRIPTION"), 300)%>
                    </li>
            </ItemTemplate>
          </asp:Repeater>
          </ul>
          <div class="clearfix"> </div>
        </div>
      </div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>    
</asp:Content>
