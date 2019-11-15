<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Reportssumar.aspx.cs" Inherits="Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h2>inventory summary&nbsp;</h2>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Height="17px" Width="823px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Stock Total" HeaderText="Stock Total" 
                ReadOnly="True" SortExpression="Stock Total" />
            <asp:BoundField DataField="Issued Total" HeaderText="Issued Total" 
                ReadOnly="True" SortExpression="Issued Total" />
            <asp:BoundField DataField="Available Total" HeaderText="Available Total" 
                ReadOnly="True" SortExpression="Available Total" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Justify" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:bbmsdbConnectionString2 %>" 
            DeleteCommand="DELETE FROM [infotbl] WHERE [info_id] = @info_id" 
            InsertCommand="INSERT INTO [infotbl] ([bloodtype], [batchid], [expirationdate], [qty], [available], [issued], [updatetime], [bankname]) VALUES (@bloodtype, @batchid, @expirationdate, @qty, @available, @issued, @updatetime, @bankname)" 
            ProviderName="<%$ ConnectionStrings:bbmsdbConnectionString1.ProviderName %>" 
            SelectCommand="SELECT SUM(qty) AS [Stock Total], SUM(issued) AS [Issued Total], SUM(qty - issued) AS [Available Total] FROM infotbl" 
            
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
   <p>
       <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
           CellPadding="4" DataSourceID="SqlDataSource2" 
           EmptyDataText="There are no data records to display." ForeColor="#333333" 
           GridLines="None" style="margin-left: 0px" Width="189px" 
           HorizontalAlign="Justify">
           <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
           <Columns>
               <asp:BoundField DataField="NO OF BANKS SERVED" HeaderText="NO OF BANKS SERVED" ReadOnly="True" 
                   SortExpression="NO OF BANKS SERVED" >
               </asp:BoundField>
           </Columns>
           <EditRowStyle BackColor="#999999" />
           <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
           <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
               HorizontalAlign="Justify" />
           <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
           <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
           <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
           <SortedAscendingCellStyle BackColor="#E9E7E2" />
           <SortedAscendingHeaderStyle BackColor="#506C8C" />
           <SortedDescendingCellStyle BackColor="#FFFDF8" />
           <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
       </asp:GridView></P>
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
           ConnectionString="<%$ ConnectionStrings:bbmsdbConnectionString2 %>" 
           DeleteCommand="DELETE FROM [banktbl] WHERE [bank_id] = @bank_id" 
           InsertCommand="INSERT INTO [banktbl] ([bankname], [address], [city], [county], [contactname], [tel]) VALUES (@bankname, @address, @city, @county, @contactname, @tel)" 
           ProviderName="<%$ ConnectionStrings:bbmsdbConnectionString1.ProviderName %>" 
           SelectCommand="SELECT COUNT(bankname) AS [NO OF BANKS SERVED] FROM banktbl" 
           
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
   <P>
       <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
           CellPadding="4" DataSourceID="SqlDataSource3" 
           EmptyDataText="There are no data records to display." ForeColor="#333333" 
           GridLines="None" Width="179px">
           <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
           <Columns>
               <asp:BoundField DataField="COUNTIES SERVED" HeaderText="COUNTIES SERVED" 
                   ReadOnly="True" SortExpression="COUNTIES SERVED" />
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
       <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
           ConnectionString="<%$ ConnectionStrings:bbmsdbConnectionString2 %>" 
           DeleteCommand="DELETE FROM [banktbl] WHERE [bank_id] = @bank_id" 
           InsertCommand="INSERT INTO [banktbl] ([bankname], [address], [city], [county], [contactname], [tel]) VALUES (@bankname, @address, @city, @county, @contactname, @tel)" 
           ProviderName="<%$ ConnectionStrings:bbmsdbConnectionString1.ProviderName %>" 
           SelectCommand="SELECT DISTINCT COUNT(DISTINCT county) AS [COUNTIES SERVED] FROM banktbl" 
           
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
    </P>
   
   <p></p>
</asp:Content>

