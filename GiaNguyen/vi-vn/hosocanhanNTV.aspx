﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/NTV.Master" AutoEventWireup="true" CodeBehind="hosocanhanNTV.aspx.cs" Inherits="CatTrang.vi_vn.hosocanhanNTV" %>
<%@ Register src="~/UIs/boxPhone.ascx" tagname="boxPhone" tagprefix="uc1" %>
<%@ Register src="~/UIs/BannerTopNTV.ascx" tagname="BannerTopNTV" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
<div class="page" id="recruitment"> 
    <!--Main-->
    <div id="main"> 
      <uc2:BannerTopNTV ID="BannerTopNTV1" runat="server" />
      <div class="block"> 
        <!--NavBar-->
        <div class="navBar noborder">
          <div class="navBarLeft">
            <h2><span class="navBarTxt">Hồ sơ cá nhân</h2>
            <p>Hồ sơ này sẽ là hồ sơ để bạn ứng tuyển trực tuyến với các việc làm trên hệ thống tìm việc 24H.<br />
              Vui lòng điền đầy đủ thông tin để nhà tuyển dụng biết rõ về bạn và khả năng, kinh nghiệm, kỹ năng của bạn,... </p>
            <br />
            <p>Những mục có dấu <span class="red">*</span> là bắt buộc phải nhập </p>
            <br />
            <p class="red">Vui lòng chọn CV cần chỉnh sửa hoặc tạo mới một CV khác!</p>
          </div>
          <div class="navBarRight align_l" style="width: 370px"><a class="btn_green01 btn_view_CV" target="_blank" href="/trang-xem-cv.html?id_cv_mau=13">Xem CV mẫu cho ứng viên đã có kinh nghiệm</a> <a class="btn_green01 btn_view_CV" target="_blank" href="/trang-xem-cv.html?id_cv_mau=20" style="margin: 0">Xem CV mẫu cho ứng viên chưa có kinh nghiệm</a> 
            <!--Created CV-->
            <div class="block" id="created_CV">
              <h3 class="blocktitle main-title">CV bạn đã tạo: <span class="ft_11 red">(Tối đa được tạo 3 CV)</span></h3>
              <div class="resumes_table" style="width: 369px">
                <div class="resumes_row">
                  <div class="resumes_td" style="width: 150px">Hồ sơ xin việc 1</div>
                  <div class="resumes_td" style="width: 80px">Đã duyệt</div>
                  <div class="resumes_td">
                    <input type="button" onclick="ntv_quan_tri_hien_thi_sua_thong_tin_tai_khoan();return(false);" value="Sửa" class="btn_green01" >
                    <input type="button" onclick="ntv_quan_tri_hien_thi_sua_thong_tin_tai_khoan();return(false);" value="Xóa" class="btn_green01" >
                  </div>
                </div>
                <div class="resumes_row">
                  <div class="resumes_td">Hồ sơ xin việc 2</div>
                  <div class="resumes_td">Đã duyệt</div>
                  <div class="resumes_td">
                    <input type="button" onclick="ntv_quan_tri_hien_thi_sua_thong_tin_tai_khoan();return(false);" value="Sửa" class="btn_green01" >
                    <input type="button" onclick="ntv_quan_tri_hien_thi_sua_thong_tin_tai_khoan();return(false);" value="Xóa" class="btn_green01" >
                  </div>
                </div>
                <div class="resumes_row">
                  <div class="resumes_td">Hồ sơ xin việc 3</div>
                  <div class="resumes_td">Đã duyệt</div>
                  <div class="resumes_td">
                    <input type="button" onclick="ntv_quan_tri_hien_thi_sua_thong_tin_tai_khoan();return(false);" value="Sửa" class="btn_green01" >
                    <input type="button" onclick="ntv_quan_tri_hien_thi_sua_thong_tin_tai_khoan();return(false);" value="Xóa" class="btn_green01" >
                  </div>
                </div>
                <div class="clearfix"> </div>
              </div>
            </div>
          </div>
          <div class="clear"></div>
        </div>
        <!--Title-->
        <div class="block">
          <h3 class="blocktitle main-title">Tiêu đề CV</h3>
          <div class="block_rec bl_white border1">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Tiêu đề CV (<span class="red">*</span>):</b><br />
                <span style="line-height:14px" class="ft_11">(Bạn nên để Tiêu đề CV rõ ràng để thu hút NTD hơn)</span></div>
              <div class="tbUser_col col_r">
                <input type="text" onkeydown="if(event.keyCode == 13 || event.keyCode == '13'){return(false);}" value="" id="c_tieu_de_cv" name="c_tieu_de_cv" class="textbox">
                <div class="ft_11" id="err_c_tieu_de_cv"><b>Ví dụ:</b> <span style="font-weight:bold;font-size:11px;"></span><span class="ft_11 red">Hồ sơ ứng tuyển vị trí nhân viên kế toán</span></div>
              </div>
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--Personal Information-->
        <div class="block">
          <h3 class="blocktitle main-title">Thông tin cá nhân</h3>
          <div class="block_rec bl_white border1" style="padding-left: 30%">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Họ và tên:</b> </div>
              <div class="tbUser_col col_r"> Lê Thị Đào </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Ngày sinh:</b> </div>
              <div class="tbUser_col col_r"> 01-06-1985 </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Giới tính:</b> </div>
              <div class="tbUser_col col_r"> Nữ </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Tình trạng hôn nhân:</b> </div>
              <div class="tbUser_col col_r"> Đã có gia đình </div>
            </div>
            <div align="right" class="button_filter">
              <input type="button" onclick="ntv_quan_tri_hien_thi_sua_thong_tin_tai_khoan();return(false);" value="Sửa" class="btn_green01">
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--Education Level-->
        <div class="block">
          <h3 class="blocktitle main-title">Trình độ học vấn</h3>
          <div class="block_rec bl_white border1">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Trình độ học vấn (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <select id="trinh_do" name="trinh_do" class="dropbox">
                  <option value="-1">-- Chọn trình độ học vấn --</option>
                  <option value="1">Trên đại học</option>
                  <option value="2">Đại học</option>
                  <option value="3">Cao đẳng</option>
                  <option value="4">Trung cấp</option>
                  <option value="5">Trung học</option>
                  <option value="6">Không yêu cầu</option>
                </select>
                <div class="red" id="err_trinh_do"></div>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Ngành học (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" onkeydown="if(event.keyCode == 13 || event.keyCode == '13'){return(false);}" value="" id="nganh_hoc" name="nganh_hoc" class="textbox">
                <div class="red" id="err_nganh_hoc"></div>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Tốt nghiệp năm:</b> </div>
              <div class="tbUser_col col_r">
                <select id="select_box_nam_tot_nghiep" name="select_box_nam_tot_nghiep" class="dropbox">
                  <option value="-1">-- Chọn năm tốt nghiệp --</option>
                  <option value="2014">2014</option>
                  <option value="2013">2013</option>
                  <option value="2012">2012</option>
                  <option value="2011">2011</option>
                  <option value="2010">2010</option>
                  <option value="2009">2009</option>
                  <option value="2008">2008</option>
                  <option value="2007">2007</option>
                  <option value="2006">2006</option>
                  <option value="2005">2005</option>
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
                </select>
                <div class="red" id="err_nam_tot_nghiep"></div>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Loại tốt nghiệp:</b> </div>
              <div class="tbUser_col col_r">
                <select id="select_box_loai_tot_nghiep" name="select_box_loai_tot_nghiep" class="dropbox">
                  <option value="-1">-- Chọn loại tốt nghiệp --</option>
                  <option value="1">Xuất sắc</option>
                  <option value="2">Giỏi</option>
                  <option value="3">Khá</option>
                  <option value="4">Trung bình khá</option>
                  <option value="5">Trung bình</option>
                </select>
                <div class="red" id="err_loai_tot_nghiep"></div>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Tốt nghiệp tại trường:</b> <br>
                <i class="ft_11 red">(Chỉ được chọn 1 trường)</i> </div>
              <div class="tbUser_col col_r">
                <input type="text" onkeydown="if(event.keyCode == 13 || event.keyCode == '13'){return(false);}" title="Đánh tên trường bạn cần tìm vào, chọn tên trường trong danh sách hiển thị, trường sẽ tự động được chọn ở box dưới" onfocus="if (this.value=='Nhập trường cần chọn vào đây') this.value='';" onblur="if (this.value=='') this.value='Nhập trường cần chọn vào đây';" value="Nhập trường cần chọn vào đây" style="width:490px;" id="txt_truong" name="txt_truong" class="textbox ac_input" autocomplete="off">
                <div id="div_listTruong" style="width:480px;" class="listTruong">
                  <input type="hidden" value="485" id="tong_so_truong" name="tong_so_truong">
                  <div id="hien_thi_truong_0">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(0)" value="99" id="checkbox_truong[0]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[0]').checked=!(document.getElementById('checkbox_truong[0]').checked); ntv_quan_tri_chon_truong(0);"> <b id="b_ten_truong_0" onmouseout="document.getElementById('b_ten_truong_0').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_0').style.textDecoration='underline';" style="text-decoration: none;">Viện Đại học Mở HN </b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_1">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(1)" value="445" id="checkbox_truong[1]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[1]').checked=!(document.getElementById('checkbox_truong[1]').checked); ntv_quan_tri_chon_truong(1);"> <b id="b_ten_truong_1" onmouseout="document.getElementById('b_ten_truong_1').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_1').style.textDecoration='underline';" style="text-decoration: none;">Đại học Quốc tế Sài Gòn</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_2">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(2)" value="419" id="checkbox_truong[2]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[2]').checked=!(document.getElementById('checkbox_truong[2]').checked); ntv_quan_tri_chon_truong(2);"> <b id="b_ten_truong_2" onmouseout="document.getElementById('b_ten_truong_2').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_2').style.textDecoration='underline';" style="text-decoration: none;">Cao đẳng Kỹ thuật Vinhempich</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_3">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(3)" value="416" id="checkbox_truong[3]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[3]').checked=!(document.getElementById('checkbox_truong[3]').checked); ntv_quan_tri_chon_truong(3);"> <b id="b_ten_truong_3" onmouseout="document.getElementById('b_ten_truong_3').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_3').style.textDecoration='underline';" style="text-decoration: none;">Sỹ Quan Thông Tin (Quân sự, Thi ở phía Nam)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_4">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(4)" value="195" id="checkbox_truong[4]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[4]').checked=!(document.getElementById('checkbox_truong[4]').checked); ntv_quan_tri_chon_truong(4);"> <b id="b_ten_truong_4" onmouseout="document.getElementById('b_ten_truong_4').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_4').style.textDecoration='underline';" style="text-decoration: none;">Sỹ quan thông tin</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_5">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(5)" value="415" id="checkbox_truong[5]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[5]').checked=!(document.getElementById('checkbox_truong[5]').checked); ntv_quan_tri_chon_truong(5);"> <b id="b_ten_truong_5" onmouseout="document.getElementById('b_ten_truong_5').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_5').style.textDecoration='underline';">Sỹ Quan Tăng-Thiết Giáp (Thi ở phía Nam)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_6">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(6)" value="194" id="checkbox_truong[6]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[6]').checked=!(document.getElementById('checkbox_truong[6]').checked); ntv_quan_tri_chon_truong(6);"> <b id="b_ten_truong_6" onmouseout="document.getElementById('b_ten_truong_6').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_6').style.textDecoration='underline';">Sỹ quan tăng thiết giáp - KV Phía Bắc</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_7">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(7)" value="411" id="checkbox_truong[7]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[7]').checked=!(document.getElementById('checkbox_truong[7]').checked); ntv_quan_tri_chon_truong(7);"> <b id="b_ten_truong_7" onmouseout="document.getElementById('b_ten_truong_7').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_7').style.textDecoration='underline';">Sỹ Quan Phòng Hoá (Thi ở phía Nam)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_8">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(8)" value="413" id="checkbox_truong[8]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[8]').checked=!(document.getElementById('checkbox_truong[8]').checked); ntv_quan_tri_chon_truong(8);"> <b id="b_ten_truong_8" onmouseout="document.getElementById('b_ten_truong_8').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_8').style.textDecoration='underline';">Sỹ Quan Pháo Binh (Thi ở phía Nam)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_9">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(9)" value="412" id="checkbox_truong[9]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[9]').checked=!(document.getElementById('checkbox_truong[9]').checked); ntv_quan_tri_chon_truong(9);"> <b id="b_ten_truong_9" onmouseout="document.getElementById('b_ten_truong_9').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_9').style.textDecoration='underline';">Sỹ Quan Lục Quân 2 (Thi ở phía Nam)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_10">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(10)" value="185" id="checkbox_truong[10]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[10]').checked=!(document.getElementById('checkbox_truong[10]').checked); ntv_quan_tri_chon_truong(10);"> <b id="b_ten_truong_10" onmouseout="document.getElementById('b_ten_truong_10').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_10').style.textDecoration='underline';">Sỹ Quan Không Quân (Hệ ĐH, thi ở phía Nam)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_11">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(11)" value="434" id="checkbox_truong[11]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[11]').checked=!(document.getElementById('checkbox_truong[11]').checked); ntv_quan_tri_chon_truong(11);"> <b id="b_ten_truong_11" onmouseout="document.getElementById('b_ten_truong_11').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_11').style.textDecoration='underline';">Sỹ Quan Không Quân (hệ ĐH, thi ở phía Bắc)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_12">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(12)" value="410" id="checkbox_truong[12]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[12]').checked=!(document.getElementById('checkbox_truong[12]').checked); ntv_quan_tri_chon_truong(12);"> <b id="b_ten_truong_12" onmouseout="document.getElementById('b_ten_truong_12').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_12').style.textDecoration='underline';">Sỹ Quan Đặc Công (Thi ở phía Nam)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_13">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(13)" value="179" id="checkbox_truong[13]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[13]').checked=!(document.getElementById('checkbox_truong[13]').checked); ntv_quan_tri_chon_truong(13);"> <b id="b_ten_truong_13" onmouseout="document.getElementById('b_ten_truong_13').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_13').style.textDecoration='underline';">Sỹ quan đặc công - KV Phía Bắc</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_14">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(14)" value="414" id="checkbox_truong[14]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[14]').checked=!(document.getElementById('checkbox_truong[14]').checked); ntv_quan_tri_chon_truong(14);"> <b id="b_ten_truong_14" onmouseout="document.getElementById('b_ten_truong_14').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_14').style.textDecoration='underline';">Sỹ Quan Công Binh (Quân sự, Thi ở phía Nam)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_15">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(15)" value="193" id="checkbox_truong[15]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[15]').checked=!(document.getElementById('checkbox_truong[15]').checked); ntv_quan_tri_chon_truong(15);"> <b id="b_ten_truong_15" onmouseout="document.getElementById('b_ten_truong_15').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_15').style.textDecoration='underline';">Sỹ quan công binh</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_16">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(16)" value="182" id="checkbox_truong[16]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[16]').checked=!(document.getElementById('checkbox_truong[16]').checked); ntv_quan_tri_chon_truong(16);"> <b id="b_ten_truong_16" onmouseout="document.getElementById('b_ten_truong_16').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_16').style.textDecoration='underline';">Sĩ quan phòng hóa - KV Phía Bắc</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_17">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(17)" value="309" id="checkbox_truong[17]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[17]').checked=!(document.getElementById('checkbox_truong[17]').checked); ntv_quan_tri_chon_truong(17);"> <b id="b_ten_truong_17" onmouseout="document.getElementById('b_ten_truong_17').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_17').style.textDecoration='underline';">Nhạc Viện Tp .HCM</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_18">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(18)" value="388" id="checkbox_truong[18]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[18]').checked=!(document.getElementById('checkbox_truong[18]').checked); ntv_quan_tri_chon_truong(18);"> <b id="b_ten_truong_18" onmouseout="document.getElementById('b_ten_truong_18').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_18').style.textDecoration='underline';">Nhac việc Hà Nội</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_19">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(19)" value="204" id="checkbox_truong[19]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[19]').checked=!(document.getElementById('checkbox_truong[19]').checked); ntv_quan_tri_chon_truong(19);"> <b id="b_ten_truong_19" onmouseout="document.getElementById('b_ten_truong_19').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_19').style.textDecoration='underline';">Khoa Quốc Tế - Đại Học QG Hà Nội</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_20">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(20)" value="382" id="checkbox_truong[20]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[20]').checked=!(document.getElementById('checkbox_truong[20]').checked); ntv_quan_tri_chon_truong(20);"> <b id="b_ten_truong_20" onmouseout="document.getElementById('b_ten_truong_20').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_20').style.textDecoration='underline';">HV Phòng Không - Không Quân - Chỉ Huy Tham Mưu (KV Miền Nam)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_21">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(21)" value="381" id="checkbox_truong[21]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[21]').checked=!(document.getElementById('checkbox_truong[21]').checked); ntv_quan_tri_chon_truong(21);"> <b id="b_ten_truong_21" onmouseout="document.getElementById('b_ten_truong_21').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_21').style.textDecoration='underline';">HV Phòng Không - Không Quân - Chỉ Huy Tham Mưu (KV Miền Bắc)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_22">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(22)" value="174" id="checkbox_truong[22]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[22]').checked=!(document.getElementById('checkbox_truong[22]').checked); ntv_quan_tri_chon_truong(22);"> <b id="b_ten_truong_22" onmouseout="document.getElementById('b_ten_truong_22').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_22').style.textDecoration='underline';">Học viện kỹ thuật quân sự - Hệ dân sự (Phía Bắc)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_23">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(23)" value="48" id="checkbox_truong[23]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[23]').checked=!(document.getElementById('checkbox_truong[23]').checked); ntv_quan_tri_chon_truong(23);"> <b id="b_ten_truong_23" onmouseout="document.getElementById('b_ten_truong_23').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_23').style.textDecoration='underline';">Học viện Y dược học cổ truyền Việt Nam</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_24">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(24)" value="31" id="checkbox_truong[24]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[24]').checked=!(document.getElementById('checkbox_truong[24]').checked); ntv_quan_tri_chon_truong(24);"> <b id="b_ten_truong_24" onmouseout="document.getElementById('b_ten_truong_24').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_24').style.textDecoration='underline';">Học viện Tài Chính</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_25">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(25)" value="191" id="checkbox_truong[25]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[25]').checked=!(document.getElementById('checkbox_truong[25]').checked); ntv_quan_tri_chon_truong(25);"> <b id="b_ten_truong_25" onmouseout="document.getElementById('b_ten_truong_25').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_25').style.textDecoration='underline';">Học viện Sỹ quan pháo binh</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_26">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(26)" value="188" id="checkbox_truong[26]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[26]').checked=!(document.getElementById('checkbox_truong[26]').checked); ntv_quan_tri_chon_truong(26);"> <b id="b_ten_truong_26" onmouseout="document.getElementById('b_ten_truong_26').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_26').style.textDecoration='underline';">Học viện Sỹ quan lục quân II</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_27">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(27)" value="386" id="checkbox_truong[27]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[27]').checked=!(document.getElementById('checkbox_truong[27]').checked); ntv_quan_tri_chon_truong(27);"> <b id="b_ten_truong_27" onmouseout="document.getElementById('b_ten_truong_27').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_27').style.textDecoration='underline';">Học viện Sỹ quan lục quân I-KV Miền Nam</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_28">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(28)" value="187" id="checkbox_truong[28]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[28]').checked=!(document.getElementById('checkbox_truong[28]').checked); ntv_quan_tri_chon_truong(28);"> <b id="b_ten_truong_28" onmouseout="document.getElementById('b_ten_truong_28').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_28').style.textDecoration='underline';">Học viện Sỹ quan lục quân I - KV Miền Bắc</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_29">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(29)" value="375" id="checkbox_truong[29]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[29]').checked=!(document.getElementById('checkbox_truong[29]').checked); ntv_quan_tri_chon_truong(29);"> <b id="b_ten_truong_29" onmouseout="document.getElementById('b_ten_truong_29').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_29').style.textDecoration='underline';">Học viện Quân Y- Hệ Dân Sự (KV Phía Nam)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_30">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(30)" value="175" id="checkbox_truong[30]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[30]').checked=!(document.getElementById('checkbox_truong[30]').checked); ntv_quan_tri_chon_truong(30);"> <b id="b_ten_truong_30" onmouseout="document.getElementById('b_ten_truong_30').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_30').style.textDecoration='underline';">Học viện Quân Y - Hệ Dân Sự (KV Phía Bắc)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_31">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(31)" value="374" id="checkbox_truong[31]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[31]').checked=!(document.getElementById('checkbox_truong[31]').checked); ntv_quan_tri_chon_truong(31);"> <b id="b_ten_truong_31" onmouseout="document.getElementById('b_ten_truong_31').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_31').style.textDecoration='underline';">Học Viện Quân Y - Bác sỹ quân y (Khu Vực Phía Nam)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_32">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(32)" value="196" id="checkbox_truong[32]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[32]').checked=!(document.getElementById('checkbox_truong[32]').checked); ntv_quan_tri_chon_truong(32);"> <b id="b_ten_truong_32" onmouseout="document.getElementById('b_ten_truong_32').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_32').style.textDecoration='underline';">Học Viện Quân Y - Bác sỹ Quân Y (Khu Vực Phía Bắc)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_33">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(33)" value="87" id="checkbox_truong[33]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[33]').checked=!(document.getElementById('checkbox_truong[33]').checked); ntv_quan_tri_chon_truong(33);"> <b id="b_ten_truong_33" onmouseout="document.getElementById('b_ten_truong_33').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_33').style.textDecoration='underline';">Học viện Quản lý Giáo dục</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_34">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(34)" value="80" id="checkbox_truong[34]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[34]').checked=!(document.getElementById('checkbox_truong[34]').checked); ntv_quan_tri_chon_truong(34);"> <b id="b_ten_truong_34" onmouseout="document.getElementById('b_ten_truong_34').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_34').style.textDecoration='underline';">Học viện Ngoại Giao</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_35">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(35)" value="184" id="checkbox_truong[35]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[35]').checked=!(document.getElementById('checkbox_truong[35]').checked); ntv_quan_tri_chon_truong(35);"> <b id="b_ten_truong_35" onmouseout="document.getElementById('b_ten_truong_35').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_35').style.textDecoration='underline';">HV Phòng không - Không quân - kỹ sư hàng không (Thi ở phía Bắc)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_36">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(36)" value="192" id="checkbox_truong[36]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[36]').checked=!(document.getElementById('checkbox_truong[36]').checked); ntv_quan_tri_chon_truong(36);"> <b id="b_ten_truong_36" onmouseout="document.getElementById('b_ten_truong_36').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_36').style.textDecoration='underline';">Học viện phòng không không quân (chỉ huy tham mưu)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_37">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(37)" value="383" id="checkbox_truong[37]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[37]').checked=!(document.getElementById('checkbox_truong[37]').checked); ntv_quan_tri_chon_truong(37);"> <b id="b_ten_truong_37" onmouseout="document.getElementById('b_ten_truong_37').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_37').style.textDecoration='underline';">Học viện phòng không - không quân - Kỹ sư hàng không (KV Miền Nam)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_38">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(38)" value="478" id="checkbox_truong[38]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[38]').checked=!(document.getElementById('checkbox_truong[38]').checked); ntv_quan_tri_chon_truong(38);"> <b id="b_ten_truong_38" onmouseout="document.getElementById('b_ten_truong_38').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_38').style.textDecoration='underline';">Học viện Ngân hàng (tại Phân viện Phú Yên)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_39">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(39)" value="93" id="checkbox_truong[39]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[39]').checked=!(document.getElementById('checkbox_truong[39]').checked); ntv_quan_tri_chon_truong(39);"> <b id="b_ten_truong_39" onmouseout="document.getElementById('b_ten_truong_39').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_39').style.textDecoration='underline';">Học viện Ngân Hàng</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_40">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(40)" value="373" id="checkbox_truong[40]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[40]').checked=!(document.getElementById('checkbox_truong[40]').checked); ntv_quan_tri_chon_truong(40);"> <b id="b_ten_truong_40" onmouseout="document.getElementById('b_ten_truong_40').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_40').style.textDecoration='underline';">Học viện kỹ thuật quân sự - Kỹ sư quân sự (Khu vực Phía Nam)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_41">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(41)" value="186" id="checkbox_truong[41]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[41]').checked=!(document.getElementById('checkbox_truong[41]').checked); ntv_quan_tri_chon_truong(41);"> <b id="b_ten_truong_41" onmouseout="document.getElementById('b_ten_truong_41').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_41').style.textDecoration='underline';">Học viện kỹ thuật quân sự - Hệ dân sự (Khu vực Phía Bắc)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_42">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(42)" value="372" id="checkbox_truong[42]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[42]').checked=!(document.getElementById('checkbox_truong[42]').checked); ntv_quan_tri_chon_truong(42);"> <b id="b_ten_truong_42" onmouseout="document.getElementById('b_ten_truong_42').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_42').style.textDecoration='underline';">Học viện kỹ thuật quân sự - Hệ dân sự (Phía Nam)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_43">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(43)" value="98" id="checkbox_truong[43]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[43]').checked=!(document.getElementById('checkbox_truong[43]').checked); ntv_quan_tri_chon_truong(43);"> <b id="b_ten_truong_43" onmouseout="document.getElementById('b_ten_truong_43').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_43').style.textDecoration='underline';">Học viện Kỹ thuật Mật mã</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_44">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(44)" value="376" id="checkbox_truong[44]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[44]').checked=!(document.getElementById('checkbox_truong[44]').checked); ntv_quan_tri_chon_truong(44);"> <b id="b_ten_truong_44" onmouseout="document.getElementById('b_ten_truong_44').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_44').style.textDecoration='underline';">Học viện khoa học quân sự - Hệ quân đội (KV Phía Nam)</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_432">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(432)" value="446" id="checkbox_truong[432]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[432]').checked=!(document.getElementById('checkbox_truong[432]').checked); ntv_quan_tri_chon_truong(432);"> <b id="b_ten_truong_432" onmouseout="document.getElementById('b_ten_truong_432').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_432').style.textDecoration='underline';">Cao đẳng Cộng đồng Lai Châu</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_433">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(433)" value="327" id="checkbox_truong[433]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[433]').checked=!(document.getElementById('checkbox_truong[433]').checked); ntv_quan_tri_chon_truong(433);"> <b id="b_ten_truong_433" onmouseout="document.getElementById('b_ten_truong_433').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_433').style.textDecoration='underline';">Cao Đẳng Cộng Đồng Kiên Giang</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_434">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(434)" value="326" id="checkbox_truong[434]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[434]').checked=!(document.getElementById('checkbox_truong[434]').checked); ntv_quan_tri_chon_truong(434);"> <b id="b_ten_truong_434" onmouseout="document.getElementById('b_ten_truong_434').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_434').style.textDecoration='underline';">Cao Đẳng Cộng Đồng Hậu Giang</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_435">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(435)" value="238" id="checkbox_truong[435]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[435]').checked=!(document.getElementById('checkbox_truong[435]').checked); ntv_quan_tri_chon_truong(435);"> <b id="b_ten_truong_435" onmouseout="document.getElementById('b_ten_truong_435').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_435').style.textDecoration='underline';">Cao Đẳng Cộng Đồng Hải Phòng</b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div id="hien_thi_truong_484">
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td><input type="checkbox" onclick="ntv_quan_tri_chon_truong(484)" value="485" id="checkbox_truong[484]" name="checkbox_truong[]"></td>
                          <td style="padding-left:5px;"><a href="javascript: document.getElementById('checkbox_truong[484]').checked=!(document.getElementById('checkbox_truong[484]').checked); ntv_quan_tri_chon_truong(484);"> <b id="b_ten_truong_484" onmouseout="document.getElementById('b_ten_truong_484').style.textDecoration='none';" onmouseover="document.getElementById('b_ten_truong_484').style.textDecoration='underline';">Đại học Phan Thiết </b></a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
                <div class="red" id="err_truong"></div>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col">&nbsp;</div>
              <div class="tbUser_col col_r">
                <input type="radio" onclick="ntv_quan_tri_hien_thi_truong_duoc_chon(1)" checked="" value="1" id="radio_hien_thi_truong_duoc_chon" name="radio_hien_thi_truong_duoc_chon">
                <a style="color: #5B960D" href="javascript:document.getElementById('radio_hien_thi_truong_duoc_chon').checked=true;ntv_quan_tri_hien_thi_truong_duoc_chon(1);">Hiển thị trường được chọn</a> <br>
                <input type="radio" onclick="ntv_quan_tri_hien_thi_truong_duoc_chon(0)" checked="" value="0" id="radio_hien_thi_truong_duoc_chon_0" name="radio_hien_thi_truong_duoc_chon">
                <a style="color: #5B960D" href="javascript:document.getElementById('radio_hien_thi_truong_duoc_chon_0').checked=true;ntv_quan_tri_hien_thi_truong_duoc_chon(0);">Hiển thị tất cả các trường</a> 
                <script>                    ntv_quan_tri_hien_thi_truong_duoc_chon(0); </script> 
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Trình độ ngoại ngữ:</b> </div>
              <div class="tbUser_col col_r">
                <select id="select_box_ngoai_ngu" name="select_box_ngoai_ngu" style="width:240px" class="dropbox">
                  <option value="-1">-- Chọn ngoại ngữ --</option>
                  <option value="EN-DE">Tiếng Anh &ndash; Tiếng Đức</option>
                  <option value="EN-RU">Tiếng Anh - Tiếng Nga</option>
                  <option value="EN-IT">Tiếng Anh &ndash; Tiếng Ý</option>
                  <option value="EN-ES">Tiếng Anh &ndash; Tiếng Tây Ban Nha</option>
                  <option value="EN">English - Tiếng Anh</option>
                  <option value="FR">French - Tiếng Pháp</option>
                  <option value="US">United States - Tiếng Anh Mỹ</option>
                  <option value="RU">Russian - Tiếng Nga</option>
                  <option value="CN">Chinese - Tiếng Trung</option>
                  <option value="KR">Korean - Tiếng Hàn</option>
                  <option value="JP">Japanese - Tiếng Nhật</option>
                  <option value="DE">German - Tiếng Đức</option>
                  <option value="SA">Arabic - Tiếng Ả Rập</option>
                  <option value="BJ">Bengalic - Tiếng Bengal</option>
                  <option value="BG">Bulgarian - Tiếng Bungary</option>
                  <option value="BF">Burmese - Tiếng Miến điện</option>
                  <option value="KH">Cambodian - Tiếng Campuchia</option>
                  <option value="CZ">Czech  - Tiếng Séc</option>
                  <option value="DA">Danmark - Tiếng Đan mạch</option>
                  <option value="SX">Dutch - Tiếng Hà Lan</option>
                  <option value="FI">Finnish - Tiếng phần Lan</option>
                  <option value="GR">Greek - Tiếng Hy Lạp</option>
                  <option value="IN">Hindi - Tiếng Hinđi</option>
                  <option value="HU">Hungarian - Tiếng Hungary</option>
                  <option value="ID">Indonesian - Tiếng Inđônesia</option>
                  <option value="IT">Italian - Tiếng Ý</option>
                  <option value="LA">Laotian - Tiếng Lào</option>
                  <option value="MY">Malay - Tiếng Mã Lai</option>
                  <option value="NO">Norwegian - Tiếng Nauy</option>
                  <option value="PL">Polish - Tiếng Ba Lan</option>
                  <option value="PT">Portuguese - Tiếng Bồ Đào Nha</option>
                  <option value="RO">Romanian  - Tiếng Ru ma ni</option>
                  <option value="ES">Spanish - Tiếng Tây Ban Nha</option>
                  <option value="TW">Taiwanese - Tiếng Đài Loan</option>
                  <option value="TR">Turkish - Tiếng Thổ Nhĩ Kỳ</option>
                  <option value="TH">Thai - Tiếng Thái</option>
                  <option value="UA">Ukrainian - Tiếng Ucraina</option>
                  <option value="00">Khác</option>
                </select>
                <div class="red" id="err_ngoai_ngu"></div>
                <select id="select_box_trinh_do_ngoai_ngu" name="select_box_trinh_do_ngoai_ngu" style="width:240px; position: absolute; top: 5px; left: 260px" class="dropbox">
                  <option value="-1">-- Chọn trình độ ngoại ngữ --</option>
                  <option value="1">Sơ cấp</option>
                  <option value="2">Trung cấp</option>
                  <option value="3">Cao cấp</option>
                </select>
                <div class="red" id="err_trinh_do_ngoai_ngu"></div>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Trình độ tin học:</b> </div>
              <div class="tbUser_col col_r">
                <textarea id="trinh_do_tin_hoc" name="trinh_do_tin_hoc" style="width:480px" class="textArea"></textarea>
                <div class="red" id="err_trinh_do_tin_hoc"></div>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Các bằng cấp <br>
                / chứng chỉ khác:</b> </div>
              <div class="tbUser_col col_r">
                <textarea id="bang_cap_khac" name="bang_cap_khac" style="width:480px" class="textArea"></textarea>
                <div class="red" id="err_bang_cap_khac"></div>
              </div>
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--Work Experience-->
        <div class="block">
          <h3 class="blocktitle main-title">Kinh nghiệm làm việc</h3>
          <div class="block_rec bl_white border1">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Số năm kinh nghiệm (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <select id="so_nam_kinh_nghiem" name="so_nam_kinh_nghiem" class="dropbox">
                  <option value="-1">-- Chọn số năm kinh nghiệm --</option>
                  <option value="8">Chưa có kinh nghiệm</option>
                  <option value="1">Dưới 1 năm</option>
                  <option value="2">1 năm</option>
                  <option value="3">2 năm</option>
                  <option value="4">3 năm</option>
                  <option value="5">4 năm</option>
                  <option value="6">5 năm</option>
                  <option value="7">Hơn 5 năm</option>
                </select>
                <div class="red" id="err_so_nam_kinh_nghiem"></div>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Quá trình làm việc:</b> <br>
                <span style="line-height:14px" class="ft_11"> Nếu bạn chưa có kinh nghiệm làm việc, hãy đưa ra các công việc/ hoạt động bạn đã từng tham gia hoặc đảm trách và các thành tích kỹ năng đạt được </span> </div>
              <div class="tbUser_col col_r">
                <textarea id="c_kinh_nghiem" name="c_kinh_nghiem" style="width:480px;height:200px;line-height:20px" class="textArea">Tên công ty:
Vị trí công việc:
Ngành nghề:
Thời gian bắt đầu:
Thời gian kết thúc:
Mô tả công việc:
Lý do thôi việc:
Thành tích đạt được:
Mức lương:</textarea>
                <div class="red" id="err_kinh_nghiem"></div>
                <a class="linkAdd" title="Chèn thêm bản mẫu điền kinh nghiệm" href="javascript: ntv_quan_tri_chen_kinh_nghiem('\n------------------------------\n','Tên công ty:\nVị trí công việc:\nNgành nghề:\nThời gian bắt đầu:\nThời gian kết thúc:\nMô tả công việc:\nLý do thôi việc:\nThành tích đạt được:\nMức lương:');">Chèn kinh nghiệm</a> </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Kỹ năng nổi bật:</b> </div>
              <div class="tbUser_col col_r">
                <textarea id="ky_nang" name="ky_nang" style="width:480px" class="textArea"></textarea>
                <div class="red" id="err_ky_nang"></div>
              </div>
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--Career objective-->
        <div class="block">
          <h3 class="blocktitle main-title">Mục tiêu nghề nghiệp</h3>
          <div class="block_rec bl_white border1">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Mục tiêu nghề nghiệp:</b> </div>
              <div class="tbUser_col col_r">
                <textarea id="c_muc_tieu_nghe_nghiep" name="c_muc_tieu_nghe_nghiep" style="width:500px;height:100px" class="textArea"></textarea>
                <div class="ft_11 red" id="err_c_muc_tieu_nghe_nghiep"></div>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Mức lương mong muốn (<span class="red">*</span>):</b></div>
              <div class="tbUser_col col_r">
                <select id="c_muc_luong" name="c_muc_luong" class="dropbox">
                  <option value="-1">-- Chọn mức lương --</option>
                  <option value="1">Thỏa thuận</option>
                  <option value="2">1 - 3 triệu</option>
                  <option value="3">3 - 5 triệu</option>
                  <option value="4">5 - 7 triệu</option>
                  <option value="5">7 &ndash; 10 triệu</option>
                  <option value="6">10 &ndash; 15 triệu</option>
                  <option value="7">15 &ndash; 20 triệu</option>
                  <option value="8">20 &ndash; 30 triệu</option>
                  <option value="9">Trên 30 triệu</option>
                </select>
                <div class="ft_11 red" id="err_c_muc_luong"></div>
              </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Ngày có thể bắt đầu làm việc (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" id="datepicker" class="textbox" style="width:150px; background: url(../Images/iconCalendar.gif) 133px top no-repeat">
                (dd-mm-yyyy)
                <div class="ft_11 red" id="err_c_ngay_co_the_bat_dau_lam"></div>
              </div>
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--Reference Sources-->
        <div class="block">
          <h3 class="blocktitle main-title">Nguồn tham khảo</h3>
          <div class="block_rec bl_white border1">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Nguồn tham khảo:</b> <br>
                <span style="line-height:14px" class="ft_11">Hãy nêu tên những người không phải là người thân, không phải là người đã thuê bạn làm việc? (Họ tên, địa chỉ, số điện thoại, nghề nghiệp, quan hệ, đã biết bạn mấy năm?)</span> </div>
              <div class="tbUser_col col_r">
                <textarea id="c_nguon_tham_khao" name="c_nguon_tham_khao" style="width:480px;height:110px" class="textArea">Họ và tên:
Địa chỉ:
Điện thoại:
Nghề nghiệp:
Quan hệ:
Thời gian quen biết:</textarea>
                <div class="red" id="err_nguon_tham_khao"></div>
                <a class="linkAdd" title="Chèn thêm mẫu điền nguồn tham khảo" href="javascript: ntv_quan_tri_chen_tham_khao('\n------------------------------\n','Họ và tên:\nĐịa chỉ:\nĐiện thoại:\nNghề nghiệp:\nQuan hệ:\nThời gian quen biết:');">Chèn nguồn tham khảo</a> </div>
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
        <!--Contact Information-->
        <div class="block">
          <h3 class="blocktitle main-title">Thông tin liên hệ</h3>
          <div class="block_rec bl_white border1" style="padding-left: 10%">
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Người liên hệ:</b> </div>
              <div class="tbUser_col col_r"> Lê Thị Đào </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Địa chỉ liên hệ:</b> </div>
              <div class="tbUser_col col_r"> Gò Vấp </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Email liên hệ:</b> </div>
              <div class="tbUser_col col_r"> daolt@dangcapviet.vn </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Điện thoại liên hệ:</b> </div>
              <div class="tbUser_col col_r"> 01656579085 </div>
            </div>
            <div align="right" class="button_filter">
              <input type="submit" name="btn_filter" value="Sửa" id="search_filter" title="Bấm đây để lọc theo các tiêu chí đã chọn!" class="btn_green01">
            </div>
            <div style="border-top: 1px solid #DDDDDD; height: 1px; margin: 10px"></div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Mã bảo mật:</b> </div>
              <div class="tbUser_col col_r"> <img width="65" height="31" alt="" name="security_image" id="security_image" src="../Images/security_image.php.jpg" /> </div>
            </div>
            <div class="tbUser_row">
              <div class="tbUser_col"><b>Nhập mã bảo mật (<span class="red">*</span>):</b> </div>
              <div class="tbUser_col col_r">
                <input type="text" onkeydown="if(event.keyCode == 13 || event.keyCode == '13'){return(false);}" id="txt_ma_xac_minh" name="txt_ma_xac_minh" class="textbox">
                <div class="red" id="err_ma_xac_minh"></div>
              </div>
            </div>
            <div class="clearfix"> </div>
          </div>
          <div class="tbUser_row" style="padding: 15px">
            <input type="checkbox" checked="" id="chap_nhan_dieu_khoan" name="chap_nhan_dieu_khoan">
            <span>Tôi xin cam đoan những thông tin cung cấp trên đây là hoàn toàn đúng sự thật và đầy đủ. Tôi xin hoàn toàn chịu trách nhiệm nếu những thông tin sai lệch</span>
            <div class="ft_11 red" id="err_c_chap_nhan_dieu_khoan"></div>
          </div>
          <div class="tbUser_row" style="margin: 0 0 15px 100px">
            <input type="button" onclick="javascript: if (dat_trang_thai_dang_xu_ly()) {ntv_quan_tri_cap_nhat_CV(); }" value="Cập nhật" class="btn_green02">
          </div>
        </div>
      </div>
    </div>
    <!--end Main-->
    <div class="clearfix"></div>
    <uc1:boxPhone ID="boxPhone1" runat="server" />
  </div>
</asp:Content>
