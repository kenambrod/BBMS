<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Infoadmin.aspx.cs" Inherits="Info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Blood Information </h2>
<p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="info_id" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." ForeColor="#333333" 
        GridLines="None" Width="845px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" OnClientClick="javascript:return confirm('Are you sure you want to Remove this Record!');" DeleteImageUrl="~/images/tick.gif"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="info_id" HeaderText="info_id" InsertVisible="False" 
                ReadOnly="True" SortExpression="info_id" Visible="False" />
            <asp:BoundField DataField="bloodtype" HeaderText="Bloodgroup" 
                SortExpression="bloodtype" />
            <asp:BoundField DataField="batchid" HeaderText="Batch Code" 
                SortExpression="batchid" />
            <asp:BoundField DataField="expirationdate" HeaderText="expirationdate" 
                SortExpression="expirationdate" Visible="False" />
            <asp:BoundField DataField="qty" HeaderText="Stock" SortExpression="qty" />
            <asp:BoundField DataField="issued" HeaderText="Issues" 
                SortExpression="issued" />
            <asp:BoundField DataField="updatetime" HeaderText="updatetime" ReadOnly="True" 
                SortExpression="updatetime" Visible="False" />
            <asp:BoundField DataField="bankname" HeaderText="Bank" 
                SortExpression="bankname" />
            <asp:BoundField DataField="available" HeaderText="Available" ReadOnly="True" 
                SortExpression="available" />
            <asp:BoundField DataField="NumberOfDays" HeaderText="Days to expiry" 
                ReadOnly="True" SortExpression="NumberOfDays" />
            <asp:HyperLinkField DataNavigateUrlFields="info_id" 
                DataNavigateUrlFormatString="~/infoedit.aspx?=info_id" Text="Edit" />
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
        ConnectionString="<%$ ConnectionStrings:bbmsdbConnectionString2 %>" 
        DeleteCommand="DELETE FROM [infotbl] WHERE [info_id] = @info_id" 
        InsertCommand="INSERT INTO [infotbl] ([bloodtype], [batchid], [expirationdate], [qty], [issued], [updatetime], [bankname]) VALUES (@bloodtype, @batchid, @expirationdate, @qty, @issued, @updatetime, @bankname)" 
        ProviderName="<%$ ConnectionStrings:bbmsdbConnectionString2.ProviderName %>" 
        SelectCommand="SELECT info_id, bloodtype, batchid, expirationdate, qty, issued, updatetime, bankname, qty - issued AS available, DATEDIFF(day, GETDATE(), expirationdate) AS NumberOfDays FROM infotbl" 
        UpdateCommand="UPDATE [infotbl] SET [bloodtype] = @bloodtype, [batchid] = @batchid, [expirationdate] = @expirationdate, [qty] = @qty, [issued] = @issued, [updatetime] = @updatetime, [bankname] = @bankname WHERE [info_id] = @info_id">
        <DeleteParameters>
            <asp:Parameter Name="info_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="bloodtype" Type="String" />
            <asp:Parameter Name="batchid" Type="Int32" />
            <asp:Parameter DbType="Date" Name="expirationdate" />
            <asp:Parameter Name="qty" Type="Int32" />
            <asp:Parameter Name="issued" Type="Int32" />
            <asp:Parameter Name="updatetime" Type="DateTime" />
            <asp:Parameter Name="bankname" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="bloodtype" Type="String" />
            <asp:Parameter Name="batchid" Type="Int32" />
            <asp:Parameter DbType="Date" Name="expirationdate" />
            <asp:Parameter Name="qty" Type="Int32" />
            <asp:Parameter Name="issued" Type="Int32" />
            <asp:Parameter Name="updatetime" Type="DateTime" />
            <asp:Parameter Name="bankname" Type="String" />
            <asp:Parameter Name="info_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h3>
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/protected/Addinfo.aspx">New Blood Info</asp:HyperLink>
    </h3>
    </asp:Content>

