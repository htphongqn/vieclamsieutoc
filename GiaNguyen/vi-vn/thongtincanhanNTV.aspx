<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTV.Master" AutoEventWireup="true" CodeBehind="thongtincanhanNTV.aspx.cs" Inherits="CatTrang.vi_vn.thongtincanhanNTV" %>
<%@ Register src="~/UIs/sidebar_NTV.ascx" tagname="sidebar_NTV" tagprefix="uc2" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="page" id="recruitment"> 
    <!--Main-->
    <div id="main">
      <div style="float: left; width: 670px" id="content_1"> 
        <!--NavBar-->
        <div class="navBar">
          <div class="navBarLeft">
            <h2><span class="navBarTxt">Thông tin Người tìm việc</span></h2>
          </div>
          <%--<div class="navBarRight"><a href="" class="effective_rec_link"><img src="../Images/arrow_l_bg_rec.png" alt="" style="margin-right: 3px" />Tìm việc hiệu quả</a></div>--%>
          <div class="clear"></div>
        </div>
        <%--<p class="number_jobs" style="color: #293790; font-size:14px">Thông tin cá nhân của bạn đã được duyệt!</p>--%>
        <!--Login Infomation-->
        <div class="block">
          <h3 class="blocktitle main-title">Thông tin đăng nhập</h3>
          <div class="block_rec bl_white">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Email đăng nhập:</b></div>
              <div class="tbUser_col col_r"><asp:Literal ID="lbEmailUser" runat="server"></asp:Literal><br />
                <a title="" href="/ntv-doi-mat-khau">[Đổi mật khẩu]</a> </div>
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--Personal Infomation-->
        <div class="block">
          <h3 class="blocktitle main-title">Thông tin cá nhân</h3>
          <div class="block_rec bl_white" style="padding-left: 22%">
            <div id="avatar" class="avatar"> 
            <asp:Image ID="imgAvata" runat="server" Width="100" Height="100" CssClass="userImg" ImageUrl="../Images/noimage.jpg" />
            <br>
                <asp:LinkButton ID="lnkRemoveLogo" runat="server" CssClass="red" CausesValidation="false" OnClientClick="return confirm('Bạn có chắc chắn xóa ảnh đại diện không?');" ToolTip="Xóa hẳn file ảnh đại diện" Text="Xóa ảnh" onclick="lnkRemoveLogo_Click"></asp:LinkButton>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Họ và tên (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" id="txtFullName" runat="server" style="width:210px" name="txt_ho_ten" class="textbox" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập họ tên!"
                ControlToValidate="txtFullName" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Ngày sinh (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <link rel="stylesheet" href="../Styles/BeatPicker.min.css" />
                <script src="../Scripts/BeatPicker.min.js"></script>
                <input type="text" data-beatpicker="true" data-beatpicker-position="['bottom','*']" data-beatpicker-module="clear" data-beatpicker-format="['DD','MM','YYYY'],separator:'/'" class="textbox date depDate hasDatepicker fl" id="txtBirthday" name="flights-checkin"  runat="server" style="width:150px;"/>
                <%--<input type="text" id="txtBirthday" runat="server" class="textbox" style="width:150px; background: url(../Images/iconCalendar.gif) 133px top no-repeat">--%>
                (dd-mm-yyyy)
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa nhập ngày sinh!"
                ControlToValidate="txtBirthday" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Giới tính:</b> </div>
              <div class="tbUser_col col_r">
                <asp:RadioButtonList ID="rdblSex" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Text="Nam" Value="1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Nữ" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Khác" Value="3"></asp:ListItem>
                </asp:RadioButtonList>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Ảnh đại diện:</b> </div>
              <div class="tbUser_col col_r">
                <asp:FileUpload ID="file_logo" runat="server" /><br>
                <span class="ft_11">(Dạng file ảnh .jpg .gif .png, dung lượng &lt;=300Kb)</span>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Tình trạng hôn nhân:</b> </div>
              <div class="tbUser_col col_r">
                <asp:DropDownList ID="ddlTinhtrangHonnhan" runat="server" style="width:220px" CssClass="dropbox">
                    <asp:ListItem Text="Độc thân" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Đã có gia đình" Value="2"></asp:ListItem>
                </asp:DropDownList>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Địa chỉ (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" id="txtAddress" runat="server" style="width:210px" name="c_dia_chi_lien_he" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Chưa nhập địa chỉ!"
                ControlToValidate="txtAddress" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Tỉnh/ thành phố (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <asp:DropDownList ID="ddlCity" runat="server" style="width:220px" CssClass="dropbox" DataTextField="Name" DataValueField="Id"  AppendDataBoundItems="true">
                    <asp:ListItem Text="-- Chọn tỉnh --" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Chưa chọn tỉnh/thành phố!"
                ControlToValidate="ddlCity" Display="None" ForeColor="Red" ValidationGroup="G40" 
                      InitialValue="0"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Số điện thoại:</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" id="txtPhone" runat="server" style="width:210px" name="c_dien_thoai_lien_he" class="textbox">
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Email (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" id="txtEmail" runat="server" style="width:210px" name="c_email_lien_he" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Chưa nhập email liên hệ!"
                ControlToValidate="txtEmail" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" 
                      ValidationGroup="G40" Display="None" 
                      ErrorMessage="Email liên hệ không đúng định dạng" 
                      ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Mã bảo mật:</b> </div>
              <div class="tbUser_col col_r"> <asp:Image ID="Image1" runat="server" ImageUrl="~/vi-vn/CImage.aspx" height="35px" /> </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Nhập mã bảo mật (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" id="txtCaptcha" runat="server" style="width:210px" name="txt_ma_xac_minh" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Chưa nhập mã bảo mật!"
                ControlToValidate="txtCaptcha" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row" style="padding: 15px 0 15px 180px">
              <asp:Button Text="Cập nhật" id="btnCapnhat" runat="server" 
                    CssClass="btn_green02" ValidationGroup="G40" onclick="btnCapnhat_Click" />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="G40" />
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
      </div>
      <uc2:sidebar_NTV ID="sidebar_NTV1" runat="server" />
      <div class="clearfix"></div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
