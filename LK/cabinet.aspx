<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cabinet.aspx.cs" Inherits="LK.cabinet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/CSS/MyCSS.css" rel="stylesheet" />
    <link href="/CSS/bootstrap1.css" rel="stylesheet" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    <div class="row">
        <nav class="navbar navbar-default">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Опрос <span class="caret"></span></a>
               <ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>
					</ul>
                    </li>
            </ul>
            <ul class="nav navbar-nav navbar-link navbar-right ">
                <li><asp:LinkButton ID="LinkButton4" runat="server" >Проекты</asp:LinkButton></li>
                <li><asp:LinkButton ID="LinkButton3" runat="server" >Мои документы</asp:LinkButton></li>
                <li><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Дискуссия<span class="badge">2</span></asp:LinkButton></li>
                <li><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Выйти&nbsp;&nbsp;&nbsp;&nbsp;</asp:LinkButton></li>
            </ul>
        </nav>
    </div>
    <div class="row">
         

            <asp:Label ID="Label1" runat="server" Text="Соединение" Visible="False"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="n_ls" Visible="False"></asp:Label>
           
            <br />
            <asp:Label ID="fio_hello" runat="server" Text="Привет,ФИО" Font-Italic="True" Font-Names="Comic Sans MS" Font-Size="X-Large" Font-Strikeout="False"></asp:Label>
            <br />
            <br />
           
   </div>

        <div class="row">
            
                <asp:Label ID="Label3" runat="server" Text="Пожалуйста пройдите опрос!" Font-Names="Comic Sans MS" Font-Overline="False" Font-Size="Large" Font-Underline="True"></asp:Label>
            
            &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AspNet_LKConnectionString2 %>" DeleteCommand="DELETE FROM [form_answer] WHERE [id] = @id" InsertCommand="INSERT INTO [form_answer] ([choice1], [choice2], [choice3]) VALUES (@choice1, @choice2, @choice3)" SelectCommand="SELECT * FROM [form_answer]" UpdateCommand="UPDATE [form_answer] SET [choice1] = @choice1, [choice2] = @choice2, [choice3] = @choice3 WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="choice1" Type="Int32" />
                    <asp:Parameter Name="choice2" Type="Int32" />
                    <asp:Parameter Name="choice3" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="choice1" Type="Int32" />
                    <asp:Parameter Name="choice2" Type="Int32" />
                    <asp:Parameter Name="choice3" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AspNet_LKConnectionString2 %>" SelectCommand="SELECT * FROM [choises1]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AspNet_LKConnectionString2 %>" SelectCommand="SELECT * FROM [choises2]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:AspNet_LKConnectionString2 %>" SelectCommand="SELECT * FROM [choises3]"></asp:SqlDataSource>
            <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource2" DefaultMode="Insert"  BorderStyle="Groove" BorderWidth="0px" CssClass="table table-bordered">
                <Fields>
                    <asp:TemplateField HeaderText="На сколько вас устраивает загрязнение воздуха и уровень шума?">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" BackColor="#F6F1DB" Font-Names="Andalus" CssClass="ddl" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("choice1") %>' Width="300px">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="На сколько вас устраивает ваша работа?">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource4" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("choice2") %>' Width="300px">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Отношения с коллегами?">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource5" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("choice3") %>' Width="300px">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" InsertText="Отправить" ShowCancelButton="False"  ControlStyle-CssClass="btn btn-info" ShowInsertButton="True" >
<ControlStyle CssClass="btn btn-default"></ControlStyle>
                    </asp:CommandField>
                </Fields>
                <FooterStyle BorderStyle="Solid" BorderWidth="0px" />
                <InsertRowStyle BorderStyle="Dotted" BorderWidth="0px" />
            </asp:DetailsView>
            <br />
        </div>

        <div class="row">
          
            <asp:Label ID="Label4" runat="server" Text="Новости для Вас:" Font-Names="Comic Sans MS" Font-Size="Large" Font-Underline="True"></asp:Label>
            
            <asp:Panel ID="Panel1" runat="server">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AspNet_LKConnectionString %>" SelectCommand="SELECT * FROM [News]"></asp:SqlDataSource>
            </asp:Panel>
        </div>
   </div>
    </form>
</body>
</html>
