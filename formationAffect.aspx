<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formationAffect.aspx.cs" Inherits="formationAffect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

           <style>
         h1{
    color:#5D7B9D;
    font-size:20px;
  
  
}
               .h3{
    color:#5D7B9D;
    font-size:20px;
  
  
}
               h2{
                   color:#FE2E2E;
                   
                   Font-Weight: Bold;
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
    background-color: #5D7B9D; 
    color: white;
     padding: 15px 32px;
    text-align: center;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
          <center>
                        <h2> Affectation des Formations : </h2> 
                         <br /> <br /> <br />
                    <table>
                         <tr>
                             <td>
                                  <h1>Svp Choisisser une Formation:</h1>
                             </td>
                             <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td>
                             <td>
                                 <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nomForm" DataValueField="idForm" Height="34px" Width="149px" ></asp:DropDownList>
                             </td>
                            
                         </tr>
                       
                     </table>
                         <br /> 

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString20 %>" SelectCommand="SELECT * FROM [formation1]">
   
                        </asp:SqlDataSource>

              <asp:Label ID="numForm" runat="server" Text="Label" Visible="false" ></asp:Label> 
               <asp:Label ID="Label3" runat="server" ></asp:Label>

<asp:Button ID="Button1" runat="server" Text="Chercher " OnClick="Button1_Click" CssClass="button1"></asp:Button>
                         <br />
              <br /> <br />
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" Visible="false" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2">
              <Columns>
                  <asp:BoundField DataField="mat" HeaderText="mat" SortExpression="mat" />
                  <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
                  <asp:BoundField DataField="prenom" HeaderText="prenom" SortExpression="prenom" />
                  <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                  <asp:BoundField DataField="ville" HeaderText="ville" SortExpression="ville" />
                 
                  <asp:BoundField DataField="tel" HeaderText="tel" SortExpression="tel" />
                
                
                  <asp:TemplateField>
                      <ItemTemplate>
                          <asp:CheckBox ID="CheckBox1" runat="server" style="text-align: justify" />
                      </ItemTemplate>
                  </asp:TemplateField>
                
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                 <br />

                 

               <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString20 %>" SelectCommand="select mat , nom ,prenom ,ville ,email ,tel from utilisateur where type='part'
except

select u.mat , u.nom ,u.prenom ,u.ville , email ,tel from utilisateur u , formation1 f ,formAff f2 WHERE 
u.mat=f2.mat
and f.idForm=f2.idForm
and f.idForm=@idForm">
                    <SelectParameters>
                                        <asp:ControlParameter ControlID="numForm" Name="idForm" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
      
                     </asp:SqlDataSource>


              <br />
<asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click"></asp:Button>
    </div>
    </form>
</body>
</html>
