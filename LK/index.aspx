<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="LK.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/CSS/MyCSS.css" rel="stylesheet" />
    <link href="/CSS/bootstrap.css" rel="stylesheet" />
</head>
<body class="BackBlueColor">
    <form id="form1" runat="server">
    <div class ="container">
        <br /><br /><br /><br /><br />
        <h2 class="span4 offset4" style="color: #252525">Личный кабинет</h2><br /><br /><br /><br /><br />
        
        <div class="well span3 offset4">
    
        
        
        <h4 class="offset1">Вход</h4><br />
        Имя пользователя:</br><asp:TextBox ID="TextBox1" runat="server" CssClass="span3"></asp:TextBox>
        <br />
        Пароль:</br><asp:TextBox ID="TextBox2" runat="server" CssClass="span3" TextMode="Password"></asp:TextBox>
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Войти</asp:LinkButton>
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" ForeColor="#FF3300" Text="!Неверные данные" Visible="False"></asp:Label>
        
        </div>
    </div>
    </form>
</body>
</html>
