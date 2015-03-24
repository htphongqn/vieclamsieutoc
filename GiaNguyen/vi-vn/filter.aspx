<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="filter.aspx.cs" Inherits="CatTrang.vi_vn.filter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
  <script type="text/javascript">
      function textChange(e, txtbox, cls) {
          if (!(/[^A-Za-z0-9 ]/.test(String.fromCharCode(e.keyCode))) || e.keyCode == 8) {
              var text = $(txtbox).val().toLowerCase();
              var node = '';
              var count = 0;
              $('#td_' + cls + ' table tr').each(function () {
                  node = $(this).text().toLowerCase();
                  if (node.match(text) == null)
                      $(this).hide();
                  else {
                      $(this).show();
                      count++;
                  }
              });
              $('#sp_' + cls).html((count) + ' items');
          }
      }
  </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <table>
        <tr>
          <td >
            <asp:TextBox ID="txtChkFilter" runat="server" onkeyup="javascript:textChange(event,this,'Chk');"></asp:TextBox>
            <span id="sp_Chk"><%=ChkCount%></span>
          </td>
          <td >
            <asp:TextBox ID="txtRadioFilter" runat="server" onkeyup="javascript:textChange(event,this,'Rdo');"></asp:TextBox>
            <span id="sp_Rdo"><%=RdoCount%></span>
          </td>
        </tr>
        <tr>
          <td>
            <div id="td_Chk">
              <asp:CheckBoxList ID="cblChkOption" DataValueField="Key" DataTextField="Value" runat="server">
              </asp:CheckBoxList>
            </div>
          </td>
          <td>
            <div id="td_Rdo">
              <asp:RadioButtonList ID="cblRdoOption" DataValueField="Key" DataTextField="Value" runat="server">
              </asp:RadioButtonList>
            </div>
          </td>
        </tr>
      </table>
    </div>
  </form>
</body>
</html>
