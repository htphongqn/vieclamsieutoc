<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTD.Master" AutoEventWireup="true" CodeBehind="dangkyNTD.aspx.cs" Inherits="CatTrang.vi_vn.dangkyNTD" %>
<%@ Register src="~/UIs/sidebar_NTD.ascx" tagname="sidebar_NTD" tagprefix="uc2" %>
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
          <h3 class="blocktitle main-title">Thông tin công ty</h3>
          <div class="block_rec bl_white">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Tên công ty (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" style="width:400px" id="txt_ten_cty" runat="server" name="c_ten_cty" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập xác nhận mật khẩu!"
                ControlToValidate="txt_ten_cty" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>            
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Quy mô công ty (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <div class="ft_11 red" id="err_c_quy_mo_cty"></div>
                <asp:DropDownList ID="ddlQuymo" runat="server" CssClass="dropbox" DataTextField="Name" DataValueField="Id"  AppendDataBoundItems="true">
                    <asp:ListItem Text="-- Chọn quy mô công ty --" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Chưa chọn quy mô công ty!"
                ControlToValidate="ddlQuymo" Display="None" ForeColor="Red" ValidationGroup="G40" 
                      InitialValue="0"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Sơ lược về công ty (<span class="red"></span>):</b><br />
                <i class="ft_11">(Tối đa 1000 ký tự)</i></div>
              <div class="tbUser_col col_r">
                <textarea id="txt_mo_ta_cty" runat="server" name="txt_mo_ta_cty" style="height:160px;width:410px;" class="textArea"></textarea>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Logo công ty:</b></div>
              <div class="tbUser_col col_r">
                <asp:FileUpload ID="file_logo_cong_ty" runat="server" />
                <br>
                <i class="ft_11">( Dạng file ảnh .jpg, .gif, .png, dung lượng &lt;=300KB )</i>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Giấy phép ĐK Kinh doanh:</b></div>
              <div class="tbUser_col col_r">
                <asp:FileUpload ID="file_giay_phep_kd" runat="server" />
                <br>
                <i class="ft_11">( Dạng file .doc .docx .xls .xlsx .jpg .gif .png .pdf, dung lượng &lt;=500KB .<br>
                Nếu giấy phép kinh doanh của bạn có nhiều file, hãy ghép lại thành 1 file để up lên nhé.)</i>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Mã số thuế:</b></div>
              <div class="tbUser_col col_r">
                <input type="text" value="" id="txt_ma_so_thue" runat="server" name="txt_ma_so_thue" class="textbox">
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Địa chỉ công ty (<span class="red">*</span>):</b></div>
              <div class="tbUser_col col_r">
                <input type="text" value="" id="txt_dia_chi_cong_ty" runat="server" name="txt_dia_chi_lien_he" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa nhập Địa chỉ công ty!"
                ControlToValidate="txt_dia_chi_cong_ty" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Tỉnh/ Thành phố (<span class="red">*</span>):</b></div>
              <div class="tbUser_col col_r">
                <asp:DropDownList ID="ddlCity" runat="server" CssClass="dropbox" DataTextField="Name" DataValueField="Id"  AppendDataBoundItems="true">
                    <asp:ListItem Text="-- Chọn tỉnh --" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Chưa chọn tỉnh/thành phố!"
                ControlToValidate="ddlCity" Display="None" ForeColor="Red" ValidationGroup="G40" 
                      InitialValue="0"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Website:</b></div>
              <div class="tbUser_col col_r">
                <input type="text" value="" id="txt_website" runat="server" name="txt_website" class="textbox">
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
              <div class="tbUser_col"><b>Tên người liên hệ (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" value="" id="txt_ten_lien_he" runat="server" name="txt_ten_day_du" class="textbox">
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Địa chỉ liên hệ (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" value="" id="txt_dia_chi_nguoi_lien_he" runat="server" name="txt_dia_chi_nguoi_lien_he" class="textbox">
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Số điện thoại liên hệ (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" value="" id="txt_dien_thoai_lien_he" runat="server" name="txt_dien_thoai_lien_he" class="textbox">
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Email liên hệ (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" value="" id="txt_email_lien_he" runat="server" name="txt_email_lien_he" class="textbox">
              </div>
            </div>
            <%--<div class="line_border"></div>--%>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Mã bảo mật:</b> </div>
              <div class="tbUser_col col_r"> <asp:Image ID="Image1" runat="server" ImageUrl="~/vi-vn/CImage.aspx" height="35px" /> </div>
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
                          var fullname = document.getElementById("<%= txt_ten_cty.ClientID %>");
                          var soluoc = document.getElementById("<%= txt_mo_ta_cty.ClientID %>"); 
                          var masothue = document.getElementById("<%= txt_ma_so_thue.ClientID %>");
                          var diachi = document.getElementById("<%= txt_dia_chi_cong_ty.ClientID %>");
                          var website = document.getElementById("<%= txt_website.ClientID %>");
                          var tenlienhe = document.getElementById("<%= txt_ten_lien_he.ClientID %>");
                          var diachilienhe = document.getElementById("<%= txt_dia_chi_nguoi_lien_he.ClientID %>");
                          var sodienthoailienhe = document.getElementById("<%= txt_dien_thoai_lien_he.ClientID %>");
                          var emaillienhe = document.getElementById("<%= txt_email_lien_he.ClientID %>");
                          var captcha = document.getElementById("<%= txtCaptcha.ClientID %>");
                          emailuser.value = pass.value = pass_2.value = fullname.value = soluoc.value = masothue.value = diachi.value = website.value = tenlienhe.value = diachilienhe.value = sodienthoailienhe.value = emaillienhe.value = captcha.value = "";
                      }
                </script>
              <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="G40" />
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
      </div>
      <uc2:sidebar_ntd ID="sidebar_NTD1" runat="server" />
      <div class="clearfix"></div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
