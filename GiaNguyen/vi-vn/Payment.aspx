<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Default.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="CatTrang.vi_vn.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../vi-vn/Styles/contact.css" rel="stylesheet" type="text/css" />
    <div id="content">
        <div id="content-detail">
            <div class="path">
                <a href="/">Trang chủ</a> » <a href="/thanh-toan.html">Thanh toán</a></div>
            <div class="box">
                <div class="font3 box_Tab tab_2"><span>Thanh toán</span></div>
                <div class="contactus" style="margin-top: 20px">
                    <table width="100%" border="0" cellpadding="3" cellspacing="0" align="center">
                        <tr>
                            <td width="27" align="right">
                                Hình thức thanh toán:<span class="required">*</span>
                            </td>
                            <td width="2">
                                &nbsp;
                            </td>
                            <td width="70%">
                                <asp:DropDownList ID="ddlPayment" runat="server" Width="100%" Style="font-weight: normal;
                                    padding: 5px">
                                    <asp:ListItem Value="0">--- Chọn hình thức thanh toán ---</asp:ListItem>
                                    <asp:ListItem Value="1">Nhận hàng tại cửa hàng</asp:ListItem>
                                    <asp:ListItem Value="2">Giao hàng tại nhà</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa chọn hình thức thanh toán"
                                    ControlToValidate="ddlPayment" Display="Dynamic" ForeColor="Red" ValidationGroup="G5"
                                    InitialValue="0">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Họ và tên:<span class="required">*</span>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <input type="text" name="txtName" id="txtName" runat="server" class="inputbox" />
                                <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ tên"
                                    ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Địa chỉ:<span class="required">*</span>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <textarea type="text" name="txtAddress" id="txtAddress" runat="server" class="inputbox"></textarea>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập địa chỉ"
                                    ControlToValidate="txtAddress" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Số điện thoại:<span class="required">*</span>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <input type="text" name="txtPhone" id="txtPhone" runat="server" class="inputbox" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập số điện thoại"
                                    ControlToValidate="txtPhone" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Email:<span class="required">*</span>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <input type="text" name="txtEmail" id="txtEmail" runat="server" class="inputbox" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập Email"
                                    ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Ghi chú:
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <textarea type="text" name="txtDesc" id="txtDesc" runat="server" class="inputbox"
                                    style="height: 150px"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                                    ShowSummary="False" ValidationGroup="G5" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <div style="padding: 10px 0;">
                                <asp:LinkButton ID="Lbthanhtoan" runat="server" class="buy_bt fl" style="width: 120px;"
                                    OnClick="Lbthanhtoan_Click" ValidationGroup="G5">Thanh toán</asp:LinkButton>
                                <a href="javascript:void(0)" onclick="reset();" class="buy_bt fl" style="width: 120px; margin-left: 20px;">
                                    Làm lại</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="text-align: center">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Email Định Dạng Chưa Đúng" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ForeColor="Red" ValidationGroup="G5"></asp:RegularExpressionValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhone"
                        ErrorMessage="Số điện thoại định dạng chưa đúng" SetFocusOnError="True" ValidationExpression="^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d$"
                        ForeColor="Red" ValidationGroup="G5"></asp:RegularExpressionValidator>
                </div>
            </div>
        </div>
    </div>
    <!--end Payment-->
    <script type="text/javascript">
        function reset() {
            var name = document.getElementById("<%= txtName.ClientID %>");
            var email = document.getElementById("<%= txtEmail.ClientID %>");
            var add = document.getElementById("<%= txtAddress.ClientID %>");
            var desc = document.getElementById("<%= txtDesc.ClientID %>");
            var phone = document.getElementById("<%= txtPhone.ClientID %>");
            name.value = email.value = add.value = desc.value = phone.value = "";
        }
    </script>
</asp:Content>

