<%@ Page Language="C#" AutoEventWireup="true" CodeFile="modal.aspx.cs" Inherits="modal" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div>
          <center>
              <br />
              <asp:Button ID="Button1" runat="server" Text="target" />
              <br /> <br />
              <asp:Label ID="Label1" runat="server" ></asp:Label>

<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">


</cc1:ToolkitScriptManager>
<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup">
    entrer votre nom :<br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Button2" runat="server" Text="submit" OnClick="Button2_Click" /> <br />
    <asp:Button ID="Button3" runat="server" Text="cancel" />
    <br />
              </asp:Panel>
<cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="button3" PopupControlID="panel1" TargetControlID="button1" BackgroundCssClass="modalBckground">

</cc1:ModalPopupExtender>
          </center>
    </div>
    </form>
</body>
</html>
