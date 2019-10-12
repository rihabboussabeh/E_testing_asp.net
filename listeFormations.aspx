<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listeFormations.aspx.cs" Inherits="listeFormations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Liste Des Formations</title>
    <style>

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
h1{
    color:#B40404;
}
h4{
    color:#B40404;
    font-size:20px;

}

 h2{text-align:center;color:#B40404;font-size:20px;}
 h3{text-align:center;color:gray;font-size:20px;}
    </style>
</head>
<body>
     
    <div class="navbar">

      
  <a href="bulletinNote.aspx">bulletin des notes</a>
        <a href="espacePart.aspx">Gérer Mon Profile</a>
        <a href="login.aspx">déconnexion</a>
  
  </div> 
    
    
    <form id="form1" runat="server">
       <%-- <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                
                <asp:BoundField DataField="idForm" HeaderText="Identifiant" SortExpression="idForm" />
                 <asp:BoundField DataField="nomForm" HeaderText="Nom" SortExpression="idForm" />
                <asp:BoundField DataField="descForm" HeaderText="Description" SortExpression="idForm" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString21 %>" SelectCommand="SELECT formAff.mat, formAff.idForm ,formation1.nomForm , formation1.descForm FROM formAff INNER JOIN formation1 ON formAff.idForm = formation1.idForm WHERE (formAff.mat = @mat)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" DefaultValue="mat" Name="mat" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
    <br />
    <div>
        <center>
            
          
              <table>
                  <tr>
                      <td>
                          <h3> Participant : </h3>  
                      </td>
                      <td>
                          <h2> <asp:Label ID="lnom" runat="server"  ></asp:Label>
              <asp:Label ID="lpren" runat="server" ></asp:Label> </h2>
                      </td>
                  </tr>
                  <tr>
                      <td>
                         <h3>Matricule : </h3> 
                      </td>
                      <td>
                         <h2><asp:Label ID="Label1" runat="server"  ></asp:Label></h2>
                      </td>
                  </tr>
              </table>
             
               
          </center>
             <br /> 
        <center>
 <h1>  <asp:Label ID="lform" runat="server" Text="Liste Des Formations " Visible="false"></asp:Label> </h1>
              
<h4><asp:Label ID="lformNonexiste" runat="server" Text="vous n'avez pas participé dans aucune formation. SVP attendez l'affection  " Visible="false"></asp:Label> </h4>
               <asp:GridView ID="gr1" runat="server" AutoGenerateColumns="False" DataSourceID="Sqlform" CellPadding="10" CellSpacing="10" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Width="736px" AutoGenerateSelectButton="True" DataKeyNames="idForm" OnSelectedIndexChanged="gr1_SelectedIndexChanged" AllowPaging="True" PageSize="5" Visible="false">
                                    <Columns>
                                        <asp:BoundField DataField="idForm" HeaderText="Identifiant" SortExpression="idForm" Visible="false" />
                 <asp:BoundField DataField="nomForm" HeaderText="Nom" SortExpression="idForm" >
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                <asp:BoundField DataField="descForm" HeaderText="Description" SortExpression="idForm"  />
                                       
                                    </Columns>
                     <FooterStyle BackColor="#CCCC99" ForeColor="Black" HorizontalAlign="Right"/>
            <HeaderStyle BackColor="cadetblue" Font-Bold="True" ForeColor="White" HorizontalAlign="Justify" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="gray" Font-Bold="True" ForeColor="White" HorizontalAlign="Justify"/>
            <SortedAscendingCellStyle BackColor="#F7F7F7" HorizontalAlign="Justify"/>
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" HorizontalAlign="Justify" />
            <SortedDescendingCellStyle BackColor="#E5E5E5"  HorizontalAlign="Justify"/>
            <SortedDescendingHeaderStyle BackColor="#242121" HorizontalAlign="Justify" />
                                </asp:GridView>
                     <br />
            <br />
                                
                                      <asp:SqlDataSource ID="Sqlform" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString8 %>" SelectCommand="SELECT  bulletin.idForm ,formation1.nomForm , formation1.descForm FROM bulletin INNER JOIN formation1 ON bulletin.idForm = formation1.idForm WHERE (bulletin.mat = @mat)">
                                            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" DefaultValue="mat" Name="mat" PropertyName="Text" Type="String" />
            </SelectParameters>
                                      </asp:SqlDataSource>
                                
      <h1><asp:Label ID="llisteMod" runat="server" Text="Liste des Modules" Visible="false" ></asp:Label> </h1>
            <h4><asp:Label ID="lmodExist" runat="server"  Visible="false"></asp:Label></h4>
<asp:Label ID="Label2" runat="server" Visible="false" ></asp:Label>
            <br /> 

                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="10" CellSpacing="10" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Width="736px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" PageSize="5" >
                                    <Columns>
                                      
                                        <%--<asp:BoundField DataField="idMod" HeaderText="Identifiant" ReadOnly="True" SortExpression="idMod"  />--%>
                                        <asp:BoundField DataField="idMod" HeaderText="Nom" SortExpression="nomMod" Visible="false"/>
                                        <asp:BoundField DataField="nomMod" HeaderText="Nom" SortExpression="nomMod"  />
                                      <asp:BoundField DataField="nbr" HeaderText="nombre Total des Leçons" SortExpression="nbr"  />
                                        
                                           <asp:HyperLinkField Text="Voir Leçons"  DataNavigateUrlFields="idMod" DataNavigateUrlFormatString="lecon.aspx?idL={0}" HeaderText="Liste des Leçons" />
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString13 %>" SelectCommand="select m.idMod, m.nomMod,count(l.idL) as nbr from formation1 f, module1 m , leçon l where  m.idMod=l.idMod and f.idForm=m.idForm and m.idForm=@idForm

group by m.nomMod,m.idMod ;

">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="gr1" Name="idForm" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
            </center>
        <br /> <br /> <center>
            <br />
           
      <%--<asp:Label ID="nbr" runat="server" Text="Label"></asp:Label>--%>
        <br /> <br />
            <h3>
<asp:Label ID="choix" runat="server" Text="Vous avez choisi le Module" Visible="false"></asp:Label> <asp:Label ID="lnomMod" runat="server"  Visible="false"></asp:Label>
<asp:Label ID="choix2" runat="server" Text="de la Formation" Visible="false"></asp:Label> <asp:Label ID="lnomForm" runat="server" Visible="false"></asp:Label> <br />
        </h3>    <br />

<asp:Label ID="lnumForm" runat="server" Text="Label" Visible="false"></asp:Label><br />

<asp:Label ID="lnumMod" runat="server" Text="Label" Visible="false"></asp:Label><br />

            <br />
    <asp:Button ID="Button1" runat="server" Text="voir les leçons" OnClick="Button1_Click" CssClass="button1" Visible="false" />

          
            <br />
            <br />
           
            </center>
         <asp:Label ID="lidB" runat="server" Visible="false"></asp:Label>
        </div>
        
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="idForm" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="idForm" HeaderText="idForm" InsertVisible="False" ReadOnly="True" SortExpression="idForm" />
                <asp:BoundField DataField="descForm" HeaderText="descForm" SortExpression="descForm" />
            </Columns>
        </asp:GridView>
       
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString20 %>" SelectCommand="SELECT * FROM [formation1]"></asp:SqlDataSource>
        <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource3"></asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
    </form>
</body>
</html>
