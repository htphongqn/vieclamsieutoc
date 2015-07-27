<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTV.Master" AutoEventWireup="true" CodeBehind="hosodadangNTV.aspx.cs" Inherits="CatTrang.vi_vn.hosodadangNTV" %>
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
    <div id="main"> 
      <uc2:BannerTopNTV ID="BannerTopNTV1" runat="server" />
      <div class="block"> 
        <!--NavBar-->
        <div class="navBar">
          <div class="navBarLeft">
            <h2><span class="navBarTxt">Các hồ sơ tìm việc</span> <span class="ft_11" style="color: #364497">(Bạn được phép tạo tối đa 10 hồ sơ tìm việc)</span></h2>
          </div>
          <div class="navBarRight" style="display:none"><a href="" class="effective_rec_link"><img src="../Images/arrow_l_bg_rec.png" alt="" style="margin-right: 3px" />Tìm việc hiệu quả</a></div>
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
        <asp:LinkButton ID="lnkXoaTam" runat="server" CssClass="remove_profile" 
                ToolTip="Xoá tạm các tin" Text="Xóa tạm hồ sơ" 
                OnClientClick="return confirm('Bạn chắc chắn xóa tạm hồ sơ đã chọn không?')" 
                onclick="lnkXoaTam_Click" ></asp:LinkButton> 
        <%--<asp:LinkButton ID="lnkDangHoSo" runat="server" CssClass="post_profile" ToolTip="Đăng các tin" Text="Đăng hồ sơ"></asp:LinkButton> 
          <asp:LinkButton ID="lnkHuyDangHoSo" runat="server" CssClass="cancel_post_profile" ToolTip="Huỷ đăng các tin" Text="Hủy đăng hồ sơ"></asp:LinkButton> --%>
          <asp:LinkButton ID="lnkPhucHoiXoaTam" runat="server" CssClass="recover_profile" 
                ToolTip="Khôi phục các tin xoá tạm" Text="Phục hồi hồ sơ xóa tạm" 
                onclick="lnkPhucHoiXoaTam_Click"></asp:LinkButton>
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
                <%--<asp:TemplateColumn HeaderText="Mã hồ sơ" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_CODE">
                    <ItemTemplate>
                        <%# Eval("NEWS_CODE")%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>--%>
                <asp:TemplateColumn HeaderText="Tên việc làm" HeaderStyle-Width="91%"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_TITLE">
                    <ItemTemplate>
                        <div class="resumes_td align_l">
                            <div style="position: relative">
                            <a href="<%# GetLinkNTD(Eval("NEWS_ID"))%>" class="job_name"><%# GetShortName(Eval("NEWS_TITLE"), 25)%></a> 
                              <!-- tooltip element -->
                              <div class="tooltip_ct">
                                <table width="420" cellpadding="5" cellspacing="1" border="0" bgcolor="#d7d7d7">
                                  <tr>
                                    <td class="td_tootip blue" colspan="2"><%# GetShortName(Eval("NEWS_TITLE"), 125)%></td>
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
                <asp:TemplateColumn HeaderText="Ngày làm mới" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_UPDATEFRERESH">
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
                    <div id="divDangchoduyet" runat="server" visible='<%# setTinhtranghoso(Eval("TINHTRANGHOSO"), 1) %>'>
                        <a title="Click để xem thông tin chi tiết hồ sơ" target="_blank" href="<%# GetLinkNTD(Eval("NEWS_ID")) %>">Xem</a> 
                        | <asp:LinkButton ID="lnkXoaDangchoduyet" runat="server" OnClientClick="return confirm('Bạn chắc chắn xóa tạm hồ sơ?')"  CommandArgument='<%# Eval("NEWS_ID")%>' OnClick="lnkXoa_Click" ToolTip="Xoá tạm hồ sơ" Text="Xóa"></asp:LinkButton>
                        <br />
                        <asp:LinkButton ID="lnkHuydanghoso" runat="server" CommandArgument='<%# Eval("NEWS_ID")%>'  OnClick="lnkHuydanghoso_Click"  ToolTip="Huỷ đăng hồ sơ" Text="Huỷ đăng hồ sơ"></asp:LinkButton>
                        <br />
                        <a title="Xuất bản thêm" href="/ntv-tao-ho-so-tim-viec?id=<%# Eval("NEWS_ID") %>&idcoppy=1">Xuất bản thêm</a>
                    </div>
                    <div id="divDadang" runat="server" visible='<%# setTinhtranghoso(Eval("TINHTRANGHOSO"), 2) %>'>
                        <a title="Click để xem thông tin chi tiết hồ sơ" target="_blank" href="<%# GetLinkNTD(Eval("NEWS_ID")) %>">Xem</a> | 
                        <a title="Sửa hồ sơ" href="/ntv-tao-ho-so-tim-viec?id=<%# Eval("NEWS_ID") %>">Sửa</a> | 
                        <asp:LinkButton ID="lnkXoa" runat="server" OnClientClick="return confirm('Bạn chắc chắn xóa tạm hồ sơ?')"  CommandArgument='<%# Eval("NEWS_ID")%>' OnClick="lnkXoa_Click" ToolTip="Xoá tạm hồ sơ" Text="Xóa"></asp:LinkButton>
                        <br />
                        <asp:LinkButton ID="lnkLammoi" runat="server" CommandArgument='<%# Eval("NEWS_ID")%>' OnClick="lnkLammoi_Click" ToolTip="Làm mới hồ sơ đã đăng" Text="Làm mới"></asp:LinkButton> | 
                        <asp:LinkButton ID="lnkAnHoso" runat="server" CommandArgument='<%# Eval("NEWS_ID")%>' OnClick="lnkAnHoso_Click" ToolTip="Ẩn HS" Text="Ẩn HS"></asp:LinkButton> 
                        <%--|
                        <a title="Gia hạn hồ sơ đã đăng" href="">Gia hạn</a>--%>
                        <br />
                        <a title="Xuất bản thêm" href="/ntv-tao-ho-so-tim-viec?id=<%# Eval("NEWS_ID") %>&idcoppy=1">Xuất bản thêm</a>
                    </div>
                    <div id="divDangan" runat="server" visible='<%# setTinhtranghoso(Eval("TINHTRANGHOSO"), 3) %>'>
                        <a title="Click để xem thông tin chi tiết hồ sơ" target="_blank" href="<%# GetLinkNTD(Eval("NEWS_ID")) %>">Xem</a> | 
                        <a title="Sửa hồ sơ" href="/ntv-tao-ho-so-tim-viec?id=<%# Eval("NEWS_ID") %>">Sửa</a> | 
                        <asp:LinkButton ID="lnkXoaDangan" runat="server" OnClientClick="return confirm('Bạn chắc chắn xóa tạm hồ sơ?')"  CommandArgument='<%# Eval("NEWS_ID")%>' OnClick="lnkXoa_Click" ToolTip="Xoá tạm hồ sơ" Text="Xóa"></asp:LinkButton>
                        <br />
                        <asp:LinkButton ID="lnkHienthihoso" runat="server" CommandArgument='<%# Eval("NEWS_ID")%>' OnClick="lnkHienthihoso_Click" ToolTip="Hiển thị hồ sơ" Text="Hiển thị hồ sơ"></asp:LinkButton>
                    </div>
                    <div id="divNhap" runat="server" visible='<%# setTinhtranghoso(Eval("TINHTRANGHOSO"), 4) %>'>
                        <a title="Click để xem thông tin chi tiết hồ sơ" target="_blank" href="<%# GetLinkNTD(Eval("NEWS_ID")) %>">Xem</a> | 
                        <a title="Sửa hồ sơ" href="/ntv-tao-ho-so-tim-viec?id=<%# Eval("NEWS_ID") %>">Sửa</a> | 
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('Bạn chắc chắn xóa tạm hồ sơ?')"  CommandArgument='<%# Eval("NEWS_ID")%>' OnClick="lnkXoa_Click" ToolTip="Xoá tạm hồ sơ" Text="Xóa"></asp:LinkButton>
                        <br />
                        <asp:LinkButton ID="lnkDanghoso" runat="server" CommandArgument='<%# Eval("NEWS_ID")%>'  OnClick="lnkDanghoso_Click"  ToolTip="Đăng hồ sơ" Text="Đăng hồ sơ"></asp:LinkButton>
                        <br />
                        <a title="Xuất bản thêm" href="/ntv-tao-ho-so-tim-viec?id=<%# Eval("NEWS_ID") %>&idcoppy=1">Xuất bản thêm</a>
                    </div>
                    <div id="divXoatam" runat="server" visible='<%# setTinhtranghoso(Eval("TINHTRANGHOSO"), 5) %>'>
                        <a title="Click để xem thông tin chi tiết hồ sơ" target="_blank" href="<%# GetLinkNTD(Eval("NEWS_ID")) %>">Xem</a>
                        <br />
                        <asp:LinkButton ID="lnkXoahan" runat="server" CommandArgument='<%# Eval("NEWS_ID")%>' ToolTip="Xóa hẳn" Text="Xóa hẳn"  OnClientClick="return confirm('Bạn chắc chắn xóa hẳn hồ sơ?')"  OnClick="lnkXoahan_Click"></asp:LinkButton>
                        <br />
                        <asp:LinkButton ID="lnkKhoiphuc" runat="server" CommandArgument='<%# Eval("NEWS_ID")%>' ToolTip="Khôi phục" Text="Khôi phục" OnClick="lnkKhoiphuc_Click"></asp:LinkButton>
                    </div>
                    <div id="divHethan" runat="server" visible='<%# setTinhtranghoso(Eval("TINHTRANGHOSO"), 6) %>'>
                        <a title="Click để xem thông tin chi tiết hồ sơ" target="_blank" href="<%# GetLinkNTD(Eval("NEWS_ID")) %>">Xem</a> | 
                        <a title="Sửa hồ sơ" href="/ntv-tao-ho-so-tim-viec?id=<%# Eval("NEWS_ID") %>">Sửa</a> | 
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('Bạn chắc chắn xóa tạm hồ sơ?')"  CommandArgument='<%# Eval("NEWS_ID")%>' OnClick="lnkXoa_Click" ToolTip="Xoá tạm hồ sơ" Text="Xóa"></asp:LinkButton>
                        <br />
                        <%--<a title="Gia hạn hồ sơ đã đăng" href="">Gia hạn</a>--%>
                    </div>                        
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
        <asp:LinkButton ID="lnkXoaTam_2" runat="server" CssClass="remove_profile" ToolTip="Xoá tạm các tin" Text="Xóa tạm hồ sơ"   
                OnClientClick="return confirm('Bạn chắc chắn xóa tạm hồ sơ đã chọn không?')" 
                onclick="lnkXoaTam_Click" ></asp:LinkButton> 
        <%--<asp:LinkButton ID="lnkDangHoSo_2" runat="server" CssClass="post_profile" ToolTip="Đăng các tin" Text="Đăng hồ sơ"></asp:LinkButton> 
          <asp:LinkButton ID="lnkHuyDangHoSo_2" runat="server" CssClass="cancel_post_profile" ToolTip="Huỷ đăng các tin" Text="Hủy đăng hồ sơ"></asp:LinkButton>--%>
          <asp:LinkButton ID="lnkPhucHoiXoaTam_2" runat="server" CssClass="recover_profile" ToolTip="Khôi phục các tin xoá tạm" Text="Phục hồi hồ sơ xóa tạm" onclick="lnkPhucHoiXoaTam_Click"></asp:LinkButton>
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
  <% }
  else { %>
  <div class="page" id="recruitment">
    <div id="main"> 
        <div style="-moz-border-radius:8px; border:1px solid #CCCCCC;padding:30px 0;text-align:center;margin: 0px 0 30px 0">Bạn chưa đăng nhập tài khoản người tìm việc!<br>Hãy đăng nhập để thực hiện thao tác này hoặc nhấn vào <a href="/" style="color:#2D91D4">đây</a> để về trang chủ.</div>
     </div>
  </div>
  <% } %>
</asp:Content>
