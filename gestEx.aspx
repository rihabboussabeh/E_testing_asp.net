<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gestEx.aspx.cs" Inherits="gestEx" %>

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
             #GridView1 th{
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
                      <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>   
                      <center> <h1> <span> Liste Des Exercices du Leçon </span>  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                          <br />
<%--                          <asp:GridView ID="gr1" runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="idEx"
    Font-Size="Medium" GridLines="None" Font-Bold="True" Font-Italic="False" ForeColor="#333333" CellPadding="4" Width="90%"
OnRowCommand="gr1_RowCommand" OnRowEditing="gr1_RowEditing" OnRowCancelingEdit="gr1_RowCancelingEdit"
                              OnRowUpdating="gr1_RowUpdating"
    
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
         <asp:TemplateField HeaderText="Numéro ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("numEx") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="TxtnumEx" Text='<%# Eval("numEx") %>' runat="server"> </asp:TextBox>
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:TextBox ID="TxtnumExFooter" runat="server"> </asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>

            <asp:TemplateField HeaderText="texte ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("texte ") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txttexte" Text='<%# Eval("texte ") %>' runat="server"> </asp:TextBox>
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:TextBox ID="TxttexteFooter" runat="server"> </asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>

                <asp:TemplateField HeaderText="type ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("type ") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="Txttype" Text='<%# Eval("type ") %>' runat="server"> </asp:TextBox>
                                    </EditItemTemplate>

                                    <FooterTemplate>
                                        <asp:TextBox ID="TxttypeFooter" runat="server"> </asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>

         <asp:HyperLinkField DataNavigateUrlFields="idEx" DataNavigateUrlFormatString="gestQ.aspx?idEx={0}" text="voir" HeaderText=" Liste des leçons" />   

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


</asp:GridView>--%>

                          <h1> &nbsp;<h1> 

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString20 %>" SelectCommand="SELECT * FROM [exercice] WHERE ([idL] = @idL2)">
    <SelectParameters>
        <asp:ControlParameter ControlID="Label3" Name="idL2" PropertyName="Text" Type="Int32" />
    </SelectParameters>
                          </asp:SqlDataSource>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idEx" DataSourceID="SqlDataSource1"
     Font-Size="Medium" GridLines="None" Font-Bold="True" Font-Italic="False" ForeColor="#333333" CellPadding="4" Width="90%">
     <AlternatingRowStyle BackColor="White" ForeColor="#284775"  />
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
        <asp:BoundField DataField="idEx" HeaderText="idEx" InsertVisible="False" ReadOnly="True" SortExpression="idEx" Visible="false" />
        <asp:BoundField DataField="numEx" HeaderText="numEx" ReadOnly="True" SortExpression="numEx" />
        <asp:BoundField DataField="texte" HeaderText="texte" SortExpression="texte" />
        <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
   
             <asp:HyperLinkField DataNavigateUrlFields="idEx" DataNavigateUrlFormatString="gestQ.aspx?idEx={0}" text="Voir" HeaderText=" Liste des Questions" />   
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

