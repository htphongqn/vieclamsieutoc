<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTV.Master" AutoEventWireup="true" CodeBehind="vieclamdaluuNTV.aspx.cs" Inherits="CatTrang.vi_vn.vieclamdaluuNTV" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>
<%@ Register src="~/UIs/BannerTopNTV.ascx" tagname="BannerTopNTV" tagprefix="uc2" %>

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
    <% if (Session["user"] != null && Session["user_fullname"] != null && Session["user_quyen"] != null && Convert.ToInt32(Session["user_quyen"]) == 1)
       { %>
    <div class="page" id="recruitment"> 
    <!--Main-->
    <div id="main"> 
      <uc2:BannerTopNTV ID="BannerTopNTV1" runat="server" />
      <div class="block"> 
        <!--NavBar-->
        <div class="navBar">
          <div class="navBarLeft">
            <h2><span class="navBarTxt">Việc làm đã lưu</h2>
          </div>
          <%--<div class="navBarRight"><a href="" class="effective_rec_link"><img src="../Images/arrow_l_bg_rec.png" alt="" style="margin-right: 3px" />Tìm việc hiệu quả</a></div>--%>
          <div class="clear"></div>
        </div>
        <p class="number_jobs">Bạn đã lưu <asp:Literal ID="lbCount" runat="server" Text="0"></asp:Literal> tin tuyển dụng</p>
        <p class="number_jobs" style="width: 600px">Tìm kiếm việc làm trong danh sách đã lưu theo tiêu chí:</p>
        <span style="float: right; margin-top: -32px">
        <asp:Button CssClass="btn_green01" ToolTip="Bấm đây để hủy tìm kiếm!" 
              ID="btnCancel_filter" runat="server" Text="Hủy tìm kiếm" 
              name="cancel_filter" onclick="btnCancel_filter_Click" 
               />
        </span> 
        <!--Resumes Table-->
        <div class="resumes_table" id="posted_jobs">
          <div class="resumes_row">
            <div class="resumes_th" style="width: 200px">Ngành nghề:</div>
            <div class="resumes_th" style="width: 160px">Mức lương:</div>
            <div class="resumes_th" style="width: 160px">Cấp bậc:</div>
            <div class="resumes_th" style="width: 160px">Địa điểm:</div>
            <div class="resumes_th" style="width: 160px">Bằng cấp:</div>
            <div class="resumes_th" style="width: 160px">Kinh nghiệm:</div>
          </div>
          <div class="resumes_row">
            <div class="resumes_td" style="background: #F3F3F3">
              <asp:CheckBoxList ID="ckhblNganhnghe" runat="server" DataTextField="CAT_NAME" 
                    DataValueField="CAT_ID" AutoPostBack="True" 
                    onselectedindexchanged="ckhblNganhnghe_SelectedIndexChanged">
              </asp:CheckBoxList>
              </div>
            <div class="resumes_td" style="background: #F3F3F3">
              <asp:CheckBoxList ID="ckhbMucluong" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ckhbMucluong_SelectedIndexChanged">
              </asp:CheckBoxList>
            </div>
            <div class="resumes_td" style="background: #F3F3F3">
              <asp:CheckBoxList ID="ckhbCapbac" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ckhbCapbac_SelectedIndexChanged">
              </asp:CheckBoxList>
            </div>
            <div class="resumes_td" style="background: #F3F3F3">
                <asp:CheckBoxList ID="ckhbDiadiem" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ckhbDiadiem_SelectedIndexChanged">
                </asp:CheckBoxList>
            </div>
            <div class="resumes_td" style="background: #F3F3F3">
                <asp:CheckBoxList ID="ckhbBangcap" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ckhbBangcap_SelectedIndexChanged">
                </asp:CheckBoxList>
            </div>
            <div class="resumes_td" style="background: #F3F3F3">
                <asp:CheckBoxList ID="ckhbKinhnghiem" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ckhbKinhnghiem_SelectedIndexChanged">
                </asp:CheckBoxList>
            </div>
          </div>                    
        </div>
        <!--Actions-->
        <div class="btn_actions">  
            <asp:LinkButton ID="lnkXoatin" runat="server" CssClass="remove_profile" OnClientClick="return confirm('Bạn chắc chắn xóa tin đã chọn không?')" 
                ToolTip="Xoá việc làm đã lưu" Text="Xóa tin" onclick="lnkXoatin_Click"></asp:LinkButton>
            <asp:LinkButton ID="lnkUngtuyentin" runat="server" CssClass="post_profile" 
                OnClientClick="return confirm('Bạn chắc chắn ứng tuyển tin đã chọn không?')"  
                ToolTip="Ứng tuyển vào các vị trí tuyển dụng đã chọn" Text="Ứng tuyển" 
                onclick="lnkUngtuyentin_Click" Visible="false"></asp:LinkButton>
          <div align="right" class="sort_by"><b>Sắp xếp theo: </b>
            <asp:DropDownList ID="ddlSort" runat="server" style="width:200px;" 
                  name="select_sap_xep_top" class="dropBox" AutoPostBack="True" onselectedindexchanged="ddlSort_SelectedIndexChanged">
                <%--<asp:ListItem Value="1" Text="Thời gian lưu tin giảm dần"></asp:ListItem>
                <asp:ListItem Value="2" Text="Thời gian lưu tin tăng dần"></asp:ListItem>--%>
                <asp:ListItem Value="5" Text="Thời gian đăng giảm dần"></asp:ListItem>
                <asp:ListItem Value="6" Text="Thời gian đăng tăng dần"></asp:ListItem>
                <asp:ListItem Value="7" Text="Hạn nộp hồ sơ giảm dần"></asp:ListItem>
                <asp:ListItem Value="8" Text="Hạn nộp hồ sơ tăng dần"></asp:ListItem>
                <asp:ListItem Value="9" Text="Số lượt xem giảm dần"></asp:ListItem>
                <asp:ListItem Value="10" Text="Số lượt xem tăng dần"></asp:ListItem>
            </asp:DropDownList>
          </div>
        </div>        
        <asp:DataGrid ID="GridItemList" CellPadding="0" runat="server" AutoGenerateColumns="False"
            Width="100%" DataKeyField="NEWS_ID" CssClass="tdGridTable" SelectedIndex="0"
            PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" AllowPaging="false"
            PageSize="20" PagerStyle-CssClass="PageClass" AllowSorting="false" OnItemCommand="GridItemList_ItemCommand"
            OnItemDataBound="GridItemList_ItemDataBound" OnSortCommand="GridItemList_SortCommand"
            GridLines="None" OnPageIndexChanged="GridItemList_PageIndexChanged">
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
                <asp:TemplateColumn HeaderText="Tên việc làm" HeaderStyle-Width="91%"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_TITLE">
                    <ItemTemplate>
                        <div class="resumes_td align_l">
                            <div style="position: relative">
                                <a href="<%# GetLinkNTV(Eval("NEWS_ID")) %>" class="job_name"><%# GetShortName(Eval("NEWS_TITLE"), 25)%></a> 
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
                                      <div style="padding-left:15px;padding-top:5px;text-align: left"><%# GetShortName(Eval("MOTACONGVIEC"), 300)%></div></td>
                                  </tr>
                                </table>
                                </div>
                            </div>
                            <span class="tencty"><%# getTenCongty(Eval("CUSTOMER_ID"))%></span><br />
                            <span class="luotxem"><em>(<%# Eval("NEWS_COUNT")%>&nbsp;lượt xem) </em></span>
                        </div>
                    </ItemTemplate>
                    <HeaderStyle CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Tên công ty" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="CUSTOMER_ID">
                    <ItemTemplate>
                            <%# getTenCongty(Eval("CUSTOMER_ID"))%>
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
                <asp:TemplateColumn HeaderText="Ngày đăng" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_PUBLISHDATE">
                    <ItemTemplate>
                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "NEWS_PUBLISHDATE")).ToString("dd/MM/yyyy")%>
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
                <asp:TemplateColumn HeaderText="Số lần xem" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_COUNT">
                    <ItemTemplate>
                            <%# Eval("NEWS_COUNT")%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn> 
                <asp:TemplateColumn HeaderText="Ngày lưu" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_ID">
                    <ItemTemplate>
                        <%# getNgayluu(DataBinder.Eval(Container.DataItem, "NEWS_ID"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>              
                <asp:TemplateColumn HeaderText="Thao tác">
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <a title="Click để xem thông tin chi tiết việc làm" target="_blank" href="<%# GetLinkNTV(Eval("NEWS_ID")) %>">Xem</a> | 
                        <asp:LinkButton ID="lnkXoa" runat="server" OnClientClick="return confirm('Bạn chắc chắn xóa không?')" CommandName="delete" CommandArgument='<%# Eval("NEWS_ID")%>' OnClick="lnkXoa_Click" ToolTip="Xoá việc làm đã lưu" Text="Xóa"></asp:LinkButton><br />
                        <%--<asp:LinkButton ID="lnkUngtuyen" runat="server" OnClientClick="return confirm('Bạn chắc chắn ứng tuyển không?')" CommandArgument='<%# Eval("NEWS_ID")%>' OnClick="lnkUngtuyen_Click" ToolTip="Ứng tuyển vào vị trí này" Text="Ứng tuyển"></asp:LinkButton>--%>
                        <a href="<%# GetLinkNopHSNTV(Eval("NEWS_SEO_URL")) %>" target="_blank">Ứng tuyển</a>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
            <PagerStyle Mode="NumericPages" HorizontalAlign="Right"></PagerStyle>
        </asp:DataGrid>        
        <div class="check_status">
        <a class="checkAll" title="Chọn tất cả các hồ sơ trong trang" onclick="javascript: CheckAll();">Chọn tất cả</a> 
        <a class="unCheck" title="Bỏ chọn tất cả các hồ sơ trong trang" onclick="javascript: ClearAll();">Bỏ chọn tất cả</a></div>
        <!--Actions-->
        <div class="btn_actions"> 
         <asp:LinkButton ID="lnkXoatin_2" runat="server" CssClass="remove_profile" OnClientClick="return confirm('Bạn chắc chắn xóa tin đã chọn không?')" ToolTip="Xoá việc làm đã lưu" Text="Xóa tin" onclick="lnkXoatin_Click"></asp:LinkButton>
            <asp:LinkButton ID="lnkUngtuyen_2" runat="server" CssClass="post_profile" OnClientClick="return confirm('Bạn chắc chắn ứng tuyển tin đã chọn không?')" onclick="lnkUngtuyentin_Click" ToolTip="Ứng tuyển vào các vị trí tuyển dụng đã chọn" Text="Ứng tuyển" Visible="false"></asp:LinkButton>
          <div align="right" class="sort_by"><b>Sắp xếp theo: </b>
            <asp:DropDownList ID="ddlSort_2" runat="server" style="width:200px;" 
                  name="select_sap_xep_top" class="dropBox" AutoPostBack="True" onselectedindexchanged="ddlSort_2_SelectedIndexChanged">
                <%--<asp:ListItem Value="1" Text="Thời gian lưu tin giảm dần"></asp:ListItem>
                <asp:ListItem Value="2" Text="Thời gian lưu tin tăng dần"></asp:ListItem>--%>
                <asp:ListItem Value="5" Text="Thời gian đăng giảm dần"></asp:ListItem>
                <asp:ListItem Value="6" Text="Thời gian đăng tăng dần"></asp:ListItem>
                <asp:ListItem Value="7" Text="Hạn nộp hồ sơ giảm dần"></asp:ListItem>
                <asp:ListItem Value="8" Text="Hạn nộp hồ sơ tăng dần"></asp:ListItem>
                <asp:ListItem Value="9" Text="Số lượt xem giảm dần"></asp:ListItem>
                <asp:ListItem Value="10" Text="Số lượt xem tăng dần"></asp:ListItem>
            </asp:DropDownList>
          </div>
        </div>
      </div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
  <% }
  else { %>
  <div class="page" id="recruitment">
    <div id="main"> 
        <div style="-moz-border-radius:8px; border:1px solid #CCCCCC;padding:30px 0;text-align:center;margin: 0px 0 30px 0">Bạn chưa đăng nhập tài khoản người tìm việc!<br>Hãy đăng nhập để thực hiện thao tác này hoặc nhấn vào <a href="/" style="color:#2D91D4">đây</a> để về trang chủ.</div>
     </div>
  </div>
  <% } %>
</asp:Content>
