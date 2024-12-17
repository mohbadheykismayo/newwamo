<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="send.aspx.cs" Inherits="waamowaste.send" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" /> <div> <asp:TextBox ID="txtMessage" runat="server"></asp:TextBox> <asp:Button ID="btnSend" runat="server" Text="Send" OnClientClick="sendMessage(); return false;" /> </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        function sendMessage()
        { var message = $('#txtMessage').val(); $.ajax({ type: "POST", url: "send.aspx/SendSMS", data: JSON.stringify({ message: message }), contentType: "application/json; charset=utf-8", dataType: "json", success: function (response) { alert('Message sent successfully!'); }, error: function (error) { alert('Error sending message: ' + error.responseText); } }); } </script>
</asp:Content>
