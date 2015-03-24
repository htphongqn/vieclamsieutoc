<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Default.Master" AutoEventWireup="true"
    CodeBehind="cart-result.aspx.cs" Inherits="CatTrang.vi_vn.cart_result" %>

<%@ Register Src="../UIs/Path.ascx" TagName="Path" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path">
        <a href="/">Trang chủ</a> » <a href="/gio-hang.html">Giỏ hàng</a></div>
    <div class="box" id="cart">
    <div class="font3 box_Tab tab_2"><span>Giỏ hàng</span></div>
        <div class="box_ct">
            <table width="100%" class="page_cart">
                <tbody>
                    <tr>
                        <th style="background-color: #f1f1f1">
                            STT
                        </th>
                        <th style="background-color: #f1f1f1">
                            Tên sản phẩm
                        </th>
<%--                        <th style="background-color: #f1f1f1; width: 140px">
                            Dung tích
                        </th>--%>
                        <th style="background-color: #f1f1f1; width: 90px">
                            Đơn giá (VNĐ)
                        </th>
                        <th style="background-color: #f1f1f1; width: 90px">
                            Số lượng
                        </th>
                        <th style="background-color: #f1f1f1; width: 100px">
                            Thành tiền (VNĐ)
                        </th>
                        <th style="background-color: #f1f1f1">
                            Xóa
                        </th>
                    </tr>
                    <asp:Repeater ID="Rpgiohang" runat="server" OnItemCommand="Rpgiohang_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td >
                                        <%# getorder()%>
                                        <input type="hidden" value='<%# Eval("news_id") %>' id="newsid" runat="server" />
                                    </td>
                                    <td align="center">
                                        <img style="max-width: 150px" alt="" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>"><br />
                                        <%# Eval("NEWS_TITLE") %>
                                    </td>
<%--                                    <td align="center">
                                        
                                    </td>--%>
                                    <td align="right">
                                        <%# String.Format("{0:0,0 VNĐ}", Eval("Basket_Price")).Replace(",",".")%>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox ID="Txtquantity" runat="server" Text='<%# Eval("Basket_quantity")  %>'
                                            onkeyup="this.value=formatNumeric(this.value);" onblur="this.value=formatNumeric(this.value);"></asp:TextBox>
                                    </td>
                                    <td align="right">
                                        <%# String.Format("{0:0,0 VNĐ}",Convert.ToInt32(Eval("Basket_Price"))*Convert.ToInt32(Eval("Basket_Quantity"))).Replace(",",".") %>
                                    </td>
                                    <td align="center">
                                        <asp:LinkButton ID="LinkXoa" runat="server" CommandName="delete" CommandArgument='<%# Eval("news_id") %>'><img align="absmiddle" src="../vi-vn/Images/remove.png"></asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
<%--
                    <tr>
                        <td colspan="5" align="right">
                            <strong>Tiền hàng</strong>
                        </td>
                        <td align="right">
                            1.495.000
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" align="right">
                            Phí vận chuyển
                        </td>
                        <td align="right">
                            Miễn phí
                        </td>
                    </tr>--%>
                    <tr>
                        <td colspan="5" align="right">
                            <strong>Tổng đơn hàng</strong>
                        </td>
                        <td align="right" style="font-weight: bold; color: #ff0000; font-size: 16px">
                            <asp:Label ID="Lbtotal" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div style="padding: 10px 0;">
                <asp:LinkButton ID="Lbcapnhap" runat="server" style="width: 120px;"
                            class="buy_bt fl" OnClick="Lbcapnhap_Click">CẬP NHẬT GIỎ HÀNG</asp:LinkButton>
                <a href="thanh-toan.html">
                    <div class="buy_bt fl" id="btn-buy" style="width: 120px; margin-left: 20px;">
                        THANH TOÁN</div>
                </a>
                <a class="buy_bt continue fr" href="/" style="width: 120px; margin-right: 10px;">Tiếp
                    tục mua hàng</a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function formatNumeric(num) {
            num = repStr(num.toString());
            if (isNaN(num)) {
                num = "0";
            }
            return (num);
        }
        function repStr(str) {
            var strResult = "";
            for (i = 0; i < str.length; i++)
                if ((str.charAt(i) != "$") && (str.charAt(i) != ",")) {
                    strResult = strResult + str.charAt(i)
                }
            return strResult;
        }
    </script>
</asp:Content>
