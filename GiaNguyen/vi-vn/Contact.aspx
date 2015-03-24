<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Default.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="CatTrang.vi_vn.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../vi-vn/Styles/contact.css" rel="stylesheet" type="text/css" />
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- #Main -->
    <asp:Label ID="lblresult" runat="server"></asp:Label>
    <!--Main Column-->
    <div class="box">
        <div class="box_ct">
            <div id="info_contact">
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </div>
            <!--Form Contact-->
            <div id="contactus" class="form_web">
                <div class="row_contact">
                    <label class="left_row">
                        Họ tên:<span class="required">*</span></label>
                    <div class="right_row">
                        <input type="text" class="inputbox" id="Txtname" runat="server">
                        <br>
                        <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ tên"
                            ControlToValidate="Txtname" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row_contact">
                    <label class="left_row">
                        Địa chỉ:</label>
                    <div class="right_row">
                        <input type="text" class="inputbox" id="Txtaddress" runat="server">
                    </div>
                </div>
                <div class="row_contact">
                    <label class="left_row">
                        Điện thoại:<span class="required">*</span></label>
                    <div class="right_row">
                        <input type="text" class="inputbox" id="Txtphone" runat="server">
                        <br>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập số điện thoại"
                            ControlToValidate="Txtphone" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row_contact">
                    <label class="left_row">
                        Email:<span class="required">*</span></label>
                    <div class="right_row">
                        <input type="text" class="inputbox" id="txtEmail" runat="server">
                        <br>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập email"
                            ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row_contact">
                    <label class="left_row">
                        Tiêu đề:<span class="required">*</span></label>
                    <div class="right_row">
                        <input type="text" class="inputbox" id="txttitle" runat="server">
                        <br>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập tiêu đề"
                            ControlToValidate="txttitle" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row_contact">
                  <div style="width:73%" class="fl">
                    <label class="left_row"> Nội dung liên hệ:<span class="required">*</span></label>
                    <div class="right_row">
                      <textarea rows="10" cols="45" id="txtContent" name="ctl00$ContentPlaceHolder1$txtContent" runat="server"></textarea>
                    </div>
                  </div>
                  <div style="width:25%" class="fr">
                    <label class="left_row"> Mã an toàn:<span class="required">*</span></label>
                    <div class="right_row">
                      <input type="text" class="inputbox" id="txtCapcha" name="ctl00$ContentPlaceHolder1$txtCapcha" runat="server">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa nhập mã bảo vệ"
                            ControlToValidate="txtCapcha" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                      <div class="fl" style="background-color: White; width: 102%; margin-top: 10px">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../vi-vn/CImage.aspx" height="35px" />
                      </div>
                    </div>
                    <div class="row_contact"> 
                        <asp:LinkButton ID="Lbthanhtoan" runat="server" class="send_cmt font1" OnClick="Lbthanhtoan_Click"
                            ValidationGroup="G40">Gửi</asp:LinkButton>
                        <a class="send_cmt reset_btn font1" onclick="reset();" href="javascript:void(0)"> Làm lại</a> 
                    </div>
                  </div>
                </div>

                <div style="text-align: center">
                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="G40" />
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Email Định Dạng Chưa Đúng" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
                  <br />
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txtphone"
                        ErrorMessage="Số điện thoại định dạng chưa đúng" SetFocusOnError="True" ValidationExpression="^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d$"
                        ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
                  <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </div>
            <!--End Form Contact-->
            <!--Map-->
            <div id="map" class="cf">
                <asp:Literal ID="liLoadMap" runat="server"></asp:Literal>
            </div>
            <!--End Map-->
        </div>
    </div>
    <!--end Main Column-->
<script type="text/javascript">
    function reset() {
        var name = document.getElementById("<%= Txtname.ClientID %>");
        var email = document.getElementById("<%= txtEmail.ClientID %>");
        var add = document.getElementById("<%= Txtaddress.ClientID %>");
        var desc = document.getElementById("<%= txtContent.ClientID %>");
        var phone = document.getElementById("<%= Txtphone.ClientID %>");
        var title = document.getElementById("<%= txttitle.ClientID %>");
        var capcha = document.getElementById("<%= txtCapcha.ClientID %>");
        name.value = email.value = add.value = desc.value = phone.value = title.value = capcha.value = "";
    }
</script>
</asp:Content>
