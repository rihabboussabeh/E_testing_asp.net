<%@ Page Language="C#" AutoEventWireup="true" CodeFile="2gererTestaspx.aspx.cs" Inherits="_2gererTestaspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Liste Des Formations
          <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="nomForm" DataValueField="idForm" Height="34px" Width="149px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString20 %>" SelectCommand="SELECT * FROM [formation1]"></asp:SqlDataSource>

           <asp:DropDownList ID="DropDownList2" runat="server" Visible="false" Height="34px" Width="149px" DataSourceID="SqlDataSource2" DataTextField="nomMod" DataValueField="idMod" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" ></asp:DropDownList>
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString20 %>" SelectCommand="SELECT * FROM [module1] WHERE ([idForm] = @idForm)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="idForm" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
                          </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Visible="false" Text="gere les lecons" OnClick="Button1_Click"/>

        <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="numMod" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>
