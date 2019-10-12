<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gestForm.aspx.cs" Inherits="gestForm" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>


<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title> Liste Des Formations Admin</title>
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
          color:red;
          font-size:18px;
          font-weight:bold;
      }


       #gr1 th{
           padding: 10px 10px;
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
                        
                     
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        </li>
                        
                     
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            
          
             <form id="form2" runat="server">
                 <div>
                     <br />
                     <center> <h1> <span> Liste Des Formations </span> </h1> 

                         <br />
                         <asp:GridView ID="gr1" runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="idForm" ShowHeaderWhenEmpty="True"
                             OnRowCommand="gr1_RowCommand" OnRowEditing="gr1_RowEditing" OnRowCancelingEdit="gr1_RowCancelingEdit" OnRowUpdating="gr1_RowUpdating" OnRowDeleting="gr1_RowDeleting"
                            
                             CellPadding="4" HorizontalAlign="Center" Width="80%" PageSize="3" Font-Size="Medium" GridLines="None" Font-Bold="True" Font-Italic="False" ForeColor="#333333" OnRowDataBound="gr1_RowDataBound"  >
                             <EditRowStyle BackColor="#999999" />
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
                                <asp:TemplateField HeaderText="Nom ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("nomForm") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="TxtnomForm" Text='<%# Eval("nomForm") %>' runat="server"> </asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                              
                             ControlToValidate="TxtnomForm" EnableClientScript="False" ValidationExpression="[a-zA-Z]{3}[a-zA-Z]*([a-zA-Z]|\s)*"
                             ErrorMessage="Nom de la Formation  chaine de caracétre" Text="*"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:TextBox ID="TxtnomFormFooter" runat="server"> </asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                              
                             ControlToValidate="TxtnomFormFooter" EnableClientScript="False" ValidationExpression="[a-zA-Z]{3}[a-zA-Z]*([a-zA-Z]|\s)*"
                             ErrorMessage="Nom de la Formation obligatoirement chaine de caracétre" Text="*"></asp:RegularExpressionValidator>
                                    </FooterTemplate>
                                </asp:TemplateField>

                                         <asp:TemplateField HeaderText="Description ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("descForm") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="TxtdescForm" Text='<%# Eval("descForm") %>' runat="server"> </asp:TextBox>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                              ErrorMessage=" la description doit obligatoirement chaine de caractére" Text="*"
                             ControlToValidate="TxtdescForm" EnableClientScript="False" ValidationExpression="[a-zA-Z]{3}[a-zA-Z]*([a-zA-Z]|\s)*"
                             ></asp:RegularExpressionValidator>
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:TextBox ID="TxtdescFormFooter" runat="server"> </asp:TextBox>
                                               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                              ErrorMessage=" la description doit obligatoirement chaine de caractére" Text="*"
                             ControlToValidate="TxtdescFormFooter" EnableClientScript="False" ValidationExpression="[a-zA-Z]{3}[a-zA-Z]*([a-zA-Z]|\s)*"
                             ></asp:RegularExpressionValidator>
                                    </FooterTemplate>
                                </asp:TemplateField>

               <asp:HyperLinkField DataNavigateUrlFields="idForm" DataNavigateUrlFormatString="gestModule.aspx?idForm={0}" text="voir" HeaderText=" Liste des Module" />

                               <asp:TemplateField>
                                   <ItemTemplate>
                                       <asp:ImageButton ImageUrl="~/images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="30px" Height="30px" />
                                       <asp:ImageButton ID="a" ImageUrl="~/images/delete.jpg" runat="server" CommandName="delete" ToolTip="delete" Width="30px" Height="30px" OnClientClick="retrurn confirm('voulez vous ');" />
                                   </ItemTemplate>
                                   <EditItemTemplate>
                                           <asp:ImageButton ImageUrl="~/images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                                                   <asp:ImageButton ImageUrl="~/images/cancel.png" runat="server" ID="link1" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                                   </EditItemTemplate>
                                   <FooterTemplate>
                                       <asp:ImageButton ImageUrl="~/images/addnew.png" runat="server" CommandName="Addnew" ToolTip="addnew" Width="20px" Height="20px" />
                                   </FooterTemplate>
                               </asp:TemplateField>
                               
                            </Columns>
                         </asp:GridView>





                         <br /> <br />
<h2><asp:ValidationSummary ID="ValidationSummary1" runat="server"></asp:ValidationSummary>  
                         <br />
                                        
                  <h2> <asp:Label ID="lblSucessMessage" runat="server"  ForeColor="Green"></asp:Label>
                           <asp:Label ID="lMsgVide" runat="server"  ForeColor="red"></asp:Label>
                                   <br />
                   <asp:Label ID="lblErrorMessage" runat="server"  ForeColor="Red"></asp:Label> </h2>


                
<asp:Label ID="lnomFormV" runat="server" Text="Label" Visible="false"></asp:Label>
 <h2><asp:Label ID="LformExiste" runat="server" ></asp:Label> </h2>
<asp:ValidationSummary ID="ValidationSummary2" runat="server" />
<asp:Label ID="lupdNomForm" runat="server" Visible="false"></asp:Label>
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



