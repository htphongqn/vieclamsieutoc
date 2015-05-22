<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTV.Master" AutoEventWireup="true" CodeBehind="dangkyNTV.aspx.cs" Inherits="CatTrang.vi_vn.dangkyNTV" %>
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
            <h2><span class="navBarTxt">Đăng ký</span></h2>
          </div>
          <%--<div class="navBarRight red" style="font-weight: 700">ĐT hỗ trợ: 1900 585 808 PHÍM 8</div>--%>
          <div class="clear"></div>
        </div>
        <p class="number_jobs">Vui lòng điền đầy đủ thông tin<br />
          Những mục có dấu <span class="red">*</span> là bắt buộc phải nhập </p>
        <!--Login Infomation-->
        <div class="block">
          <h3 class="blocktitle main-title">Thông tin đăng nhập</h3>
          <div class="block_rec bl_white">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Email đăng nhập: <span class="red">*</span></b></div>
              <div class="tbUser_col col_r">
                <input type="text" style="width:210px" id="txtEmailUser" runat="server" name="c_ten_dang_nhap" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập email đăng nhập!"
                ControlToValidate="txtEmailUser" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                      ValidationGroup="G40" Display="None"  ControlToValidate="txtEmailUser"
                      ErrorMessage="Email đăng nhập không đúng định dạng" 
                      ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Mật khẩu: <span class="red">*</span></b></div>
              <div class="tbUser_col col_r">
                <input type="password" style="width:210px" id="txtPassword" runat="server" name="c_mat_khau" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập mật khẩu!"
                ControlToValidate="txtPassword" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Xác nhận lại mật khẩu: <span class="red">*</span></b></div>
              <div class="tbUser_col col_r">
                <input type="password" style="width:210px" id="txtPassword_2" runat="server" name="c_mat_khau_2" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập xác nhận mật khẩu!"
                ControlToValidate="txtPassword_2" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
                  <asp:CompareValidator ID="CompareValidator1" runat="server" 
                      ErrorMessage="Mật khẩu xác nhận không khớp!" ValidationGroup="G40" 
                      Display="None" ControlToCompare="txtPassword" ControlToValidate="txtPassword_2"></asp:CompareValidator>
              </div>
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--Personal Infomation-->
        <div class="block">
          <h3 class="blocktitle main-title">Thông tin cá nhân</h3>
          <div class="block_rec bl_white">
            <%--<div id="avatar" class="avatar"> 
            <img width="100" height="100" class="userImg" alt="" src="../Images/noimage.jpg">
              <div style="padding-top: 10px" class="ft_11 red"> Bạn phải có tài khoản trên trang Việc làm mới sử dụng được chức năng upload ảnh </div>
            </div>--%>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Họ và tên (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" style="width:210px" id="txtFullName" runat="server" name="c_ten_day_du" class="textbox">
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
              <div class="tbUser_col"><b>Tình trạng hôn nhân:</b> </div>
              <div class="tbUser_col col_r">
                <asp:DropDownList ID="ddlTinhtrangHonnhan" runat="server" style="width:220px" CssClass="dropbox">
                    <asp:ListItem Text="Độc thân" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Đã có gia đình" Value="2"></asp:ListItem>
                </asp:DropDownList>
              </div>
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--Contact Infomation-->
        <div class="block">
          <h3 class="blocktitle main-title">Thông tin liên hệ</h3>
          <div class="block_rec bl_white">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Địa chỉ (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" id="txtAddress" runat="server" name="c_dia_chi_lien_he" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Chưa nhập địa chỉ!"
                ControlToValidate="txtAddress" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Tỉnh/ thành phố (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <asp:DropDownList ID="ddlCity" runat="server" CssClass="dropbox" DataTextField="Name" DataValueField="Id"  AppendDataBoundItems="true">
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
                <input type="text" id="txtPhone" runat="server" name="c_dien_thoai_lien_he" class="textbox">
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Email (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" id="txtEmail" runat="server" name="c_email_lien_he" class="textbox">
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
              <div class="tbUser_col col_r">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/vi-vn/CImage.aspx" height="35px" />
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Nhập mã bảo mật (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" id="txtCaptcha" runat="server" name="txt_ma_xac_minh" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Chưa nhập mã bảo mật!"
                ControlToValidate="txtCaptcha" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--Terms Of Use-->
        <div class="block">
          <h3 class="blocktitle main-title">Thỏa thuận sử dụng</h3>
          <div class="block_rec bl_white">
            <div class="terms">Xin hãy đọc cẩn thận những điều khoản của Bản thỏa thuận sử dụng khi truy cập vào Website việc làm vieclamsieutoc Việc bạn truy cập, sử dụng trang web vieclamsieutoc có nghĩa là bạn chấp nhận, đồng ý bị ràng buộc với điều khoản, điều kiện của Bản thỏa thuận sử dụng này. <br>
              <br>
              1. Về tài khoản sử dụng ( account ): <br>
              <br>
              Khi đăng ký tài khoản, bạn cần phải cung cấp một số thông tin quan trọng như : tên tuổi, địa chỉ, e-mail, … Những thông tin này sẽ được sử dụng vào mục đích xác nhận chính xác về bạn khi phát sinh các vấn đề như quên tên đăng nhập hoặc mật khẩu đăng nhập v.v. Những trường hợp điền thiếu thông tin trên hoặc thông tin sai sự thật sẽ không được giải quyết. <br>
              <br>
              2. Tuyệt đối không sử dụng bất kỳ chương trình, công cụ hay hình thức nào khác để can thiệp vào hệ thống hay làm thay đổi cấu trúc dữ liệu. Mọi vi phạm khi phát hiện sẽ bị xử lý theo pháp luật. <br>
              <br>
              3. Nghiêm cấm việc phát tán, truyền bá hay cổ vũ cho bất kỳ hoạt động nào nhằm can thiệp, phá hoại và xâm nhập (hack, cheat…) vào dữ liệu cũng như hệ thống máy chủ của vieclamsieutoc. Tùy theo mức độ vi phạm, thành viên sẽ bị tước bỏ mọi quyền lợi hoặc bị truy tố trước pháp luật. <br>
              <br>
              4. Nghiêm cấm việc phát tán các tranh ảnh, nội dung liên quan văn hóa phẩm đồi trụy trái với thuần phong mỹ tục của dân tộc Việt nam. Tùy theo mức độ vi phạm, thành viên sẽ bị tước bỏ mọi quyền lợi hoặc bị truy tố trước pháp luật. <br>
              <br>
              5. Khi phát hiện ra lỗi của hệ thống, xin vui lòng thông báo cho đội ngũ quản trị Hệ thống vieclamsieutoc theo địa chỉ vieclam@vieclamsieutoc.com <br>
              <br>
              6. Hệ thống tuyển dụng trực tuyến vieclamsieutoc không chấp nhận việc mua bán hoặc chuyển nhượng tài khoản của vieclamsieutoc bằng tiền thật hoặc hiện kim ở trong lẫn ngoài vieclamsieutoc. <br>
              <br>
              7. Tuyệt đối nghiêm cấm hành vi xúc phạm người khác dưới bất kỳ hình thức nào (nhạo báng, chê bai, kỳ thị tôn giáo, giới tính, sắc tộc….). <br>
              <br>
              8. Tuyệt đối nghiêm cấm mọi hành vi mạo nhận hay cố ý làm người khác tưởng lầm mình là một thành viên khác của Hệ thống tuyển dụng trực tuyến vieclamsieutoc. Tùy theo mức độ vi phạm, thànhviên sẽ bị tước bỏ mọi quyền lợi hoặc bị truy tố trước pháp luật. <br>
              <br>
              9. Trong những trường hợp bất khả kháng như chập điện, hư hỏng phần cứng, phần mềm, hoặc do thiên tai .v.v. người dùng phải chấp nhận những thiệt hại nếu có. <br>
              <br>
              10. vieclamsieutoc có toàn quyền xóa, sửa chữa hay thay đổi các dữ liệu, thông tin người dùng trong các trường hợp người đó vi phạm những qui định kể trên mà không cần sự đồng ý . <br>
              <br>
              11. Tuyệt đối nghiêm cấm mọi hành vi tuyên truyền, chống phá và xuyên tạc chính quyền. Trường hợp bị phát hiện, không những bị xóa bỏ tài khoản mà chúng tôi sẽ cung cấp thông tin của người đó cho các cơ quan pháp luật. <br>
              <br>
              12. Tuyệt đối không bàn luận về Chính trị . <br>
              <br>
              13. Không có những hành vi, thái độ làm tổn hại đến uy tín của Hệ thống tuyển dụng trực tuyến vieclamsieutoc dưới bất kỳ hình thức nào, phương thức nào. Mọi vi phạm sẽ bị bị xử lí thông qua hình thức tước bỏ mọi quyền lợi hoặc truy tố trước pháp luật. <br>
              <br>
              14. vieclamsieutoc hoàn toàn không chịu trách nhiệm về mọi giao dịch thỏa thuận trên Hệ thống. Chúng tôi sẽ không chịu trách nhiệm về bất kỳ sự mất mát, thiệt hại hay khiếu nại nào liên quan đến việc thỏa thuận, trao đổi thông tin giữa các bạn. <br>
              <br>
              15. Mọi thông tin cá nhân mà bạn không công khai sẽ được chúng tôi bảo mật, không tiết lộ ra ngoài. Chúng tôi không bán hay trao đổi những thông tin này với bất kỳ một bên thứ ba nào khác. <br>
              <br>
              16. Nghiêm cấm tổ chức các hình thức cá cược, cờ bạc có dính dáng đến tiền. <br>
              <br>
              17. Những thông tin không muốn công khai của thành viên sẽ được bảo mật nhưng trong trường hợp cơ quan pháp luật yêu cầu, chúng tôi buộc phải cung cấp những thông tin này cho các cơ quan pháp luật. <br>
              <br>
              18. Khi phát hiện những vi phạm đã nêu ở các mục trên,tùy theo mức độ nghiêm trọng của hậu quả gây ra, vieclamsieutoc có quyền cung cấp thông tin cá nhân của đối tượng đó cho các cơ quan thẩm quyền để truy tố trước pháp luật . <br>
              <br>
              19. vieclamsieutoc có thể thay đổi, bổ sung hoặc sửa chữa thỏa thuận này bất cứ lúc nào và sẽ công bố rõ trên trang chủ của website vieclamsieutoc. </div>
            <div class="padding1">
              <asp:CheckBox ID="chkAcept" runat="server" Checked="true" />
              &nbsp;<span>Tôi đã đọc và đồng ý với thỏa thuận sử dụng</span>
            </div>
            <div class="tbUser_row padding1">
              <asp:Button Text="Đăng ký ngay" id="btnDangky" runat="server" 
                    CssClass="btn_green02" ValidationGroup="G40" onclick="btnDangky_Click" />
              &nbsp;&nbsp;
              <input type="button" title="Xóa dữ liệu đã nhập!" onclick="reset();" value="Làm lại" class="btn_green02">
                  <script type="text/javascript">
                      function reset() {
                          var emailuser = document.getElementById("<%= txtEmailUser.ClientID %>");
                          var pass = document.getElementById("<%= txtPassword.ClientID %>");
                          var pass_2 = document.getElementById("<%= txtPassword_2.ClientID %>");
                          var fullname = document.getElementById("<%= txtFullName.ClientID %>");
                          var birth = document.getElementById("<%= txtBirthday.ClientID %>");
                          var address = document.getElementById("<%= txtAddress.ClientID %>");
                          var phone = document.getElementById("<%= txtPhone.ClientID %>");
                          var email = document.getElementById("<%= txtEmail.ClientID %>");
                          var captcha = document.getElementById("<%= txtCaptcha.ClientID %>");
                          emailuser.value = pass.value = pass_2.value = fullname.value = birth.value = address.value = phone.value = email.value = captcha.value = "";
                      }
                </script>
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
