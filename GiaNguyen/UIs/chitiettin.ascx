<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="chitiettin.ascx.cs" Inherits="CatTrang.UIs.chitiettin" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<%@ Register src="~/UIs/sidebar_NTV.ascx" tagname="sidebar_NTV" tagprefix="uc2" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>
<%@ Register Src="Toolbar.ascx" TagName="Toolbar" TagPrefix="uc3" %>
<uc3:Toolbar ID="Toolbar1" runat="server" />

<div class="page" id="recruitment"> 
    <!--Main-->
    <div id="main">
      <%--<div style="float: left; width: 670px" id="content_1"> --%>
        <!--NavBar-->
        <div class="navBar navDetailNews">
          <div class="navBarLeft">
            <h2><span class="navBarTxt"> &raquo; <asp:Literal ID="lbTitleCat" runat ="server"></asp:Literal></span></h2>
          </div>
           
          <div class="clear"></div>
        </div>
        <div class="box">
          <div id="detail_news">
            <div id="info_g">
              <h1><asp:Literal ID="lbTitle" runat ="server"></asp:Literal></h1>
              <p class="date">Ngày <asp:Literal ID="lbDate" runat ="server"></asp:Literal></p>
              <p><asp:Literal ID="lbHtml" runat ="server"></asp:Literal></p>
            </div>
            <div class="function">
                <div class="addthis_toolbox addthis_default_style like_face">
                    <a class="addthis_button_preferred_1"></a><a class="addthis_button_preferred_2">
                    </a><a class="addthis_button_preferred_3"></a><a class="addthis_button_preferred_4">
                    </a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style">
                    </a>
                    <script type="text/javascript">
                        var addthis_config = { "data_track_addressbar": true };
                        addthis_config = addthis_config || {};
                        addthis_config.data_track_addressbar = false;
                    </script>
                    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-50d418ab2d45f0aa"></script>
                </div>
                <div class="toolbar">
                    <a id="hplSendEmail" href="#" class="email" runat="server">Gửi email</a> 
                    <a href="#" id="hplPrint" target="_blank" runat="server" class="print">Bản In</a> <a href="#"
                            id="hplFeedback" runat="server" class="opinion">Phản hồi</a></div>
            </div>
            <!--function--> 
            <!--Other News-->
            <div class="other_news_sub">
              <!--<div class="other_newsT">Tin bài khác</div>-->
              <ul>
                <asp:Repeater ID="rptNewsother" runat="server">
                    <ItemTemplate>
                        <li><a href="<%# GetLinkNTV(Eval("NEWS_ID")) %>">
                            <%# Eval("NEWS_TITLE") %>
                            <span class="date">(Ngày đăng <%# getDate(Eval("NEWS_PUBLISHDATE"))%>)</span> </a></li>
                    </ItemTemplate>
                </asp:Repeater>
              </ul>
               </div>
            <!--Other News--> 
           
          </div>
          <!--End box_ct--> 
        </div>
        <!--End box--> 
      <%--</div>--%>
      <%--<uc2:sidebar_NTV ID="sidebar_NTV1" runat="server" />--%>
      <div class="clearfix"></div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>