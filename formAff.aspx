<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formAff.aspx.cs" Inherits="formAff" %>


<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>admin</title>
    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
    

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">islem ben amar</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                  
                   
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    
                 
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                  
                  
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <li class="divider"></li>
                        <li><a href="login.aspx"><i class="fa fa-sign-out fa-fw"></i> Déconnexion

                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                
                                <span class="input-group-btn">
                                
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="acceuilAdmin.aspx"><i class="fa fa-dashboard fa-fw"></i> Acceuil</a>
                        </li>
                      
                      
                         <li>
                            <a href=""><i class="fa fa-wrench fa-fw"></i> Gestions Des agents <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                              
                                <li>
                                    <a href="gestionGgest.aspx">Gestionnaires</a>
                                </li>
                                <li>
                                    <a href="gestPadmin.aspx">Participants</a>
                                </li>
                               
                               
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                          <li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Gestions Des Tests <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                              
                                <li>
                                    <a href="gestForm.aspx"> Test</a>
                                </li>
                                <li>
                                    <a href="formAff.aspx"> Affecter Formations</a>
                                </li>
                              
                                  <li>
                                    <a href="ListeConsulter.aspx"> Consulter Bulletins</a>
                                </li>
                                   <li>
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                          <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Statistiques<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="statistique.aspx">Par formations</a>
                                </li>
                               
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                     
                            <!-- /.nav-second-level -->
                        </li>
                        
                     
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
           
            <br />

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
<asp:GridView ID="GridView2" runat="server" Visible="false" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="mat" HeaderText="mat" SortExpression="mat" />
        <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
        <asp:BoundField DataField="prenom" HeaderText="prenom" SortExpression="prenom" />
        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
        <asp:BoundField DataField="ville" HeaderText="ville" SortExpression="ville" />
        
        <asp:BoundField DataField="tel" HeaderText="tel" SortExpression="tel" />
       
       
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                         </asp:GridView>
                         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString20 %>" SelectCommand="select u.mat , u.nom ,u.prenom ,u.ville , email ,tel from utilisateur u , formation1 f ,bulletin f2 WHERE 
u.mat=f2.mat
and f.idForm=f2.idForm
and f.idForm=@idForm">
                              <SelectParameters>
                                        <asp:ControlParameter ControlID="numForm" Name="idForm" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                         </asp:SqlDataSource>
                         <br /> <br />
                         <br />

<%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
<asp:Timer ID="Timer2" runat="server" Interval="1000" OnTick="Timer2_Tick"></asp:Timer>--%>

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

select u.mat , u.nom ,u.prenom ,u.ville , email ,tel from utilisateur u , formation1 f ,bulletin f2 WHERE 
u.mat=f2.mat
and f.idForm=f2.idForm
and f.idForm=@idForm">
                    <SelectParameters>
                                        <asp:ControlParameter ControlID="numForm" Name="idForm" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
      
                     </asp:SqlDataSource>
         <%--  </ContentTemplate>
</asp:UpdatePanel>--%>


              <br />
<asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click"></asp:Button> <br />

                         <br />
                         <br />
<%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>--%>
<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" Visible="false">
    <Columns>
        <asp:BoundField DataField="mat" HeaderText="mat" SortExpression="mat" />
        <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
        <asp:BoundField DataField="prenom" HeaderText="prenom" SortExpression="prenom" />
        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
        <asp:BoundField DataField="ville" HeaderText="ville" SortExpression="ville" />
       
        <asp:BoundField DataField="tel" HeaderText="tel" SortExpression="tel" />
    
        
    </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString20 %>" SelectCommand="select u.mat , u.nom ,u.prenom ,u.ville , email ,tel from utilisateur u , formation1 f ,bulletin f2 WHERE 
u.mat=f2.mat
and f.idForm=f2.idForm
and f.idForm=@idForm">
                 <SelectParameters>
                                        <asp:ControlParameter ControlID="numForm" Name="idForm" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
        </asp:SqlDataSource>
   <%-- </ContentTemplate>
</asp:UpdatePanel>--%>

</center>

                 </div>
                 </form>
          
               
           
    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
