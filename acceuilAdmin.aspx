 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="acceuilAdmin.aspx.cs" Inherits="acceuil" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

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

      .textBoxS	{
	
	border: solid 1px cadetblue;
	color: black;
	font-size: 16px;
	height: 30px;
	padding: 9px 9px 0 10px;
	width:200px;
	 background-color: #f9f9f9;
  
	}



.card1 {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
	top: 50px;
  right: -500px;
  height: 600px;
    width: 75%;
    border-radius: 30px;
    background-color: #F2F2F2;
    border: solid 2px #5D7B9D;
   
    
}
   
.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

img {
    border-radius: 7px 7px 0 0;
}

.container1 {
    padding: 2px 16px;
}
h1{
    color:#B40404;
    font-weight:bolder;
}
 h2{text-align:left;color:#5D7B9D;font-size:16pt;font-family:'italic';}

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
            width:800px;
            height:600px;
            background-color: #f9f9f9;
            border:2px solid cadetblue;
        }
           h4{
          color:#D90115;
          font-size:20px;
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
                    <ul class="dropdown-menu dropdown-user">
                       
                        </li>
                      
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
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
           
            <br />

             <form id="form1" runat="server">
                 <div>
                     
                             
                           <div class="our_inventory margin-top-30 scroll_effect bounceIn">
           
 <center> <h1> <span> MON PROFILE:  </span> </h1> </center>
</div> 
       
        <center>

<div class="card1">
  
  <div class="container1">
     
      <br />
      <table>
          <tr>
             <td><h2>matricule:</h2>   </td>   
             
                <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td></td><td></td>
              <td><b>   <asp:Label ID="lmat" runat="server" ></asp:Label></td>
              
          </tr>
        
          <tr>
              <td><h2>Nom & Prénom:</h2></td> 
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td></td><td></td><td></td>
              <td><b><asp:Label ID="lnom" runat="server" Text="Label"></asp:Label> <asp:Label ID="lpren" runat="server" Text="Label"></asp:Label></td>
          </tr>

           <tr>
              <td><h2>E-mail</h2></td>
                <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:Label ID="lemail" runat="server" Text="Label"></asp:Label></td>
          </tr>
       
          
            <tr>
              <td><h2>Ville:</h2></td>
                <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:Label ID="lville" runat="server" Text="Label"></asp:Label></td>
          </tr>
       
            <tr>
              <td><h2>Code Postale:</h2></td>
                <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:Label ID="lcode" runat="server" Text="Label"></asp:Label></td>
          </tr>
          
            <tr>
              <td><h2>Téléphone : </h2></td>
                <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:Label ID="ltel" runat="server" Text="Label"></asp:Label></td>
          </tr>
         
             <tr>
              <td><h2> Mot De Passe:</h2></td>
                 <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td> 
              <td><b><asp:Label ID="lmp" runat="server" Text="Label"></asp:Label></td>
                 </tr>
         
      </table>
   
      <br /> <br />
    <tr> <asp:Button ID="btnMod" runat="server" Text="Modifier Profile" OnClick="btnMod_Click" CssClass="button1"></asp:Button>
       <br /> <br /> <br />  
  </div>
    </center>
        <br />
    <center> <h4><asp:Label ID="lmod" runat="server" Visible="false"></asp:Label> </h4> </center>
       <%-- <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
       <cc2:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server"></cc2:ToolkitScriptManager>
<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup">
   <center> <h1>  Changer mon profile: </h1> </center> <br />
   
    <center>
<asp:UpdatePanel runat="server">
    
</asp:UpdatePanel>
        
    <table>
     
         <tr>
             <td><h2>Nom :</h2>   </td> 
             
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><asp:TextBox ID="tnom" runat="server" CssClass="textBoxS"></asp:TextBox>
              
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                              
                             ControlToValidate="tnom" EnableClientScript="False" ValidationExpression="[a-zA-Z]{3}[a-zA-Z]*([a-zA-Z]|\s)*"
                             ErrorMessage="Votre Nom doit être composé de chaine de caractére..!!"  Text="*"></asp:RegularExpressionValidator>
              
        </tr>
    

         <tr>
             <td><h2>Prénom :</h2>   </td> 
             
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><asp:TextBox ID="tpren" runat="server" CssClass="textBoxS"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                              
                             ControlToValidate="tpren" EnableClientScript="False" ValidationExpression="[a-zA-Z]{3}[a-zA-Z]*([a-zA-Z]|\s)*"
                             ErrorMessage="Votre Prenom doit être composé de chaine de caractére..!!"  Text="*"></asp:RegularExpressionValidator>
                  
                  
                  
                  </td>
        </tr>

         <tr>
             <td><h2>E-mail</h2>   </td> 
             
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><asp:TextBox ID="temail" runat="server" CssClass="textBoxS"></asp:TextBox>
                  
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                              
                             ControlToValidate="temail" EnableClientScript="False" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                             ErrorMessage="Vérifier Votre email..!!"  Text="*"></asp:RegularExpressionValidator>
                  
                  
                  
                  </td>
        </tr>

         <tr>
             <td><h2>Ville :</h2>   </td> 
             
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td>   <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="96px">
            <asp:ListItem Value="1" Text="Ariana"></asp:ListItem>
             <asp:ListItem Value="2" Text="Béja"></asp:ListItem>
             <asp:ListItem Value="3" Text="Ben Arous"></asp:ListItem>
                  <asp:ListItem Value="4" Text="Bizerte"></asp:ListItem>
             <asp:ListItem Value="5" Text="Gabes"></asp:ListItem>
             <asp:ListItem Value="6" Text="Gafsa"></asp:ListItem>
                        <asp:ListItem Value="7" Text="Jandouba"></asp:ListItem>
             <asp:ListItem Value="8" Text="Kairouan"></asp:ListItem>
             <asp:ListItem Value="9" Text="kassrine"></asp:ListItem>
                  <asp:ListItem Value="10" Text="Kebeli"></asp:ListItem>
             <asp:ListItem Value="11" Text="La Manouba"></asp:ListItem>
             <asp:ListItem Value="12" Text="Le Kef"></asp:ListItem>
                    <asp:ListItem Value="13" Text="Mahdia"></asp:ListItem>
             <asp:ListItem Value="14" Text="Médenine"></asp:ListItem>
             <asp:ListItem Value="15" Text="Monastir"></asp:ListItem>
                  <asp:ListItem Value="16" Text="Nabeul"></asp:ListItem>
             <asp:ListItem Value="17" Text="Sfax"></asp:ListItem>
             <asp:ListItem Value="18" Text="Sidi Bouzid"></asp:ListItem>
                        <asp:ListItem Value="19" Text="Siliana"></asp:ListItem>
             <asp:ListItem Value="20" Text="Sousse"></asp:ListItem>
             <asp:ListItem Value="21" Text="Tataouine"></asp:ListItem>
                  <asp:ListItem Value="22" Text="Tozeur"></asp:ListItem>
             <asp:ListItem Value="23" Text="Tunis"></asp:ListItem>
             <asp:ListItem Value="24" Text="Zaghoun"></asp:ListItem>
        </asp:DropDownList></td>
        </tr>

           <tr>
             <td><h2>Code Postale :</h2>   </td> 
             
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><asp:TextBox ID="tpost" runat="server" CssClass="textBoxS"></asp:TextBox>
                  
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                              
                             ControlToValidate="tpost" EnableClientScript="False" ValidationExpression="\d{4}"
                             ErrorMessage="Votre code postale doit être composé de 4 chiffres..!!"  Text="*"></asp:RegularExpressionValidator>
                  
                  
                  
                  </td>
        </tr>

           <tr>
             <td><h2>Téléphone :</h2>   </td> 
             
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><asp:TextBox ID="ttel" runat="server" CssClass="textBoxS"></asp:TextBox>
                  
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                              
                             ControlToValidate="ttel" EnableClientScript="False" ValidationExpression="\d{8}"
                             ErrorMessage="Votre numéro de téléphone doit être composé de 8 chiffres..!!"  Text="*"></asp:RegularExpressionValidator>
                  
                  </td>
        </tr>

           <tr>
             <td><h2>Mot de Passe :</h2>   </td> 
             
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><asp:TextBox ID="tmp" runat="server" CssClass="textBoxS"></asp:TextBox></td>
        </tr>
        </table>
       
        <br /> <br />
<asp:Button runat="server" Text="Confirmer" CssClass="button1" OnClick="Unnamed1_Click"></asp:Button> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" Text="Annuler" CssClass="button1" /><br />
       
    
       
        </center>
                
              </asp:Panel>
<cc2:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="button3" PopupControlID="panel1" TargetControlID="btnMod" BackgroundCssClass="modalBckground">

</cc2:ModalPopupExtender>
        <br />
  <h4> <center> <asp:ValidationSummary ID="ValidationSummary1" runat="server" /> </h4> </center>
                      
  
                                 
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
