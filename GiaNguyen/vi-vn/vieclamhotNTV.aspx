<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTV.Master" AutoEventWireup="true" CodeBehind="vieclamhotNTV.aspx.cs" Inherits="CatTrang.vi_vn.vieclamhotNTV" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<%@ Register src="~/UIs/sidebar_NTV.ascx" tagname="sidebar_NTV" tagprefix="uc2" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript">
				<!--
    function ToggleAll(e, action) {
        if (e.checked) {
            CheckAll();
        }
        else {
            ClearAll();
        }
    }

    function CheckAll() {
        var ml = document.forms[0];
        var len = ml.elements.length;
        for (var i = 1; i < len; i++) {
            var e = ml.elements[i];

            if (e.name.toString().indexOf("chkSelect") > 0)
                e.checked = true;
        }
        ml.MainContent_GridItemList_toggleSelect.checked = true;
    }

    function ClearAll() {
        var ml = document.forms[0];
        var len = ml.elements.length;
        for (var i = 1; i < len; i++) {
            var e = ml.elements[i];
            if (e.name.toString().indexOf("chkSelect") > 0)
                e.checked = false;
        }
        ml.MainContent_GridItemList_toggleSelect.checked = false;
    }
				    
				// -->
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="page" id="recruitment"> 
    <!--Main-->
    <div id="main">
      <div style="float: left; width: 670px" id="content_1" class="listJobPg">
        <div class="block"> 
          <!--NavBar-->
          <div class="navBar">
            <div class="navBarLeft">
              <h2><span class="navBarTxt">Việc làm HOT</span></h2>
            </div>
            <div class="navBarRight"> <!-- page number-->
              <div class="navigation_news">
              <asp:Literal ID="litTopPager_Hot" runat="server"></asp:Literal>
              </div>
              <!--End page number--></div>
            <div class="clear"></div>
          </div>          
          <asp:DataGrid ID="GridItemList_Hot" CellPadding="0" runat="server" AutoGenerateColumns="False"
            Width="100%" DataKeyField="NEWS_ID" CssClass="tdGridTable" SelectedIndex="0"
            PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" AllowPaging="false"
            PageSize="20" PagerStyle-CssClass="PageClass" AllowSorting="false"            
            GridLines="None">
            <AlternatingItemStyle BackColor="#f3f3f3" />
            <Columns>                
                <asp:TemplateColumn HeaderStyle-Width="1%" ItemStyle-Wrap="False" HeaderStyle-CssClass="tdGridHeader"
                    ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                    <HeaderTemplate>
                        <input type="checkbox" id="toggleSelect" runat="server" onclick="javascript: ToggleAll(this,0);"
                            style="border-top-style: none; border-right-style: none; border-left-style: none;
                            border-bottom-style: none" name="toggleSign">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <input id="chkSelect" type="checkbox" name="chkSelect" runat="server" style="border-top-style: none;
                            border-right-style: none; border-left-style: none; border-bottom-style: none">
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Vị trí việc làm" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_TITLE">
                    <ItemTemplate>                            
                            <div class="resumes_td align_l">
                            <div style="position: relative">
                                <a href="<%# GetLinkNTV(Eval("NEWS_ID")) %>" class="job_name"><%# Eval("NEWS_TITLE")%></a> 
                                <!-- tooltip element -->
                                <div class="tooltip_ct">
                                <table width="420" cellpadding="5" cellspacing="1" border="0" bgcolor="#d7d7d7">
                                  <tr>
                                    <td class="td_tootip blue" colspan="2"><%# Eval("NEWS_TITLE")%></td>
                                  </tr>
                                  <tr>
                                    <td class="td_tootip blue" style="width:60px;">Công ty: </td>
                                    <td class="td_tootip blue"><%# getTenCongty(Eval("CUSTOMER_ID"))%></td>
                                  </tr>
                                  <tr>
                                    <td class="td_tootip blue" style="width:60px;">Số lượng: </td>
                                    <td class="td_tootip blue "><%# Eval("SOLUONGTUYEN")%> </td>
                                  </tr>
                                  <tr>
                                    <td class="td_tootip" colspan="2">
                                      <b><span class="red" style="font-size: 12px">Mô tả công việc:</span></b>
                                      <div style="padding-left:15px;padding-top:5px;text-align: left"><%# Eval("MOTACONGVIEC")%></div></td>
                                  </tr>
                                </table>
                                </div>
                            </div>
                            <span class="tencty"><%# getTenCongty(Eval("CUSTOMER_ID"))%></span><br />
                            <span class="luotxem"><em>(<%# Eval("NEWS_COUNT")%>&nbsp;lượt xem) </em></span>
                            </div>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>                
                <asp:TemplateColumn HeaderText="Nơi làm việc" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                    <ItemTemplate>
                        <%# getnoilamviec(DataBinder.Eval(Container.DataItem, "NEWS_ID"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                    </HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Mức lương" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                    <ItemTemplate>
                        <%# getMucluong(DataBinder.Eval(Container.DataItem, "VL_MUCLUONG_ID"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                    </HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Ngày làm mới" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_PUBLISHDATE">
                    <ItemTemplate>
                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "NEWS_UPDATEFRERESH")).ToString("dd/MM/yyyy")%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Hạn nộp hồ sơ" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                    <ItemTemplate>
                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "NEWS_DEALINE")).ToString("dd/MM/yyyy")%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                    </HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateColumn>        
            </Columns>
            <PagerStyle Mode="NumericPages" HorizontalAlign="Right"></PagerStyle>
          </asp:DataGrid>
          <div class="clearfix"></div>
          <!--chia se-->
          <div class=" marTB10 foolistjob">
            <div class="fLeft marTB10 marL10"> 
                <a href="javascript:gui_mail_ban_be();" title="" class="guiBanBe">Gửi bạn bè</a> 
                <a href="javascript: print_preview('/ajax/llbars=yes');" title="" class="inTin">In tin này</a> 
                <a href="javascript:ntv_to_cao();" title="" class="toCao">Tố cáo</a> 
            </div>
            <div class="fRight marTB10 "><!-- page number-->
              <div class="navigation_news">
                    <cc1:collectionpager ID="CollectionPager5" runat="server" ShowPageNumbers="True"
                        LabelText="" PageSize="1" NextText="" LastText="Sau" BackText="" FirstText="Trước"
                        ResultsFormat="" ShowLabel="False" BackNextLocation="None" HideOnSinglePage="True"
                        MaxPages="1000" PageNumbersDisplay="Numbers" PageNumberStyle="" ResultsLocation="Top"
                        ShowFirstLast="True" UseSlider="True" BackNextLinkSeparator="" PagingMode="PostBack"
                        ControlCssClass="colored-border:white;colorChooser:white" BackNextDisplay="HyperLinks"
                        PageNumbersSeparator="&amp;nbsp;" PageNumbersStyle="" PageNumberImage="/vi-vn/Images/hover.png"
                        PageNumberImageActive="/vi-vn/Images/active.png" ResultsStyle="FONT-WEIGHT: bold;"
                        UsePageImage="False" SliderSize="20">
                    </cc1:collectionpager>
              </div>
              <!--End page number--></div>
            <div class="clear"></div>
          </div>
          <!--chia se-->
          <div class="clearfix"></div>
        </div>
        <%--<div class="ads_rec"> <img src="../Images/ads_01.jpg" alt=""> </div>--%>
        <!--List jobs-->
        <div class="block">
          <div class="title_rec_home"><b>Việc làm được nhiều người xem</b></div>
          <div class="block_rec bl_white">
            <ul id="list_most_viewed_jobs">              
              <asp:Repeater ID="rptViecLam_XemNhieu" runat="server">
                    <ItemTemplate>
                        <li class="col_rec_item width50">
                            <div class="col_rec_item_ct">
                            <a class="position_job" href="<%# GetLinkNTV(Eval("NEWS_ID")) %>"><%# Eval("NEWS_TITLE")%></a>
                              <h4 class="recruiter_name"><%# getTenCongty(Eval("CUSTOMER_ID"))%></h4>
                            </div>
                          </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div><a href="/viec-lam-nhieu-nguoi-xem" class="view_more_rec">&raquo; Xem danh sách chi tiết</a></div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--End List jobs--> 
        <!--List Latest Jobs-->
<div class="block">
  <div class="title_rec_home"><b>Việc làm mới nhất</b>
    <div class="select_rec"> Chọn tỉnh:      
      <asp:DropDownList id="ddlDiadiemVLMoi" runat="server" DataTextField="Are_Name" 
            DataValueField="Are_Id" AppendDataBoundItems="true" CssClass="type-option" 
            AutoPostBack="True" 
            onselectedindexchanged="ddlDiadiemVLMoi_SelectedIndexChanged">
            <asp:ListItem Value="0" Text="Tất cả địa điểm"></asp:ListItem>                        
        </asp:DropDownList>
    </div>
  </div>
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ddlDiadiemVLMoi" />
    </Triggers>
    <ContentTemplate>
  <div class="block_rec bl_white">
    <div id="list_latest_jobs" class="carousel module">
      <ul>
        <asp:Repeater ID="rptViecLam_MoiNhat" runat="server">
            <ItemTemplate>
                <li class="col_rec_item">
                    <div class="col_rec_item_ct">
                    <a href="<%# GetLinkNTV(Eval("NEWS_ID")) %>" class="position_job"><%# Eval("NEWS_TITLE")%></a>
                        <h4 class="recruiter_name"><%# getTenCongty(Eval("CUSTOMER_ID"))%></h4>
                    </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>
      </ul>
    </div>
    <div class="clearfix"> </div>
    <div class="pageList"> 
    <cc1:collectionpager ID="CollectionPager1" runat="server" ShowPageNumbers="True"
        LabelText="" PageSize="1" NextText="" LastText="Sau" BackText="" FirstText="Trước"
        ResultsFormat="" ShowLabel="False" BackNextLocation="None" HideOnSinglePage="True"
        MaxPages="1000" PageNumbersDisplay="Numbers" PageNumberStyle="" ResultsLocation="Top"
        ShowFirstLast="True" UseSlider="True" BackNextLinkSeparator="" PagingMode="PostBack"
        ControlCssClass="colored-border:white;colorChooser:white" BackNextDisplay="HyperLinks"
        PageNumbersSeparator="&amp;nbsp;" PageNumbersStyle="" PageNumberImage="/vi-vn/Images/hover.png"
        PageNumberImageActive="/vi-vn/Images/active.png" ResultsStyle="FONT-WEIGHT: bold;"
        UsePageImage="False" SliderSize="20">
    </cc1:collectionpager>
    </div>
  </div>
  </ContentTemplate>
</asp:UpdatePanel>
</div>
<!--List Latest Jobs-->
        
      </div>
      <uc2:sidebar_NTV ID="sidebar_NTV1" runat="server" />
      <div class="clearfix"></div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
