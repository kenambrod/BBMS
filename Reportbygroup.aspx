<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Reportbygroup.aspx.cs" Inherits="Reportbygroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h2>See available by bloodgroup</h2>

    <span class="style1">
    <br ></br>
    <strong>Select bloodgroup:</strong></span><asp:DropDownList ID="DropDownList1" 
        runat="server" AutoPostBack="True" 
        Height="16px" style="margin-left: 6px" Width="70px">
        <asp:ListItem>A+</asp:ListItem>
        <asp:ListItem>A-</asp:ListItem>
        <asp:ListItem>B+</asp:ListItem>
        <asp:ListItem>B-</asp:ListItem>
        <asp:ListItem>AB</asp:ListItem>
        <asp:ListItem>O+</asp:ListItem>
        <asp:ListItem Value="O-"></asp:ListItem>
    </asp:DropDownList>
 <br></br>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
         CellPadding="4" DataSourceID="SqlDataSource1" 
         EmptyDataText="There are no data records to display." ForeColor="#333333" 
         GridLines="None" style="margin-left: 17px" Width="162px">
         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
         <Columns>
             <asp:BoundField DataField="Total" HeaderText="Total Available" ReadOnly="True" 
                 SortExpression="Total" />
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
     <br></br>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:bbmsdbConnectionString2 %>" 
         DeleteCommand="DELETE FROM [infotbl] WHERE [info_id] = @info_id" 
         InsertCommand="INSERT INTO [infotbl] ([bloodtype], [batchid], [expirationdate], [qty], [available], [issued], [updatetime], [bankname]) VALUES (@bloodtype, @batchid, @expirationdate, @qty, @available, @issued, @updatetime, @bankname)" 
         ProviderName="<%$ ConnectionStrings:bbmsdbConnectionString2.ProviderName %>" 
         SelectCommand="SELECT SUM(qty - issued) AS Total FROM infotbl WHERE (bloodtype = @bloodtype)" 
         
        UpdateCommand="UPDATE [infotbl] SET [bloodtype] = @bloodtype, [batchid] = @batchid, [expirationdate] = @expirationdate, [qty] = @qty, [available] = @available, [issued] = @issued, [updatetime] = @updatetime, [bankname] = @bankname WHERE [info_id] = @info_id">
         <DeleteParameters>
             <asp:Parameter Name="info_id" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="bloodtype" Type="String" />
             <asp:Parameter Name="batchid" Type="Int32" />
             <asp:Parameter DbType="Date" Name="expirationdate" />
             <asp:Parameter Name="qty" Type="Int32" />
             <asp:Parameter Name="available" Type="Int32" />
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
             <asp:Parameter Name="available" Type="Int32" />
             <asp:Parameter Name="issued" Type="Int32" />
             <asp:Parameter Name="updatetime" Type="DateTime" />
             <asp:Parameter Name="bankname" Type="String" />
             <asp:Parameter Name="info_id" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
    <h2><strong>See Issued By Bloodgroup</strong></h2>
    <br > </br>
        <strong><span class="style1">Select bloodgroup:&nbsp; </span>&nbsp;</strong><asp:DropDownList 
            ID="DropDownList2" runat="server" AutoPostBack="True" Height="16px" 
            Width="62px">
            <asp:ListItem>A+</asp:ListItem>
            <asp:ListItem>A-</asp:ListItem>
            <asp:ListItem>B+</asp:ListItem>
            <asp:ListItem>AB</asp:ListItem>
            <asp:ListItem>B-</asp:ListItem>
            <asp:ListItem>O+</asp:ListItem>
            <asp:ListItem>O-</asp:ListItem>
        </asp:DropDownList>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource2" 
            EmptyDataText="There are no data records to display." ForeColor="#333333" 
            GridLines="None" style="margin-left: 21px" Width="163px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Expr1" HeaderText="Total Issued" ReadOnly="True" 
                    SortExpression="Expr1" />
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
            DeleteCommand="DELETE FROM [infotbl] WHERE [info_id] = @info_id" 
            InsertCommand="INSERT INTO [infotbl] ([bloodtype], [batchid], [expirationdate], [qty], [available], [issued], [updatetime], [bankname]) VALUES (@bloodtype, @batchid, @expirationdate, @qty, @available, @issued, @updatetime, @bankname)" 
            ProviderName="<%$ ConnectionStrings:bbmsdbConnectionString2.ProviderName %>" 
            SelectCommand="SELECT SUM(issued) AS Expr1 FROM infotbl WHERE (bloodtype = @bloodtype)" 
            UpdateCommand="UPDATE [infotbl] SET [bloodtype] = @bloodtype, [batchid] = @batchid, [expirationdate] = @expirationdate, [qty] = @qty, [available] = @available, [issued] = @issued, [updatetime] = @updatetime, [bankname] = @bankname WHERE [info_id] = @info_id">
            <DeleteParameters>
                <asp:Parameter Name="info_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="bloodtype" Type="String" />
                <asp:Parameter Name="batchid" Type="Int32" />
                <asp:Parameter DbType="Date" Name="expirationdate" />
                <asp:Parameter Name="qty" Type="Int32" />
                <asp:Parameter Name="available" Type="Int32" />
                <asp:Parameter Name="issued" Type="Int32" />
                <asp:Parameter Name="updatetime" Type="DateTime" />
                <asp:Parameter Name="bankname" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="bloodtype" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="bloodtype" Type="String" />
                <asp:Parameter Name="batchid" Type="Int32" />
                <asp:Parameter DbType="Date" Name="expirationdate" />
                <asp:Parameter Name="qty" Type="Int32" />
                <asp:Parameter Name="available" Type="Int32" />
                <asp:Parameter Name="issued" Type="Int32" />
                <asp:Parameter Name="updatetime" Type="DateTime" />
                <asp:Parameter Name="bankname" Type="String" />
                <asp:Parameter Name="info_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

