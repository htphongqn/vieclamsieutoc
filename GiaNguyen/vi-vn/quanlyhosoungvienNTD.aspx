<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTD.Master" AutoEventWireup="true" CodeBehind="quanlyhosoungvienNTD.aspx.cs" Inherits="CatTrang.vi_vn.quanlyhosoungvienNTD" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>
<%@ Register src="~/UIs/BannerTopNTD.ascx" tagname="BannerTopNTD" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="page" id="recruitment">
    <div id="main"> 
      <uc2:BannerTopNTD ID="BannerTopNTD1" runat="server" />
      <div class="block"> 
        <!--NavBar-->
        <div class="navBar">
          <div class="navBarLeft">
            <h2><span class="navBarTxt">Ứng viên nộp hồ sơ vào vị trí:</h2>
          </div>
          <div class="navBarRight"><a href="" class="effective_rec_link"><img src="../Images/arrow_l_bg_rec.png" alt="" style="margin-right: 3px" />Tuyển dụng hiệu quả</a></div>
          <div class="clear"></div>
        </div>
        <div class="tbUser_row">
          <div class="tbUser_col" style="width: 220px; text-align: center">
          <asp:Literal ID="lbLogo" runat="server"></asp:Literal>
          </div>
          <div class="tbUser_col" style="width: 28%"> <b>Vị trí tuyển dụng:</b><br>
            <asp:TextBox ID="txtFilterVitrituyendung" runat="server" value="Nhập tiêu đề tin tuyển dụng" onfocus="if (this.value=='Nhập tiêu đề tin tuyển dụng') this.value='';" onblur="if (this.value=='') this.value='Nhập tiêu đề tin tuyển dụng';" CssClass="textbox txt-360" style="width:248px;"></asp:TextBox><br>
            <asp:ListBox ID="cblRdoOptionVitrituyendung" DataValueField="NEWS_ID" DataTextField="NEWS_TITLE" runat="server" CssClass="textbox txt-360" style="width:260px;">
            </asp:ListBox> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Chưa chọn Vị trí tuyển dụng"
                            ControlToValidate="cblRdoOptionVitrituyendung" Display="None" ForeColor="Red" ValidationGroup="G44">*</asp:RequiredFieldValidator>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="G44" />
          </div>
          <div class="tbUser_col" style="width: 15%; padding-top: 25px">
            <asp:Button ID="btnTimkiem" runat="server" CssClass="btn_green02" Text="Xem
            danh sách" onclick="btnTimkiem_Click" ValidationGroup="G44" />
          </div>
          <div class="tbUser_col" style="width: 30%">
            <b>Vị trí tuyển dụng:</b><asp:Literal ID="lbVitrituyendung" runat="server"></asp:Literal><br>
            <b>Hạn nộp hồ sơ:</b><asp:Literal ID="lbHannophoso" runat="server"></asp:Literal><br>
            <b>Yêu cầu: </b><asp:Literal ID="lbYeucau" runat="server"></asp:Literal><br>
            <b>Số lượng tuyển:</b> <asp:Literal ID="lbSoluongtuyen" runat="server"></asp:Literal><br>
            <b>Địa điểm làm việc:</b> <asp:Literal ID="lbDiadiemlamviec" runat="server"></asp:Literal>
          </div>
        </div>
        <p class="number_jobs">Thống kê: Danh sách hiện có <span style="color:red;font-size:14px;font-weight:bold">
        <asp:Literal ID="lbCountItem" runat="server"></asp:Literal> </span> Hồ sơ ứng viên</p>
        <p class="number_jobs" style="width: 600px">Tìm kiếm hồ sơ ứng viên trong danh sách ứng viên đã nộp hồ sơ theo tiêu chí:</p>
        <span style="float: right; margin-top: -32px">
        <asp:Button ID="btnHuytimkiem" runat="server" CssClass="btn_green01" 
                                title="Bấm đây để hủy các tiêu thức đã lọc!" Text="Hủy tìm kiếm" 
                                name="cancel_filter" onclick="btnHuytimkiem_Click" />
        </span> 
        <!--Resumes Table-->
        <div class="resumes_table" id="posted_jobs">
          <div class="resumes_row">
            <div class="resumes_th" style="width: 280px">Trạng thái hồ sơ:</div>
            <div class="resumes_th" style="width: 200px">Mức lương mong muốn:</div>
            <div class="resumes_th" style="width: 200px">Trình độ học vấn:</div>
            <div class="resumes_th" style="width: 180px">Giới tính:</div>
            <div class="resumes_th" style="width: 200px">Tình trạng hôn nhân:</div>
            <div class="resumes_th" style="width: 280px">Số năm kinh nghiệm:</div>
          </div>
          <div class="resumes_row">
            <div class="resumes_td" style="background: #F3F3F3">
              <asp:CheckBoxList ID="ckhblTrangthaiHoso" runat="server" AutoPostBack="True">
              </asp:CheckBoxList>
            </div>
            <div class="resumes_td" style="background: #F3F3F3">
              <asp:CheckBoxList ID="ckhbMucluong" runat="server" AutoPostBack="True" 
                    >
              </asp:CheckBoxList>
            </div>
            <div class="resumes_td" style="background: #F3F3F3">
                <asp:CheckBoxList ID="ckhbBangcap" runat="server" AutoPostBack="True" 
                    >
                </asp:CheckBoxList>
            </div>
            <div class="resumes_td" style="background: #F3F3F3">
                <asp:CheckBoxList ID="ckhbGioitinh" runat="server" AutoPostBack="True" 
                    >
                </asp:CheckBoxList>
            </div>
            <div class="resumes_td" style="background: #F3F3F3">
                <asp:CheckBoxList ID="ckhbTinhtrangHonnhan" runat="server" AutoPostBack="True" 
                    >
                </asp:CheckBoxList>
            </div>
            <div class="resumes_td" style="background: #F3F3F3">
                <asp:CheckBoxList ID="ckhbKinhnghiem" runat="server" AutoPostBack="True" 
                    >
                </asp:CheckBoxList>
            </div>
          </div>          
        </div>
        <!--Actions-->
        <div class="btn_actions"> 
        <asp:LinkButton ID="lnkDanhgia" runat="server" CssClass="assessment_rec" ToolTip="Gửi đánh giá tới ứng viên">Đánh giá</asp:LinkButton>
        <asp:LinkButton ID="lnkPhanhoi" runat="server" CssClass="send_to_friends" ToolTip="Gửi phản hồi tới ứng viên">Phản hồi</asp:LinkButton>
        <asp:LinkButton ID="lnkPhongvan" runat="server" CssClass="save_rec" ToolTip="Lưu vào hồ sơ phỏng vấn" >Phỏng vấn</asp:LinkButton>
        <asp:LinkButton ID="lnkTrungtuyen" runat="server" CssClass="matriculated" ToolTip="Lưu ứng viên vào danh sách trúng tuyển">Trúng tuyển</asp:LinkButton>
        <asp:LinkButton ID="lnkKhongtrungtuyen" runat="server" CssClass="cancel_post_profile" ToolTip="Chuyển ứng viên sang danh sách không trúng tuyển" >Không trúng tuyển</asp:LinkButton> 
        <asp:LinkButton ID="lnkTuchoi" runat="server" CssClass="refused" ToolTip="Từ chối ứng viên tự ứng tuyển">Từ chối</asp:LinkButton>
        <asp:LinkButton ID="lnkXoahoso" runat="server" CssClass="remove_profile" ToolTip="Xoá hồ sơ ứng viên đã lưu" >Xóa hồ sơ</asp:LinkButton>
        <asp:LinkButton ID="lnkExcel" runat="server" CssClass="excel" ToolTip="Tạo file excel danh sách ứng viên" >Excel</asp:LinkButton>
          <div align="right" class="sort_by" style="margin: 5px 0 15px 0"><b>Sắp xếp theo: </b>
            <asp:DropDownList ID="ddlSort" runat="server" style="width:200px;" 
                  name="select_sap_xep_top" class="dropBox" AutoPostBack="True" onselectedindexchanged="ddlSort_SelectedIndexChanged">
                <asp:ListItem Value="1" Text="Ngày gửi giảm dần"></asp:ListItem>
                <asp:ListItem Value="2" Text="Ngày gửi tăng dần"></asp:ListItem>
                <asp:ListItem Value="3" Text="Ngày xử lý giảm dần"></asp:ListItem>
                <asp:ListItem Value="4" Text="Ngày xử lý tăng dần"></asp:ListItem>
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
                <asp:TemplateColumn HeaderText="Thông tin ứng viên" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="CUSTOMER_ID">
                    <ItemTemplate>                        
                        <a class="linkBlack" title="Xem chi tiết hồ sơ tìm việc" href="<%# GetLinkNTD(Eval("NEWS_ID"))%>"><b>
                        <%# GetCusNameNTV(Eval("CUSTOMER_ID"))%></b></a> <br>
                          Giới tính: <%# GetCusSexNTV(Eval("CUSTOMER_ID"))%>
                          - Tuổi: <%# GetCusTuoiNTV(Eval("CUSTOMER_ID"))%><br>
                          <%# GetCusEmailNTV(Eval("CUSTOMER_ID"))%><br>
                          ĐT: <%# GetCusPhoneNTV(Eval("CUSTOMER_ID"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="CV/Hồ sơ tìm việc liên quan" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_ID">
                    <ItemTemplate>
                            <a class="linkBlack" title="Xem chi tiết hồ sơ tìm việc" href="<%# GetLinkNTD(Eval("NEWS_ID"))%>"><%# getTenHoso(Eval("NEWS_ID"))%></a></b><br>
                            <%# getKinhnghiemByNewsId(Eval("NEWS_ID"))%></a><br />
                           <%-- <b class="ft_11">Vị trí: Tuyển dụng nhân viên thiết kế đồ họa website</b>--%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Mức lương mong muốn" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_ID" Visible="false">
                    <ItemTemplate>
                            <%# getMucluongByNewsId(Eval("NEWS_ID"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Ngày gửi" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="PUBLISHDATE">
                    <ItemTemplate>
                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "PUBLISHDATE")).ToString("dd/MM/yyyy")%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Ngày xử lý" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_UPDATE">
                    <ItemTemplate>
                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "PUBLISHDATE")).ToString("dd/MM/yyyy")%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                    </HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Ngày hẹn tiếp theo" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                    <ItemTemplate>
                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "PUBLISHDATE")).ToString("dd/MM/yyyy")%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                    </HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Trạng thái hồ sơ" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                    <ItemTemplate>
                        <%--<%# getTinhtranghoso(DataBinder.Eval(Container.DataItem, "TINHTRANGHOSO"))%>--%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                    </HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateColumn>                
                <asp:TemplateColumn HeaderText="Thao tác">
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkPhongvan" runat="server" ToolTip="Lưu ứng viên vào danh sách được phỏng vấn">Phỏng vấn
                        </asp:LinkButton> | 
                        <asp:LinkButton ID="lnkDanhgia" runat="server" ToolTip="Lưu đánh giá về ứng viên">Đánh giá</asp:LinkButton><br />
                        <asp:LinkButton ID="lnkPhanhoi" runat="server" ToolTip="Gửi phản hồi cho ứng viên">Gửi phản hồi</asp:LinkButton> | 
                        <asp:LinkButton ID="lnkXoa" runat="server" ToolTip="Xoá ứng viên đã lưu">Xóa</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
            <PagerStyle Mode="NumericPages" HorizontalAlign="Right"></PagerStyle>
        </asp:DataGrid>
        <!--Actions-->
        <div class="btn_actions"> 
            <asp:LinkButton ID="lnkDanhgia_2" runat="server" CssClass="assessment_rec" ToolTip="Gửi đánh giá tới ứng viên">Đánh giá</asp:LinkButton>
        <asp:LinkButton ID="lnkPhanhoi_2" runat="server" CssClass="send_to_friends" ToolTip="Gửi phản hồi tới ứng viên">Phản hồi</asp:LinkButton>
        <asp:LinkButton ID="lnkPhongvan_2" runat="server" CssClass="save_rec" ToolTip="Lưu vào hồ sơ phỏng vấn" >Phỏng vấn</asp:LinkButton>
        <asp:LinkButton ID="lnkTrungtuyen_2" runat="server" CssClass="matriculated" ToolTip="Lưu ứng viên vào danh sách trúng tuyển">Trúng tuyển</asp:LinkButton>
        <asp:LinkButton ID="lnkKhongtrungtuyen_2" runat="server" CssClass="cancel_post_profile" ToolTip="Chuyển ứng viên sang danh sách không trúng tuyển" >Không trúng tuyển</asp:LinkButton> 
        <asp:LinkButton ID="lnkTuchoi_2" runat="server" CssClass="refused" ToolTip="Từ chối ứng viên tự ứng tuyển">Từ chối</asp:LinkButton>
        <asp:LinkButton ID="lnkXoahoso_2" runat="server" CssClass="remove_profile" ToolTip="Xoá hồ sơ ứng viên đã lưu" >Xóa hồ sơ</asp:LinkButton>
        <asp:LinkButton ID="lnkExcel_2" runat="server" CssClass="excel" ToolTip="Tạo file excel danh sách ứng viên" >Excel</asp:LinkButton>
          <div align="right" class="sort_by" style="margin: 5px 0 15px 0"><b>Sắp xếp theo: </b>
            <asp:DropDownList ID="ddlSort_2" runat="server" style="width:200px;" 
                  name="select_sap_xep_top" class="dropBox" AutoPostBack="True" onselectedindexchanged="ddlSort_2_SelectedIndexChanged">
                <asp:ListItem Value="1" Text="Ngày gửi giảm dần"></asp:ListItem>
                <asp:ListItem Value="2" Text="Ngày gửi tăng dần"></asp:ListItem>
                <asp:ListItem Value="3" Text="Ngày xử lý giảm dần"></asp:ListItem>
                <asp:ListItem Value="4" Text="Ngày xử lý tăng dần"></asp:ListItem>
            </asp:DropDownList>
          </div>
        </div>
      </div>        
    </div>
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
<script type="text/javascript">
    function DoListBoxFilter(listBoxSelector, filter, keys, values) {
        var list = $(listBoxSelector);
        var selectBase = '<option value="{0}">{1}</option>';

        list.empty();
        for (i = 0; i < values.length; ++i) {

            var value = values[i];

            if (value == "" || value.toLowerCase().indexOf(filter.toLowerCase()) >= 0) {
                var temp = '<option value="' + keys[i] + '">' + value + '</option>';
                list.append(temp);
            }
        }
    }
    var keys = [];
    var values = [];

    var options = $('#<% = cblRdoOptionVitrituyendung.ClientID %> option');
    $.each(options, function (index, item) {
        keys.push(item.value);
        values.push(item.innerHTML);
    });
    $('#<% = txtFilterVitrituyendung.ClientID %>').keyup(function () {
        var filter = $(this).val();
        DoListBoxFilter('#<% = cblRdoOptionVitrituyendung.ClientID %>', filter, keys, values);
    });

</script>
    </span>
</asp:Content>
