<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formtejrab.aspx.cs" Inherits="formtejrab" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
       <%-- <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>--%>

       <%-- <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idForm" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="idForm" HeaderText="idForm" InsertVisible="False" ReadOnly="True" SortExpression="idForm" />
                <asp:BoundField DataField="nomForm" HeaderText="nomForm" SortExpression="nomForm" />
                <asp:BoundField DataField="descForm" HeaderText="descForm" SortExpression="descForm" />
            </Columns>
        </asp:GridView>--%>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString15 %>" SelectCommand="SELECT * FROM [formation1]"></asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" DataKeyNames="idForm">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:CheckBox ID="chekedAll" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="cheked" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="identifiant">
                    <ItemTemplate>
                        <asp:Label ID="lbidform" runat="server" Text='<%# Eval("idForm")  %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Nom">
                    <ItemTemplate>
                        <asp:Label ID="lbnomform" runat="server" Text='<%# Eval("nomForm")  %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="description">
                    <ItemTemplate>
                        <asp:Label ID="lbdescform" runat="server" Text='<%# Eval("descForm")  %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>


    </div>
    </form>
</body>
</html>
