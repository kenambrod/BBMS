<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Addinfo.aspx.cs" Inherits="Addinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-family: "Times New Roman", Times, serif;
        }
    </style>
        <script type= "text/javascript">
        $(document).ready(function () {
            $(".expirationdate").datepicker({
                dateFormat: 'mm/dd/yy',
                changeMonth: true,
                changeYear: true,
                minDate: '+1da',
                maxDate:'+6mo'
             });
	});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2 class="style1">Add Blood Information</h2>
<p>
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
        DataKeyNames="info_id" DataSourceID="SqlDataSource1" DefaultMode="Insert" 
        Height="50px" Width="479px" style="margin-left: 23px">
        <Fields>
            <asp:BoundField DataField="info_id" HeaderText="info_id" InsertVisible="False" 
                ReadOnly="True" SortExpression="info_id" />
            <asp:TemplateField HeaderText="Bank">
                <EditItemTemplate>
                    <asp:DropDownList ID="bankname" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="bankname" DataValueField="bankname" Height="16px" 
                        SelectedValue='<%# Bind("bankname") %>' style="margin-left: 18px" Width="102px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:bbmsdbConnectionString2 %>" 
                        SelectCommand="SELECT [bankname] FROM [banktbl]"></asp:SqlDataSource>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Batch Code">
                <EditItemTemplate>
                    <asp:TextBox ID="batchid" runat="server" Text='<%# Bind("batchid") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="batchid" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Batch code is required" SetFocusOnError="True" 
                        ValidationGroup="^\d+$"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="batchid" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Check the Batch you entered" SetFocusOnError="True" 
                        ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bloodgroup">
                <EditItemTemplate>
                    <asp:DropDownList ID="bloodgroup" runat="server" 
                        DataTextField="bloodgroup" DataValueField="bloodgroup" Height="17px" 
                        SelectedValue='<%# Bind("bloodtype") %>' style="margin-left: 32px" 
                        Width="104px">
                        <asp:ListItem>A+</asp:ListItem>
                        <asp:ListItem>A-</asp:ListItem>
                        <asp:ListItem>B-</asp:ListItem>
                        <asp:ListItem>B+</asp:ListItem>
                        <asp:ListItem>AB</asp:ListItem>
                        <asp:ListItem>O+</asp:ListItem>
                        <asp:ListItem>O-</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Stock">
                <EditItemTemplate>
                    <asp:TextBox ID="qty" runat="server" Text='<%# Bind("qty") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="qty" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Quantity is required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="qty" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Enter valid quantity of stock" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Issued">
                <EditItemTemplate>
                    <asp:TextBox ID="issued" runat="server" Text='<%# Bind("issued") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="issued" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Enter valid number of issue" SetFocusOnError="True" 
                        ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Expiry">
                <EditItemTemplate>
                   <asp:TextBox ID="expirationdate" runat="server" Text="<%# Bind('expirationdate','{0:d}') %>" 
                    CssClass="expirationdate" 
                    />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="expirationdate" CssClass="validationError" Display="Dynamic" 
                        ErrorMessage="Expiry date is required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    </p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:bbmsdbConnectionString2 %>" 
        DeleteCommand="DELETE FROM [infotbl] WHERE [info_id] = @info_id" 
        InsertCommand="INSERT INTO [infotbl] ([bloodtype], [batchid], [expirationdate], [qty],[issued], [bankname]) VALUES (@bloodtype, @batchid, @expirationdate, @qty,  @issued, @bankname)" 
        ProviderName="<%$ ConnectionStrings:bbmsdbConnectionString2.ProviderName %>" 
        SelectCommand="SELECT info_id, bloodtype, batchid, expirationdate, qty, issued, updatetime, bankname FROM infotbl" 
        
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
    
      
    </asp:Content>

