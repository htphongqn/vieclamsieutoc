<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTV.Master" AutoEventWireup="true" CodeBehind="nhatuyendungdaxemhosoNTV.aspx.cs" Inherits="CatTrang.vi_vn.nhatuyendungdaxemhosoNTV" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>
<%@ Register src="~/UIs/BannerTopNTV.ascx" tagname="BannerTopNTV" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
<div class="page" id="recruitment"> 
    <!--Main-->
    <div id="main"> 
      <uc2:BannerTopNTV ID="BannerTopNTV1" runat="server" />
      <div class="block"> 
        <!--NavBar-->
        <div class="navBar">
          <div class="navBarLeft">
            <h2><span class="navBarTxt">Nhà tuyển dụng đã xem hồ sơ của tôi</span> </h2>
          </div>
          <%--<div class="navBarRight"><a href="" class="effective_rec_link"><img src="../Images/arrow_l_bg_rec.png" alt="" style="margin-right: 3px" />Tìm việc hiệu quả</a></div>--%>
          <div class="clear"></div>
        </div>
        <p class="number_jobs"><b>Xem theo hồ sơ : </b>
          <asp:DropDownList ID="ddlHoso" runat="server"
                  name="sel_tin_tim_viec" class="dropbox" AutoPostBack="True" 
                DataTextField="NEWS_TITLE" DataValueField="NEWS_ID" AppendDataBoundItems="true" 
                onselectedindexchanged="ddlHoso_SelectedIndexChanged">
                  <asp:ListItem Value="0" Text="-- Tất cả --"></asp:ListItem>
            </asp:DropDownList>
        </p>        
        <asp:DataGrid ID="GridItemList" CellPadding="0" runat="server" AutoGenerateColumns="False"
            Width="100%" DataKeyField="ID" CssClass="tdGridTable" SelectedIndex="0"
            PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" AllowPaging="false"
            PageSize="20" PagerStyle-CssClass="PageClass" AllowSorting="false" OnItemCommand="GridItemList_ItemCommand"
            OnItemDataBound="GridItemList_ItemDataBound" OnSortCommand="GridItemList_SortCommand"
            GridLines="None" OnPageIndexChanged="GridItemList_PageIndexChanged">
            <AlternatingItemStyle BackColor="#f3f3f3" />
            <Columns>
                <asp:TemplateColumn HeaderText="Tên công ty" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="CUSTOMER_ID">
                    <ItemTemplate>
                            <%# getTenCongty(Eval("CUSTOMER_NTD_ID"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Tên hồ sơ" HeaderStyle-Width="91%" ItemStyle-Wrap="False"
                    HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                    SortExpression="NEWS_ID">
                    <ItemTemplate>
                            <%# getTenHoso(Eval("NEWS_ID_UNGTUYEN"))%>
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
                        <%# getLuuhoso(Eval("NEWS_ID_UNGTUYEN"), Eval("CUSTOMER_NTD_ID"))%>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                </asp:TemplateColumn>
                <%--<asp:TemplateColumn HeaderText="Thao tác">
                    <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                    <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <a target="_blank" href="/">Danh sách tin của NTD</a>
                    </ItemTemplate>
                </asp:TemplateColumn>--%>
            </Columns>
            <PagerStyle Mode="NumericPages" HorizontalAlign="Right"></PagerStyle>
        </asp:DataGrid>
      </div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
