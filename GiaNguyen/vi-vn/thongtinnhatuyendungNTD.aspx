<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTD.Master" AutoEventWireup="true" CodeBehind="thongtinnhatuyendungNTD.aspx.cs" Inherits="CatTrang.vi_vn.thongtinnhatuyendungNTD" %>
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
            <h2><span class="navBarTxt">Thông tin Nhà tuyển dụng</span></h2>
          </div>
          <div class="navBarRight"><a href="" class="effective_rec_link"><img src="../Images/arrow_l_bg_rec.png" alt="" style="margin-right: 3px" />Tuyển dụng hiệu quả</a></div>
          <div class="clear"></div>
        </div>
        <%--<p class="number_jobs" style="color: #293790; font-size:14px">Thông tin đang chờ duyệt.</p>--%>
        <!--Login Infomation-->
        <div class="block">
          <h3 class="blocktitle main-title">Thông tin đăng nhập</h3>
          <div class="block_rec bl_white border1">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Email đăng nhập:</b></div>
              <div class="tbUser_col col_r">
                <asp:Literal ID="lbEmailUser" runat="server"></asp:Literal><br />
                <a title="" href="/ntd-doi-mat-khau">[Đổi mật khẩu]</a></div>
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--Personal Infomation-->
        <div class="block">
          <h3 class="blocktitle main-title">Thông tin công ty</h3>
          <div class="block_rec bl_white border1">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Tên công ty (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" value="" id="txt_ten_cty" runat="server" name="txt_ten_cty" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập Tên công ty!"
                ControlToValidate="txt_ten_cty" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Quy mô công ty (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <asp:DropDownList ID="ddlQuymo" runat="server" CssClass="dropbox" DataTextField="Name" DataValueField="Id"  AppendDataBoundItems="true">
                    <asp:ListItem Text="-- Chọn quy mô công ty --" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Chưa chọn quy mô công ty!"
                ControlToValidate="ddlQuymo" Display="None" ForeColor="Red" ValidationGroup="G40" 
                      InitialValue="0"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Sơ lược về công ty:</b><br />
                <i class="ft_11 red">(Tối đa 1000 ký tự)</i> </div>
              <div class="tbUser_col col_r">
                <textarea id="txt_mo_ta_cty" runat="server" name="txt_mo_ta_cty" style="height:160px;width:410px;" class="textArea"></textarea>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Logo công ty:</b><br />
                <asp:Image ID="imgLogo" runat="server" Width="104" Height="79" ImageUrl="../Images/noimage.jpg"/>
                <br>
                <asp:LinkButton ID="lnkRemoveLogo" runat="server" CssClass="red" CausesValidation="false" OnClientClick="return confirm('Bạn có chắc chắn xóa logo không?');"
                      ToolTip="Xóa hẳn file logo công ty" Text="Xóa ảnh" onclick="lnkRemoveLogo_Click"></asp:LinkButton></div>
              <div class="tbUser_col col_r">
                <asp:FileUpload ID="file_logo_cong_ty" runat="server" />
                <br>
                <span class="ft_11">(Dạng file ảnh .jpg .gif .png, dung lượng &lt;=300Kb)</span>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Giấy phép ĐK kinh doanh:</b><br />
                <i class="ft_11 red">(GPKD phải có dấu đỏ hoặc công chứng)</i> </div>
              <div class="tbUser_col col_r">
                <asp:FileUpload ID="file_giay_phep_kd" runat="server" />
                <br>
                <span class="ft_11">(Dạng file .doc .docx .xls .xlsx .jpg .gif .png .pdf, dung lượng &lt;=500Kb) <br>
                Nếu giấy phép kinh doanh của bạn có nhiều file hãy ghép lại thành 1 file Word để up lên.</span>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Mã số thuế:</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" value="" id="txt_ma_so_thue" runat="server" name="txt_ma_so_thue" class="textbox">
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Địa chỉ công ty (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" value="" id="txt_dia_chi_cong_ty" runat="server" name="txt_dia_chi_lien_he" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập Địa chỉ công ty!"
                ControlToValidate="txt_dia_chi_cong_ty" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Tỉnh/ Thành phố (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">                
                <asp:DropDownList ID="ddlCity" runat="server" CssClass="dropbox" DataTextField="Name" DataValueField="Id"  AppendDataBoundItems="true">
                    <asp:ListItem Text="-- Chọn tỉnh --" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa chọn tỉnh/thành phố!"
                ControlToValidate="ddlCity" Display="None" ForeColor="Red" ValidationGroup="G40" 
                      InitialValue="0"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Website:</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" value="" id="txt_website" runat="server" name="txt_website" class="textbox">
              </div>
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--Contact Information-->
        <div class="block">
          <h3 class="blocktitle main-title">Thông tin liên hệ</h3>
          <div class="block_rec bl_white border1">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Tên người liên hệ:</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" value="" id="txt_ten_lien_he" runat="server" name="txt_ten_day_du" class="textbox">
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Địa chỉ liên hệ:</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" value="" id="txt_dia_chi_nguoi_lien_he" runat="server" name="txt_dia_chi_nguoi_lien_he" class="textbox">
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Số điện thoại liên hệ:</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" value="" id="txt_dien_thoai_lien_he" runat="server" name="txt_dien_thoai_lien_he" class="textbox">
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Email liên hệ:</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" value="" id="txt_email_lien_he" runat="server" name="txt_email_lien_he" class="textbox">
              </div>
            </div>
            <div class="line_border" style="float: left; width: 97%; margin-top: 20px"></div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Mã bảo mật:</b> </div>
              <div class="tbUser_col col_r"> <asp:Image ID="Image1" runat="server" ImageUrl="~/vi-vn/CImage.aspx" height="35px" /> </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Nhập mã bảo mật (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" id="txtCaptcha" runat="server" name="txt_ma_xac_minh" class="textbox">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập mã bảo mật!"
                ControlToValidate="txtCaptcha" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col">&nbsp; </div>
              <div class="tbUser_col col_r">
                <asp:Button Text="Cập nhật" id="btnCapnhat" runat="server" 
                    CssClass="btn_green02" ValidationGroup="G40" onclick="btnCapnhat_Click" />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="G40" />
              </div>
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
      </div>
      <uc2:sidebar_NTD ID="sidebar_NTD1" runat="server" />
      <div class="clearfix"></div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
