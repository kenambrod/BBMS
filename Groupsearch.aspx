﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Groupsearch.aspx.cs" Inherits="Groupsearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h2>Search by blood group</h2>
<p>
    
    <span class="style1"><strong>Select bloodgroup:</strong></span><asp:DropDownList 
        ID="DropDownList1" runat="server" AutoPostBack="True" Height="17px" 
        Width="50px">
        <asp:ListItem>A+</asp:ListItem>
        <asp:ListItem>A-</asp:ListItem>
        <asp:ListItem>B+</asp:ListItem>
        <asp:ListItem>B-</asp:ListItem>
        <asp:ListItem>AB</asp:ListItem>
        <asp:ListItem>O+</asp:ListItem>
        <asp:ListItem>O-</asp:ListItem>
    </asp:DropDownList>
    
</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="info_id" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." ForeColor="#333333" 
        GridLines="None" Width="749px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
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
        SelectCommand="SELECT info_id, bloodtype, batchid, expirationdate, qty, issued, updatetime, bankname, qty - issued AS available, DATEDIFF(day, GETDATE(), expirationdate) AS NumberOfDays FROM infotbl WHERE (bloodtype = @bloodtype)" 
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
            <asp:ControlParameter ControlID="DropDownList1" Name="bloodtype" 
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

