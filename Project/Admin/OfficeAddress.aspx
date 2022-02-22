<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="OfficeAddress.aspx.cs" Inherits="Project.Admin.OfficeAddress" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="container">
        <div class="jumbotron mt-3 col-lg-10 ml-5">
            <div class="row">
                <div class="col-lg-10">
                    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="addressId" DataSourceID="dsOfficeAddress" GridLines="Both" CssClass="table table-bordered table-hover table-sm">
                        <EditItemTemplate>
                            Address ID:
                            <asp:Label ID="addressIdLabel1" runat="server" CssClass="form-control" Text='<%# Eval("addressId") %>' />
                            <br />
                            Address:
                            <asp:TextBox ID="addressTextBox" runat="server" CssClass="form-control" Text='<%# Bind("address") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-success btn-sm" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-info btn-sm" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            Address:
                            <asp:TextBox ID="addressTextBox" runat="server" CssClass="form-control" Text='<%# Bind("address") %>'/>
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Save" CssClass="btn btn-primary btn-sm" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-info btn-sm" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            Address ID:
                            <asp:Label ID="addressIdLabel" runat="server" CssClass="form-control" Text='<%# Eval("addressId") %>' />
                            <br />
                            Address:
                            <asp:Label ID="addressLabel" runat="server" CssClass="form-control" Text='<%# Bind("address") %>' />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-outline-success btn-sm" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-outline-danger btn-sm" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-outline-primary btn-sm" />
                        </ItemTemplate>
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    </asp:FormView>
                    <asp:SqlDataSource ID="dsOfficeAddress" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:OfficeAddressCon %>" DeleteCommand="DELETE FROM [OfficeAddress] WHERE [addressId] = @original_addressId AND [address] = @original_address" InsertCommand="INSERT INTO [OfficeAddress] ([address]) VALUES (@address)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [OfficeAddress]" UpdateCommand="UPDATE [OfficeAddress] SET [address] = @address WHERE [addressId] = @original_addressId AND [address] = @original_address">
                        <DeleteParameters>
                            <asp:Parameter Name="original_addressId" Type="Int32" />
                            <asp:Parameter Name="original_address" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="address" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="address" Type="String" />
                            <asp:Parameter Name="original_addressId" Type="Int32" />
                            <asp:Parameter Name="original_address" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
