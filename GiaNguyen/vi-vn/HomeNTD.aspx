<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTD.Master" AutoEventWireup="true" CodeBehind="HomeNTD.aspx.cs" Inherits="CatTrang.vi_vn.HomeNTD" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>
<%@ Register src="~/UIs/sidebar_NTD.ascx" tagname="sidebar_NTD" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="page" id="recruitment">
        <div id="main">            
            <div style="float: left; width: 670px" id="content_1"> 
        <!--List HOT jobs-->
        <div class="block">
          <div class="hot_rec_title"><b>Hồ sơ ứng viên tiêu biểu</b> 
          <%--<a href="" class="effective_rec_link"><img src="../Images/arrow_l_bg_rec.png" alt="" style="margin-right: 3px" />Tìm việc hiệu quả</a>--%>
          </div>
          <div class="block_rec">
            <ul id="list_hot_jobs">
              <asp:Repeater ID="rptHoso_Tieubieu" runat="server">
                    <ItemTemplate>
                        <li class="col_rec_item">
                            <div class="col_rec_item_ct"><a href="<%# GetLinkNTD(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" class="position_job"><%# Eval("NEWS_TITLE")%></a>
                                <h4 class="recruiter_name"><%# getCusName(Eval("CUSTOMER_ID"))%></h4>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div><a href="/ung-vien-tieu-bieu" class="view_more_rec">&raquo; Xem danh sách chi tiết</a></div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--Ads-->
        <div class="ads_rec"> 
        <asp:Repeater ID="rptBannerGiua1" runat="server">
                <ItemTemplate>
                  <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("AD_ITEM_DESC"))%>
                </ItemTemplate>
              </asp:Repeater>
        </div>
        <!--List Most Viewed jobs-->
        <div class="block">
          <div class="title_rec_home"><b>Hồ sơ ứng viên được nhiều người xem</b></div>
          <div class="block_rec">
            <ul id="list_most_viewed_jobs">
              <asp:Repeater ID="rptHoso_XemNhieu" runat="server">
                <ItemTemplate>
                    <li class="col_rec_item">
                        <div class="col_rec_item_ct"><a href="<%# GetLinkNTD(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" class="position_job"><%# Eval("NEWS_TITLE")%></a>
                            <h4 class="recruiter_name"><%# getCusName(Eval("CUSTOMER_ID"))%></h4>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
            <div><a href="/ung-vien-nhieu-nguoi-xem" class="view_more_rec">&raquo; Xem danh sách chi tiết</a></div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--Ads-->
        <div class="ads_rec"> 
        <asp:Repeater ID="rptBannerGiua2" runat="server">
                <ItemTemplate>
                  <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("AD_ITEM_DESC"))%>
                </ItemTemplate>
              </asp:Repeater>
        </div>
        
        <!--List Career--> 
        
        <script type="text/javascript">
            $(document).ready(function () {
                $(".tab_content").hide();
                $(".tab_content:first").show();

                $("ul.tabs_sort_cr li").click(function () {
                    $("ul.tabs_sort_cr li").removeClass("active");
                    $(this).addClass("active");
                    $(".tab_content").hide();
                    var activeTab = $(this).attr("rel");
                    $("#" + activeTab).fadeIn();
                });
            }); 
	    </script>
        <div class="box">
          <div class="box_ct">
            <div class="tbl titleSort"> <span class="listJobTitle"> Danh sách ngành nghề</span>
              <div class="fRight"><span class="txtSort">Sắp xếp theo: </span>
                <ul class="tabs_sort_cr tbl_row">
                  <li class="active" rel="tab1">ABC</li>
                  <li  rel="tab2">Nhóm ngành</li>
                  <li rel="tab3">Ngành hot</li>
                </ul>
              </div>
            </div>
            <div class="tab_container sort_cr block">
              <div id="tab1" class="tab_content ">
                <div class="innerTabContent block_rec">
                  <p class="sort_status">Bạn đang xem danh sách ngành nghề sắp xếp theo: <b>ABC</b></p>
                  <ul id="list_career">
                    <asp:Repeater ID="rptNganhngheABC" runat="server">
                        <ItemTemplate>
                          <li class="col_rec_item">
                              <div class="col_rec_item_ct">
                              <a class="career_name" href="<%#GetLinkCat(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                              <%#Eval("cat_name")%></a> 
                              <span class="number_jobs">(<%# getCount(Eval("cat_id"))%>)</span>
                              </div>
                          </li>
                        </ItemTemplate>
                      </asp:Repeater>
                  </ul>
                </div>
                <!--innerTabContent--> 
              </div>
              <!-- #tab1 -->
              <div id="tab2" class="tab_content block_rec">
                <div class="innerTabContent">
                  <p class="sort_status">Bạn đang xem danh sách ngành nghề sắp xếp theo: <b>Nhóm ngành</b></p>
                    <asp:Repeater ID="rptNganhngheGroup" runat="server">
                        <ItemTemplate>
                          <!--colGroup-->
                          <div class="colGroup">
                            <ul id="list_career">
                              <b><%#Eval("cat_name")%></b>                              
                              <asp:Repeater ID="rptNganhngheGroup2" runat="server" DataSource='<%# Load_NganhngheGroup2(Eval("Cat_ID")) %>'>
                                <ItemTemplate>                                  
                                  <li class="col_rec_item">
                                    <div class="col_rec_item_ct">
                                    <a class="career_name" href="<%#GetLinkCat(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                                    <%#Eval("cat_name")%></a> 
                                    <span class="number_jobs">(<%# getCount(Eval("cat_id"))%>)</span></div>
                                  </li>
                                </ItemTemplate>
                              </asp:Repeater>
                            </ul>
                          </div>
                          <!--colGroup--> 
                        </ItemTemplate>
                      </asp:Repeater>                                    
                </div>
                <!--innerTabContent--> 
              </div>
              <!-- #tab2 -->
              <div id="tab3" class="tab_content block_rec">
                <div class="innerTabContent block_rec">
                  <p class="sort_status">Bạn đang xem danh sách ngành nghề sắp xếp theo: <b>Ngành Hot</b></p>
                  <ul id="list_career">
                    <asp:Repeater ID="rptNganhngheHot" runat="server">
                        <ItemTemplate>
                          <li class="col_rec_item">
                              <div class="col_rec_item_ct">
                              <a class="career_name" href="<%#GetLinkCat(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                              <%#Eval("cat_name")%></a>
                              <span class="number_jobs">(<%# getCount(Eval("cat_id"))%>)</span>
                              </div>
                          </li>
                        </ItemTemplate>
                      </asp:Repeater>
                  </ul>
                </div>
                <!--innerTabContent-->                 
              </div>
              <!-- #tab2 --> 
            </div>
            <!-- /tab_container --> 
            
          </div>
          <!--end box ct--> 
        </div>
        <!--end  BOX --> 
        <!--Ads-->
        <div class="ads_rec"> 
            <asp:Repeater ID="rptBannerGiua3" runat="server">
                <ItemTemplate>
                  <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("AD_ITEM_DESC"))%>
                </ItemTemplate>
              </asp:Repeater>
        </div>
        <!--List Latest Jobs-->
        <div class="block">
          <div class="title_rec_home"><b>Hồ sơ ứng viên mới nhất</b>
            <div class="select_rec"> Chọn tỉnh:
              <asp:DropDownList id="ddlDiadiemVLMoi" runat="server" DataTextField="Name" 
                DataValueField="Id" AppendDataBoundItems="true" CssClass="type-option" 
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
                        <asp:Repeater ID="rptHoso_MoiNhat" runat="server">
                            <ItemTemplate>
                                <li class="col_rec_item">
                                    <div class="col_rec_item_ct"><a href="<%# GetLinkNTD(Eval("NEWS_ID")) %>" class="position_job"><%# Eval("NEWS_TITLE")%></a>
                                        <h4 class="recruiter_name"><%# getCusName(Eval("CUSTOMER_ID"))%></h4>
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                    </div>
                    <div class="clearfix"> </div>
                    <div class="pageList"> 
                        <cc1:CollectionPager ID="CollectionPager5" runat="server" ShowPageNumbers="True"
                        LabelText="" PageSize="1" NextText="" LastText="Sau" BackText="" FirstText="Trước"
                        ResultsFormat="" ShowLabel="False" BackNextLocation="None" HideOnSinglePage="True"
                        MaxPages="1000" PageNumbersDisplay="Numbers" PageNumberStyle="" ResultsLocation="Top"
                        ShowFirstLast="True" UseSlider="True" BackNextLinkSeparator="" PagingMode="PostBack"
                        ControlCssClass="colored-border:white;colorChooser:white" BackNextDisplay="HyperLinks"
                        PageNumbersSeparator="&amp;nbsp;" PageNumbersStyle="" PageNumberImage="/vi-vn/Images/hover.png"
                        PageNumberImageActive="/vi-vn/Images/active.png" ResultsStyle="FONT-WEIGHT: bold;"
                        UsePageImage="False" SliderSize="20">
                        </cc1:CollectionPager>
                    </div>
                </div>
                  </ContentTemplate>
            </asp:UpdatePanel>
        </div>   
        </div>       
            <uc2:sidebar_NTD ID="sidebar_NTD1" runat="server" />
            <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>    
             <uc1:boxPhone ID="boxPhone1" runat="server" />
            </div>
</asp:Content>
