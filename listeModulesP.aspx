<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listeModulesP.aspx.cs" Inherits="listeModulesP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Listes Des Modules</title>
    <style>
         
.navbar {
    overflow: hidden;
    background-color: cadetblue;
    font-family: italic, Helvetica, sans-serif;
}

.navbar a {
    float: left;
    font-size: 16px;
    color: white;
    text-align: center;
    padding: 20px 50px;
    text-decoration: none;
}

.dropdown {
    float: left;
    overflow: hidden;
}
.d{
    float:right;
}

.dropdown .dropbtn {
    font-size: 16px;    
    border: none;
    outline: none;
    color: white;
    padding: 14px 16px;
    background-color: inherit;
    font-family: inherit;
    margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
    background-color: #F4FA58;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    
}

.dropdown-content a {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {
    background-color: #ddd;
}

.dropdown:hover .dropdown-content {
    display: block;
}
h1{
    color:#FAF602;
}

    </style>
       <div class="navbar">
  <a href="listeFormations.aspx">Formations</a>
  <a href="#news">bulletin des notes</a>
        <a href="#home">Gérer profile</a>
        <a href="login.aspx">déconnexion</a>
  
  </div> 
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <br />
    <center> <h1> <span> Liste Des Modules </span> </h1> </center>
    <br />
     <center>
islem :<asp:Label ID="Lid" runat="server" Text="Label"></asp:Label>
        <asp:GridView ID="Grid1" runat="server" AutoGenerateColumns="False" CellPadding="10" CellSpacing="10" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
            
            <Columns>
                <asp:BoundField DataField="idMod"  HeaderText="identifiant " />
                <asp:BoundField DataField="nomMod" HeaderText="Nom " />
                
                
                 <%-- <asp:TemplateField HeaderText="identifiant">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>--%>
            </Columns>

            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="cadetblue" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />

        </asp:GridView>
            </center>
    </div>
    </form>
</body>
</html>
