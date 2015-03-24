<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTD.Master" AutoEventWireup="true" CodeBehind="quanlytuyendungNTD.aspx.cs" Inherits="CatTrang.vi_vn.quanlytuyendungNTD" %>
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
            <h2><a title="Trang quản lý các tin tìm việc" class="navBarTxt">Các tin tuyển dụng</a></h2>
          </div>
          <div class="navBarRight"><a href="" class="effective_rec_link"><img src="../Images/arrow_l_bg_rec.png" alt="" style="margin-right: 3px" />Tuyển dụng hiệu quả</a></div>
          <div class="clear"></div>
        </div>
        <!--Recruitment Status-->
        <div class="resumes_status"> 
        <span class="resumes_status_item fr_status">Bạn đã tạo <b><asp:Literal ID="lbCountTin" runat="server" Text="0"></asp:Literal></b> tin tuyển dụng</span> 
        <span class="resumes_status_item" style="width: 18%">Tin đã đăng: <b><asp:Literal ID="lbCountTindadang" runat="server" Text="0"></asp:Literal></b> tin</span> 
        <span class="resumes_status_item" style="width: 18%">Tin hết hạn: <b><asp:Literal ID="lbCountTinhethan" runat="server" Text="0"></asp:Literal></b> tin</span>
        <span class="resumes_status_item" style="width: 18%">Tin đang ẩn: <b><asp:Literal ID="lbCountTinan" runat="server" Text="0"></asp:Literal></b> tin</span> 
        <span class="resumes_status_item" style="width: 18%">Tin xóa tạm: <b><asp:Literal ID="lbCountTinxoatam" runat="server" Text="0"></asp:Literal></b> tin</span> 
        <span class="resumes_status_item mr_l" style="width: 18%">Tin nháp: <b><asp:Literal ID="lbCountTinnhap" runat="server" Text="0"></asp:Literal></b> tin</span> 
        <span class="resumes_status_item" style="width: 18%">Tin đang chờ duyệt: <b><asp:Literal ID="lbCountChoduyet" runat="server" Text="0"></asp:Literal></b> tin</span> 
        <span class="resumes_status_item" style="width: 18%">Tin hết hạn: <b><asp:Literal ID="lbCountHethan" runat="server" Text="0"></asp:Literal></b> tin</span> 
        </div>
        <asp:DataGrid ID="GridItemList" CellPadding="0" runat="server" AutoGenerateColumns="False"
            Width="100%" DataKeyField="NEWS_ID" CssClass="tdGridTable" SelectedIndex="0"
            PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" AllowPaging="false"
            PageSize="20" PagerStyle-CssClass="PageClass" AllowSorting="false"
            GridLines="None">
            <AlternatingItemStyle BackColor="#f3f3f3" />
            <Columns>
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
        <div style="float: right; padding: 10px 0"><a href="/ntd-tin-tuyen-dung-da-dang" class="view_more_rec">&raquo; Xem danh sách chi tiết</a></div>
      </div>
      <!--Feedback From Jobseeker-->
      <div class="block">
        <div class="title_rec_home"><b>Xem phản hồi - đánh giá của Người tìm việc</b></div>
        <div class="block_rec padding1">
          <ul id="feedback">
            <asp:Repeater ID="rptcomment" runat="server">
            <ItemTemplate>
                    <li> 
                        <img src="<%#GetCusLogo(Eval("CUSTOMER_NTV_ID")) %>" alt="" width="62" height="62" class="img" /> 
                        <b><%# GetCusNameNTV(Eval("CUSTOMER_NTV_ID"))%></b> 
                        - <span class="ft_11">Gửi ngày <%# Convert.ToDateTime(Eval("DATE_CREATE")).ToString("dd-MM-yyyy")%></span>
                      <div class="line_border" style="margin: 3px 0 3px 70px"></div>
                      <%# GetShortName(Eval("DESCRIPTION"), 250)%>
                    </li>
            </ItemTemplate>
          </asp:Repeater>            
          </ul>
          <div><a class="view_more_rec" href="/ntd-xem-phan-hoi-tu-nguoi-tim-viec">» Xem danh sách chi tiết</a></div>
          <div class="clearfix"> </div>
        </div>
      </div>
    </div>
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
