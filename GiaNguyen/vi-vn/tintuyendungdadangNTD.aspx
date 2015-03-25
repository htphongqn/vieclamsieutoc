﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTD.Master" AutoEventWireup="true" CodeBehind="tintuyendungdadangNTD.aspx.cs" Inherits="CatTrang.vi_vn.tintuyendungdadangNTD" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>
<%@ Register src="~/UIs/BannerTopNTD.ascx" tagname="BannerTopNTD" tagprefix="uc2" %>

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
    <div id="main"> 
      <uc2:BannerTopNTD ID="BannerTopNTD1" runat="server" />
      <div class="block"> 
        <!--NavBar-->
        <div class="navBar">
          <div class="navBarLeft">
            <h2><a title="Trang quản lý các tin tuyển dụng" class="navBarTxt">Các tin tuyển dụng</a></h2>
          </div>
          <div class="navBarRight"><a href="" class="effective_rec_link"><img src="../Images/arrow_l_bg_rec.png" alt="" style="margin-right: 3px" />Tuyển dụng hiệu quả</a></div>
          <div class="clear"></div>
        </div>

        <p class="number_jobs" style="width: 600px">Tìm kiếm các tin tuyển dụng bạn đã tạo theo tiêu chí:</p>
        <span style="float: right; margin-top: -32px">
        <asp:Button CssClass="btn_green01" ToolTip="Bấm đây để hủy tìm kiếm!" 
              ID="btnCancel_filter" runat="server" Text="Hủy tìm kiếm" 
              name="cancel_filter" onclick="btnCancel_filter_Click" />
        </span> 
        <!--Resumes Table-->
        <div class="resumes_table" id="posted_jobs">
          <div class="resumes_row">
            <div class="resumes_th" style="width: 200px">Ngành nghề:</div>
            <div class="resumes_th" style="width: 160px">Loại tin:</div>
          </div>
          <div class="resumes_row">
            <div class="resumes_td" style="background: #F3F3F3">
                <asp:CheckBoxList ID="ckhblNganhnghe" runat="server" DataTextField="CAT_NAME" 
                    DataValueField="CAT_ID" AutoPostBack="True" 
                    onselectedindexchanged="ckhblNganhnghe_SelectedIndexChanged">
              </asp:CheckBoxList>
            </div>
            <div class="resumes_td" style="background: #F3F3F3">
                <asp:CheckBoxList ID="ckhblLoaiTin" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ckhblLoaiTin_SelectedIndexChanged">
                </asp:CheckBoxList>
            </div>
          </div>
        </div>
        <!--Actions-->
        <div class="btn_actions">
          <asp:LinkButton ID="lnkXoaTam" runat="server" CssClass="remove_profile" ToolTip="Xoá tạm các tin" Text="Xóa tạm tin"></asp:LinkButton> 
        <asp:LinkButton ID="lnkDangTin" runat="server" CssClass="post_profile" ToolTip="Đăng các tin" Text="Đăng tin"></asp:LinkButton> 
          <asp:LinkButton ID="lnkHuyDangTin" runat="server" CssClass="cancel_post_profile" ToolTip="Huỷ đăng các tin" Text="Hủy đăng tin"></asp:LinkButton> 
          <asp:LinkButton ID="lnkPhucHoiXoaTam" runat="server" CssClass="recover_profile" ToolTip="Khôi phục các tin xoá tạm" Text="Phục hồi tin xóa tạm"></asp:LinkButton>
          <div align="right" class="sort_by"><b>Sắp xếp theo: </b>            
            <asp:DropDownList ID="ddlSort" runat="server" style="width:200px;" 
                  name="select_sap_xep_top" class="dropBox" AutoPostBack="True" 
                  onselectedindexchanged="ddlSort_SelectedIndexChanged">
                <asp:ListItem Value="1" Text="Thời gian cập nhật giảm dần"></asp:ListItem>
                <asp:ListItem Value="2" Text="Thời gian cập nhật tăng dần"></asp:ListItem>
                <asp:ListItem Value="3" Text="Thời gian làm mới giảm dần"></asp:ListItem>
                <asp:ListItem Value="4" Text="Thời gian làm mới tăng dần"></asp:ListItem>
                <asp:ListItem Value="5" Text="Thời gian đăng giảm dần"></asp:ListItem>
                <asp:ListItem Value="6" Text="Thời gian đăng tăng dần"></asp:ListItem>
                <asp:ListItem Value="7" Text="Thời gian hết hạn giảm dần"></asp:ListItem>
                <asp:ListItem Value="8" Text="Thời gian hết hạn tăng dần"></asp:ListItem>
                <asp:ListItem Value="9" Text="Số lần xem giảm dần"></asp:ListItem>
                <asp:ListItem Value="10" Text="Số lần xem tăng dần"></asp:ListItem>
                <%--<asp:ListItem Value="11" Text="Số hồ sơ ứng tuyển giảm dần"></asp:ListItem>
                <asp:ListItem Value="12" Text="Số hồ sơ ứng tuyển tăng dần"></asp:ListItem>--%>
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
                <asp:TemplateColumn HeaderText="Mã tin" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_CODE">
                    <ItemTemplate>
                        <%# Eval("NEWS_CODE")%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Tiêu đề tuyển dụng" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_TITLE">
                    <ItemTemplate>
                            <div class="resumes_td align_l">
                            <div style="position: relative">
                                <a href="<%# GetLink(Eval("NEWS_ID")) %>" class="job_name"><%# Eval("NEWS_TITLE")%></a> 
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
                            <span class="luotxem"><em>(<%# Eval("NEWS_COUNT")%>lượt xem) </em></span>
                            </div>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Ngày làm mới" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_UPDATEFRERESH" Visible="false">
                    <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("NEWS_UPDATEFRERESH")).ToString("dd/MM/yyyy")%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
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
                <asp:TemplateColumn HeaderText="Ngày cập nhật" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_UPDATE">
                    <ItemTemplate>
                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "NEWS_UPDATE")).ToString("dd/MM/yyyy")%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                    </HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Ngày hết hạn" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                    <ItemTemplate>
                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "NEWS_DEALINE")).ToString("dd/MM/yyyy")%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                    </HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Tình trạng tin" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                    <ItemTemplate>
                        <%# getTinhtrangtin(DataBinder.Eval(Container.DataItem, "TINHTRANGHOSO"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                    </HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateColumn>                
                <asp:TemplateColumn HeaderText="Thao tác">
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <a title="Click để xem thông tin chi tiết tuyển dụng" target="_blank" href="<%# GetLink(Eval("NEWS_ID")) %>">Xem</a> | <asp:LinkButton ID="lnkXoa" runat="server" ToolTip="Xoá tạm tin tuyển dụng" Text="Xóa"></asp:LinkButton><br />
                        <asp:LinkButton ID="lnkHuydangtin" runat="server" ToolTip="Huỷ đăng tin tuyển dụng" Text="Huỷ đăng tin"></asp:LinkButton> | <a title="Xuất bản thêm tin tuyển dụng" href="">Xuất bản thêm</a>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
            <PagerStyle Mode="NumericPages" HorizontalAlign="Right"></PagerStyle>
        </asp:DataGrid>
        <div class="check_status">
        <a class="checkAll" title="Chọn tất cả các tin tuyển dụng trong trang" onclick="javascript: CheckAll();">Chọn tất cả</a> 
        <a class="unCheck" title="Bỏ chọn tất cả các tin tuyển dụng trong trang" onclick="javascript: ClearAll();">Bỏ chọn tất cả</a></div>
        <!--Actions-->
        <div class="btn_actions"> 
          <asp:LinkButton ID="lnkXoaTam_2" runat="server" CssClass="remove_profile" ToolTip="Xoá tạm các tin" Text="Xóa tạm tin"></asp:LinkButton> 
        <asp:LinkButton ID="lnkDangTin_2" runat="server" CssClass="post_profile" ToolTip="Đăng các tin" Text="Đăng tin"></asp:LinkButton> 
          <asp:LinkButton ID="lnkHuyDangTin_2" runat="server" CssClass="cancel_post_profile" ToolTip="Huỷ đăng các tin" Text="Hủy đăng tin"></asp:LinkButton> 
          <asp:LinkButton ID="lnkPhucHoiXoaTam_2" runat="server" CssClass="recover_profile" ToolTip="Khôi phục các tin xoá tạm" Text="Phục hồi tin xóa tạm"></asp:LinkButton>
          <div align="right" class="sort_by"><b>Sắp xếp theo: </b>
            <asp:DropDownList ID="ddlSort_2" runat="server" style="width:200px;" 
                  name="select_sap_xep_top" class="dropBox" AutoPostBack="True" 
                  onselectedindexchanged="ddlSort_SelectedIndexChanged">
                <asp:ListItem Value="1" Text="Thời gian cập nhật giảm dần"></asp:ListItem>
                <asp:ListItem Value="2" Text="Thời gian cập nhật tăng dần"></asp:ListItem>
                <asp:ListItem Value="3" Text="Thời gian làm mới giảm dần"></asp:ListItem>
                <asp:ListItem Value="4" Text="Thời gian làm mới tăng dần"></asp:ListItem>
                <asp:ListItem Value="5" Text="Thời gian đăng giảm dần"></asp:ListItem>
                <asp:ListItem Value="6" Text="Thời gian đăng tăng dần"></asp:ListItem>
                <asp:ListItem Value="7" Text="Thời gian hết hạn giảm dần"></asp:ListItem>
                <asp:ListItem Value="8" Text="Thời gian hết hạn tăng dần"></asp:ListItem>
                <asp:ListItem Value="9" Text="Số lần xem giảm dần"></asp:ListItem>
                <asp:ListItem Value="10" Text="Số lần xem tăng dần"></asp:ListItem>
                <asp:ListItem Value="11" Text="Số hồ sơ ứng tuyển giảm dần"></asp:ListItem>
                <asp:ListItem Value="12" Text="Số hồ sơ ứng tuyển tăng dần"></asp:ListItem>
            </asp:DropDownList>
          </div>
        </div>
      </div>
    </div>
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>