<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Filter_test.aspx.cs" Inherits="CatTrang.vi_vn.Filter_test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <table>
        <tr>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="217px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ListBox ID="ListBox1" runat="server" Width="220px" Font-Bold="True"
                    Font-Size="Small" Height="165px">
                    <asp:ListItem Text="krishna" Value="krishna"></asp:ListItem>
                    <asp:ListItem Text="daya" Value="daya"></asp:ListItem>
                    <asp:ListItem Text="bansi" Value="bansi"></asp:ListItem>
                    <asp:ListItem Text="hetal" Value="hetal"></asp:ListItem>
                    <asp:ListItem Text="kavita" Value="kavita"></asp:ListItem>
                    <asp:ListItem Text="poonam" Value="poonam"></asp:ListItem>
                    <asp:ListItem Text="janki" Value="janki"></asp:ListItem>
                    <asp:ListItem Text="niyati" Value="niyati"></asp:ListItem>
                    <asp:ListItem Text="bhumika" Value="bhumika"></asp:ListItem>
                    <asp:ListItem Text="bindi" Value="bindi"></asp:ListItem>
                    <asp:ListItem Text="nayana" Value="nayana"></asp:ListItem>
                    <asp:ListItem Text="nita" Value="nita"></asp:ListItem>
                    <asp:ListItem Text="kajal" Value="kajal"></asp:ListItem>
                    <asp:ListItem Text="jashoda" Value="jashoda"></asp:ListItem>
                    <asp:ListItem Text="shilpa" Value="shilpa"></asp:ListItem>
                    <asp:ListItem Text="ridhi" Value="ridhi"></asp:ListItem>
                    <asp:ListItem Text="rachana" Value="rachana"></asp:ListItem>
                    <asp:ListItem Text="rakshita" Value="rakshita"></asp:ListItem>
                    <asp:ListItem Text="parul" Value="parul"></asp:ListItem>
                     <asp:ListItem Text="twinkle" Value="twinkle"></asp:ListItem>
                </asp:ListBox>
            </td>
        </tr>
    </table>
    </form>
 
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

        var options = $('#<% = ListBox1.ClientID %> option');
        $.each(options, function (index, item) {
            keys.push(item.value);
            values.push(item.innerHTML);
        });
        $('#<% = TextBox1.ClientID %>').keyup(function () {
            var filter = $(this).val();
            DoListBoxFilter('#<% = ListBox1.ClientID %>', filter, keys, values);
        });
    </script>
</body>
</html>
