<%@ Page Language="C#" AutoEventWireup="true" CodeFile="espacePartMod.aspx.cs" Inherits="espacePartMod" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Espace Participant</title>
    
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
    background-color: cadetblue; 
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
.navbar {
    overflow: hidden;
    background-color: cadetblue;
    font-family: italic, Helvetica, sans-serif;
}

.navbar a {
    float: left;
    font-size: 16px;
    color: white;
    text-align: center;
    padding: 20px 50px;
    text-decoration: none;
}

.dropdown {
    float: left;
    overflow: hidden;
}
.d{
    float:right;
}

.dropdown .dropbtn {
    font-size: 16px;    
    border: none;
    outline: none;
    color: white;
    padding: 14px 16px;
    background-color: inherit;
    font-family: inherit;
    margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
    background-color:  #f9f9f9;
    color:cadetblue;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {
    background-color: #ddd;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.card {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
	top: 50px;
  right: -500px;
  height: 600px;
    width: 75%;
    border-radius: 30px;
    background-color: #F2F2F2;
    border: solid 1.5px cadetblue;
   
    
}

.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

img {
    border-radius: 7px 7px 0 0;
}

.container {
    padding: 2px 16px;
}
h1{
    color:#B40404;
}
 h2{text-align:left;color:cadetblue;font-size:14pt;font-family:'italic';}

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
     

</style>
</head>
<body>
    <br />
    
    <form id="form2" runat="server">
    <div class="navbar">
  <a href="listeFormations.aspx">Formations</a>
  <a href="bulletinNote.aspx">bulletin des notes</a>
    <a href="login.aspx">déconnexion</a>
  
  </div> 
</div>
        <br /> <br />
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
        <div class="our_inventory margin-top-30 scroll_effect bounceIn">
           
 <center> <h1> <span> MON PROFILE:  </span> </h1> </center>
</div> 
        <asp:Label ID="lmat" runat="server" Text="Label"></asp:Label>  
        <center>

<div class="card">
  
  <div class="container">
      <br />
<asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"></asp:Button>
      <table>
          <tr>
             <td><h2>matricule:</h2>   </td> 
             
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
              
          </tr>
        
          <tr>
              <td><h2>Nom </h2></td> 
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
          </tr>

           <tr>
              <td><h2>Prénom </h2></td> 
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:TextBox ID="tpren" runat="server" CssClass="textBoxS"></asp:TextBox></td>
          </tr>

           <tr>
              <td><h2>E-mail</h2></td>
                <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:TextBox ID="temail" runat="server" CssClass="textBoxS"></asp:TextBox></td>
          </tr>
       
          
            <tr>
              <td><h2>Ville:</h2></td>
                <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:TextBox ID="tville" runat="server" CssClass="textBoxS"></asp:TextBox></td>
          </tr>
       
            <tr>
              <td><h2>Code Postale:</h2></td>
                <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:TextBox ID="tcode" runat="server" CssClass="textBoxS"></asp:TextBox></td>
          </tr>
          
            <tr>
              <td><h2>Téléphone : </h2></td>
                <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:TextBox ID="ttel" runat="server" CssClass="textBoxS"></asp:TextBox></td>
          </tr>
         
             <tr>
              <td><h2> Mot De Passe:</h2></td>
                 <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td> 
              <td><b><asp:TextBox ID="tmp" runat="server" CssClass="textBoxS"></asp:TextBox></td>
                 </tr>
         <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
      </table>
   
      <br /> <br />
    <tr> <asp:Button ID="btnMod" runat="server" Text="Modifier Profile"  CssClass="button1" OnClick="btnMod_Click"></asp:Button>
        
  </div>
    </center>
 
    </form>
</body>
</html>

