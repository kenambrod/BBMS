<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Addbank.aspx.cs" Inherits="Addbank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Add Bank</h2>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" DataKeyNames="bank_id" 
            DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="69px" 
            Width="575px" OnItemInserted="Detailview1_ItemInsert"
            OnItemCommand="DetailView1_ItemCommand">
            <Fields>
                <asp:BoundField DataField="bank_id" HeaderText="bank_id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="bank_id" />
                <asp:TemplateField HeaderText="Bank Name">
                 <EditItemTemplate>
                    <asp:TextBox ID="bankname" runat="Server" Text="<%# Bind('bankname') %>" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                         ControlToValidate="bankname" CssClass="validationError" Display="Dynamic" 
                         ErrorMessage="Bank name is required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address"> <EditItemTemplate>
                    <asp:TextBox ID="address" runat="Server" Text="<%# Bind('address') %>" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="address" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Please enter an address" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </EditItemTemplate></asp:TemplateField>
                <asp:TemplateField HeaderText="City"> <EditItemTemplate>
                    <asp:TextBox ID="city" runat="Server" Text="<%# Bind('city') %>" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="city" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Please enter your city" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </EditItemTemplate></asp:TemplateField>
                <asp:TemplateField HeaderText="County"> <EditItemTemplate>
                    <asp:TextBox ID="county" runat="Server" Text="<%# Bind('county') %>" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="county" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Please give your county" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </EditItemTemplate></asp:TemplateField>
                <asp:TemplateField HeaderText="Contact Name"> <EditItemTemplate>
                    <asp:TextBox ID="contactname" runat="Server" Text="<%# Bind('contactname') %>" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="contactname" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Please give us a name to contact" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </EditItemTemplate></asp:TemplateField>
                <asp:TemplateField HeaderText="Telephone"> <EditItemTemplate>
                    <asp:TextBox ID="tel" runat="Server" Text="<%# Bind('tel') %>" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="tel" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Give a number to reach you please" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="tel" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Please enter a valid phone number" 
                        ValidationExpression="^\d+$" ></asp:RegularExpressionValidator>
                </EditItemTemplate></asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" InsertText="Add Bank" 
                    ButtonType="Image" CancelImageUrl="~/images/CANCEL.PNG" 
                    InsertImageUrl="~/images/save.png" >
                <ControlStyle BorderStyle="Solid" BorderWidth="1px" />
                </asp:CommandField>
            </Fields>
        </asp:DetailsView>
    </p>
<p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:bbmsdbConnectionString2 %>" 
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
</p>
</asp:Content>

