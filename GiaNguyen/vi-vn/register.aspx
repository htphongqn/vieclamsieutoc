<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Default.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="CatTrang.vi_vn.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="main">
    <link rel="Stylesheet" type="text/css" href="../vi-vn/Styles/process_payment.css" />
    <div class="path"> <a href="/">Trang chủ</a> » <a href="dang-ky.html">Đăng ký</a></div>
    <div class="account">
      <!--Regis-->
      <div class="regis_form form">
        <div class="form_header"> <span class="form_subtitle">Đăng ký tài khoản mới </span> </div>
        <div class="row">
          <label class="item_title" for="formEmail">Email<span class="required">*</span></label>
          <input class="inputbox" placeholder="Vui lòng nhập email" type="text" name="txtEmail" id="txtEmail" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Chưa nhập Email" ForeColor="Red" 
                ValidationGroup="G10" ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
        </div>
        <div class="row">
          <label class="item_title"for="formFullname">Họ tên<span class="required">*</span></label>
          <select name="Gender" id="Gender" runat="server">
            <option value="" selected="selected">--</option>
            <option value="0">Anh</option>
            <option value="1">Chị</option>
          </select>
          <input class="inputbox" placeholder="Vui lòng nhập họ tên" type="text" name="txtName" id="txtName" style="width: 120px" runat="server" />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="Chưa nhập họ tên" ForeColor="Red" 
                ValidationGroup="G10" ControlToValidate="txtName">*</asp:RequiredFieldValidator>
        </div>
        <div class="row">
          <label class="item_title" for="formPassword">Mật khẩu<span class="required">*</span></label>
          <input class="inputbox" placeholder="Vui lòng nhập mật khẩu" name="txtPassword1" id="txtPassword1" type="password" runat="server"/>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ErrorMessage="Chưa nhập mật khẩu" ForeColor="Red" 
                ValidationGroup="G10" ControlToValidate="txtPassword1">*</asp:RequiredFieldValidator>
        </div>
         <div class="row">
          <label class="item_title item_tt_other" for="formNumberphone">Điện thoại liên lạc<span class="required">*</span></label>
          <input class="inputbox" placeholder="Vui lòng nhập điện thoại" type="text" name="formNumberphone" id="txtPhone" runat="server"/>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ErrorMessage="Chưa nhập số điện thoại" ForeColor="Red" 
                ValidationGroup="G10" ControlToValidate="txtPhone">*</asp:RequiredFieldValidator>
        </div>
        <div class="row">
          <label class="item_title item_tt_other" for="formPassword_2">Nhập lại mật khẩu<span class="required">*</span></label>
          <input class="inputbox" placeholder="Vui lòng xác nhận mật khẩu" name="txtRePassword" id="txtRePassword" type="password" runat="server"/>
        </div>
       
        <div class="row">
          <label class="item_title" for="formDateBirth">Ngày sinh<span class="required">*</span></label>
          <select name="BirthDate_Day" id="BirthDate_Day" runat="server"><option value="">Ngày</option>
            <option value="01">1</option>
            <option value="02">2</option>
            <option value="03">3</option>
            <option value="04">4</option>
            <option value="05">5</option>
            <option value="06">6</option>
            <option value="07">7</option>
            <option value="08">8</option>
            <option value="09">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
            <option value="26">26</option>
            <option value="27">27</option>
            <option value="28">28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
            </select>
            <select name="BirthDate_Month" id="BirthDate_Month" runat="server"><option value="">Tháng</option>
            <option value="01">1</option>
            <option value="02">2</option>
            <option value="03">3</option>
            <option value="04">4</option>
            <option value="05">5</option>
            <option value="06">6</option>
            <option value="07">7</option>
            <option value="08">8</option>
            <option value="09">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            </select>
            <select name="BirthDate_Year" id="BirthDate_Year" style="margin: 0" runat="server"><option value="">Năm</option>
            <option value="2004">2004</option>
            <option value="2003">2003</option>
            <option value="2002">2002</option>
            <option value="2001">2001</option>
            <option value="2000">2000</option>
            <option value="1999">1999</option>
            <option value="1998">1998</option>
            <option value="1997">1997</option>
            <option value="1996">1996</option>
            <option value="1995">1995</option>
            <option value="1994">1994</option>
            <option value="1993">1993</option>
            <option value="1992">1992</option>
            <option value="1991">1991</option>
            <option value="1990">1990</option>
            <option value="1989">1989</option>
            <option value="1988">1988</option>
            <option value="1987">1987</option>
            <option value="1986">1986</option>
            <option value="1985">1985</option>
            <option value="1984">1984</option>
            <option value="1983">1983</option>
            <option value="1982">1982</option>
            <option value="1981">1981</option>
            <option value="1980">1980</option>
            <option value="1979">1979</option>
            <option value="1978">1978</option>
            <option value="1977">1977</option>
            <option value="1976">1976</option>
            <option value="1975">1975</option>
            <option value="1974">1974</option>
            <option value="1973">1973</option>
            <option value="1972">1972</option>
            <option value="1971">1971</option>
            <option value="1970">1970</option>
            <option value="1969">1969</option>
            <option value="1968">1968</option>
            <option value="1967">1967</option>
            <option value="1966">1966</option>
            <option value="1965">1965</option>
            <option value="1964">1964</option>
            <option value="1963">1963</option>
            <option value="1962">1962</option>
            <option value="1961">1961</option>
            <option value="1960">1960</option>
            <option value="1959">1959</option>
            <option value="1958">1958</option>
            <option value="1957">1957</option>
            <option value="1956">1956</option>
            <option value="1955">1955</option>
            <option value="1954">1954</option>
            <option value="1953">1953</option>
            <option value="1952">1952</option>
            <option value="1951">1951</option>
            <option value="1950">1950</option>
            <option value="1949">1949</option>
            <option value="1948">1948</option>
            <option value="1947">1947</option>
            <option value="1946">1946</option>
            <option value="1945">1945</option>
            <option value="1944">1944</option>
            <option value="1943">1943</option>
            <option value="1942">1942</option>
            <option value="1941">1941</option>
            <option value="1940">1940</option>
            <option value="1939">1939</option>
            <option value="1938">1938</option>
            <option value="1937">1937</option>
            <option value="1936">1936</option>
            <option value="1935">1935</option>
            <option value="1934">1934</option>
            </select>
        </div>
       
        <div class="row form_footer">
          <label class="item_title"></label>
          <%--<asp:LinkButton ID="IbtnFinish" runat="server" class="btn_detail" OnClick="IbtnFinish_Click" ValidationGroup="G8">Hoàn thành</asp:LinkButton>--%>
          <asp:Button ID="btnRegister" runat="server" Text="Hoàn thành" class="btn_detail" 
                onclick="btnRegister_Click" ValidationGroup="G10"/>
         <a class="link_register" href="/dang-nhap.html">Đã đăng ký?</a>
         <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                                ShowSummary="False" ValidationGroup="G10" />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txtphone"
                ErrorMessage="Số điện thoại định dạng chưa đúng" SetFocusOnError="True" ValidationExpression="^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d$"
                ForeColor="Red" ValidationGroup="G10"></asp:RegularExpressionValidator>
         <br />
         <div style="clear:both;"><asp:Label ID="Labelerrors" runat="server" ForeColor="Red"></asp:Label></div>
        </div>
      </div>
      <!--End Regis-->
      <div class="cf"></div>
    </div>
  </div>
</asp:Content>
