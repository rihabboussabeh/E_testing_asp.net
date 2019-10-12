<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listeConsulter.aspx.cs" Inherits="listeConsulter" %>


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
    Font-Weight: Bold;
}
                                h2{
    color:#5D7B9D;
    Font-Weight: Bold;
    font-size:20px;
}
    .modalBckground{
            background-color:black;
            filtrer :alpha(opacity=90)!important ;
            opacity:0.6!important;
            z-index:20;
        }
        .modalPopup
        {
            padding: 20px 0px 24px 10px;
            position:relative;
            width:450px;
            height:66px;
            background-color:white;
            border:1px solid black;
        }
         #gForm th,td{
           padding: 8px 10px;
       }
            #gpart th,td{
           padding: 8px 10px;
       }

               .button {
    background-color: #5D7B9D; 
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
      
    <script  lang="javascript" type="text/javascript">
        function select(radio)
        {
            var rbtn = document.getElementById(radio.id);
            var rbtliste = document.getElementsByTagName("input");
            for(i=0;i<rbtliste.length;i++)
            {
                if(rbtliste[i].type=="radio" && rbtliste[i].id!=rbtn.id)
                {
                    rbtliste[i].checked = false;
                }
            }
        }
    </script>
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
                        
                     
                            </ul>
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

             <form id="form2" runat="server">
                 <div>
                     <br />
                      <center> <h1> <span> Liste Des Formations </span> </h1> 
                          <br />
                     <asp:GridView ID="gForm" runat="server" AutoGenerateColumns="False" DataKeyNames="idForm" DataSourceID="SqlDataSource1"
                         CellPadding="4" HorizontalAlign="Center" Width="70%" PageSize="3" Font-Size="Medium" GridLines="None" Font-Bold="True" Font-Italic="False" ForeColor="#333333"  >
                        
                           <FooterStyle BackColor="white" Font-Bold="True" ForeColor="black" />
                             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  />
                             <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                             <RowStyle BackColor="#F7F6F3"  ForeColor="#333333"/>
                             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                             <SortedAscendingCellStyle BackColor="#E9E7E2" />
                             <SortedAscendingHeaderStyle BackColor="#506C8C" />
                             <SortedDescendingCellStyle BackColor="#FFFDF8" />
                             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                 <asp:TemplateField HeaderText="case à chochez">
                                            <ItemTemplate>
                                                 
                                               <input  name="r1" type="radio" value="<%# Eval ("idForm") %>"  onclick="javascript.select(this.id)" style="text-align: justify"/>
                                              
                                            </ItemTemplate>
                                        </asp:TemplateField>
                <asp:BoundField DataField="idForm" HeaderText="idForm" InsertVisible="False" ReadOnly="True" SortExpression="idForm" Visible="false"/>
                <asp:BoundField DataField="nomForm" HeaderText="nomForm" SortExpression="nomForm" />
             
                
            </Columns>

        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString20 %>" SelectCommand="SELECT * FROM [formation1]"></asp:SqlDataSource>
   <br /> <br />
        <asp:Button ID="Button1" runat="server" Text="Chercher" OnClick="Button1_Click" CssClass="button1" />
        <br />
        <asp:Label ID="LidForm" runat="server" Visible="false"></asp:Label>
                <br /> <br />     
<h2> <asp:Label ID="lListeP" runat="server" ></asp:Label> <asp:Label ID="LnomForm" runat="server" ></asp:Label> </h2>
                          <br /> <br />
<asp:GridView ID="gpart" runat="server" Visible="False" AutoGenerateColumns="False" DataKeyNames="idB" DataSourceID="SqlDataSource2"
     CellPadding="4" HorizontalAlign="Center" Width="80%" PageSize="3" Font-Size="Medium" GridLines="None" Font-Bold="True" Font-Italic="False" ForeColor="#333333">
    <FooterStyle BackColor="white" Font-Bold="True" ForeColor="black" />
                             <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  />
                             <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                             <RowStyle BackColor="#F7F6F3"  ForeColor="#333333"/>
                             <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                             <SortedAscendingCellStyle BackColor="#E9E7E2" />
                             <SortedAscendingHeaderStyle BackColor="#506C8C" />
                             <SortedDescendingCellStyle BackColor="#FFFDF8" />
                             <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
             <asp:TemplateField HeaderText="case à chochez">
                                            <ItemTemplate>
                                                 
                                               <input  name="r2" type="radio" value="<%# Eval ("idB") %>"  onclick="javascript.select(this.id)" style="text-align: justify"/>
                                              
                                            </ItemTemplate>
                                        </asp:TemplateField>
        <asp:BoundField DataField="idB" HeaderText="idB" InsertVisible="False" ReadOnly="True" SortExpression="idB" Visible="false" />
        <asp:BoundField DataField="mat" HeaderText="Matricule" SortExpression="mat" />
          <asp:BoundField DataField="nom" HeaderText="Nom" SortExpression="mat" />
          <asp:BoundField DataField="prenom" HeaderText="Prenom" SortExpression="mat" />
          <asp:BoundField DataField="email" HeaderText="Email" SortExpression="mat" />
          <asp:BoundField DataField="ville" HeaderText="Ville" SortExpression="mat" />
          <asp:BoundField DataField="codeP" HeaderText="Code Postale" SortExpression="mat" />
          <asp:BoundField DataField="tel" HeaderText="Téléphone" SortExpression="mat" />
       
    </Columns>
                          </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString20 %>" SelectCommand="SELECT * FROM bulletin b , utilisateur u  WHERE ([idForm] = @idForm) and b.mat=u.mat">
    <SelectParameters>
        <asp:ControlParameter ControlID="LidForm" Name="idForm" PropertyName="Text" Type="Int32" />
    </SelectParameters>
                          </asp:SqlDataSource>
                          <br />
<asp:Label ID="LidB" runat="server" ></asp:Label>
                          <asp:Button ID="btnCon" runat="server" Text="Consulter"  CssClass="button1" OnClick="Button2_Click"  Visible="false"/>
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


