<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTV.Master" AutoEventWireup="true" CodeBehind="quanlytimviecNTV.aspx.cs" Inherits="CatTrang.vi_vn.quanlytimviecNTV" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>
<%@ Register src="~/UIs/BannerTopNTV.ascx" tagname="BannerTopNTV" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="page" id="recruitment">
    <div id="main"> 
      <uc2:BannerTopNTV ID="BannerTopNTV1" runat="server" />
      <div class="block"> 
        <!--NavBar-->
        <div class="navBar">
          <div class="navBarLeft">
            <h2><a title="Trang quản lý các hồ sơ tìm việc" href="/ntv-ho-so-da-dang" class="navBarTxt">Các hồ sơ tìm việc</a></h2>
          </div>
          <div class="navBarRight"><a href="" class="effective_rec_link"><img src="../Images/arrow_l_bg_rec.png" alt="" style="margin-right: 3px" />Tìm việc hiệu quả</a></div>
          <div class="clear"></div>
        </div>
        <!--Resumes Status-->
        <div class="resumes_status"> 
            <span class="resumes_status_item fr_status">Bạn đã tạo <b><asp:Literal ID="lbCountTao_HosoDadang" runat="server" Text="0"></asp:Literal></b> hồ sơ tìm việc</span> 
            <span class="resumes_status_item">Hồ sơ đã đăng: <b><asp:Literal ID="lbCountDadang_HosoDadang" runat="server" Text="0"></asp:Literal></b> hồ sơ</span> 
            <span class="resumes_status_item">Hồ sơ đang ẩn: <b><asp:Literal ID="lbCountAn_HosoDadang" runat="server" Text="0"></asp:Literal></b> hồ sơ</span> 
            <span class="resumes_status_item">Hồ sơ xóa tạm: <b><asp:Literal ID="lbCountXoatam_HosoDadang" runat="server" Text="0"></asp:Literal></b> hồ sơ</span> 
            <span class="resumes_status_item mr_l">Hồ sơ nháp: <b><asp:Literal ID="lbCountNhap_HosoDadang" runat="server" Text="0"></asp:Literal></b> hồ sơ</span> 
            <span class="resumes_status_item">Hồ sơ đang chờ duyệt: <b><asp:Literal ID="lbCountChoduyet_HosoDadang" runat="server" Text="0"></asp:Literal></b> hồ sơ</span> 
            <span class="resumes_status_item">Hồ sơ hết hạn: <b><asp:Literal ID="lbCountHethan_HosoDadang" runat="server" Text="0"></asp:Literal></b> hồ sơ</span> 
        </div>
        <asp:DataGrid ID="GridItemListHosodadang" CellPadding="0" runat="server" AutoGenerateColumns="False"
            Width="100%" DataKeyField="NEWS_ID" CssClass="tdGridTable" SelectedIndex="0"
            PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" AllowPaging="false"
            PageSize="20" PagerStyle-CssClass="PageClass" AllowSorting="false"
            GridLines="None">
            <AlternatingItemStyle BackColor="#f3f3f3" />
            <Columns>
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
        <div style="float: right; padding: 10px 0"><a href="/ntv-ho-so-da-dang" class="view_more_rec">&raquo; Xem danh sách chi tiết</a></div>
      </div>
      <!--Saved Jobs-->
      <div class="block">
        <div class="title_rec_home"><b>Việc làm đã lưu</b></div>
        <p class="number_jobs">Bạn đã lưu <span class="red"><asp:Literal ID="lbCountVLDaluu" runat="server" Text="0"></asp:Literal></span> tin tuyển dụng</p>        
        <asp:DataGrid ID="GridItemListVLDaluu" CellPadding="0" runat="server" AutoGenerateColumns="False"
            Width="100%" DataKeyField="NEWS_ID" CssClass="tdGridTable" SelectedIndex="0"
            PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" AllowPaging="false"
            PageSize="20" PagerStyle-CssClass="PageClass" AllowSorting="false"             
            GridLines="None">
            <AlternatingItemStyle BackColor="#f3f3f3" />
            <Columns>
                <asp:TemplateColumn HeaderText="Tên việc làm" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_TITLE">
                    <ItemTemplate>
                            <a href="<%# GetLinkNTV(Eval("NEWS_ID")) %>">
                            <%# Eval("NEWS_TITLE")%></a>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
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
                        <%# getNgayluu(DataBinder.Eval(Container.DataItem, "NEWS_ID"), DataBinder.Eval(Container.DataItem, "CUSTOMER_ID"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>              
                <asp:TemplateColumn HeaderText="Thao tác">
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <a title="Click để xem thông tin chi tiết việc làm" target="_blank" href="<%# GetLinkNTV(Eval("NEWS_ID")) %>">Xem</a> | 
                        <asp:LinkButton ID="lnkXoa" runat="server" OnClientClick="return confirm('Bạn chắc chắn xóa không?')" CommandName="delete" CommandArgument='<%# Eval("NEWS_ID")%>' OnClick="lnkXoaVLDaluu_Click" ToolTip="Xoá việc làm đã lưu" Text="Xóa"></asp:LinkButton><br />
                        <asp:LinkButton ID="lnkUngtuyen" runat="server" OnClientClick="return confirm('Bạn chắc chắn ứng tuyển không?')" CommandArgument='<%# Eval("NEWS_ID")%>' OnClick="lnkUngtuyenVLDaluu_Click" ToolTip="Ứng tuyển vào vị trí này" Text="Ứng tuyển"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
            <PagerStyle Mode="NumericPages" HorizontalAlign="Right"></PagerStyle>
        </asp:DataGrid>
        <div style="float: right; padding: 10px 0"><a href="/ntv-viec-lam-da-luu" class="view_more_rec">&raquo; Xem danh sách chi tiết</a></div>
      </div>
      <!--Applying Jobs-->
      <div class="block">
        <div class="title_rec_home"><b>Việc làm đã ứng tuyển</b></div>
        <!--Resumes Status-->
        <div class="resumes_status"> 
        <span class="resumes_status_item fr_status" style="width: 250px"> Bạn đã ứng tuyển <b><asp:Literal ID="lbCountVLDaungtuyen" runat="server" Text="0"></asp:Literal></b> vị trí tuyển dụng</span>
        <span class="resumes_status_item">Tin còn hạn: <b><asp:Literal ID="lbCountConhanVLDaungtuyen" runat="server" Text="0"></asp:Literal></b> tin</span> 
        <span class="resumes_status_item mr_l" style="display: block; margin-left: 25%">Tin hết hạn: <b><asp:Literal ID="lbCountHetnhanVLDaungtuyen" runat="server" Text="0"></asp:Literal></b> tin</span></div>
        <asp:DataGrid ID="GridItemListVLDaungtuyen" CellPadding="0" runat="server" AutoGenerateColumns="False"
            Width="100%" DataKeyField="NEWS_ID" CssClass="tdGridTable" SelectedIndex="0"
            PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" AllowPaging="false"
            PageSize="20" PagerStyle-CssClass="PageClass" AllowSorting="false" 
            GridLines="None">
            <AlternatingItemStyle BackColor="#f3f3f3" />
            <Columns>                
                <%--<asp:TemplateColumn HeaderStyle-Width="1%" ItemStyle-Wrap="False" HeaderStyle-CssClass="tdGridHeader"
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
                </asp:TemplateColumn>--%>
                <asp:TemplateColumn HeaderText="Tên việc làm" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_TITLE">
                    <ItemTemplate>                    
                    <a href="<%# GetLinkNTV(Eval("NEWS_ID")) %>">
                            <%# Eval("NEWS_TITLE")%></a>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
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
                        <%# getNgayluu(DataBinder.Eval(Container.DataItem, "NEWS_ID"), DataBinder.Eval(Container.DataItem, "CUSTOMER_ID"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>              
                <asp:TemplateColumn HeaderText="Thao tác">
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <a title="Click để xem thông tin chi tiết việc làm" target="_blank" href="<%# GetLinkNTV(Eval("NEWS_ID")) %>">Xem</a><br />
                        <asp:LinkButton ID="lnkHuyungtuyenVLDaungtuyen" runat="server" OnClientClick="return confirm('Bạn chắc chắn hủy ứng tuyển không?')" CommandArgument='<%# Eval("NEWS_ID")%>' OnClick="lnkHuyungtuyenVLDaungtuyen_Click" ToolTip="Hủy ứng tuyển" Text="Hủy ứng tuyển"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
            <PagerStyle Mode="NumericPages" HorizontalAlign="Right"></PagerStyle>
        </asp:DataGrid>
        <div style="float: right; padding: 10px 0"><a href="/ntv-viec-lam-da-ung-tuyen" class="view_more_rec">&raquo; Xem danh sách chi tiết</a></div>
      </div>
      <!--Jobs From Recruiters-->
      <div class="block">
        <div class="title_rec_home"><b>Việc làm từ nhà tuyển dụng của tôi</b></div>
        <p class="number_jobs fl">Bạn đã đăng ký nhận tin tuyển dụng từ <span class="red"><asp:Literal ID="lbCountNTDcuatoi" runat="server" Text="0"></asp:Literal></span> nhà tuyển dụng.<br />
          Có tổng số <span class="red"><asp:Literal ID="lbCountTinNTDcuatoi" runat="server" Text="0"></asp:Literal></span> tin tuyển dụng từ <asp:Literal ID="lbCountNTDcuatoi_2" runat="server" Text="0"></asp:Literal> Nhà tuyển dụng của bạn.<br />
          Ngày hôm nay có <span class="red"><asp:Literal ID="lbCountTinHomnayNTDcuatoi" runat="server" Text="0"></asp:Literal></span> tin tuyển dụng mới</p>
        <div class="cancel_button fr">
          <input type="submit" class="btn_green01" title="Bấm đây để hủy nhận tin từ nhà tuyển dụng" id="search_filter" value="Hủy nhận tin từ NTD của tôi" name="btn_filter">
        </div>
        <asp:DataGrid ID="GridItemListNTDcuatoi" CellPadding="0" runat="server" AutoGenerateColumns="False"
            Width="100%" DataKeyField="NEWS_ID" CssClass="tdGridTable" SelectedIndex="0"
            PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" AllowPaging="false"
            PageSize="20" PagerStyle-CssClass="PageClass" AllowSorting="false" 
            GridLines="None">
            <AlternatingItemStyle BackColor="#f3f3f3" />
            <Columns>                
                <%--<asp:TemplateColumn HeaderStyle-Width="1%" ItemStyle-Wrap="False" HeaderStyle-CssClass="tdGridHeader"
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
                </asp:TemplateColumn>--%>
                <asp:TemplateColumn HeaderText="Tên việc làm" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_TITLE">
                    <ItemTemplate>
                            <%# Eval("NEWS_TITLE")%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
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
                <asp:TemplateColumn HeaderText="Thao tác">
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <a title="Click để xem thông tin chi tiết việc làm" target="_blank" href="/">Xem</a> | 
                        <asp:LinkButton ID="lnkUngtuyen" runat="server" OnClientClick="return confirm('Bạn chắc chắn ứng tuyển không?')" CommandArgument='<%# Eval("NEWS_ID")%>' OnClick="lnkUngtuyenNTDcuatoi_Click" ToolTip="Ứng tuyển vào vị trí này" Text="Ứng tuyển"></asp:LinkButton><br />
                        <asp:LinkButton ID="lnkHuynhantinNTDcuatoi" runat="server" CommandName="delete" CommandArgument='<%# Eval("NEWS_ID")%>' ToolTip="Hủy nhận tin" Text="Hủy nhận tin"></asp:LinkButton>                        
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
            <PagerStyle Mode="NumericPages" HorizontalAlign="Right"></PagerStyle>
        </asp:DataGrid>
        <div style="float: right; padding: 10px 0"><a href="/ntv-nha-tuyen-dung-cua-toi" class="view_more_rec">&raquo; Xem danh sách chi tiết</a></div>
      </div>
      <!--Viewed Jobs-->
      <div class="block">
        <div class="title_rec_home"><b>Việc làm đã xem</b></div>
        <div class="block_rec bl_white">
          <ul id="list_most_viewed_jobs" class="manage_job">            
            <asp:Repeater ID="rptVLDaxem" runat="server">
                <ItemTemplate>
                    <li class="col_rec_item">
                      <div class="col_rec_item_ct">
                      <a class="position_job" href="<%# GetLinkNTV(Eval("NEWS_ID")) %>">
                      <%# GetShortName(Eval("NEWS_TITLE"), 40)%></a>
                        <h4 class="recruiter_name"><%# getTenCongty(Eval("CUSTOMER_ID"))%></h4>
                      </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
          </ul>
          <div class="clearfix"> </div>
        </div>
      </div>
      <!--Recruiters Viewed My Resume-->
      <div class="block">
        <div class="title_rec_home"><b>NTD đã xem hồ sơ của tôi</b></div>
        <asp:DataGrid ID="GridItemListNTDXemHoso" CellPadding="0" runat="server" AutoGenerateColumns="False"
            Width="100%" DataKeyField="ID" CssClass="tdGridTable" SelectedIndex="0"
            PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" AllowPaging="false"
            PageSize="20" PagerStyle-CssClass="PageClass" AllowSorting="false"
            GridLines="None">
            <AlternatingItemStyle BackColor="#f3f3f3" />
            <Columns>
                <asp:TemplateColumn HeaderText="Tên công ty" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="CUSTOMER_ID">
                    <ItemTemplate>
                            <%# getTenCongty(Eval("CUSTOMER_ID"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Tên hồ sơ" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_ID">
                    <ItemTemplate>
                            <%# getTenHoso(Eval("NEWS_ID"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Số lần xem" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                    <ItemTemplate>
                        <%# Eval("VIEWCOUNT")%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                    </HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Ngày xem cuối" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                    <ItemTemplate>
                        <%# Eval("PUBLISHDATE", "{0:dd/MM/yyyy}")%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                    </HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="NTD lưu hồ sơ" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_PUBLISHDATE">
                    <ItemTemplate>
                        <%# getLuuhoso(Eval("NEWS_ID"), Eval("CUSTOMER_ID"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Thao tác">
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <a target="_blank" href="/">Danh sách tin của NTD</a>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
            <PagerStyle Mode="NumericPages" HorizontalAlign="Right"></PagerStyle>
        </asp:DataGrid>
        <div style="float: right; padding: 10px 0"><a href="/ntv-nha-tuyen-dung-da-xem-ho-so" class="view_more_rec">&raquo; Xem danh sách chi tiết</a></div>
      </div>
    </div>
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
