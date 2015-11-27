<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="discussion.aspx.cs" Inherits="LK.discussion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/CSS/bootstrap1.css" rel="stylesheet" />
    <link href="/CSS/MyCSS.css" rel="stylesheet" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <nav class="navbar navbar-default">
            <ul class="nav navbar-nav navbar-link navbar-right ">
                <li><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Назад в кабинет&nbsp;&nbsp;&nbsp;</asp:LinkButton></li>
            </ul>
        </nav>
        </div>

        <div class="row">
            
            <asp:TextBox ID="TextBox1" runat="server" Height="59px" Rows="3" TextMode="MultiLine" Width="365px"></asp:TextBox><br />
            <asp:Button ID="Button1" runat="server" Text="Отправить" CssClass="btn btn-info" OnClick="Button1_Click"  />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            
        </div>

        <div class="row">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AspNet_LKConnectionString %>" SelectCommand="SELECT [date], [fio], [Message] FROM [diskuss] ORDER BY [date] DESC"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-hover" BorderColor="White" BorderStyle="Dotted" ShowHeader="False" ShowHeaderWhenEmpty="True">
            <Columns>
                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" ControlStyle-CssClass="warning" />
                <asp:BoundField DataField="fio" HeaderText="fio" SortExpression="fio" />
                <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" ItemStyle-Wrap="true" />
            </Columns>
            </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
