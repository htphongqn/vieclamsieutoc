<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTV.Master" AutoEventWireup="true" CodeBehind="hosodadangNTV.aspx.cs" Inherits="CatTrang.vi_vn.hosodadangNTV" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>
<%@ Register src="~/UIs/BannerTopNTV.ascx" tagname="BannerTopNTV" tagprefix="uc2" %>

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
      <uc2:BannerTopNTV ID="BannerTopNTV1" runat="server" />
      <div class="block"> 
        <!--NavBar-->
        <div class="navBar">
          <div class="navBarLeft">
            <h2><span class="navBarTxt">Các hồ sơ tìm việc</span> <span class="ft_11" style="color: #364497">(Bạn được phép tạo tối đa 10 hồ sơ tìm việc)</span></h2>
          </div>
          <div class="navBarRight"><a href="" class="effective_rec_link"><img src="../Images/arrow_l_bg_rec.png" alt="" style="margin-right: 3px" />Tìm việc hiệu quả</a></div>
          <div class="clear"></div>
        </div>
        <p class="number_jobs" style="width: 600px">Tìm kiếm tin tìm việc <b><asp:Literal ID="lbFullName" runat="server"></asp:Literal></b> đã tạo trong danh sách theo tiêu chí:</p>
        <span style="float: right; margin-top: -32px">
        <asp:Button CssClass="btn_green01" ToolTip="Bấm đây để hủy tìm kiếm!" 
              ID="btnCancel_filter" runat="server" Text="Hủy tìm kiếm" 
              name="cancel_filter" onclick="btnCancel_filter_Click" 
               />
        </span> 
        <!--Resumes Table-->
        <div class="resumes_table">
          <div class="resumes_row">
            <div class="resumes_th" style="width: 250px">Ngành nghề:</div>
            <div class="resumes_th" style="width: 200px">Loại hồ sơ:</div>
            <div class="resumes_th" style="width: 550px">&nbsp;</div>
          </div>
          <div class="resumes_row">
            <div class="resumes_td" style="background: #F3F3F3">
              <asp:CheckBoxList ID="ckhblNganhnghe" runat="server" DataTextField="CAT_NAME" 
                    DataValueField="CAT_ID" AutoPostBack="True" 
                    onselectedindexchanged="ckhblNganhnghe_SelectedIndexChanged">
              </asp:CheckBoxList>
              </div>
            <div class="resumes_td" style="background: #F3F3F3">
              <asp:CheckBoxList ID="ckhblLoaiHoso" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ckhblLoaiHoso_SelectedIndexChanged">
              </asp:CheckBoxList>
              </div>
            <div class="resumes_th" style="width: 550px">&nbsp;</div>
          </div>
        </div>
        <!--Actions-->
        <div class="btn_actions"> 
        <asp:LinkButton ID="lnkXoaTam" runat="server" CssClass="remove_profile" ToolTip="Xoá tạm các tin" Text="Xóa tạm hồ sơ"></asp:LinkButton> 
        <asp:LinkButton ID="lnkDangHoSo" runat="server" CssClass="post_profile" ToolTip="Đăng các tin" Text="Đăng hồ sơ"></asp:LinkButton> 
          <asp:LinkButton ID="lnkHuyDangHoSo" runat="server" CssClass="cancel_post_profile" ToolTip="Huỷ đăng các tin" Text="Hủy đăng hồ sơ"></asp:LinkButton> 
          <asp:LinkButton ID="lnkPhucHoiXoaTam" runat="server" CssClass="recover_profile" ToolTip="Khôi phục các tin xoá tạm" Text="Phục hồi hồ sơ xóa tạm"></asp:LinkButton>
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
                <asp:TemplateColumn HeaderText="Mã hồ sơ" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_CODE">
                    <ItemTemplate>
                        <%# Eval("NEWS_CODE")%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Tên việc làm" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_TITLE">
                    <ItemTemplate>
                            <%# Eval("NEWS_TITLE")%>
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
                <asp:TemplateColumn HeaderText="Tình trạng hồ sơ" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                    <ItemTemplate>
                        <%# getTinhtranghoso(DataBinder.Eval(Container.DataItem, "TINHTRANGHOSO"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                    </HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateColumn>                
                <asp:TemplateColumn HeaderText="Thao tác">
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <a title="Click để xem thông tin chi tiết việc làm" target="_blank" href="<%# GetLinkNTV(Eval("NEWS_ID")) %>">Xem</a> | 
                        <a title="Sửa việc làm đã lưu" href="/ntv-tao-ho-so-tim-viec?id=<%# Eval("NEWS_ID") %>">Sửa</a> | 
                        <asp:LinkButton ID="lnkXoa" runat="server" ToolTip="Xoá việc làm đã lưu" Text="Xóa"></asp:LinkButton><br />
                        <asp:LinkButton ID="lnkLammoi" runat="server" ToolTip="Làm mới việc làm đã lưu" Text="Làm mới"></asp:LinkButton> |
                        <a title="Gia hạn việc làm đã lưu" href="">Gia hạn</a><br />
                        <a title="Xuất bản thêm" href="/ntv-tao-ho-so-tim-viec?id=<%# Eval("NEWS_ID") %>&idcoppy=1">Xuất bản thêm</a> | 
                        <asp:LinkButton ID="lnkAnHoso" runat="server" ToolTip="Ẩn HS" Text="Ẩn HS"></asp:LinkButton>
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
        <asp:LinkButton ID="lnkXoaTam_2" runat="server" CssClass="remove_profile" ToolTip="Xoá tạm các tin" Text="Xóa tạm hồ sơ"></asp:LinkButton> 
        <asp:LinkButton ID="lnkDangHoSo_2" runat="server" CssClass="post_profile" ToolTip="Đăng các tin" Text="Đăng hồ sơ"></asp:LinkButton> 
          <asp:LinkButton ID="lnkHuyDangHoSo_2" runat="server" CssClass="cancel_post_profile" ToolTip="Huỷ đăng các tin" Text="Hủy đăng hồ sơ"></asp:LinkButton>
          <asp:LinkButton ID="lnkPhucHoiXoaTam_2" runat="server" CssClass="recover_profile" ToolTip="Khôi phục các tin xoá tạm" Text="Phục hồi hồ sơ xóa tạm"></asp:LinkButton>
          <div align="right" class="sort_by"><b>Sắp xếp theo: </b>
            <asp:DropDownList ID="ddlSort_2" runat="server" style="width:200px;" 
                  name="select_sap_xep_top" class="dropBox" AutoPostBack="True" onselectedindexchanged="ddlSort_2_SelectedIndexChanged">
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
            </asp:DropDownList>
          </div>
        </div>
      </div>
    </div>
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
