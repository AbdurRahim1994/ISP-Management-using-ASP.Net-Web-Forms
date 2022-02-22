<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="Project.Admin.Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="jumbotron col-lg-6 m-auto">
        <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered table-dark table-hover" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="employeeId" DataSourceID="dsEmployee" OnItemInserting="DetailsView1_ItemInserting" OnItemUpdating="DetailsView1_ItemUpdating" Width="500px">
            <Fields>
                <asp:TemplateField HeaderText="Employee ID" InsertVisible="False" SortExpression="employeeId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("employeeId") %>' CssClass="form-control" Enabled="false"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("employeeId") %>' CssClass="form-control" Enabled="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Employee Name" SortExpression="employeeName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("employeeName") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("employeeName") %>' CssClass="form-control"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("employeeName") %>' CssClass="form-control"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact" SortExpression="contact">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("contact") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("contact") %>' CssClass="form-control"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("contact") %>' CssClass="form-control"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("email") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("email") %>' CssClass="form-control"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("email") %>' CssClass="form-control"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date of Birth" SortExpression="dateofBirth">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDOB" runat="server" Text='<%# Bind("dateofBirth","{0:yyyy-MM-dd}") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtDOB" runat="server" Text='<%# Bind("dateofBirth","{0:yyyy-MM-dd}") %>' CssClass="form-control"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("dateofBirth", "{0:yyyy-MM-dd}") %>' CssClass="form-control"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address" SortExpression="address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("address") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("address") %>' CssClass="form-control"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("address") %>' CssClass="form-control"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Office ID" SortExpression="officeAreaId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("officeAreaId") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("officeAreaId") %>' CssClass="form-control"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("officeAreaId") %>' CssClass="form-control"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image" SortExpression="image">
                    <EditItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image","~/Images/{0}") %>' Height="40px" Width="40px" />
                        Change Image :
                        <br />
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("image") %>' />
                        <asp:FileUpload ID="UpdatePicture" runat="server" CssClass="form-control" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("image") %>' />
                        <asp:FileUpload ID="InsertPicutre" runat="server" CssClass="form-control" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("image","~/Images/{0}") %>' Height="40px" Width="40px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action" ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-outline-success"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-outline-secondary"></asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-outline-primary"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-outline-secondary"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-outline-success" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="New" CssClass="btn btn-outline-primary" Text="New"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-outline-danger"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsEmployee" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:OfficeAddressCon %>" DeleteCommand="DELETE FROM [tblEmployee] WHERE [employeeId] = @original_employeeId AND [employeeName] = @original_employeeName AND [contact] = @original_contact AND [email] = @original_email AND [dateofBirth] = @original_dateofBirth AND [address] = @original_address AND [officeAreaId] = @original_officeAreaId AND (([image] = @original_image) OR ([image] IS NULL AND @original_image IS NULL))" InsertCommand="INSERT INTO [tblEmployee] ([employeeName], [contact], [email], [dateofBirth], [address], [officeAreaId], [image]) VALUES (@employeeName, @contact, @email, @dateofBirth, @address, @officeAreaId, @image)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tblEmployee]" UpdateCommand="UPDATE [tblEmployee] SET [employeeName] = @employeeName, [contact] = @contact, [email] = @email, [dateofBirth] = @dateofBirth, [address] = @address, [officeAreaId] = @officeAreaId, [image] = @image WHERE [employeeId] = @original_employeeId AND [employeeName] = @original_employeeName AND [contact] = @original_contact AND [email] = @original_email AND [dateofBirth] = @original_dateofBirth AND [address] = @original_address AND [officeAreaId] = @original_officeAreaId AND (([image] = @original_image) OR ([image] IS NULL AND @original_image IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_employeeId" Type="Int32" />
                <asp:Parameter Name="original_employeeName" Type="String" />
                <asp:Parameter Name="original_contact" Type="Int32" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter DbType="Date" Name="original_dateofBirth" />
                <asp:Parameter Name="original_address" Type="String" />
                <asp:Parameter Name="original_officeAreaId" Type="String" />
                <asp:Parameter Name="original_image" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="employeeName" Type="String" />
                <asp:Parameter Name="contact" Type="Int32" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter DbType="Date" Name="dateofBirth" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="officeAreaId" Type="String" />
                <asp:Parameter Name="image" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="employeeName" Type="String" />
                <asp:Parameter Name="contact" Type="Int32" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter DbType="Date" Name="dateofBirth" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="officeAreaId" Type="String" />
                <asp:Parameter Name="image" Type="String" />
                <asp:Parameter Name="original_employeeId" Type="Int32" />
                <asp:Parameter Name="original_employeeName" Type="String" />
                <asp:Parameter Name="original_contact" Type="Int32" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter DbType="Date" Name="original_dateofBirth" />
                <asp:Parameter Name="original_address" Type="String" />
                <asp:Parameter Name="original_officeAreaId" Type="String" />
                <asp:Parameter Name="original_image" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
    <script src="../Scripts/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("input[name$='txtDOB']").datepicker({ format: "yyyy-mm-dd" });
        })
    </script>
</asp:Content>
