<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="testgridadd.aspx.cs" Inherits="testgridadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
            <asp:BoundField DataField="NumberOfDays" HeaderText="NumberOfDays" 
                ReadOnly="True" SortExpression="NumberOfDays" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:bbmsdbConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:bbmsdbConnectionString2.ProviderName %>" 
        SelectCommand="SELECT id, DATEDIFF(day, expirity, GETDATE()) AS NumberOfDays FROM Table2">
    </asp:SqlDataSource>
    </p>
</asp:Content>

