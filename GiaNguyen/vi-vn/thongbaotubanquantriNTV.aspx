<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTV.Master" AutoEventWireup="true" CodeBehind="thongbaotubanquantriNTV.aspx.cs" Inherits="CatTrang.vi_vn.thongbaotubanquantriNTV" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>
<%@ Register src="~/UIs/BannerTopNTV.ascx" tagname="BannerTopNTV" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
<div class="page" id="recruitment"> 
    <!--Main-->
    <div id="main"> 
      <uc2:BannerTopNTV ID="BannerTopNTV1" runat="server" />
      <div class="block"> 
        <!--NavBar-->
        <div class="navBar noborder">
          <div class="navBarLeft">
            <h2><span class="navBarTxt">Thông báo từ ban quản trị</span></h2>
          </div>
          <%--<div class="navBarRight"><a href="" class="effective_rec_link"><img src="../Images/arrow_l_bg_rec.png" alt="" style="margin-right: 3px" />Tìm việc hiệu quả</a></div>--%>
          <div class="clear"></div>
        </div>
        <!--Resumes Table-->
        <div class="resumes_table">
          <div class="resumes_row">
            <div class="resumes_th" style="width: 90px">Ngày gửi</div>
            <div class="resumes_th">Tiêu đề thông báo</div>
            <div class="resumes_th" style="width: 90px">Xem</div>
          </div>          
          <asp:Repeater ID="rptThongbao" runat="server">
            <ItemTemplate>
                    <div class="resumes_row">
                        <div class="resumes_td"><%# Convert.ToDateTime(Eval("NEWS_PUBLISHDATE")).ToString("dd/MM/yyyy")%></div>
                        <div class="resumes_td align_l">
                        <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"> <b><%# Eval("NEWS_TITLE")%></b> </a></div>
                        <div class="resumes_td">
                        <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" class="blue">Xem</a></div>
                    </div>
            </ItemTemplate>
          </asp:Repeater>
          
          
        </div>
      </div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
