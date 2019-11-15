<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Infoedit.aspx.cs" Inherits="Infoedit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>
        &nbsp;
        Edit Blood Information</h2>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataKeyNames="info_id" DataSourceID="SqlDataSource1" DefaultMode="Edit" 
            Height="43px" Width="398px" style="margin-left: 25px">
            <Fields>
                <asp:BoundField DataField="info_id" HeaderText="info_id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="info_id" />
                <asp:BoundField DataField="bloodtype" HeaderText="Bloodgroup" 
                    SortExpression="bloodtype" NullDisplayText="No data" ReadOnly="True" />
                <asp:BoundField DataField="batchid" HeaderText="Batch Code" 
                    SortExpression="batchid" ReadOnly="True" />
                <asp:BoundField DataField="expirationdate" HeaderText="Expiry" 
                    SortExpression="expirationdate" DataFormatString="{0:d}" ReadOnly="True" />
                <asp:BoundField DataField="qty" HeaderText="Quantity" SortExpression="qty" 
                    ReadOnly="True" />
                <asp:TemplateField HeaderText="Issued">
                    <EditItemTemplate>
                        <asp:TextBox ID="issued" runat="server" Text='<%# Bind("issued", "{0}") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="issued" CssClass="validationError" Display="Dynamic" 
                            ErrorMessage="Please enter a valid number" SetFocusOnError="True" 
                            ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="bankname" HeaderText="Bank" 
                    SortExpression="bankname" ReadOnly="True" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
    </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:bbmsdbConnectionString2 %>" 
            DeleteCommand="DELETE FROM [infotbl] WHERE [info_id] = @info_id" 
            InsertCommand="INSERT INTO [infotbl] ([bloodtype], [batchid], [expirationdate], [qty], [issued], [updatetime], [bankname]) VALUES (@bloodtype, @batchid, @expirationdate, @qty, @issued, @updatetime, @bankname)" 
            ProviderName="<%$ ConnectionStrings:bbmsdbConnectionString2.ProviderName %>" 
            SelectCommand="SELECT [info_id], [bloodtype], [batchid], [expirationdate], [qty], [issued], [updatetime], [bankname] FROM [infotbl]" 
            UpdateCommand="UPDATE [infotbl] SET  [issued] = @issued WHERE [info_id] = @info_id">
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
    </p>
            
            
    </asp:Content>
