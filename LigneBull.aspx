<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LigneBull.aspx.cs" Inherits="LigneBull" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>bulletin des notes</title>
    <link rel="stylesheet" href="style1.css" type="text/css">
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
    color:#B40404 ;
    font-size:16pt;
}
 h2{text-align:left;color:cadetblue;font-size:14pt;font-family:'italic';}

 hForm{text-align:left;color:cadetblue;font-size:20pt;font-family:'italic';}
  hMod{text-align:left;color:cadetblue;font-size:16pt;font-family:'italic';}
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
         h3{text-align:center;color:gray;font-size:24px;}
                h4{
    color:#5D7B9D;
    font-size:20px;
  
  
}
     
                table#t01{
    width:100%;
}
table#t01, th#t01, td#t01 {
    border: 1px solid cadetblue;
    border-collapse: collapse;
}
th#t01, td#t01 {
    padding: 7px;
    text-align: center;
}
table#t01 tr:nth-child(even) {
    background-color: cadetblue;
}
table#t01 tr:nth-child(odd) {
   background-color:#fff;
}
table#t01 th {
    background-color: cadetblue;
    color: white;
}

table#t02 td {
    background-color: gray;
    color: white;
    border :1px solid black ;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <div class="navbar">
  <a href="listeFormations.aspx">Formations</a>
 <a href="espacePart.aspx">Gérer Mon Profile</a>
       
        <a href="login.aspx">déconnexion</a>
  
  </div> 
        <asp:Label ID="lmat" runat="server" Text="Label"></asp:Label>
        <center>
        <table>
            <tr>
                <td>
                    <h1> <span>  Bulletin des Notes  du Participant : </span> </h1> 
                </td>
                </tr>
            <tr>
                <td>
                    <h3> <asp:Label ID="lnom" runat="server"  ></asp:Label>
              <asp:Label ID="lpren" runat="server" ></asp:Label> </h3>
                </td>
            </tr>
            <tr>
                <td> <h3> Formation <asp:Label ID="nomf" runat="server" Text="Label"></asp:Label></td></h3>
          
               
            </tr>
        </table>
         
            </center>
            <asp:Label ID="lidB" runat="server" visible="false"></asp:Label>
        <center>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="nomMod" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                
               <asp:Label ID="lidMod" runat="server"  Text='<%# Eval("idMod") %>' visible="false" />
              <table id='t01'>
                  <tr>
                      <th id='t01'>
                        Module:  <asp:Label ID="nomModLabel" runat="server" Text='<%# Eval("nomMod") %>' />
                      </th>
                      
                  </tr>
              
                  </table>
               
                <br />
               <table>
                  <%--   <tr>  <td id='t01'>
                    Nom Leçon:
                     </td> 
                     <td id='t01'>
                       Note:
                    </td>--%>

                   
                </tr>
               </table>
  <asp:DataList ID="DataList2" runat="server" DataKeyField="idL" DataSourceID="SqlDataSource2">
            <ItemTemplate>
            <table id="t01">
              
                 <tr>
                    
                     <td id='t01'>
                         <asp:Label ID="nomLLabel" runat="server" Text='<%# Eval("nomL") %>' />
                     </td>
               
                   
                     <td id='t01'>
                          <asp:Label ID="noteLabel" runat="server" Text='<%# Eval("note") %>' />
                     </td>
                
               
                    
                   <%-- <td id='t01'>
                     <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                    </td>--%>
                </tr>
            </table>
                
               

            </ItemTemplate>
        </asp:DataList>
                <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString20 %>" SelectCommand="SELECT leçon.idL, leçon.nomL,  max(ligneBull.note) AS note  FROM leçon INNER JOIN ligneBull ON leçon.idL = ligneBull.idL INNER JOIN module1 ON leçon.idMod = module1.idMod where idB=@idB and module1.idMod=@idMod
group by leçon.idL, nomL ">
                    <SelectParameters>
                <asp:ControlParameter ControlID="lidB" Name="idB" PropertyName="Text" Type="Int32" DefaultValue="idB" />
                         <asp:ControlParameter ControlID="lidMod" Name="idMod" PropertyName="Text" Type="Int32" DefaultValue="idB" />
            </SelectParameters>
        </asp:SqlDataSource>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pfeConnectionString20 %>" SelectCommand="SELECT distinct module1.nomMod ,module1.idMod FROM leçon INNER JOIN ligneBull ON leçon.idL = ligneBull.idL INNER JOIN module1 ON leçon.idMod = module1.idMod where idB=@idB">
               <SelectParameters>
                <asp:ControlParameter ControlID="lidB" Name="idB" PropertyName="Text" Type="Int32" DefaultValue="idB" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
<asp:Label ID="lLeçExist" runat="server" Text="vous n'avez passer aucune leçon dans cette formation" Visible="false"></asp:Label>
        <br />
        <center>
            <br /> <br />
         <asp:Button ID="btnConsulter" runat="server" Text="Liste Des Bulletins"  CssClass="button1" OnClick="btnConsulter_Click"  />
     </center>
    </div>
    </form>
</body>
</html>

