<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Banksearch.aspx.cs" Inherits="Views" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Search inormation by Bank</h2>
<p>
     <span class="style1"><strong>Bank:</strong></span><asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="bankname" 
        DataValueField="bankname" Height="22px" style="margin-left: 22px" 
        Width="134px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:bbmsdbConnectionString2 %>" 
        SelectCommand="SELECT [bankname] FROM [infotbl]"></asp:SqlDataSource>
</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="info_id" DataSourceID="SqlDataSource2" 
        EmptyDataText="There are no data records to display." ForeColor="#333333" 
        GridLines="None" Width="831px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="info_id" HeaderText="info_id" InsertVisible="False" 
                ReadOnly="True" SortExpression="info_id" Visible="False" />
            <asp:BoundField DataField="bloodtype" HeaderText="Bloodgroup" 
                SortExpression="bloodtype" />
            <asp:BoundField DataField="batchid" HeaderText="Batch" 
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
            <asp:BoundField DataField="Available" HeaderText="Available" ReadOnly="True" 
                SortExpression="Available" />
            <asp:BoundField DataField="NumberOfDays" HeaderText="Days to expiry" 
                ReadOnly="True" SortExpression="NumberOfDays" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:bbmsdbConnectionString2 %>" 
        DeleteCommand="DELETE FROM [infotbl] WHERE [info_id] = @info_id" 
        InsertCommand="INSERT INTO [infotbl] ([bloodtype], [batchid], [expirationdate], [qty], [issued], [updatetime], [bankname]) VALUES (@bloodtype, @batchid, @expirationdate, @qty, @issued, @updatetime, @bankname)" 
        ProviderName="<%$ ConnectionStrings:bbmsdbConnectionString2.ProviderName %>" 
        SelectCommand="SELECT info_id, bloodtype, batchid, expirationdate, qty, issued, updatetime, bankname, qty - issued AS Available, DATEDIFF(day, GETDATE(), expirationdate) AS NumberOfDays FROM infotbl WHERE (bankname = @bankname)" 
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
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="bankname" 
                PropertyName="SelectedValue" />
        </SelectParameters>
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
</p>
</asp:Content>

