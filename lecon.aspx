<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lecon.aspx.cs" Inherits="lecon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> leçon</title>
    <style>
        h1{
    color:gray;
}
        h2{
    color:#B40404;
}
        h3{
           font-weight:bolder;
        }
          .button {
    background-color: #4CAF50; 
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s; 
    transition-duration: 0.4s;
}

.button1 {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
    background-color: cadetblue; 
    color: white;
     padding: 15px 32px;
    text-align: center;
}
         
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
      background-color:  #f9f9f9;
    color:cadetblue;
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

.red{
    background-color:red;
}
.green {
    background-color:green;
}
    </style>
</head>
<body>
        <div class="navbar">
  <a href= "listeFormations.aspx?mat="+ +""  >Formations</a>
      
  <a href="bulletinNote.aspx">bulletin des notes</a>
        <a href="espacePart.aspx">Gérer Mon Profile</a>
        <a href="login.aspx">déconnexion</a>
  
  </div> 
    <form id="form1" runat="server">
    <div>
        <center>
          <h2>   formation : <asp:Label ID="lnomForm" runat="server" Text="Label"></asp:Label><asp:Label ID="lform" runat="server" Text="Label" Visible="false"></asp:Label> </h2>
        </center>
      
      


        <br />
        <center> <h1> <span> Liste Des Leçons du module <asp:Label ID="lnomMod" runat="server" Text="Label"></asp:Label><asp:Label ID="lmod" runat="server" Text="Label" Visible="false"></asp:Label></span> </h1>
        <br />
        <center>  
          <asp:Label ID="liB" runat="server" Visible="false"></asp:Label>   
  <%--      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idL" DataSourceID="SqlDataSource1" CellPadding="10" CellSpacing="10" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Width="736px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
            <Columns>
                 <asp:HyperLinkField DataTextField="nomL" HeaderText="Nom" DataNavigateUrlFields="idL" DataNavigateUrlFormatString="test.aspx?idL={0}" />
                
                
                <asp:BoundField DataField="contL" HeaderText="contL" SortExpression="contL" />
               
               
            </Columns>
             <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="cadetblue" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="gray" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString18 %>" SelectCommand="SELECT * FROM [leçon] WHERE ([idMod] = @idMod)">
            <SelectParameters>
                <asp:ControlParameter ControlID="lmod" Name="idMod" PropertyName="Text" Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>--%>

        </center>
        <br />
       

<asp:GridView ID="gr2" runat="server" OnRowDataBound="gr2_RowDataBound" CellPadding="10" CellSpacing="10" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Width="736px"  DataKeyNames="idL" AutoGenerateColumns="False">
    <Columns>
        
         <asp:HyperLinkField Text="Passer Test" HeaderText="Nom" DataNavigateUrlFields="idL" DataNavigateUrlFormatString="test.aspx?idL={0}" />
         <asp:BoundField DataField="nomL" HeaderText="Nom"  />
          <asp:HyperLinkField Text="Lire Cours" HeaderText="PDF" DataNavigateUrlFields="contL"   />
        <asp:BoundField DataField="note" HeaderText="Note Obtenu"  />
    </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="cadetblue" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="gray" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>


        
  <%--      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="10" CellSpacing="10" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Width="736px">
            
            <Columns>
                
            
                <asp:BoundField DataField="idForm"  HeaderText="identifiant " />
                <asp:BoundField DataField="nomForm" HeaderText="Nom " />
                <asp:BoundField DataField="descForm" HeaderText="Description" />
                
                 

            </Columns>
            

            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="cadetblue" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />

       
        </asp:GridView--%>
     <h3><asp:Label ID="llecExist" runat="server" ></asp:Label></h3>


        <br /> <br />
</center>
        <center>
     <asp:Button ID="Button1" runat="server" Text="Liste Des Formations" OnClick="Button1_Click" CssClass="button1"></asp:Button>
            </center>
    </div>
        
    </form>
</body>
</html>
