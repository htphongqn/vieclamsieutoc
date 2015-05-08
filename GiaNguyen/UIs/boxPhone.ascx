<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="boxPhone.ascx.cs" Inherits="CatTrang.UIs.boxPhone" %>

<div class="boxPhones">
        <p class="heading"><em class="iconPhone"><img src="/Images/icon_phones.png" /></em> Hotline cho nhà tuyển dụng: 
        <strong><asp:Literal ID="lbHotroMienNam" runat="server"></asp:Literal></strong> và <strong><asp:Literal ID="lbHotroMienBac" runat="server"></asp:Literal></strong></p>
        <hr />
        <p class="heading2">Hotline cho nhà tuyển dụng Miền Nam( Từ Đà Nẵng trở vào)</p>
        <div class="numbersPhone">
    <ul>
        <asp:Repeater ID="rptHotlineMienNam" runat="server">
        <ItemTemplate>                  
            <li>
            <div class="number"><strong><%# Eval("ONLINE_FIELD2")%></strong> <%# Eval("ONLINE_DESC")%></div>
            </li>
        </ItemTemplate>
        </asp:Repeater>
    </ul>
    </div>
    <hr />
    <p class="heading2">Hotline cho nhà tuyển dụng Miền Bắc( Từ Huế trở ra)</p>      
    <div class="numbersPhone">
    <ul>
        <asp:Repeater ID="rptHotlineMienBac" runat="server">
        <ItemTemplate>                  
            <li>
            <div class="number"><strong><%# Eval("ONLINE_FIELD2")%></strong> <%# Eval("ONLINE_DESC")%></div>
            </li>
        </ItemTemplate>
        </asp:Repeater>
    </ul>
    </div>
</div>
<!--boxPhones-->

    <div class="share_left"> 
    <span style="display: inline-block"> <b>Thích và chia sẻ Tuyển dụng Việc làm Siêu Tốc trên:</b> </span> 
    <span style="display:inline-block;"> 
    <div id="fb-root"></div>
    <script>                (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&appId=1578997885661619&version=v2.0";
            fjs.parentNode.insertBefore(js, fjs);
        } (document, 'script', 'facebook-jssdk'));</script>
        <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button_count" data-action="like" data-show-faces="true" data-share="true"></div>
    <%--<a title="Chia sẻ link qua yahoo!" href=""> 
    <img alt="" src="../Images/iconYahoo.gif" height="25" width="25"> </a> 
    <a title="Chia sẻ qua email" href=""> 
    <img alt="" src="../Images/icon-email-share.gif" height="25" width="56"> </a> --%>
    </span> 
    </div>
    <div style="margin-bottom: 15px" class="ft_11"> Kết bạn với Tuyển dụng Việc làm Siêu Tốc trên 
    <span style="display:inline-block"><b style="color: #5e78ab">Facebook</b> và <b style="color: #cd0000">Google +</b></span> 
    để nhận thông tin việc làm và hồ sơ ứng viên tốt nhất. </div>