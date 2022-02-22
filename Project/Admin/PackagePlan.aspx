<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="PackagePlan.aspx.cs" Inherits="Project.Admin.PackagePlan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="container">
        <div class="d-flex justify-content-end mb-2 mt-2">
        <a href="PackageEntry.aspx" class="btn btn-outline-primary" id="create"><i class="fa fa-plus-square-o"></i></a>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="objPackagePlan" GridLines="None" CssClass="table table-bordered table-hover table-sm">
        <Columns>
            <asp:BoundField DataField="planId" HeaderText="Plan ID" />
            <asp:BoundField DataField="planName" HeaderText="Plan Name" />
            <asp:BoundField DataField="speed" HeaderText="Speed" />
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:TemplateField HeaderText="Action" ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-outline-success"><i class="fa fa-pencil-square-o"></i></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-outline-info"><i class="fa fa-backward"></i></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-outline-success"><i class="fa fa-pencil-square"></i></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-outline-danger"><i class="fa fa-trash"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    </div>
    <asp:ObjectDataSource ID="objPackagePlan" runat="server" DeleteMethod="DeletePackagePlan" InsertMethod="InsertPackagePlan" SelectMethod="GetAllPlan" TypeName="Project.Models.PackagePlanAccessLayer" UpdateMethod="UpdatePackagePlan" DataObjectTypeName="Project.Models.PackagePlan">
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="speed" Type="String" />
            <asp:Parameter Name="price" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
