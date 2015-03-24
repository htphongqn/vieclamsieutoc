<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BannerHomeNTV.ascx.cs" Inherits="CatTrang.UIs.BannerHomeNTV" %>

<div class="updateDaily">
    <div class="hd"><span>Cập nhật hôm nay!</span></div>
    <div class="fl nd">Có <strong><asp:Literal ID="lbTotalTodayNews" runat="server" Text="0"></asp:Literal></strong> 
    việc làm mới hôm nay trong <strong><asp:Literal ID="lbTotalNews" runat="server" Text="0"></asp:Literal> </strong>
    việc làm đang tuyển dụng <strong>>> BẤM XEM NGAY !</strong><a href="/tim-kiem-viec-lam-sieu-toc?page=0">
    <img src="../Images/click.gif" style="height:14px; margin-left:10px" /></a></div>
</div>
<!--updateDaily-->         
<div class="dangKyNhanThongTin">
    <div class="imgAdsDK"><img src="../Images/img2.png" /></div>
    <div class="boxDK">
        <p style="clear:both;">Để tuyển dụng hoặc tìm việc nhanh, vui lòng ĐĂNG KÝ TƯ VẤN để được hỗ trợ ngay</p>
        <div class="grbtnDK"> 
        <a href="/nha-tuyen-dung/" class="btnNhaTD">Nhà tuyển dụng đăng ký Tư Vấn</a> 
        <a href="/" class="btnNguoiTimViec">Người tìm việc đăng ký Tư vấn</a> 
        </div>
    </div>
    <div class="phoneSupp">
        <p><em class="iconPhone">&nbsp;</em>Điện thoại hỗ trợ</p>
        <p>Miền Bắc:<strong><asp:Literal ID="lbHotroMienBac" runat="server"></asp:Literal></strong></p>
        <p>Miền Nam:<strong><asp:Literal ID="lbHotroMienNam" runat="server"></asp:Literal></strong></p>
    </div>
</div>
    <!--dangKyNhanThongTin-->          
<div class="searchDiff">
<fieldset>
    <rows>
        <cols>
            <input id="txtSearch" runat="server" name="" type="text" class="congViec" placeholder="Nhập tiêu đề công việc, tên NTD, địa điểm để tìm kiếm"/>
        </cols>
        <cols>
            <asp:DropDownList id="ddlNganhnghe" runat="server" DataTextField="Cat_Name" DataValueField="Cat_Id" AppendDataBoundItems="true">                        
            <asp:ListItem Value="0" Text="Tất cả ngành nghề"></asp:ListItem>
            </asp:DropDownList>
        </cols>
        <cols>
            <asp:DropDownList id="ddlDiadiem" runat="server" DataTextField="Are_Name" DataValueField="Are_Id" AppendDataBoundItems="true">
            <asp:ListItem Value="0" Text="Tất cả địa điểm"></asp:ListItem>                        
            </asp:DropDownList>
        </cols>
        <cols>
            <asp:DropDownList id="ddlMucluong" runat="server" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true">    
            <asp:ListItem Value="0" Text="Tất cả mức lương"></asp:ListItem>                    
            </asp:DropDownList>
        </cols>
        <cols><asp:LinkButton ID="lnkTimngay" runat="server" CssClass="btnTimNgay" 
        Text="Tìm Ngay" onclick="lnkTimngay_Click"></asp:LinkButton></cols>      
    </rows>
</fieldset>
</div>