<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BNadmin.aspx.cs" Inherits="BNadmin" %>

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
.button2 {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
    background-color: #F2F2F2; 
     border: 3px solid #5D7B9D ;
    color: #5D7B9D;
     padding: 15px 400px;
    text-align: center;
    font-weight:bolder;
    font-size:20px;
    position :initial;
}

  h3{text-align:center;color:gray;font-size:24px;}
    h4{text-align:center;font-size:22px; font-weight:bolder}
     .h10{text-align: left;margin-left: 15px;font-size:18px; font-weight:bolder; color:black;}
 
  h1{
    color:#B40404 ;
    font-size:16pt;
}
  .p {
      width: 100px;
      height : 100px;
    padding: 20px;
    border: 5px solid red;
    margin: 0;
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
                    
                                <asp:Label ID="lidB" runat="server" ></asp:Label>
                               
                                
                                
                                <asp:Label ID="Lmat" runat="server" ></asp:Label>
                     <br />
                     <center>
                          <table>
            <tr>
                <td>
                    <h1> <span>  Bulletin des Notes  du Participant : </span> </h1> 
                </td>
            
                <td>
                    <h1>  <asp:Label ID="Lnom" runat="server" ></asp:Label>
              <asp:Label ID="Lpren" runat="server" ></asp:Label></h1>
                </td>
            </tr>
            <tr>
                <td> <h3> Formation <asp:Label ID="LnomF" runat="server" ></asp:Label></td></h3>
          
               
            </tr>
        </table>
<br /> <br />
<h4> <asp:Label ID="Label1" runat="server" ></asp:Label> </h4>
                         <br /> <br />  <br /> <br />
                   <asp:Panel ID="Panel1" runat="server"></asp:Panel>  
                       <asp:Button ID="btnCon" runat="server" Text="Retour"  CssClass="button1" OnClick="Button2_Click"  />
                      
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

