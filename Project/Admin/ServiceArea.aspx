<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ServiceArea.aspx.cs" Inherits="Project.Admin.ServiceArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="container">
       <div class="d-flex justify-content-end">
          <div class="container">
            <div class="d-flex justify-content-end">
                <button type="button" class="btn btn-primary mt-3" data-target="#loginmodal" data-toggle="modal">Add New</button>
            </div>
            <div class="modal fade" id="loginmodal" tabindex="-1"  data-keyboard="false" data-backdrop="static" role="dialog">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Service Area Entry</h4>
                            <button class="close" data-dismiss="modal" style="color:red;">&times;</button> 
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Area Name</label>
                                <asp:TextBox ID="txtAreaName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Adddress</label>
                                <asp:DropDownList ID="ddlInsertOfficeAddress" runat="server" CssClass="form-control" DataTextField="address" DataValueField="addressId" DataSourceID="dsOfficeAddress"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                            <button type="button" class="btn btn-primary"data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       </div>
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-dark mt-3" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="objServiceArea">
        <Columns>
            <asp:TemplateField HeaderText="Area ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("areaId") %>' CssClass="form-control" Enabled="false"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("areaId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Area Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("areaName") %>' CssClass="form-control"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("areaName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address ID">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlOfficeAddress" runat="server" DataTextField="address" DataValueField="addressId" DataSourceID="dsOfficeAddress" CssClass="form-control"></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("addressId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action" ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-outline-success"><i class="fa fa-pencil-square-o"></i></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-outline-secondary"><i class="fa fa-backward"></i></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-outline-success"><i class="fa fa-edit"></i></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-outline-danger"><i class="fa fa-trash-o"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </div>
    <asp:ObjectDataSource ID="objServiceArea" runat="server" DataObjectTypeName="Project.Models.ServiceArea" DeleteMethod="DeleteServiceArea" InsertMethod="InsertServiceArea" SelectMethod="GetServiceAreas" TypeName="Project.Models.ServiceAreaAccessLayer" UpdateMethod="UpdateServiceArea"></asp:ObjectDataSource>
    <asp:SqlDataSource ID="dsOfficeAddress" runat="server" ConnectionString="<%$ ConnectionStrings:OfficeAddressCon %>" SelectCommand="SELECT * FROM [OfficeAddress]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
