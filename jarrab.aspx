<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jarrab.aspx.cs" Inherits="jarrab" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nomForm" DataValueField="nomForm"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString20 %>" SelectCommand="SELECT [nomForm] FROM [formation1]"></asp:SqlDataSource>
        <br /> <asp:Button ID="Button1" runat="server" Text="Button" />
         <asp:Label ID="LnomForm" runat="server" ></asp:Label>
    </div>
    </form>
</body>
</html>
