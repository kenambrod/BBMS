<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Adduser.aspx.cs" Inherits="Adduser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h2>Add User</h2>
<p>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="user_id" DataSourceID="SqlDataSource1" 
        DefaultMode="Insert" Height="50px" Width="531px">
        <Fields>
            <asp:BoundField DataField="user_id" HeaderText="user_id" InsertVisible="False" 
                ReadOnly="True" SortExpression="user_id" />
            <asp:TemplateField HeaderText="Username"> <EditItemTemplate>
                    <asp:TextBox ID="username" runat="Server" Text="<%# Bind('username') %>" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="username" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Username is required" SetFocusOnError="True" 
                        ToolTip="Use a strong password"></asp:RequiredFieldValidator>
                </EditItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Password"> <EditItemTemplate>
                    <asp:TextBox ID="password" runat="Server" Text="<%# Bind('password') %>" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="password" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Use a strong password" ToolTip="Use a strong password"></asp:RequiredFieldValidator>
                </EditItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Names"> <EditItemTemplate>
                    <asp:TextBox ID="names" runat="Server" Text="<%# Bind('names') %>" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="names" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Please enter your names" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </EditItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Address"> <EditItemTemplate>
                    <asp:TextBox ID="address" runat="Server" Text="<%# Bind('address') %>" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="address" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Please  enter your address" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </EditItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Category"><EditItemTemplate>
                    <asp:TextBox ID="category" runat="Server" Text="<%# Bind('category') %>" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="category" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Please enter your category"></asp:RequiredFieldValidator>
                </EditItemTemplate></asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" InsertText="Save User" />
        </Fields>
    </asp:DetailsView>
</p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:bbmsdbConnectionString1 %>" 
        DeleteCommand="DELETE FROM [userstbl] WHERE [user_id] = @user_id" 
        InsertCommand="INSERT INTO [userstbl] ([username], [password], [names], [address], [category]) VALUES (@username, @password, @names, @address, @category)" 
        ProviderName="<%$ ConnectionStrings:bbmsdbConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [user_id], [username], [password], [names], [address], [category] FROM [userstbl]" 
        UpdateCommand="UPDATE [userstbl] SET [username] = @username, [password] = @password, [names] = @names, [address] = @address, [category] = @category WHERE [user_id] = @user_id">
        <DeleteParameters>
            <asp:Parameter Name="user_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="names" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="category" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="names" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="category" Type="String" />
            <asp:Parameter Name="user_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

