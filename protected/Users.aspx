<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h2>Users</h2>
<p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." AllowSorting="True" 
        CellPadding="4" ForeColor="#333333" GridLines="None" Width="313px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ApplicationId" HeaderText="ApplicationId" 
                SortExpression="ApplicationId" Visible="False" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" 
                SortExpression="UserId" Visible="False" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" 
                SortExpression="UserName" />
            <asp:BoundField DataField="LoweredUserName" HeaderText="LoweredUserName" 
                SortExpression="LoweredUserName" Visible="False" />
            <asp:BoundField DataField="MobileAlias" HeaderText="MobileAlias" 
                SortExpression="MobileAlias" Visible="False" />
            <asp:CheckBoxField DataField="IsAnonymous" HeaderText="IsAnonymous" 
                SortExpression="IsAnonymous" Visible="False" />
            <asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" 
                SortExpression="LastActivityDate" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ASPNETDBConnectionString1 %>" 
        DeleteCommand="DELETE FROM [aspnet_Users] WHERE [UserId] = @UserId" 
        InsertCommand="INSERT INTO [aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (@ApplicationId, @UserId, @UserName, @LoweredUserName, @MobileAlias, @IsAnonymous, @LastActivityDate)" 
        ProviderName="<%$ ConnectionStrings:ASPNETDBConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate] FROM [aspnet_Users]" 
        UpdateCommand="UPDATE [aspnet_Users] SET [ApplicationId] = @ApplicationId, [UserName] = @UserName, [LoweredUserName] = @LoweredUserName, [MobileAlias] = @MobileAlias, [IsAnonymous] = @IsAnonymous, [LastActivityDate] = @LastActivityDate WHERE [UserId] = @UserId">
        <DeleteParameters>
            <asp:Parameter Name="UserId" Type="Object" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ApplicationId" Type="Object" />
            <asp:Parameter Name="UserId" Type="Object" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="LoweredUserName" Type="String" />
            <asp:Parameter Name="MobileAlias" Type="String" />
            <asp:Parameter Name="IsAnonymous" Type="Boolean" />
            <asp:Parameter Name="LastActivityDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ApplicationId" Type="Object" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="LoweredUserName" Type="String" />
            <asp:Parameter Name="MobileAlias" Type="String" />
            <asp:Parameter Name="IsAnonymous" Type="Boolean" />
            <asp:Parameter Name="LastActivityDate" Type="DateTime" />
            <asp:Parameter Name="UserId" Type="Object" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>
</asp:Content>

