<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTD.Master" AutoEventWireup="true" CodeBehind="ungvientieubieuNTD.aspx.cs" Inherits="CatTrang.vi_vn.ungvientieubieuNTD" %>
<%@ Register src="~/UIs/sidebar_NTD.ascx" tagname="sidebar_NTD" tagprefix="uc2" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<%@ Register src="~/UIs/MessageBox.ascx" tagname="MessageBox" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="../Scripts/jquery.tools.min.js"></script>
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
      <div style="float: left; width: 670px" id="content_1">
        <div class="block"> 
          <!--NavBar-->
          <div class="navBar">
            <div class="navBarLeft">
              <h2><span class="navBarTxt">Hồ sơ ứng viên tiêu biểu</span></h2>
            </div>
            <div class="navBarRight">
                <div class="navigation_news">
                  <asp:Literal ID="litTopPager_Tieubieu" runat="server"></asp:Literal>
                </div>
            </div>
            <div class="clear"></div>
          </div>
          <asp:DataGrid ID="GridItemList_Tieubieu" CellPadding="0" runat="server" AutoGenerateColumns="False"
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
                <asp:TemplateColumn HeaderText="Tên ứng viên" HeaderStyle-Width="91%"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_TITLE">
                    <ItemTemplate>
                            <div class="resumes_td align_l">
                            <div style="position: relative">
                            <a href="<%# GetLinkNTD(Eval("NEWS_ID"))%>" class="job_name"><%# GetCusNameNTV(Eval("CUSTOMER_ID"))%></a> 
                              <!-- tooltip element -->
                              <div class="tooltip_ct">
                                <table width="420" cellpadding="5" cellspacing="1" border="0" bgcolor="#d7d7d7">
                                  <tr>
                                    <td class="td_tootip blue" colspan="2"><%# GetShortName(Eval("NEWS_TITLE"), 25)%></td>
                                  </tr>
                                  <tr>
                                    <td class="td_tootip" colspan="2"><b><span class="red" style="font-size: 12px">Kinh nghiệm:</span></b>
                                      <div style="padding-left:15px;padding-top:5px;text-align: left">
                                       <%# GetShortName(Eval("QUATRINHLAMVIEC"), 300)%>
                                        </div></td>
                                  </tr>
                                </table>
                              </div>
                            </div>
                            <span class="thongtinngan_ungvien"><em>Giới tính: <%# GetCusSexNTV(Eval("CUSTOMER_ID"))%> - Tuổi: <%# GetCusTuoiNTV(Eval("CUSTOMER_ID"))%> </em></span> 
                            </div>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>                
                <asp:TemplateColumn HeaderText="Tiêu đề hồ sơ" HeaderStyle-Width="1%"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                    <ItemTemplate>
                        <div class="resumes_td align_l">
                            <div style="position: relative">
                            <a href="<%# GetLinkNTD(Eval("NEWS_ID"))%>" class="job_name"><%# GetShortName(Eval("NEWS_TITLE"), 25)%></a> 
                              <!-- tooltip element -->
                              <div class="tooltip_ct">
                                <table width="420" cellpadding="5" cellspacing="1" border="0" bgcolor="#d7d7d7">
                                  <tr>
                                    <td class="td_tootip blue" colspan="2"><%# GetShortName(Eval("NEWS_TITLE"), 25)%></td>
                                  </tr>
                                  <tr>
                                    <td class="td_tootip" colspan="2"><b><span class="red" style="font-size: 12px">Kinh nghiệm:</span></b>
                                      <div style="padding-left:15px;padding-top:5px;text-align: left">
                                       <%# GetShortName(Eval("QUATRINHLAMVIEC"), 225)%>
                                        </div></td>
                                  </tr>
                                </table>
                              </div>
                            </div>
                            <span class="thongtinngan_ungvien"><em>Giới tính: <%# GetCusSexNTV(Eval("CUSTOMER_ID"))%> - Tuổi: <%# GetCusTuoiNTV(Eval("CUSTOMER_ID"))%> </em></span> 
                            </div>
                        <span class="ten_cty_ungvien"><%# GetShortName(Eval("QUATRINHLAMVIEC"), 105)%></span>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                    </HeaderStyle>
                    <ItemStyle CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Kinh nghiệm" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="VL_KINHNGHIEM_ID">
                    <ItemTemplate>
                        <%# getKinhnghiem(Eval("VL_KINHNGHIEM_ID"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
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
                <asp:TemplateColumn HeaderText="Nơi làm việc" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                    <ItemTemplate>
                        <%# getnoilamviec(Eval("NEWS_ID"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                    </HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateColumn>       
                <asp:TemplateColumn HeaderText="Ngày làm mới" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                    <ItemTemplate>
                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "NEWS_UPDATEFRERESH")).ToString("dd/MM/yyyy")%>
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
                <asp:LinkButton ID="lnkLuutin" runat="server" CssClass="luuTin_ntd" onclick="lnkLuutin_Click" 
                  >Lưu hồ sơ</asp:LinkButton>
			    <a class="toCao_ntd" title="" style="display:none">Tố cáo</a>
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
        <!--List Latest Jobs-->

<div class="block">
  <div class="title_rec_home"><b>Hồ sơ ứng viên mới nhất</b>
    <div class="select_rec"> Chọn tỉnh:
      <asp:DropDownList id="ddlDiadiemUVMoi" runat="server" DataTextField="Name" 
            DataValueField="Id" AppendDataBoundItems="true" CssClass="type-option" 
            AutoPostBack="True" 
            onselectedindexchanged="ddlDiadiemUVMoi_SelectedIndexChanged">
            <asp:ListItem Value="0" Text="Tất cả địa điểm"></asp:ListItem>                        
        </asp:DropDownList>
    </div>
  </div>
   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ddlDiadiemUVMoi" />
        <asp:AsyncPostBackTrigger ControlID="CollectionPager1" />
    </Triggers>
    <ContentTemplate>
  <div class="block_rec">
    <div id="list_latest_jobs" class="carousel module">
      <ul>
        <asp:Repeater ID="rptUngvien_MoiNhat" runat="server">
            <ItemTemplate>
                <li class="col_rec_item">
                    <div class="col_rec_item_ct">
                    <a href="<%# GetLinkNTD(Eval("NEWS_ID")) %>" class="position_job"><%# GetShortName(Eval("NEWS_TITLE"), 25)%></a>
                        <h4 class="recruiter_name"><%# GetCusNameNTV(Eval("CUSTOMER_ID"))%></h4>
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
      <uc2:sidebar_NTD ID="sidebar_NTD1" runat="server" />
      <div class="clearfix"></div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
  <uc3:MessageBox ID="MessageBox1" runat="server" />
</asp:Content>
