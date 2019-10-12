<%@ Page Language="C#" AutoEventWireup="true" CodeFile="espacePart.aspx.cs" Inherits="menu" %>
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
           h4{
          color:#D90115;
          font-size:20px;
          font-weight:bold;
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
       
        <center>

<div class="card">
  
  <div class="container">

      <br />
      <table>
          <tr>
             <td><h2>matricule:</h2>   </td> 
             
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:Label ID="lmat" runat="server" Text="Label"></asp:Label></td>
              
          </tr>
        
          <tr>
              <td><h2>Nom & Prénom:</h2></td> 
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
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
       <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>
<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup">
   <center> <h1>  Changer mon profile: </h1> </center> <br />
   
    <center>
<asp:UpdatePanel runat="server">
    
</asp:UpdatePanel>
        
    <table>
     
         <tr>
             <td><h2>Nom :</h2>   </td> 
             
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:TextBox ID="tnom" runat="server" CssClass="textBoxS"></asp:TextBox>
              
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                              
                             ControlToValidate="tnom" EnableClientScript="False" ValidationExpression="[a-zA-Z]{3}[a-zA-Z]*([a-zA-Z]|\s)*"
                             ErrorMessage="Votre Nom doit être composé de chaine de caractére..!!"  Text="*"></asp:RegularExpressionValidator>
              
        </tr>
    

         <tr>
             <td><h2>Prénom :</h2>   </td> 
             
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:TextBox ID="tpren" runat="server" CssClass="textBoxS"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                              
                             ControlToValidate="tpren" EnableClientScript="False" ValidationExpression="[a-zA-Z]{3}[a-zA-Z]*([a-zA-Z]|\s)*"
                             ErrorMessage="Votre Prenom doit être composé de chaine de caractére..!!"  Text="*"></asp:RegularExpressionValidator>
                  
                  
                  
                  </td>
        </tr>

         <tr>
             <td><h2>E-mail</h2>   </td> 
             
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:TextBox ID="temail" runat="server" CssClass="textBoxS"></asp:TextBox>
                  
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                              
                             ControlToValidate="temail" EnableClientScript="False" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                             ErrorMessage="Vérifier Votre email..!!"  Text="*"></asp:RegularExpressionValidator>
                  
                  
                  
                  </td>
        </tr>

         <tr>
             <td><h2>Ville :</h2>   </td> 
             
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b>   <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="96px">
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
              <td><b><asp:TextBox ID="tpost" runat="server" CssClass="textBoxS"></asp:TextBox>
                  
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                              
                             ControlToValidate="tpost" EnableClientScript="False" ValidationExpression="\d{4}"
                             ErrorMessage="Votre code postale doit être composé de 4 chiffres..!!"  Text="*"></asp:RegularExpressionValidator>
                  
                  
                  
                  </td>
        </tr>

           <tr>
             <td><h2>Téléphone :</h2>   </td> 
             
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:TextBox ID="ttel" runat="server" CssClass="textBoxS"></asp:TextBox>
                  
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                              
                             ControlToValidate="ttel" EnableClientScript="False" ValidationExpression="\d{8}"
                             ErrorMessage="Votre numéro de téléphone doit être composé de 8 chiffres..!!"  Text="*"></asp:RegularExpressionValidator>
                  
                  </td>
        </tr>

           <tr>
             <td><h2>Mot de Passe :</h2>   </td> 
             
              <td> </td> <td></td> <td></td><td> </td> <td></td> <td></td><td> </td> <td></td> <td></td>
              <td><b><asp:TextBox ID="tmp" runat="server" CssClass="textBoxS"></asp:TextBox></td>
        </tr>
        </table>
       
        <br /> <br />
<asp:Button runat="server" Text="Confirmer" CssClass="button1" OnClick="Unnamed1_Click"></asp:Button> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" Text="Annuler" CssClass="button1" /><br />
       
    
       
        </center>
                
              </asp:Panel>
<cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="button3" PopupControlID="panel1" TargetControlID="btnMod" BackgroundCssClass="modalBckground">

</cc1:ModalPopupExtender>
        <br />
  <h4> <center> <asp:ValidationSummary ID="ValidationSummary1" runat="server" /> </h4> </center>

       
    </form>

</body>
</html>
