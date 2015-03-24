<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="sidebar_NTD.ascx.cs" Inherits="CatTrang.UIs.sidebar_NTD" %>

<div style="float: right; width: 325px" id="right_sidebar"> 
            <!--Ads-->
            <div class="ads_rec"> 
              <asp:Repeater ID="rptBannerPhai1" runat="server">
                <ItemTemplate>
                  <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("AD_ITEM_DESC"))%>
                </ItemTemplate>
              </asp:Repeater>
            </div>
            <!--Handbook Search Jobs-->
            <%--<div class="block">
                <h3 class="blocktitle main-title"> Cẩm nang tìm việc</h3>
                <div class="block_rec bl_white" id="handbook_search_jobs"> 
                <ul class="quick_page">
                    <asp:Repeater ID="rptCamnang" runat="server">
                            <ItemTemplate>
                                <li><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                                    <img  src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>" /></a> 
                                    <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" class="handbook_title"><%# Eval("NEWS_TITLE")%></a> <span><%# Eval("NEWS_DESC")%></span></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul> 
                <div class="clearfix"> </div>
                </div>
                </div>--%>
            <!--Filter-->
                <div class="block">
                    <h3 class="blocktitle main-title"> Lọc tìm</h3>
                    <div class="block_rec bl_white padding1" id="filter">
                                                            <div class="searchItem"> 
                    <div class="searchGroup">Ngành nghề</div>
                        <div class="searchObject">
                    <asp:TextBox ID="txtFilterNganhnghe" runat="server" value="Tìm nhanh ngành nghề..." onfocus="if (this.value=='Tìm nhanh ngành nghề...') this.value='';" onblur="if (this.value=='') this.value='Tìm nhanh ngành nghề...';" CssClass="filter_textbox"></asp:TextBox>
                      <%--<div id="div_listNganh" class="listTruong" style="width: 166px;">--%>
                          <asp:ListBox ID="cblRdoOptionNganhnghe" DataValueField="Cat_Id" DataTextField="Cat_Name" runat="server" CssClass="filter_list">
                          </asp:ListBox>                      
                      <%--</div>--%>
                    </div>
                        <div class="clear"></div>
                    </div>
                                                            <div class="searchItem">
                        <div class="searchGroup">Địa điểm</div>
                        <div class="searchObject">
                        <asp:TextBox ID="txtFilterDiadiem" runat="server" onfocus="if (this.value=='Tìm nhanh địa điểm...') this.value='';" onblur="if (this.value=='') this.value='Tìm nhanh địa điểm...';" value="Tìm nhanh địa điểm..." CssClass="filter_textbox"></asp:TextBox>
                        <%--<div id="div_listTinh" class="listTruong" style="width: 166px;">--%>
                            <asp:ListBox ID="cblChkOptionDiadiem" DataValueField="Are_Id" DataTextField="Are_Name" runat="server" CssClass="filter_list">
                            </asp:ListBox>
                        <%--</div>--%>
                        </div>
                        <div class="clear"></div>
                    </div>
                                                        <div class="searchItem">
                        <div class="searchGroup">Mức lương</div>
                        <div class="searchObject">
                        <asp:DropDownList id="ddlMucluong" runat="server" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" CssClass="filter_drop">    
                        <asp:ListItem Value="0" Text="Chọn mức lương"></asp:ListItem>                    
                        </asp:DropDownList>
                    </div>
                        <div class="clear"></div>
                    </div>
                                                    <div class="searchItem">
                        <div class="searchGroup">Kinh nghiệm</div>
                        <div class="searchObject">
                            <asp:DropDownList id="ddlKinhnghiem" runat="server" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="true" CssClass="filter_drop">    
                                <asp:ListItem Value="0" Text="Chọn kinh nghiệm"></asp:ListItem>                    
                            </asp:DropDownList>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div align="right" class="button_filter" style="clear:both">
                            <asp:Button ID="btnTimkiem" runat="server" CssClass="btn_green01" 
                                title="Bấm đây để lọc theo các tiêu chí đã chọn!" Text="Tìm kiếm" 
                                name="btn_filter" onclick="btnTimkiem_Click" />
                            <asp:Button ID="btnHuytimkiem" runat="server" CssClass="btn_green01" 
                                title="Bấm đây để hủy các tiêu thức đã lọc!" Text="Hủy tìm kiếm" 
                                name="cancel_filter" onclick="btnHuytimkiem_Click" />
                        </div>
                    <div class="clearfix"> </div>
                    </div>
                </div>
            <!--Ads-->
            <div class="ads_rec">
              <asp:Repeater ID="rptBannerPhai2" runat="server">
                <ItemTemplate>
                  <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("AD_ITEM_DESC"))%>
                </ItemTemplate>
              </asp:Repeater>
            </div>
            <!--Ads-->
            <div class="ads_rec">
              <asp:Repeater ID="rptBannerPhai3" runat="server">
                <ItemTemplate>
                  <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("AD_ITEM_DESC"))%>
                </ItemTemplate>
              </asp:Repeater>
            </div>
            <!--Ads-->
            <div class="ads_rec">
              <asp:Repeater ID="rptBannerPhai4" runat="server">
                <ItemTemplate>
                  <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("AD_ITEM_DESC"))%>
                </ItemTemplate>
              </asp:Repeater>
            </div>
            <!--Ads-->
            <div class="ads_rec">
              <asp:Repeater ID="rptBannerPhai5" runat="server">
                <ItemTemplate>
                  <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("AD_ITEM_DESC"))%>
                </ItemTemplate>
              </asp:Repeater>
            </div>
            <!--Ads-->
            <div class="ads_rec">
              <asp:Repeater ID="rptBannerPhai6" runat="server">
                <ItemTemplate>
                  <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("AD_ITEM_DESC"))%>
                </ItemTemplate>
              </asp:Repeater>
            </div>
            </div>

<script type="text/javascript">
    function DoListBoxFilter(listBoxSelector, filter, keys, values) {
        var list = $(listBoxSelector);
        var selectBase = '<option value="{0}">{1}</option>';

        list.empty();
        for (i = 0; i < values.length; ++i) {

            var value = values[i];

            if (value == "" || value.toLowerCase().indexOf(filter.toLowerCase()) >= 0) {
                var temp = '<option value="' + keys[i] + '">' + value + '</option>';
                list.append(temp);
            }
        }
    }
    var keys = [];
    var values = [];

    var options = $('#<% = cblRdoOptionNganhnghe.ClientID %> option');
    $.each(options, function (index, item) {
        keys.push(item.value);
        values.push(item.innerHTML);
    });
    $('#<% = txtFilterNganhnghe.ClientID %>').keyup(function () {
        var filter = $(this).val();
        DoListBoxFilter('#<% = cblRdoOptionNganhnghe.ClientID %>', filter, keys, values);
    });


    var options1 = $('#<% = cblChkOptionDiadiem.ClientID %> option');
    $.each(options1, function (index, item) {
        keys.push(item.value);
        values.push(item.innerHTML);
    });
    $('#<% = txtFilterDiadiem.ClientID %>').keyup(function () {
        var filter = $(this).val();
        DoListBoxFilter('#<% = cblChkOptionDiadiem.ClientID %>', filter, keys, values);
    });
</script>