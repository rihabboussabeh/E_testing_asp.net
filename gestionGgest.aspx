<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gestionGgest.aspx.cs" Inherits="gestionGest" %>



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

         #grPart th{
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
                        
                     
                            <!-- /.nav-second-level -->
                        </li>
                        
                     
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
          

             <form id="form1" runat="server">
                 <div>
                     <br />
                                
                                 <center> <h1> <span> Liste Des Gestionnaires </span> </h1> </center>
                     <br />
                     <center>
                      <asp:GridView ID="grPart" runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="mat" ShowHeaderWhenEmpty="True"
                                       OnRowCommand="grPart_RowCommand" OnRowEditing="grPart_RowEdditing" OnRowCancelingEdit="grPart_RowCancelingEdit" OnRowUpdating="grPart_RowDeleting1" CellPadding="4" Width="50%" Font-Size="Medium" GridLines="None" Font-Bold="True" Font-Italic="False" ForeColor="#333333" >
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

                                       <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                                       <Columns>
                                           <asp:TemplateField HeaderText="Matricule" >
                                               <ItemTemplate>
                                                   <asp:Label  runat="server" Text='<%# Eval("mat") %>' />
                                               </ItemTemplate>
                                              
                                               <EditItemTemplate>
                                                   <asp:TextBox ID="Txtmat" Text='<%# Eval("mat") %>' runat="server"> </asp:TextBox>
                                               </EditItemTemplate>

                                               <FooterTemplate>
                                                     <asp:TextBox ID="TxtmatFooter" runat="server"> </asp:TextBox>
                                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                              
                             ControlToValidate="TxtmatFooter" EnableClientScript="False" ValidationExpression="\d{5}"
                             ErrorMessage="mat de 5 chiffres" Text="*"></asp:RegularExpressionValidator>
                                               </FooterTemplate>
                                           </asp:TemplateField>

                                                           <asp:TemplateField HeaderText="Nom">
                                               <ItemTemplate>
                                                   <asp:Label  runat="server" Text='<%# Eval("nom") %>' />
                                               </ItemTemplate>
                                              
                                               <EditItemTemplate>
                                                   <asp:TextBox ID="Txtnom" Text='<%# Eval("nom") %>' runat="server"> </asp:TextBox>
                                               </EditItemTemplate>

                                               <FooterTemplate>
                                                     <asp:TextBox ID="TxtnomFooter" runat="server"> </asp:TextBox>
                                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                              
                             ControlToValidate="TxtnomFooter" EnableClientScript="False" ValidationExpression="[a-zA-Z]{3}[a-zA-Z]*([a-zA-Z]|\s)*"
                             ErrorMessage="erreur" Text="*"></asp:RegularExpressionValidator>
                                               </FooterTemplate>
                                           </asp:TemplateField>

                                                           <asp:TemplateField HeaderText="prenom">
                                               <ItemTemplate>
                                                   <asp:Label  runat="server" Text='<%# Eval("prenom") %>' />
                                               </ItemTemplate>
                                              
                                               <EditItemTemplate>
                                                   <asp:TextBox ID="Txtpren" Text='<%# Eval("prenom") %>' runat="server"> </asp:TextBox>
                                               </EditItemTemplate>

                                               <FooterTemplate>
                                                     <asp:TextBox ID="TxtprenFooter" runat="server"> </asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                              
                             ControlToValidate="TxtprenFooter" EnableClientScript="False" ValidationExpression="[a-zA-Z]{3}[a-zA-Z]*([a-zA-Z]|\s)*"
                             ErrorMessage="erreur" Text="*"></asp:RegularExpressionValidator>
                                               </FooterTemplate>
                                           </asp:TemplateField>

                                                           <asp:TemplateField HeaderText="email">
                                               <ItemTemplate>
                                                   <asp:Label  runat="server" Text='<%# Eval("email") %>' />
                                               </ItemTemplate>
                                              
                                               <EditItemTemplate>
                                                   <asp:TextBox ID="Txtemail" Text='<%# Eval("email") %>' runat="server"> </asp:TextBox>
                                               </EditItemTemplate>

                                               <FooterTemplate>
                                                     <asp:TextBox ID="TxtemailFooter" runat="server"> </asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                              
                             ControlToValidate="TxtemailFooter" EnableClientScript="False" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                             ErrorMessage="Vérifier Votre email..!!"  Text="*"></asp:RegularExpressionValidator>
                                               </FooterTemplate>
                                           </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="ville">
                                               <ItemTemplate>
                                                   <asp:Label  runat="server" Text='<%# Eval("ville") %>' />
                                               </ItemTemplate>
                                              
                                               <EditItemTemplate>
                                                   <asp:TextBox ID="Txtville" Text='<%# Eval("ville") %>' runat="server"> </asp:TextBox>
                                               </EditItemTemplate>

                                               <FooterTemplate>
                                                     <asp:TextBox ID="TxtvilleFooter" runat="server"> </asp:TextBox>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                              
                             ControlToValidate="TxtvilleFooter" EnableClientScript="False" ValidationExpression="[a-zA-Z]{3}[a-zA-Z]*([a-zA-Z]|\s)*"
                             ErrorMessage="erreur" Text="*"></asp:RegularExpressionValidator>
                                               </FooterTemplate>
                                           </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="codeP">
                                               <ItemTemplate>
                                                   <asp:Label  runat="server" Text='<%# Eval("codeP") %>' />
                                               </ItemTemplate>
                                              
                                               <EditItemTemplate>
                                                   <asp:TextBox ID="TxtcodeP" Text='<%# Eval("codeP") %>' runat="server"> </asp:TextBox>
                                               </EditItemTemplate>

                                               <FooterTemplate>
                                                     <asp:TextBox ID="TxtcodePFooter" runat="server"> </asp:TextBox>
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                              
                             ControlToValidate="TxtcodePFooter" EnableClientScript="False" ValidationExpression="\d{4}"
                             ErrorMessage="Votre code postale doit être composé de 4 chiffres..!!"  Text="*"></asp:RegularExpressionValidator>
                                               </FooterTemplate>
                                           </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="tel">
                                               <ItemTemplate>
                                                   <asp:Label  runat="server" Text='<%# Eval("tel") %>' />
                                               </ItemTemplate>
                                              
                                               <EditItemTemplate>
                                                   <asp:TextBox ID="Txttel" Text='<%# Eval("tel") %>' runat="server"> </asp:TextBox>
                                               </EditItemTemplate>

                                               <FooterTemplate>
                                                     <asp:TextBox ID="TxttelFooter" runat="server"> </asp:TextBox>
                                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server"
                              
                             ControlToValidate="TxttelFooter" EnableClientScript="False" ValidationExpression="\d{8}"
                             ErrorMessage="Votre numéro de téléphone doit être composé de 8 chiffres..!!"  Text="*"></asp:RegularExpressionValidator>
                                               </FooterTemplate>
                                           </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="mp">
                                               <ItemTemplate>
                                                   <asp:Label  runat="server" Text='<%# Eval("mp") %>' />
                                               </ItemTemplate>
                                              
                                               <EditItemTemplate>
                                                   <asp:TextBox ID="Txtmp" Text='<%# Eval("mp") %>' runat="server"> </asp:TextBox>
                                               </EditItemTemplate>

                                               <FooterTemplate>
                                                     <asp:TextBox ID="TxtmpFooter" runat="server"> </asp:TextBox>
                                               </FooterTemplate>
                                           </asp:TemplateField>

                                                   <%--<asp:TemplateField HeaderText="type">
                                               <ItemTemplate>
                                                   <asp:Label  runat="server" Text='<%# Eval("type") %>' />
                                               </ItemTemplate>
                                              
                                               <%--<EditItemTemplate>
                                                   <asp:TextBox ID="Txttype" Text='<%# Eval("type") %>' runat="server"> </asp:TextBox>
                                               </EditItemTemplate>

                                               <FooterTemplate>
                                                     <asp:TextBox ID="TxttypeFooter" runat="server"> </asp:TextBox>
                                               </FooterTemplate>
                                           </asp:TemplateField>--%>

             

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
                                   <br />
                   <asp:Label ID="lblSucessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>

                                   <br />
                   <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                               </center> 
                     <asp:Label ID="lblControl" runat="server" ></asp:Label>
                
                 <asp:ValidationSummary ID="ValidationSummary1" runat="server"></asp:ValidationSummary>  
                     <asp:Label ID="lnomFormV" runat="server" Text="Label" Visible="false"></asp:Label>
 <h2><asp:Label ID="LformExiste" runat="server" ></asp:Label>
                                
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
