<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BannerTopNTD.ascx.cs" Inherits="CatTrang.UIs.BannerTopNTD" %>

      <!--Ads-->
      <div class="ads_rec">
          <asp:Repeater ID="rptbannertop" runat="server">
            <ItemTemplate>
              <%# GetImage(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("AD_ITEM_DESC"))%>
            </ItemTemplate>
          </asp:Repeater>
      </div>
      <!--New Message-->
      <div>
        <marquee bgcolor="#e1e1e1" style="padding:5px;" scrolldelay="180">
        <span style="font-size:14px; color:red; font-family: Verdana, Tahoma, Helvetica, Arial;">
         <asp:Repeater ID="rptMarquee" runat="server">
            <ItemTemplate>
                  <%# Eval("NEWS_TITLE")%>
              </div>
            </ItemTemplate>
          </asp:Repeater> 
         </span></marquee>
      </div>