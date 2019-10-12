<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>acc</title>
    <link rel="stylesheet" href="style2.css" type="text/css">
     <link rel="stylesheet" href="style.css" type="text/css">
</head>
    <body>
        <center> <img src="images/steg.png" /> </center> 
        <style>
            h1{
    color:#B40404;
    font-weight:bolder;
    font-size:20px;
}
        </style>
    <br />
	
<div class="container demo-1">
    <div class="
        ">
        <div id="large-header" class="large-header">
                
            <div class="main-agileits">

                <div class="form-w3-agile">
                    <h2>Authentification</h2>
                        <form id="form1" runat="server">
                                <div class="form-sub-w3">
                                    <asp:TextBox ID="tlog" placeholder="login" runat="server"></asp:TextBox>
								<div class="icon-w3">
									<i class="fa fa-user" aria-hidden="true"></i>
								</div>
								</div>
                                <div class="form-sub-w3">
                                    <asp:TextBox ID="tmp" placeholder="mot de passe" runat="server" TextMode="Password"></asp:TextBox>
								<div class="icon-w3">
									<i class="fa fa-user" aria-hidden="true"></i>
								</div>
								</div>
                           
                            	<div class="submit-w3l">
                                    <asp:Button ID="Button1" runat="server" Text="connexion" OnClick="Button1_Click" />
                                  
								</div>
                            <br /> 
                               <center><h1><asp:Label ID="Lmesg" runat="server" class="error" Visible="False" Text="message d'erreur"></asp:Label></h1></center>
                        </form>
                    
                </div>
            </div>
        </div>
        
    </div>
    
</div>
     