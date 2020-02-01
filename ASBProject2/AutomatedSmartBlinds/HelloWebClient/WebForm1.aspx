<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="HelloWebClient.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="font-family:Arial">
                <tr>
                    <td>
                        <asp:TextBox ID="txtBox" runat="server"></asp:TextBox><asp:Button ID="btnButton" runat="server" Text="Get message" OnClick="btnButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="label1" runat="server" Text="label" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
