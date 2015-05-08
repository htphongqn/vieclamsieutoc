<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header_NTV.ascx.cs" Inherits="CatTrang.UIs.header_NTV" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<div class="page">
    <div id="header-inner">
    <div class="logo">
        <asp:Repeater ID="rptLogo" runat="server">
            <ItemTemplate>
                <%# Getbanner(Eval("BANNER_TYPE"),Eval("BANNER_FIELD1"), Eval("BANNER_ID"), Eval("BANNER_FILE"))%>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div id="header-right">
            <div class="topmenu">
            <div style="float: left;margin-left: 290px;margin-top: 4px;">
            Kết nối với việc làm siêu tốc</div>
            <div id="fb-root"></div>
<script>    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&appId=1578997885661619&version=v2.0";
        fjs.parentNode.insertBefore(js, fjs);
    } (document, 'script', 'facebook-jssdk'));</script>
    <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button_count" data-action="like" data-show-faces="true" data-share="true"></div>

    <!-- Place this tag in your head or just before your close body tag. -->
<script src="https://apis.google.com/js/platform.js" async defer></script>

<!-- Place this tag where you want the +1 button to render. -->
<div class="g-plusone"></div>

<!-- Place this tag where you want the share button to render. -->
<div class="g-plus" data-action="share" data-annotation="none"></div>

</div>
    <asp:Panel ID="pnLogin" runat="server" DefaultButton="lnkLogin">
            <div id="divlogin" runat="server" class="loginbox" visible="true">
                <fieldset>
                    <rows>
                        <cols>
                            <input id="txtEmail" runat="server" type="text" class="name" placeholder="Email đăng nhập"/>
                        </cols>
                        <cols>
                            <input id="txtPassword" runat="server" type="password" class="password" placeholder="Mật khẩu" />
                        </cols>
                        <cols><asp:LinkButton ID="lnkLogin" runat="server" CssClass="btn_login" 
                        onclick="lnkLogin_Click"></asp:LinkButton></cols>
                    </rows>
                </fieldset>
                <ul class="menu">
                    <li class="last" style="padding-left:0px;">
                    <img src="/Images/icon_login.png" style="margin-right:5px;" />
                    <%--<a href="/ntv-dang-ky">Đăng ký</a>--%>
                    <asp:LinkButton ID="lnkDangky" runat="server" Text="Đăng ký"></asp:LinkButton>
                    </li>
                    <li class="last" style="padding-left:0px;">&nbsp;|&nbsp;
                    <a href="/quen-mat-khau">Quên mật khẩu</a></li>
                </ul>
            </div>
        </asp:Panel>
            <div id="divtaikhoan" runat="server" class="loginbox taikhoan" visible="false">		
	            <div class="txtViolet">
			        <div style="float:left">Quản lý tài khoản</div> 
			        <div class="thoat">
				        <asp:LinkButton ID="lnkThoat" runat="server" class="thoat" 
                            onclick="lnkThoat_Click">
					        Thoát
				        </asp:LinkButton>
			        </div>
		        </div>			
                <div class="lineGrey marT5"></div>		
                <div class="thongTinTaiKhoan">
		            <b><asp:Literal ID="lbFullName" runat="server"></asp:Literal></b>
	            </div>
	            <div class="thongTinTaiKhoan">
                    <div id="divNTV" runat="server">		
		            <a href="/ntv-thong-tin-ca-nhan" title="Quản trị thông tin tài khoản">
			            - Thông tin tài khoản
		            </a>
		            <a href="/ntv-ho-so-da-dang" title="Quản trị các hồ sơ tìm việc">
			            - Hồ sơ đã đăng
		            </a>
                    </div>
                    <div id="divNTD" runat="server">		
		            <a href="/ntd-thong-tin-tai-khoan" title="Quản trị thông tin tài khoản">
			            - Thông tin nhà tuyển dụng
		            </a><br />
		            <a href="/ntd-tin-tuyen-dung-da-dang" title="Quản trị các tin đã đăng">
			            - Các tin đăng tuyển
		            </a>
                    </div>
	            </div>
            </div>

        </div>
    <div class="clearfix"></div>
    </div>
</div>

<asp:ModalPopupExtender ID="mpext" runat="server" BackgroundCssClass="ModalPopupBG" 
    PopupDragHandleControlID="PopupHeaderMessage3"
    TargetControlID="lnkDangky" CancelControlID="lnkClose" PopupControlID="pnlPopup" Drag="True" RepositionMode="None">
</asp:ModalPopupExtender>
<asp:Panel ID="pnlPopup" runat="server" class="popupConfirmation" Style="display: none;">
    <div class="popup_Container">
        <div class="popup_Titlebar" id="PopupHeaderMessage3">
            <div class="TitlebarLeft">
                <asp:Label ID="lblCaption" runat="server" Text="Đăng ký tài khoản"></asp:Label>
            </div>
            <asp:LinkButton ID="lnkClose" runat="server" CssClass="TitlebarRight"></asp:LinkButton>
        </div>
        <div class="popup_Body" style="font-family:Arial;font-weight:normal;font-size:12pt">
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tbody>
                <tr>
        	        <td class="popupLabel" height="33" align="right"><img src="/images/icon-NTD.gif" width="40" height="40" alt=""></td>
                    <td><a href="/ntd-dang-ky" title="" class="button">Nhà tuyển dụng đăng ký</a></td>
                </tr>
                <tr>
        	        <td class="popupLabel" height="33" align="right"><img src="/images/icon-NTV.gif" width="40" height="40" alt=""></td>
                    <td><a href="/ntv-dang-ky" title="" class="button">Người tìm việc đăng ký</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Panel>
