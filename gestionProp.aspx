﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gestionProp.aspx.cs" Inherits="gestionProp" %>


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
                                  #gr1 th{
           padding: 10px 20px;
       }

.button1 {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
    background-color: #5D7B9D; 
    color: white;
     padding: 15px 32px;
    text-align: center;
}
h4{
    font-weight:bolder;
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
                                <asp:Label ID="lprop" runat="server" ></asp:Label>      
                      <center> <h1> <span> Liste Des Propositions d'exercice </span>  <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                          <br />
                         
                          <asp:GridView ID="gr1" runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="idQ"
    Font-Size="Medium" GridLines="None" Font-Bold="True" Font-Italic="False" ForeColor="#333333" CellPadding="4" Width="100%"
OnRowCommand="gr1_RowCommand" OnRowEditing="gr1_RowEditing" OnRowCancelingEdit="gr1_RowCancelingEdit"
    OnRowUpdating="gr1_RowUpdating" Visible="false"
    >
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="black" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="white" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    <Columns>
         <asp:TemplateField HeaderText="contenu ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("cont") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtcont" Text='<%# Eval("cont") %>' runat="server"> </asp:TextBox>
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:TextBox ID="TxtcontFooter" runat="server"> </asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>

        
                        <asp:TemplateField HeaderText="note">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("note") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="Textnote" Text='<%# Eval("note") %>' runat="server"> </asp:TextBox>
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:TextBox ID="TextnoteFooter" runat="server"> </asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>


          <asp:TemplateField>
                                   <ItemTemplate>
                                       <asp:ImageButton ImageUrl="~/images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="30px" Height="30px" />
                                   </ItemTemplate>
                                   <EditItemTemplate>
                                           <asp:ImageButton ImageUrl="~/images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                                                   <asp:ImageButton ImageUrl="~/images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                                   </EditItemTemplate>
                                   <FooterTemplate>
                                       <asp:ImageButton ImageUrl="~/images/addnew.png" runat="server" CommandName="Addnew" ToolTip="addnew" Width="20px" Height="20px" />
                                   </FooterTemplate>
                               </asp:TemplateField>



    </Columns>


</asp:GridView>
                          <br /> <br />

         <asp:GridView ID="gr2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="idQ" Width="80%"  Font-Size="Medium" Visible="false"
             OnRowCommand="gr2_RowCommand" OnRowEditing="gr2_RowEditing" OnRowCancelingEdit="gr2_RowCancelingEdit" OnRowUpdating="gr2_RowUpdating">
       <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="black" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="white" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
             <Columns>
                  <asp:TemplateField HeaderText="reponse1">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("rep1") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtrep1" Text='<%# Eval("rep1") %>' runat="server"> </asp:TextBox>
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:TextBox ID="Txtrep1Footer" runat="server"> </asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>

          <asp:TemplateField HeaderText="reponse2">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("rep2") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtrep2" Text='<%# Eval("rep2") %>' runat="server"> </asp:TextBox>
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:TextBox ID="Txtrep2Footer" runat="server"> </asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>

          <asp:TemplateField HeaderText="reponse3">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("rep3") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txtrep3" Text='<%# Eval("rep3") %>' runat="server"> </asp:TextBox>
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:TextBox ID="Txtrep3Footer" runat="server"> </asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                  <asp:TemplateField HeaderText="note">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("note") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="Textnote" Text='<%# Eval("note") %>' runat="server"> </asp:TextBox>
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:TextBox ID="TextnoteFooter" runat="server"> </asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                           <asp:TemplateField>
                                   <ItemTemplate>
                                       <asp:ImageButton ImageUrl="~/images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="30px" Height="30px" />
                                   </ItemTemplate>
                                   <EditItemTemplate>
                                           <asp:ImageButton ImageUrl="~/images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                                                   <asp:ImageButton ImageUrl="~/images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                                   </EditItemTemplate>
                                   <FooterTemplate>
                                       <asp:ImageButton ImageUrl="~/images/addnew.png" runat="server" CommandName="Addnew" ToolTip="addnew" Width="20px" Height="20px" />
                                   </FooterTemplate>
                               </asp:TemplateField>
             </Columns>
                          </asp:GridView>

                   <br />
                    <h4> <asp:Label ID="lblSucessMessage" runat="server" Text="" ForeColor="Green"></asp:Label> </h4> 

                                   <br />
                  <h4>  <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label> </h4>
                         <br /> 
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




