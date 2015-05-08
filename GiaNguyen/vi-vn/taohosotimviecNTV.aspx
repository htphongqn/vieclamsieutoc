<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTV.Master" AutoEventWireup="true" CodeBehind="taohosotimviecNTV.aspx.cs" Inherits="CatTrang.vi_vn.taohosotimviecNTV" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>
<%@ Register src="~/UIs/BannerTopNTV.ascx" tagname="BannerTopNTV" tagprefix="uc2" %>

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
    <!--Main-->
    <div id="main"> 
      <uc2:BannerTopNTV ID="BannerTopNTV1" runat="server" />
      <div class="block"> 
        <!--NavBar-->
        <div class="navBar">
          <div class="navBarLeft">
            <h2><span class="navBarTxt">Các hồ sơ tìm việc</span> <span class="ft_11" style="color: #364497">(Bạn được phép tạo tối đa 10 hồ sơ tìm việc)</span></h2>
          </div>
          <%--<div class="navBarRight"><a href="" class="effective_rec_link"><img src="../Images/arrow_l_bg_rec.png" alt="" style="margin-right: 3px" />Tìm việc hiệu quả</a></div>--%>
          <div class="clear"></div>
        </div>
        <!--Rules-->
        <div class="rules"> <b style="color:#ed2227; font-size:14px;">Quy định đăng hồ sơ tìm việc:</b> <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Viết tiếng Việt <span style="color:red;">có dấu.</span> <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Không viết chữ in hoa (trừ chữ cái đầu câu) <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Giữa hàng nghìn hồ sơ mỗi ngày, nội dung hồ sơ của bạn <span style="color:red;">càng chi tiết, đầy đủ</span> giúp hồ sơ của bạn <b>tạo ấn tượng tốt và gây được sự chú ý đối với các nhà tuyển dụng.</b> <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Các hồ sơ không đúng quy định, không đạt chất lượng, nội dung không nghiêm túc sẽ bị xóa không cần báo trước. </div>
        <!--Left Col QTNTV-->
        <div class="colLeft_QTNTV"> 
          <!--Desired job-->
          <div class="block">
            <h3 class="blocktitle main-title">Công việc mong muốn</h3>
            <div class="block_rec bl_white">
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Vị trí mong muốn (<span class="red">*</span>):</b> </div>
                <div class="tbUser_col col_r">
                  <input type="text" value="" id="txttieu_de" runat="server" name="tieu_de" class="textbox" onkeyup="ParseText(this);" onblur="ParseText(this);">
                    <asp:RequiredFieldValidator ID="rfvtieu_de" runat="server" ErrorMessage="Chưa nhập tiêu đề"
                            ControlToValidate="txttieu_de" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                    <asp:HiddenField ID="txtSeoUrl" runat="server" />
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Cấp bậc mong muốn (<span class="red">*</span>):</b> </div>
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
                        function ValidateModuleList(source, args)
                        {
                            var chkListModules = document.getElementById('<%= cblChkOptionDiadiem.ClientID %>');
                          var chkListinputs = chkListModules.getElementsByTagName("input");
                          for (var i=0;i<chkListinputs .length;i++)
                          {
                            if (chkListinputs [i].checked)
                            {
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
                <div class="tbUser_col"><b>Mức lương mong muốn (<span class="red">*</span>):</b> </div>
                <div class="tbUser_col col_r">
                  <asp:DropDownList id="ddlMucluongmongmuon" runat="server" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" CssClass="dropbox">    
                        <asp:ListItem Value="0" Text="-- Chọn mức lương --"></asp:ListItem>                    
                        </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa chọn mức lương mong muốn"
                            ControlToValidate="ddlMucluongmongmuon" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Mục tiêu nghề nghiệp:</b> </div>
                <div class="tbUser_col col_r">
                  <textarea id="txtmuc_tieu_nghe_nghiep" runat="server" name="muc_tieu_nghe_nghiep" style="width:480px;height:100px" class="textArea"></textarea>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Hồ sơ hiển thị đến ngày (<span class="red">*</span>):</b> </div>
                <div class="tbUser_col col_r">
                    <link rel="stylesheet" href="/Styles/BeatPicker.min.css" />
                    <script src="/Scripts/BeatPicker.min.js"></script>
                    <input type="text" data-beatpicker="true" data-beatpicker-position="['bottom','*']" data-beatpicker-module="clear" data-beatpicker-format="['DD','MM','YYYY'],separator:'/'" class="textbox date depDate hasDatepicker fl" id="txtPickerDenngay" name="flights-checkin"  runat="server" style="width:150px;"/>
                (dd-mm-yyyy)
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa nhập hồ sơ hiển thị đến ngày!"
                    ControlToValidate="txtPickerDenngay" Display="None" ForeColor="Red" ValidationGroup="G40"></asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="clearfix"> </div>
            </div>
          </div>
          <!--Personal Information-->
          <div class="block">
            <h3 class="blocktitle main-title">Thông tin cá nhân</h3>
            <div class="block_rec bl_white" style="padding-left: 30%">
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Họ và tên:</b> </div>
                <div class="tbUser_col col_r"><asp:Literal ID="lbFullname" runat="server"></asp:Literal></div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Ngày sinh:</b> </div>
                <div class="tbUser_col col_r"><asp:Literal ID="lbBirthday" runat="server"></asp:Literal></div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Giới tính:</b> </div>
                <div class="tbUser_col col_r"> <asp:Literal ID="lbSex" runat="server"></asp:Literal> </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Tình trạng hôn nhân:</b> </div>
                <div class="tbUser_col col_r"> <asp:Literal ID="lbTinhtranghonnha" runat="server"></asp:Literal></div>
              </div>
              <%--<div align="right" class="button_filter">
                <input type="button" onclick="ntv_quan_tri_hien_thi_sua_thong_tin_tai_khoan();return(false);" value="Sửa" class="btn_green01">
              </div>--%>
              <div class="clearfix"> </div>
            </div>
          </div>
          <!--Education Level-->
          <div class="block">
            <h3 class="blocktitle main-title">Trình độ học vấn</h3>
            <div class="block_rec bl_white">
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Trình độ học vấn (<span class="red">*</span>):</b> </div>
                <div class="tbUser_col col_r">
                  <asp:DropDownList id="ddlTrinhdohocvan" runat="server" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" CssClass="dropbox">    
                        <asp:ListItem Value="0" Text="-- Chọn trình độ học vấn --"></asp:ListItem>                    
                        </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa chọn trình độ học vấn"
                            ControlToValidate="ddlTrinhdohocvan" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Ngành học (<span class="red">*</span>):</b> </div>
                <div class="tbUser_col col_r">
                  <input type="text" value="" id="txtnganh_hoc" runat="server" name="nganh_hoc" class="textbox">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Chưa nhập ngành học"
                            ControlToValidate="txtnganh_hoc" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Tốt nghiệp năm:</b> </div>
                <div class="tbUser_col col_r">
                    <asp:DropDownList id="ddlNamtotnghiep" runat="server" AppendDataBoundItems="true" CssClass="dropbox">    
                        <asp:ListItem Value="0" Text="-- Chọn năm tốt nghiệp --"></asp:ListItem>                    
                    </asp:DropDownList>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Loại tốt nghiệp:</b> </div>
                <div class="tbUser_col col_r">
                    <asp:DropDownList id="ddlLoaitotnghiep" runat="server" AppendDataBoundItems="true" CssClass="dropbox">    
                        <asp:ListItem Value="0" Text="-- Chọn loại tốt nghiệp --"></asp:ListItem> 
                        <asp:ListItem Value="1" Text="Xuất sắc"></asp:ListItem> 
                        <asp:ListItem Value="2" Text="Giỏi"></asp:ListItem> 
                        <asp:ListItem Value="3" Text="Khá"></asp:ListItem> 
                        <asp:ListItem Value="4" Text="Trung bình khá"></asp:ListItem>
                        <asp:ListItem Value="5" Text="Trung bình"></asp:ListItem>            
                    </asp:DropDownList>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Tốt nghiệp tại trường:</b> <br>
                  <i class="ft_11 red">(Chỉ được chọn 1 trường)</i> </div>
                <div class="tbUser_col col_r">
                  <asp:TextBox ID="txtFilterTruongtotnghiep" runat="server" onkeyup="javascript:textChange(event,this,'listTruong');" onfocus="if (this.value=='Nhập trường cần chọn vào đây') this.value='';" onblur="if (this.value=='') this.value='Nhập trường cần chọn vào đây';" value="Nhập trường cần chọn vào đây" CssClass="textbox ac_input" style="width:490px;"></asp:TextBox>
                  <div id="div_listTruong" style="width:480px;" class="listTruong">
                    <asp:RadioButtonList ID="ddlTruongtotnghiep" DataValueField="Id" DataTextField="Name" runat="server">
                      </asp:RadioButtonList>
                  </div>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col">&nbsp;</div>
                <div class="tbUser_col col_r"> 
                  <asp:RadioButtonList ID="ddlTruongtotnghiepDislay" runat="server" 
                        onselectedindexchanged="ddlTruongtotnghiepDislay_SelectedIndexChanged" 
                        AutoPostBack="True">
                    <asp:ListItem Value="1" Text="Hiển thị trường được chọn"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Hiển thị tất cả các trường" Selected="True"></asp:ListItem>
                  </asp:RadioButtonList>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Trình độ ngoại ngữ:</b> </div>
                <div class="tbUser_col col_r">
                    <asp:DropDownList ID="ddlNgoaingu" DataValueField="Id" DataTextField="Name" runat="server" AppendDataBoundItems="true" style="width:240px" class="dropbox">
                        <asp:ListItem Value="0" Text="-- Chọn ngoại ngữ --"></asp:ListItem>
                    </asp:DropDownList>
                  <asp:DropDownList ID="ddlTrinhdongoaingu" DataValueField="Id" DataTextField="Name" runat="server"   AppendDataBoundItems="true" style="width:240px; position: absolute; top: 5px; left: 260px" class="dropbox">
                        <asp:ListItem Value="0" Text="-- Chọn trình độ ngoại ngữ --"></asp:ListItem>
                    </asp:DropDownList>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Trình độ tin học:</b> </div>
                <div class="tbUser_col col_r">
                  <textarea id="txttrinh_do_tin_hoc" runat="server" name="trinh_do_tin_hoc" style="width:480px" class="textArea"></textarea>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Các bằng cấp <br>
                  / chứng chỉ khác:</b> </div>
                <div class="tbUser_col col_r">
                  <textarea id="txtbang_cap_khac" runat="server" name="bang_cap_khac" style="width:480px" class="textArea"></textarea>
                </div>
              </div>
              <div class="clearfix"> </div>
            </div>
          </div>
          <!--Work Experience-->
          <div class="block">
            <h3 class="blocktitle main-title">Kinh nghiệm làm việc</h3>
            <div class="block_rec bl_white">
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Số năm kinh nghiệm (<span class="red">*</span>):</b> </div>
                <div class="tbUser_col col_r">
                  <asp:DropDownList id="ddKinhnghiem" runat="server" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" CssClass="dropbox">    
                        <asp:ListItem Value="0" Text="-- Chọn số năm kinh nghiệm --"></asp:ListItem>                    
                        </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Chưa chọn số năm kinh nghiệm"
                            ControlToValidate="ddKinhnghiem" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Quá trình làm việc:</b> <br>
                  <span style="line-height:14px" class="ft_11"> Nếu bạn chưa có kinh nghiệm làm việc, hãy đưa ra các công việc/ hoạt động bạn đã từng tham gia hoặc đảm trách và các thành tích kỹ năng đạt được </span> </div>
                <div class="tbUser_col col_r">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkAddKinhnghiem" />
                        </Triggers>
                        <ContentTemplate>
                            <textarea id="txt_kinh_nghiem" runat="server" name="c_kinh_nghiem" style="width:480px;height:200px;
                                line-height:20px" class="textArea">                        
                            </textarea>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                  <asp:LinkButton ID="lnkAddKinhnghiem" runat="server" CssClass="linkAdd" 
                        ToolTip="Chèn thêm bản mẫu điền kinh nghiệm" onclick="lnkAddKinhnghiem_Click">Chèn kinh nghiệm</asp:LinkButton> </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Kỹ năng nổi bật:</b> </div>
                <div class="tbUser_col col_r">
                  <textarea id="txtky_nang" runat="server" name="ky_nang" style="width:480px" class="textArea"></textarea>
                </div>
              </div>
              <div class="clearfix"> </div>
            </div>
          </div>
          <!--Reference Sources-->
          <div class="block">
            <h3 class="blocktitle main-title">Nguồn tham khảo</h3>
            <div class="block_rec bl_white">
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Nguồn tham khảo:</b> <br>
                  <span style="line-height:14px" class="ft_11">Hãy nêu tên những người không phải là người thân, không phải là người đã thuê bạn làm việc? (Họ tên, địa chỉ, số điện thoại, nghề nghiệp, quan hệ, đã biết bạn mấy năm?)</span> </div>
                <div class="tbUser_col col_r">
                    <asp:UpdatePanel ID="upnnguo_tham_khao" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="lnkAddThamkhao" />
                        </Triggers>
                        <ContentTemplate>
                            <textarea id="txt_nguon_tham_khao" runat="server" name="c_nguon_tham_khao" style="width:480px;height:110px" class="textArea"></textarea>
                        </ContentTemplate>
                    </asp:UpdatePanel>                    
                  <asp:LinkButton ID="lnkAddThamkhao" runat="server" CssClass="linkAdd" 
                        ToolTip="Chèn thêm mẫu điền nguồn tham khảo" onclick="lnkAddThamkhao_Click">Chèn nguồn tham khảo</asp:LinkButton> </div>
              </div>
              <div class="clearfix"> </div>
            </div>
          </div>
          <!--Contact Information-->
          <div class="block">
            <h3 class="blocktitle main-title">Thông tin liên hệ</h3>
            <div class="block_rec bl_white">
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Người liên hệ:</b> </div>
                <div class="tbUser_col col_r"> <asp:Literal ID="lbContactName" runat="server"></asp:Literal> </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Địa chỉ liên hệ:</b> </div>
                <div class="tbUser_col col_r"> <asp:Literal ID="lbContactAddress" runat="server"></asp:Literal> </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Email liên hệ:</b> </div>
                <div class="tbUser_col col_r">
                <%--<a title="" href="mailto:daolt@dangcapviet.vn">daolt@dangcapviet.vn</a>--%>
                <asp:Literal ID="lbContactEmail" runat="server"></asp:Literal>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Điện thoại liên hệ:</b> </div>
                <div class="tbUser_col col_r"> <asp:Literal ID="lbContactPhone" runat="server"></asp:Literal> </div>
              </div>
              <%--<div align="right" class="button_filter">
                <input type="submit" name="btn_filter" value="Sửa" id="search_filter" title="Bấm đây để lọc theo các tiêu chí đã chọn!" class="btn_green01">
              </div>--%>
              <div class="clearfix"> </div>
              <div style="border-top: 1px solid #DDDDDD; height: 1px; margin: 10px"></div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Mã bảo mật:</b> </div>
                <div class="tbUser_col col_r"> 
                <asp:Image ID="Image1" runat="server" ImageUrl="~/vi-vn/CImage.aspx" height="35px" />
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col"><b>Nhập mã bảo mật (<span class="red">*</span>):</b> </div>
                <div class="tbUser_col col_r">
                  <input type="text" id="txt_ma_xac_minh" runat="server" name="txt_ma_xac_minh" class="textbox">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Chưa nhập mã catpcha"
                            ControlToValidate="ddKinhnghiem" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                </div>
              </div>
              <div class="tbUser_row">
                <div class="tbUser_col">&nbsp; </div>
                <div class="tbUser_col col_r">
                  <asp:Button ID="btnXemtruoc" runat="server" Text="Xem trước" CssClass="btn_green02"  Visible="false"/>
                  &nbsp;&nbsp;
                  <asp:Button ID="btnLuutam" runat="server" Text="Lưu tạm" ValidationGroup="G40" 
                        CssClass="btn_green02" onclick="btnLuutam_Click" />
                  &nbsp;&nbsp;
                  <asp:Button ID="btnDanghoso" runat="server" Text="Đăng hồ sơ tìm việc" 
                        ValidationGroup="G40" style="width:150px;" CssClass="btn_green02" 
                        onclick="btnDanghoso_Click" />
                  &nbsp;&nbsp;
                  <asp:Button ID="btnCapnhat" runat="server" Text="Cập nhật" 
                        ValidationGroup="G40" CssClass="btn_green02" 
                        onclick="btnCapnhat_Click" />
                  &nbsp;&nbsp;
                  <a title="Về trang quản lý hồ sơ tìm việc" href="/ntv-ho-so-da-dang" class="btn_green02">Quay lại</a>
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
          <span style="color: #690000; font-size:14px;font-weight: bold;">Chèn nhanh thông tin từ:</span>
          <div> <b style="font-size: 14px; border-bottom: 1px dashed #E5E5E5; padding-bottom: 5px; margin-top: 10px; display: block">MẪU HỒ SƠ TÌM VIỆC</b> </div>
          <div style="display:inline;" id="div_hien_thi_nganh_thu_1">
            <div class="HSMauItem"> <span class="searchGroupMauTin">Báo chí-Truyền hình</span>
              <div class="clear"></div>
              <ul class="HSMau">
                <div style="display:inline;" id="div_hien_thi_nganh_thu_1_tin_mau_1">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=82&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_82').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=82';}" id="mau_tin_tim_viec_82">
                    Phóng viên, biên tập viên, cộng tác viên </a> &nbsp;&nbsp;</li>
                </div>
                <div style="display:inline;" id="div_hien_thi_nganh_thu_1_tin_mau_2">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=83&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_83').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=83';}" id="mau_tin_tim_viec_83">
                    Nhân viên dựng phim, quay phim, biên tập nhiều năm kinh nghiệm </a> &nbsp;&nbsp;</li>
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
                    Chuyên viên tư vấn đầu tư tài chính </a> &nbsp;&nbsp;</li>
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
                    Quản trị mạng, Nhân viên IT, Quản trị Website </a> &nbsp;&nbsp;</li>
                </div>
                <div style="display:inline;" id="div_hien_thi_nganh_thu_3_tin_mau_2">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=80&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_80').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=80';}" id="mau_tin_tim_viec_80">
                    Nhân viên IT phần cứng/mạng 3 năm kinh nghiệm </a> &nbsp;&nbsp;</li>
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
                    Kế toán tổng hợp </a> &nbsp;&nbsp;</li>
                </div>
                <div style="display:inline;" id="div_hien_thi_nganh_thu_4_tin_mau_2">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=11&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_11').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=11';}" id="mau_tin_tim_viec_11">
                    Nhân viên kế toán 3 năm kinh nghiệm </a> &nbsp;&nbsp;</li>
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
                    Trưởng nhóm kinh doanh/ Nhân viên kinh doanh </a> &nbsp;&nbsp;</li>
                </div>
                <div style="display:inline;" id="div_hien_thi_nganh_thu_5_tin_mau_2">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=78&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_78').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=78';}" id="mau_tin_tim_viec_78">
                    Trưởng/ phó phòng kinh doanh </a> &nbsp;&nbsp;</li>
                </div>
                <div style="display:none;" id="div_hien_thi_nganh_thu_5_tin_mau_3">
                  <li> <a title="" href="/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=64&amp;id_tin_tv=-1">
                    <input type="checkbox" onclick="javascript: if (document.getElementById('mau_tin_tim_viec_64').checked) {window.location.href='/ntv-trang-quan-tri-cap-nhat-tin-tim-viec.html?id_mau_tin_tv=64';}" id="mau_tin_tim_viec_64">
                    Nhân viên kinh doanh, chăm sóc khách hàng </a> &nbsp;&nbsp;</li>
                </div>
              </ul>
              <div id="nut_bam_div_hien_thi_nganh_thu_5_tin_mau_" class="view_all_trades"> <a title="Xem tất cả các mẫu tin tuyển dụng ngành này" href="javascript: hien_thi_cac_div_an_trong_list_div('div_hien_thi_nganh_thu_5_tin_mau_', 3, 2, -1, 'Xem thêm', 'Thu gọn')">Xem thêm</a> </div>
            </div>
          </div>
          <div id="nut_bam_div_hien_thi_nganh_thu_" class="view_all_trades"> <a title="Xem tất cả các ngành có tin tuyển dụng mẫu" href="javascript: hien_thi_cac_div_an_trong_list_div('div_hien_thi_nganh_thu_', 5, 3, -1, 'Xem tất cả các ngành', 'Thu gọn danh sách các ngành')">Xem tất cả các ngành</a> </div>
        </div>
      </div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
