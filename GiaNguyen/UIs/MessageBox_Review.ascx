<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MessageBox_Review.ascx.cs" Inherits="raovat.net.web.UIs_RV.MessageBox_Review" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<asp:ModalPopupExtender ID="mpext" runat="server" BackgroundCssClass="ModalPopupBG" 
    PopupDragHandleControlID="PopupHeaderMessage"
    TargetControlID="HiddenField1" PopupControlID="pnlPopup" Drag="True" RepositionMode="None">
</asp:ModalPopupExtender>
<asp:HiddenField ID="HiddenField1" runat="server" />
<asp:Panel ID="pnlPopup" runat="server" class="popupConfirmation2" Style="display: none;">
    <div class="popup_Container">
        <div class="popup_Titlebar" id="PopupHeaderMessage">
            <div class="TitlebarLeft">
                <asp:Label ID="lblCaption" runat="server" Text="MessageBox"></asp:Label>
            </div>
            <div class="TitlebarRight" onclick='$get("<%= btnOk.ClientID %>").click();'> <%--"$get('Main_MessageBox_btnOk').click();"--%>
            </div>
        </div>
        <div class="popup_Body" style="font-family:Arial;font-weight:normal;font-size:12pt">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
        <div class="popup_Buttons">
            <asp:Button ID="btnOk" runat="server" Text="OK" CausesValidation="false"/>  <%--OnClick="btnOk_Click"--%>
            <asp:Button ID="btnOk1" runat="server" Text="Ok1" OnClick="btnOk1_Click" Visible="false" />
        </div>
    </div>
</asp:Panel>
<script type="text/javascript">
    function fnClickOK(sender, e) {
        __doPostBack(sender, e);
    }
</script>
    </ContentTemplate>
</asp:UpdatePanel>