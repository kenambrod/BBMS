<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Banks.aspx.cs" Inherits="Banks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h2>Banks</h2>
<p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="bank_id" DataSourceID="SqlDataSource2" 
        EmptyDataText="There are no data records to display." ForeColor="#333333" 
        GridLines="None" style="margin-left: 37px" Width="847px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="bank_id" HeaderText="bank_id" ReadOnly="True" 
                SortExpression="bank_id" Visible="False" />
            <asp:BoundField DataField="bankname" HeaderText="Bank" 
                SortExpression="bankname" />
            <asp:BoundField DataField="address" HeaderText="Address" 
                SortExpression="address" />
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
            <asp:BoundField DataField="county" HeaderText="County" 
                SortExpression="county" />
            <asp:BoundField DataField="contactname" HeaderText="Contact" 
                SortExpression="contactname" />
            <asp:BoundField DataField="tel" HeaderText="Telephone" SortExpression="tel" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:bbmsdbConnectionString2 %>" 
        DeleteCommand="DELETE FROM [banktbl] WHERE [bank_id] = @bank_id" 
        InsertCommand="INSERT INTO [banktbl] ([bankname], [address], [city], [county], [contactname], [tel]) VALUES (@bankname, @address, @city, @county, @contactname, @tel)" 
        ProviderName="<%$ ConnectionStrings:bbmsdbConnectionString2.ProviderName %>" 
        SelectCommand="SELECT [bank_id], [bankname], [address], [city], [county], [contactname], [tel] FROM [banktbl]" 
        UpdateCommand="UPDATE [banktbl] SET [bankname] = @bankname, [address] = @address, [city] = @city, [county] = @county, [contactname] = @contactname, [tel] = @tel WHERE [bank_id] = @bank_id">
        <DeleteParameters>
            <asp:Parameter Name="bank_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="bankname" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="county" Type="String" />
            <asp:Parameter Name="contactname" Type="String" />
            <asp:Parameter Name="tel" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="bankname" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="county" Type="String" />
            <asp:Parameter Name="contactname" Type="String" />
            <asp:Parameter Name="tel" Type="Int32" />
            <asp:Parameter Name="bank_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </p>
    <p>&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Agency FB" 
            Font-Size="Large" NavigateUrl="~/protected/Addbank.aspx">Add Bank</asp:HyperLink>
    </p>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:bbmsdbConnectionString1 %>" 
        DeleteCommand="DELETE FROM [banktbl] WHERE [bank_id] = @bank_id" 
        InsertCommand="INSERT INTO [banktbl] ([bankname], [address], [city], [county], [contactname], [tel]) VALUES (@bankname, @address, @city, @county, @contactname, @tel)" 
        ProviderName="<%$ ConnectionStrings:bbmsdbConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [bank_id], [bankname], [address], [city], [county], [contactname], [tel] FROM [banktbl]" 
        UpdateCommand="UPDATE [banktbl] SET [bankname] = @bankname, [address] = @address, [city] = @city, [county] = @county, [contactname] = @contactname, [tel] = @tel WHERE [bank_id] = @bank_id">
        <DeleteParameters>
            <asp:Parameter Name="bank_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="bankname" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="county" Type="String" />
            <asp:Parameter Name="contactname" Type="String" />
            <asp:Parameter Name="tel" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="bankname" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="county" Type="String" />
            <asp:Parameter Name="contactname" Type="String" />
            <asp:Parameter Name="tel" Type="Int32" />
            <asp:Parameter Name="bank_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

