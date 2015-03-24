<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteVi.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="CatTrang.vi_vn.contactus" %>
<%@ Register src="~/UIs/projectsLeft_vi.ascx" tagname="projectsLeft_vi" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="padding10">
      <div class="path"><a href="/">Trang chủ</a> &raquo; <a href="lien-he.html">Liên hệ</a></div>
      <!--Main Column-->
      <div class="fr" id="main_col" style="width:100%">
        <!--Contact-->
        <link href="Styles/contact.css" rel="stylesheet" type="text/css" />
        <div class="box">
          <div class="box_Tab">Liên hệ</div>
          <div class="box_ct">
            <div class="fullsize fl" id="info_contact">
              <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </div>
            <!--Form Contact-->
            <div class="fullsize form_web fr" id="contactus">
              <div class="row_account">
                <label class="item_title"> Họ tên:<span class="required">*</span></label>
                <input type="text" class="inputbox" id="Txtname" runat="server">
                        <br>
                        <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ tên"
                            ControlToValidate="Txtname" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
              </div>
              <div class="row_account">
                <label class="item_title"> Địa chỉ:</label>
                <input type="text" class="inputbox" id="Txtaddress" runat="server">
              </div>
              <div class="row_account">
                <label class="item_title"> Điện thoại:<span class="required">*</span></label>
                <input type="text" class="inputbox" id="Txtphone" runat="server">
                        <br>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập số điện thoại"
                            ControlToValidate="Txtphone" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
              </div>
              <div class="row_account">
                <label class="item_title"> Email:<span class="required">*</span></label>
                <input type="text" class="inputbox" id="txtEmail" runat="server">
                        <br>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập email"
                            ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
              </div>
              <div class="row_account">
                <label class="item_title"> Nội dung liên hệ:<span class="required">*</span></label>
                <textarea rows="10" cols="45" id="txtContent" name="ctl00$ContentPlaceHolder1$txtContent" runat="server" class="inputbox"></textarea>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập nội dung liên hệ"
                            ControlToValidate="txtContent" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
              </div>
              <div class="row_account" style="float: left">
                <label class="item_title"> Mã an toàn:<span class="required">*</span></label>
                <input type="text" class="inputbox" id="txtCapcha" name="ctl00$ContentPlaceHolder1$txtCapcha" runat="server">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa nhập mã bảo vệ"
                            ControlToValidate="txtCapcha" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/vi-vn/CImage.aspx" height="35px" />
                </div>
              <div class="row_account"> 
              <asp:Label ID="lblresult" runat="server"></asp:Label>
              <asp:LinkButton ID="Lbthanhtoan" runat="server" class="btn_web send_cmt" OnClick="Lbthanhtoan_Click"
                            ValidationGroup="G40">Gửi</asp:LinkButton>
              <a class="btn_web send_cmt reset_btn" onclick="reset();" href="javascript:void(0)"> Làm lại</a> 
              </div>
            </div>
            <!--End Form Contact-->
          </div>
        </div>
        <!--End Contact-->

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
      <!--End Main Column-->
      <!--Sidebar-->
      <%--<uc2:projectsLeft_vi ID="projectsLeft_vi1" runat="server" />--%>
      <!--End Sidebar-->
    </div>
    <script type="text/javascript">
        function reset() {
            var name = document.getElementById("<%= Txtname.ClientID %>");
            var email = document.getElementById("<%= txtEmail.ClientID %>");
            var add = document.getElementById("<%= Txtaddress.ClientID %>");
            var desc = document.getElementById("<%= txtContent.ClientID %>");
            var phone = document.getElementById("<%= Txtphone.ClientID %>");
            var content = document.getElementById("<%= txtContent.ClientID %>");
            var capcha = document.getElementById("<%= txtCapcha.ClientID %>");
            name.value = email.value = add.value = desc.value = phone.value = content.value = capcha.value = "";
        }
</script>
</asp:Content>
