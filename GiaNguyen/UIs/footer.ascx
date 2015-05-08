<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer.ascx.cs" Inherits="CatTrang.UIs.footer" %>

<div id="footer">
        <div class="nav_f">
        <ul>
            <li><a href="/"><em class="iconHome"><img src="/images/icon_home.png" /></em></a></li>
            <li><a href="/trang-chu.html">Cho người tìm việc</a></li>
            <li><a href="/nha-tuyen-dung/">Cho nhà tuyển dụng</a></li>
            <li><a href="javascript:void(0)">Hổ trợ: 0908 169 044</a></li>
            <li><a href="/gop-y">Góp ý</a></li>
            <li><a href="/huong-dan-su-dung">Hướng dẫn sử dụng</a></li>
            <li class="bth"><a href="#backtohome">Về đầu trang<em class="icon_bth"><img src="/Images/icon_backToHome.png" /></em></a></li>          </ul>

        </div>
            <div id="footer_inner">
     
            <div id="footer_bottom">
              <div class="logo"> 
                <asp:Repeater ID="rptLogo" runat="server">
                    <ItemTemplate>
                        <%# Getbanner(Eval("BANNER_TYPE"),Eval("BANNER_FIELD1"), Eval("BANNER_ID"), Eval("BANNER_FILE"))%>
                    </ItemTemplate>
                </asp:Repeater>
              </div>
              <div class="copyright">
                <asp:Literal ID="lbCoppyRightInfo" runat="server"></asp:Literal>
              </div>
              <div class="clearfix"> </div>
              </div>
        </div>
        </div>