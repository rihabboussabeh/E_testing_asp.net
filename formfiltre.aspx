<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formfiltre.aspx.cs" Inherits="formfiltre" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nomForm" DataValueField="nomForm" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Refresh" />
    
    </div>
        <br />
        <br />
         <asp:Panel ID="Panel3" runat="server">
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="10" DataSourceID="SqlDataSource4" GridLines="None" CellSpacing="4" ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="idForm" HeaderText="idForm" SortExpression="idForm" />
                <asp:BoundField DataField="nomForm" HeaderText="nomForm" SortExpression="nomForm" />
                <asp:BoundField DataField="descForm" HeaderText="descForm" SortExpression="descForm" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString7 %>" SelectCommand="SELECT * FROM [formation]"></asp:SqlDataSource>
        <br /> <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString4 %>" SelectCommand="SELECT * FROM [formation]">
        </asp:SqlDataSource>
              </asp:Panel>

        <asp:Panel ID="Panel1" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="10" DataSourceID="SqlDataSource2" GridLines="None" Width="416px" CellSpacing="4" ForeColor="#333333">

                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="idForm" HeaderText="idForm" SortExpression="idForm" />
                    <asp:BoundField DataField="nomForm" HeaderText="nomForm" SortExpression="nomForm" />
                    <asp:BoundField DataField="descForm" HeaderText="descForm" SortExpression="descForm" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />

            </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString5 %>" SelectCommand="SELECT * FROM [formation] WHERE ([nomForm] = @nomForm)">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="DropDownList1" Name="nomForm" PropertyName="SelectedValue" Type="String" />
                 </SelectParameters>
            </asp:SqlDataSource>
             </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">

            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="10" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="454px" CellSpacing="4">


                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="idForm" HeaderText="idForm" SortExpression="idForm" />
                    <asp:BoundField DataField="nomForm" HeaderText="nomForm" SortExpression="nomForm" />
                    <asp:BoundField DataField="descForm" HeaderText="descForm" SortExpression="descForm" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />


            </asp:GridView>
        </asp:Panel>


            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString6 %>" SelectCommand="SELECT * FROM [formation] WHERE ([nomForm] = @nomForm)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="nomForm" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
        </asp:SqlDataSource>
       
    </form>
</body>
</html>
