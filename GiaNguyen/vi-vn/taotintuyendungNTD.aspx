<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTD.Master" AutoEventWireup="true" CodeBehind="taotintuyendungNTD.aspx.cs" Inherits="CatTrang.vi_vn.taotintuyendungNTD" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>
<%@ Register src="~/UIs/BannerTopNTD.ascx" tagname="BannerTopNTD" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    function textChange(e, txtbox, cls) {
        if (!(/[^A-Za-z0-9 ]/.test(String.fromCharCode(e.keyCode))) || e.keyCode == 8) {
            var text = $(txtbox).val().toLowerCase();
            var node = '';
            var count = 0;
            $('#div_' + cls + ' table tr').each(function () {
                node = $(this).text().toLowerCase();
                if (node.match(text) == null)
                    $(this).hide();
                else {
                    $(this).show();
                    count++;
                }
            });
        }
    }

    function ParseText(objsent) {
        ParseUrl(objsent, document.getElementById('ContentMain_txtSeoUrl'));
    }
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="page" id="recruitment">
    <div id="main"> 
      <uc2:BannerTopNTD ID="BannerTopNTD1" runat="server" />
      <div class="block"> 
        <!--NavBar-->
        <div class="navBar">
          <div class="navBarLeft">
            <h2><span class="navBarTxt">Các hồ sơ tìm việc</span> 
            <span class="ft_11" style="color: #364497">(Bạn được phép tạo tối đa 10 hồ sơ tìm việc)</span></h2>
          </div>
          <%--<div class="navBarRight">
          <a href="" class="effective_rec_link"><img src="../Images/arrow_l_bg_rec.png" alt="" style="margin-right: 3px" />Tìm việc hiệu quả</a></div>--%>
          <div class="clear"></div>
        </div>
        <!--Rules-->
        <div class="rules"> <b style="color:red; font-size:16px;">Quy định đăng tin tuyển dụng:</b> <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-	Viết tiếng Việt <span style="color:red;">có dấu.</span> <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-	Không viết chữ in hoa (trừ chữ cái đầu câu) <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-	Giữa hàng nghìn tin tuyển dụng mỗi ngày, tin tuyển dụng của bạn sẽ được nhiều ứng viên tìm việc quan tâm nếu: <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>+ Thông tin chi tiết, rõ ràng, đầy đủ.</b> <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+ Điền mã số thuế và upload giấy phép kinh doanh để trở thành nhà tuyển dụng uy tín đối với ứng viên và ban quản trị trang việc làm 24h. <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-	Không đăng tin của các công ty thuộc loại hình sau <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.	Trung tâm việc làm, môi giới việc làm <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.	Đa cấp. <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.	Công ty môi giới bảo hiểm, đại lý bảo hiểm <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.	Công ty đăng tin tuyển sinh ,thu hút học viên <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-	Các tin tuyển dụng không đúng quy định, không đạt chất lượng, nội dung không nghiêm túc sẽ bị xóa không cần báo trước. </div>
        <!--Left Col QTNTV-->
        <div class="colLeft_QTNTV"> 
          <!--Desired job-->
          <div class="block">
            <h3 class="blocktitle main-title">Thông tin tuyển dụng</h3>
            <div class="block_rec bl_white">
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Vị trí tuyển dụng (<span class="red">*</span>):</b> </div>
                <div class="tbUser_col col_r">
                  <input type="text" value="" id="txttieu_de" runat="server" name="tieu_de" class="textbox" onkeyup="ParseText(this);" onblur="ParseText(this);">
                    <asp:RequiredFieldValidator ID="rfvtieu_de" runat="server" ErrorMessage="Chưa nhập tiêu đề"
                            ControlToValidate="txttieu_de" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                    <asp:HiddenField ID="txtSeoUrl" runat="server" />
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Cấp bậc (<span class="red">*</span>):</b> </div>
                <div class="tbUser_col col_r">
                  <asp:DropDownList id="ddlCapbacmongmuon" runat="server" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" CssClass="dropbox">    
                        <asp:ListItem Value="0" Text="-- Chọn cấp bậc --"></asp:ListItem>                    
                        </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa chọn cấp bậc mong muốn"
                            ControlToValidate="ddlCapbacmongmuon" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Chọn ngành nghề (<span class="red">*</span>):</b><br/>
                  <i class="ft_11 red">(Chỉ được chọn 1 ngành nghề cấp 1)</i> </div>
                <div class="tbUser_col col_r">
                  <asp:TextBox ID="txtRadioFilterNganhnghe" runat="server" onkeyup="javascript:textChange(event,this,'listNganh');" onfocus="if (this.value=='Nhập ngành nghề cấp 1 cần chọn vào đây') this.value='';" onblur="if (this.value=='') this.value='Nhập ngành nghề cấp 1 cần chọn vào đây';" value="Nhập ngành nghề cấp 1 cần chọn vào đây" CssClass="textbox ac_input"></asp:TextBox>
                  <div id="div_listNganh" class="listTruong">
                      <asp:RadioButtonList ID="cblRdoOptionNganhnghe" DataValueField="Cat_Id" DataTextField="Cat_Name" runat="server">
                      </asp:RadioButtonList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Chưa chọn ngành nghề"
                            ControlToValidate="cblRdoOptionNganhnghe" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                  </div>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col">&nbsp; </div>
                <div class="tbUser_col col_r">
                  <asp:RadioButtonList ID="cblRdoOptionNganhngheDislay" runat="server" 
                        AutoPostBack="True" 
                        onselectedindexchanged="cblRdoOptionNganhngheDislay_SelectedIndexChanged">
                    <asp:ListItem Value="1" Text="Hiển thị ngành cấp 1 được chọn"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Hiển thị tất cả các ngành cấp 1" Selected="True"></asp:ListItem>
                  </asp:RadioButtonList>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Địa điểm làm việc (<span class="red">*</span>):</b><br/>
                  <i class="ft_11 red">(tối đa 10 địa điểm)</i> </div>
                <div class="tbUser_col col_r">
                  <asp:TextBox ID="txtChkFilterDiadiem" runat="server" onkeyup="javascript:textChange(event,this,'listTinh');" onfocus="if (this.value=='Nhập tỉnh thành cần chọn vào đây') this.value='';" onblur="if (this.value=='') this.value='Nhập tỉnh thành cần chọn vào đây';" value="Nhập tỉnh thành cần chọn vào đây" CssClass="textbox ac_input"></asp:TextBox>
                  <div id="div_listTinh" class="listTruong">
                    <asp:CheckBoxList ID="cblChkOptionDiadiem" DataValueField="Id" DataTextField="Name" runat="server">
                    </asp:CheckBoxList>
                    <asp:CustomValidator runat="server" ID="cvmodulelist" ClientValidationFunction="ValidateModuleList"
                        ErrorMessage="Chưa chọn địa điểm làm việc" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:CustomValidator>
                        <script type="text/javascript">
                            function ValidateModuleList(source, args) {
                                var chkListModules = document.getElementById('<%= cblChkOptionDiadiem.ClientID %>');
                                var chkListinputs = chkListModules.getElementsByTagName("input");
                                for (var i = 0; i < chkListinputs.length; i++) {
                                    if (chkListinputs[i].checked) {
                                        args.IsValid = true;
                                        return;
                                    }
                                }
                                args.IsValid = false;
                            }
                        </script>
                  </div>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col">&nbsp; </div>
                <div class="tbUser_col col_r">
                  <asp:RadioButtonList ID="cblRdoOptionDiadiemDislay" runat="server" 
                        onselectedindexchanged="cblRdoOptionDiadiemDislay_SelectedIndexChanged" 
                        AutoPostBack="True">
                    <asp:ListItem Value="1" Text="Hiển thị ngành cấp 1 được chọn"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Hiển thị tất cả các ngành cấp 1" Selected="True"></asp:ListItem>
                  </asp:RadioButtonList>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Hình thức làm việc (<span class="red">*</span>):</b> </div>
                <div class="tbUser_col col_r">
                  <asp:DropDownList id="ddlHinhthuclamviec" runat="server" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" CssClass="dropbox">    
                        <asp:ListItem Value="0" Text="-- Chọn hình thức làm việc --"></asp:ListItem>                    
                        </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa chọn hình thức làm việc"
                            ControlToValidate="ddlHinhthuclamviec" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Mức lương (<span class="red">*</span>):</b> </div>
                <div class="tbUser_col col_r">
                  <asp:DropDownList id="ddlMucluongmongmuon" runat="server" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" CssClass="dropbox">    
                        <asp:ListItem Value="0" Text="-- Chọn mức lương --"></asp:ListItem>                    
                        </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa chọn mức lương mong muốn"
                            ControlToValidate="ddlMucluongmongmuon" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Số lượng tuyển (<span class="red">*</span>):</b><br>
                  <i class="text11 textRed">(Nhập ký tự số)</i> </div>
                <div class="tbUser_col col_r">
                  <input type="text" value="" id="txt_so_luong_tuyen" runat="server" name="so_luong" class="textbox">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập số lượng tuyển"
                            ControlToValidate="txt_so_luong_tuyen" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Quyền lợi được hưởng (<span class="red">*</span>):</b> </div>
                <div class="tbUser_col col_r">
                  <textarea id="txt_quyen_loi" runat="server" name="quyen_loi" style="width:480px;height:100px" class="textArea"></textarea>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa nhập quyền lợi được hưởng"
                            ControlToValidate="txt_quyen_loi" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Mô tả công việc (<span class="red">*</span>):</b><br>
                  <i class="text11 textRed">(Tối thiểu 100 ký tự)</i></div>
                <div class="tbUser_col col_r">
                  <textarea id="txt_mo_ta_cong_viec" runat="server" name="mo_ta_cong_viec" style="width:480px;height:100px" class="textArea"></textarea>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Chưa nhập mô tả công việc"
                            ControlToValidate="txt_mo_ta_cong_viec" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Yêu cầu số năm kinh nghiệm (<span class="red">*</span>):</b></div>
                <div class="tbUser_col col_r">
                  <asp:DropDownList id="ddKinhnghiem" runat="server" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" CssClass="dropbox">    
                        <asp:ListItem Value="0" Text="-- Chọn số năm kinh nghiệm --"></asp:ListItem>                    
                        </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Chưa chọn số năm kinh nghiệm"
                            ControlToValidate="ddKinhnghiem" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Yêu cầu bằng cấp (<span class="red">*</span>):</b></div>
                <div class="tbUser_col col_r">
                  <asp:DropDownList id="ddlTrinhdohocvan" runat="server" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" CssClass="dropbox">    
                        <asp:ListItem Value="0" Text="-- Chọn yêu cầu bằng cấp --"></asp:ListItem>                    
                        </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Chưa chọn yêu cầu bằng cấp"
                            ControlToValidate="ddlTrinhdohocvan" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Yêu cầu giới tính (<span class="red"></span>):</b></div>
                <div class="tbUser_col col_r">
                  <asp:DropDownList id="ddlGioitinh" runat="server" CssClass="dropbox">    
                        <asp:ListItem Value="0" Text="-- Chọn yêu cầu giới tính --"></asp:ListItem>
                        <asp:ListItem Value="1" Text="Nam"></asp:ListItem>   
                        <asp:ListItem Value="2" Text="Nữ"></asp:ListItem>   
                        <asp:ListItem Value="3" Text="Khác"></asp:ListItem>                    
                  </asp:DropDownList>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Yêu cầu độ tuổi (<span class="red"></span>):</b></div>
                <div class="tbUser_col col_r">
                  <asp:DropDownList id="ddlDotuoi" runat="server" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" CssClass="dropbox">    
                        <asp:ListItem Value="0" Text="-- Chọn yêu cầu độ tuổi --"></asp:ListItem>                    
                        </asp:DropDownList>
                  <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Chưa chọn yêu cầu độ tuổi"
                            ControlToValidate="ddlDotuoi" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G40">*</asp:RequiredFieldValidator>--%>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Yêu cầu khác:</b></div>
                <div class="tbUser_col col_r">
                  <textarea id="txt_yeu_cau_khac" runat="server" name="yeu_cau" style="width:480px;height:100px" class="textArea"></textarea>                  
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Hồ sơ bao gồm (<span class="red">*</span>):</b></div>
                <div class="tbUser_col col_r">
                  <textarea id="txt_ho_so_gom" runat="server" name="ho_so" style="width:480px;height:100px" class="textArea"></textarea>                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Chưa nhập hồ sơ bao gồm"
                            ControlToValidate="txt_ho_so_gom" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Hạn nộp hồ sơ (<span class="red">*</span>):</b></div>
                <div class="tbUser_col col_r">
                  <link rel="stylesheet" href="/Styles/BeatPicker.min.css" />
                    <script src="/Scripts/BeatPicker.min.js"></script>
                    <input type="text" data-beatpicker="true" data-beatpicker-position="['bottom','*']" data-beatpicker-module="clear" data-beatpicker-format="['DD','MM','YYYY'],separator:'/'" class="textbox date depDate hasDatepicker fl" id="txtPickerHannop" name="flights-checkin"  runat="server" style="width:150px;"/>
                (dd-mm-yyyy)
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Chưa nhập hồ sơ hiển thị đến ngày!"
                    ControlToValidate="txtPickerHannop" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator> 
                  </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Hình thức nộp hồ sơ (<span class="red">*</span>):</b></div>
                <div class="tbUser_col col_r">
                  <asp:DropDownList id="ddlHinhthucnophoso" runat="server" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" CssClass="dropbox">    
                        <asp:ListItem Value="0" Text="-- Chọn hình thức nộp hồ sơ --"></asp:ListItem>                    
                        </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Chưa chọn hình thức nộp hồ sơ"
                            ControlToValidate="ddlHinhthucnophoso" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="clearfix"> </div>
            </div>
          </div>
          <!--Personal Information-->
          <div class="block">
            <h3 class="blocktitle main-title">Thông tin Nhà tuyển dụng</h3>
            <div class="block_rec bl_white" style="padding-left: 20%">
              <div id="avatar" class="avatar">
              <asp:Literal ID="lbLogo" runat="server"></asp:Literal>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Tên công ty:</b> </div>
                <div class="tbUser_col col_r"><asp:Literal ID="lbCompanyname" runat="server"></asp:Literal></div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Quy mô công ty:</b> </div>
                <div class="tbUser_col col_r"><asp:Literal ID="lbQuymocongty" runat="server"></asp:Literal></div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Sơ lược về công ty:</b> </div>
                <div class="tbUser_col col_r"><asp:Literal ID="lbSoluoccongty" runat="server"></asp:Literal></div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Địa chỉ:</b> </div>
                <div class="tbUser_col col_r"><asp:Literal ID="lbDiachicongty" runat="server"></asp:Literal></div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Mã số thuế:</b> </div>
                <div class="tbUser_col col_r"><asp:Literal ID="lbMasothue" runat="server"></asp:Literal></div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Website:</b> </div>
                <div class="tbUser_col col_r"><asp:Literal ID="lbWebsite" runat="server"></asp:Literal></div>
              </div>
              <%--<div align="right" class="button_filter">
                <input type="button" class="btn_green01" value="Sửa" onclick="javascripthong_tin');">
              </div>--%>
              <div class="clearfix"> </div>
            </div>
          </div>
          <!--Contact Information-->
          <div class="block">
            <h3 class="blocktitle main-title">Thông tin liên hệ</h3>
            <div class="block_rec bl_white">
              <div class="tbUser_row" style="padding-left: 20%">
                <div class="tbUser_col"><b>Người liên hệ:</b> </div>
                <div class="tbUser_col col_r"><asp:Literal ID="lbNguoilienhe" runat="server"></asp:Literal></div>
              </div>
              <div class="tbUser_row" style="padding-left: 20%">
                <div class="tbUser_col"><b>Địa chỉ liên hệ:</b> </div>
                <div class="tbUser_col col_r"><asp:Literal ID="lbDiachilienhe" runat="server"></asp:Literal></div>
              </div>
              <div class="tbUser_row" style="padding-left: 20%">
                <div class="tbUser_col"><b>Email liên hệ:</b> </div>
                <div class="tbUser_col col_r"><asp:Literal ID="lbEmailLienhe" runat="server"></asp:Literal></div>
              </div>
              <div class="tbUser_row" style="padding-left: 20%">
                <div class="tbUser_col"><b>Điện thoại liên hệ:</b> </div>
                <div class="tbUser_col col_r"><asp:Literal ID="lbDienthoailienhe" runat="server"></asp:Literal></div>
              </div>
              <%--<div align="right" class="button_filter">
                <input type="button" onclick="javascript:do_lien_he');" value="Sửa" class="btn_green01">
              </div>--%>
              <div style="border-top: 1px solid #DDDDDD; height: 1px; margin: 10px; clear:both"></div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Mã bảo mật:</b> </div>
                <div class="tbUser_col col_r">
                    <script type="text/javascript"  language="Javascript">
                        function Catpc() {
                            var img = document.getElementById("icp");
                            img.src = "/vi-vn/captchr.ashx?query=" + Math.random();
                        }
                        </script>                    
                    <img id="icp" align="absmiddle" src='/vi-vn/captchr.ashx?query=<%= querys() %>' alt="Mã bảo mật" />
                    <a href="javascript:void(0)" onclick="javascript:Catpc();">
                        <img title="Refresh" style="vertical-align: middle;border-width:0px" src="/images/reloadpaf.png" /></a>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Nhập mã bảo mật (<span class="red">*</span>):</b> </div>
                <div class="tbUser_col col_r">
                  <input type="text" id="txt_ma_xac_minh" runat="server" name="txt_ma_xac_minh" class="textbox">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Chưa nhập mã catpcha"
                            ControlToValidate="ddKinhnghiem" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col">&nbsp; </div>
                <div class="tbUser_col col_r">
                  <asp:Button ID="btnXemtruoc" runat="server" Text="Xem trước" CssClass="btn_green02" Visible="false"/>
                  &nbsp;&nbsp;
                  <asp:Button ID="btnLuutam" runat="server" Text="Lưu tạm" ValidationGroup="G40" 
                        CssClass="btn_green02" onclick="btnLuutam_Click" />
                  &nbsp;&nbsp;
                  <asp:Button ID="btnDangtuyen" runat="server" Text="Đăng tuyển" 
                        ValidationGroup="G40" CssClass="btn_green02" 
                        onclick="btnDangtuyen_Click" />
                  &nbsp;&nbsp;
                  <asp:Button ID="btnCapnhat" runat="server" Text="Cập nhật" 
                        ValidationGroup="G40" CssClass="btn_green02" 
                        onclick="btnCapnhat_Click" />
                  &nbsp;&nbsp;
                  <a title="Về trang quản lý tin tuyển dụng" href="/ntd-tin-tuyen-dung-da-dang" class="btn_green02">Quay lại</a>
                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="G40" />
                </div>
              </div>
              <div class="clearfix"> </div>
            </div>
          </div>
        </div>
        <!--Right Col QTNTV-->
        <div class="colRight_QTNTV" style="display:none"> 
          <!--Contact Information-->
          <div> <b style="font-size: 14px; border-bottom: 1px dashed #E5E5E5; padding-bottom: 5px; display: block">MẪU TIN TUYỂN DỤNG</b> </div>
          <div style="display:inline;" id="div_hien_thi_nganh_thu_1">
            <div class="HSMauItem"> <span class="searchGroupMauTin">Báo chí-Truyền hình</span>
              <div class="clear"></div>
              <ul class="HSMau">
                <div style="display:inline;" id="div_hien_thi_nganh_thu_1_tin_mau_1">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=82&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_82').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=82';}" id="mau_tin_tim_viec_82">
                    Phóng viên, biên tập viên, cộng tác viên </a> </li>
                </div>
                <div style="display:inline;" id="div_hien_thi_nganh_thu_1_tin_mau_2">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=83&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_83').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=83';}" id="mau_tin_tim_viec_83">
                    Nhân viên dựng phim, quay phim, biên tập nhiều năm kinh nghiệm </a> </li>
                </div>
              </ul>
              <script type="text/javascript" language="javascript"></script> 
            </div>
          </div>
          <div style="display:inline;" id="div_hien_thi_nganh_thu_2">
            <div class="HSMauItem"> <span class="searchGroupMauTin">Chứng khoán- Vàng</span>
              <div class="clear"></div>
              <ul class="HSMau">
                <div style="display:inline;" id="div_hien_thi_nganh_thu_2_tin_mau_1">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=81&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_81').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=81';}" id="mau_tin_tim_viec_81">
                    Chuyên viên tư vấn đầu tư tài chính </a> </li>
                </div>
              </ul>
              <script type="text/javascript" language="javascript"></script> 
            </div>
          </div>
          <div style="display:inline;" id="div_hien_thi_nganh_thu_3">
            <div class="HSMauItem"> <span class="searchGroupMauTin">IT phần cứng/mạng</span>
              <div class="clear"></div>
              <ul class="HSMau">
                <div style="display:inline;" id="div_hien_thi_nganh_thu_3_tin_mau_1">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=79&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_79').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=79';}" id="mau_tin_tim_viec_79">
                    Quản trị mạng, Nhân viên IT, Quản trị Website </a> </li>
                </div>
                <div style="display:inline;" id="div_hien_thi_nganh_thu_3_tin_mau_2">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=80&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_80').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=80';}" id="mau_tin_tim_viec_80">
                    Nhân viên IT phần cứng/mạng 3 năm kinh nghiệm </a> </li>
                </div>
              </ul>
              <script type="text/javascript" language="javascript"></script> 
            </div>
          </div>
          <div style="display:none;" id="div_hien_thi_nganh_thu_4">
            <div class="HSMauItem"> <span class="searchGroupMauTin">Kế toán-Kiểm toán</span>
              <div class="clear"></div>
              <ul class="HSMau">
                <div style="display:inline;" id="div_hien_thi_nganh_thu_4_tin_mau_1">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=7&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_7').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=7';}" id="mau_tin_tim_viec_7">
                    Kế toán tổng hợp </a> </li>
                </div>
                <div style="display:inline;" id="div_hien_thi_nganh_thu_4_tin_mau_2">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=11&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_11').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=11';}" id="mau_tin_tim_viec_11">
                    Nhân viên kế toán 3 năm kinh nghiệm </a> </li>
                </div>
              </ul>
              <script type="text/javascript" language="javascript"></script> 
            </div>
          </div>
          <div style="display:none;" id="div_hien_thi_nganh_thu_5">
            <div class="HSMauItem"> <span class="searchGroupMauTin">Nhân viên kinh doanh</span>
              <div class="clear"></div>
              <ul class="HSMau">
                <div style="display:inline;" id="div_hien_thi_nganh_thu_5_tin_mau_1">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=77&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_77').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=77';}" id="mau_tin_tim_viec_77">
                    Trưởng nhóm kinh doanh/ Nhân viên kinh doanh </a> </li>
                </div>
                <div style="display:inline;" id="div_hien_thi_nganh_thu_5_tin_mau_2">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=78&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_78').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=78';}" id="mau_tin_tim_viec_78">
                    Trưởng/ phó phòng kinh doanh </a> </li>
                </div>
                <div style="display:none;" id="div_hien_thi_nganh_thu_5_tin_mau_3">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=64&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_64').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=64';}" id="mau_tin_tim_viec_64">
                    Nhân viên kinh doanh, chăm sóc khách hàng </a> </li>
                </div>
              </ul>
              <div id="nut_bam_div_hien_thi_nganh_thu_5_tin_mau_" class="view_all_trades"> <a title="Xem tất cả các mẫu tin tuyển dụng ngành này" href="javascript: hien_thi_cac_div_an_trong_list_div('div_hien_thi_nganh_thu_5_tin_mau_', 3, 2, -1, 'Xem thêm', 'Thu gọn')">Xem thêm</a> </div>
            </div>
          </div>
          <div id="nut_bam_div_hien_thi_nganh_thu_" class="view_all_trades"> <a title="Xem tất cả các ngành có tin tuyển dụng mẫu" href="javascript: hien_thi_cac_div_an_trong_list_div('div_hien_thi_nganh_thu_', 5, 3, -1, 'Xem tất cả các ngành', 'Thu gọn danh sách các ngành')">Xem tất cả các ngành</a> </div>
        </div>
      </div>        
    </div>
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
