<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gestionL.aspx.cs" Inherits="gestionL" %>


<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Module</title>
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
           padding: 10px 10px;
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
      h2{
          color:red;
          font-size:18px;
          font-weight:bold;
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
    <form id="form1" runat="server">
    <div>
        <br />
        <center> <h1> <span> Liste Des Leçons de Module </span>  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    

            <br />
<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <br />

<asp:GridView ID="gr1" runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="idL"
    Font-Size="Medium" GridLines="None" Font-Bold="True" Font-Italic="False" ForeColor="#333333" CellPadding="4"
    OnRowCommand="gr1_RowCommand" OnRowEditing="gr1_RowEditing" OnRowCancelingEdit="gr1_RowCancelingEdit"
    OnRowUpdating="gr1_RowUpdating" OnRowDeleting="gr1_RowDeleting"
    
    >
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
  <EditRowStyle BackColor="#999999" Width="80%"  />
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
                                        <asp:Label runat="server" Text='<%# Eval("nomL") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="TxtnomL" Text='<%# Eval("nomL") %>' runat="server"> </asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                              
                             ControlToValidate="TxtnomL" EnableClientScript="False" ValidationExpression="[a-zA-Z]{3}[a-zA-Z]*([a-zA-Z]|\s)*"
                             ErrorMessage="Nom de la Leçon doit être obligatoirement chaine de caracétre" Text="*"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:TextBox ID="TxtnomLFooter" runat="server"> </asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                              
                             ControlToValidate="TxtnomLFooter" EnableClientScript="False" ValidationExpression="[a-zA-Z]{3}[a-zA-Z]*([a-zA-Z]|\s)*"
                             ErrorMessage="Nom de la Formation obligatoirement chaine de caracétre" Text="*"></asp:RegularExpressionValidator>
                                    </FooterTemplate>
                                </asp:TemplateField>

            <asp:TemplateField HeaderText="Contenu ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("contL") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="TxtcontL" Text='<%# Eval("contL") %>' runat="server"> </asp:TextBox>
                                             
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                       <asp:TextBox ID="TxtcontLFooter" runat="server"> </asp:TextBox>
                                      <asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload>
                                 
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                              ErrorMessage=" la description doit obligatoirement chaine de caractére" Text="*"
                             ControlToValidate="TxtcontLFooter" EnableClientScript="False" ValidationExpression="[a-zA-Z]{3}[a-zA-Z]*([a-zA-Z]|\s)*"
                             ></asp:RegularExpressionValidator>
                                        </FooterTemplate>
                                </asp:TemplateField>
         <asp:HyperLinkField DataNavigateUrlFields="idL" DataNavigateUrlFormatString="gestionEx.aspx?idL={0}" text="voir" HeaderText=" Liste des leçons" />   

          <asp:TemplateField>
                                   <ItemTemplate>
                                       <asp:ImageButton ImageUrl="~/images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="30px" Height="30px" />
                                        <asp:ImageButton ID="a" ImageUrl="~/images/delete.jpg" runat="server" CommandName="delete" ToolTip="delete" Width="30px" Height="30px" OnClientClick="retrurn confirm('voulez vous ');" />
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
                       
<asp:Label ID="lidL" runat="server" ></asp:Label>
                   <br />
                    <h4> <asp:Label ID="lblSucessMessage" runat="server" Text="" ForeColor="Green"></asp:Label> </h4> 

                                   <br />
                  <h4>  <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label> </h4>
                         <br /> 
            <h2>
            <asp:Label ID="lmsgV" runat="server" ></asp:Label> 
            <asp:ValidationSummary ID="ValidationSummary1" runat="server"></asp:ValidationSummary>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
                </h2>
        </center>
        <br />
        </center>
                        
               
    </div>
    </form>
</body>
</html>

