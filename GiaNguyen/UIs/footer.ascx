﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer.ascx.cs" Inherits="CatTrang.UIs.footer" %>

<div id="footer">
        <div class="nav_f">
        <ul>
            <li><a href="/"><em class="iconHome"><img src="../images/icon_home.png" /></em></a></li>
            <li><a href="/">Cho người tìm việc</a></li>
            <li><a href="/nha-tuyen-dung/">Cho nhà tuyển dụng</a></li>
            <li><a>Hổ trợ :12345</a></li>
            <li><a>Góp ý</a></li>
            <li><a>Hướng dẫn sử dụng</a></li>
            <li class="bth"><a href="#backtohome">Về đầu trang<em class="icon_bth"><img src="../Images/icon_backToHome.png" /></em></a></li>          </ul>

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
            <script>
                (function (i, s, o, g, r, a, m) {
                    i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                        (i[r].q = i[r].q || []).push(arguments)
                    }, i[r].l = 1 * new Date(); a = s.createElement(o),
          m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
                })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

                ga('create', 'UA-41266232-1', 'Esell.Vn');
                ga('send', 'pageview');

        </script> 
        </div>
        </div>