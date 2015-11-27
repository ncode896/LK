<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="LK.statistics" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/CSS/bootstrap1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    
    <div class="row">
        <asp:SqlDataSource ID="sotrudnikiSource" runat="server" ConnectionString="<%$ ConnectionStrings:AspNet_LKConnectionString %>" SelectCommand="SELECT [n_ls], [fio] FROM [sotrudniki]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="NewsSource" runat="server" ConnectionString="<%$ ConnectionStrings:AspNet_LKConnectionString %>"  InsertCommand="INSERT INTO [NewsTable] ([News], [n_ls]) VALUES (@News, @n_ls)" SelectCommand="SELECT * FROM [NewsTable]" >
            <InsertParameters>
                <asp:Parameter Name="News" Type="String" />
                <asp:Parameter Name="n_ls" Type="Int32" />
            </InsertParameters>
            
        </asp:SqlDataSource>
        Отправить новость
        <br />
&nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="70px" TextMode="MultiLine" Width="284px"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Отправить" CssClass="btn btn-info" />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        Сотрудникам<br />
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="sotrudnikiSource" DataTextField="fio" DataValueField="n_ls">
        </asp:CheckBoxList>

    </div>

    <div class="row">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
            <series>
                <asp:Series ChartType="Bar" Name="Series1" XValueMember="name" YValueMembers="cnt">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AspNet_LKConnectionString2 %>" SelectCommand="SELECT * FROM [stat_q1]"></asp:SqlDataSource>
        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2">
            <series>
                <asp:Series ChartType="Bar" Name="Series1" XValueMember="name" YValueMembers="cnt">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AspNet_LKConnectionString %>" SelectCommand="SELECT * FROM [stat_q2]"></asp:SqlDataSource>
        <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource3">
            <series>
                <asp:Series ChartType="Bar" Name="Series1" XValueMember="name" YValueMembers="cnt">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AspNet_LKConnectionString %>" SelectCommand="SELECT * FROM [stat_q3]"></asp:SqlDataSource>
        
        </div>         

        <div class="row">
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Выйти из режима администратора</asp:LinkButton>
        </div>
    </div>
    </form>
</body>
</html>
