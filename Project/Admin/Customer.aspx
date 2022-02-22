<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="Project.Admin.Customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="container">
        <div class="modal fade" id="loginmodal" tabindex="-1"  data-keyboard="false" data-backdrop="static" role="dialog">
                            <div class="modal-dialog modal-sm" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Service Area Entry</h4>
                                        <button class="close" data-dismiss="modal" style="color:red;">&times;</button> 
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>Name</label>
                                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Contact</label>
                                            <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>IP Number</label>
                                            <asp:TextBox ID="txtIPNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Connection Start Date</label>
                                            <asp:TextBox ID="txtConnectionStartDate" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Plan ID</label>
                                            <asp:DropDownList ID="ddlPlanId" runat="server" DataTextField="planName" DataValueField="planId" DataSourceID="dsPlanId" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label>Service Area ID</label>
                                            <asp:DropDownList ID="ddlServiceAreaId" runat="server" DataTextField="areaName" DataValueField="areaId" DataSourceID="dsServiceAreaId" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label>Customer Image</label>
                                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                        <button type="button" class="btn btn-primary"data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="objCustomer">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Label ID="CustomerIdLabel" runat="server" Text='<%# Eval("CustomerId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Eval("CustomerName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ContactLabel" runat="server" Text='<%# Eval("Contact") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IPNumberLabel" runat="server" Text='<%# Eval("IPNumber") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ConnectionStartDateLabel" runat="server" Text='<%# Eval("ConnectionStartDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PlanIdLabel" runat="server" Text='<%# Eval("PlanId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ServiceAreaIdLabel" runat="server" Text='<%# Eval("ServiceAreaId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ImageLabel" runat="server" Text='<%# Eval("Image") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="CustomerIdTextBox" runat="server" Text='<%# Bind("CustomerId") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CustomerNameTextBox" runat="server" Text='<%# Bind("CustomerName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ContactTextBox" runat="server" Text='<%# Bind("Contact") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="IPNumberTextBox" runat="server" Text='<%# Bind("IPNumber") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ConnectionStartDateTextBox" runat="server" Text='<%# Bind("ConnectionStartDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PlanIdTextBox" runat="server" Text='<%# Bind("PlanId") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ServiceAreaIdTextBox" runat="server" Text='<%# Bind("ServiceAreaId") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ImageTextBox" runat="server" Text='<%# Bind("Image") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="CustomerIdTextBox" runat="server" Text='<%# Bind("CustomerId") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CustomerNameTextBox" runat="server" Text='<%# Bind("CustomerName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ContactTextBox" runat="server" Text='<%# Bind("Contact") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="IPNumberTextBox" runat="server" Text='<%# Bind("IPNumber") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ConnectionStartDateTextBox" runat="server" Text='<%# Bind("ConnectionStartDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PlanIdTextBox" runat="server" Text='<%# Bind("PlanId") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ServiceAreaIdTextBox" runat="server" Text='<%# Bind("ServiceAreaId") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ImageTextBox" runat="server" Text='<%# Bind("Image") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Label ID="CustomerIdLabel" runat="server" Text='<%# Eval("CustomerId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Eval("CustomerName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ContactLabel" runat="server" Text='<%# Eval("Contact") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IPNumberLabel" runat="server" Text='<%# Eval("IPNumber") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ConnectionStartDateLabel" runat="server" Text='<%# Eval("ConnectionStartDate","{0:yyyy-MM-dd}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PlanIdLabel" runat="server" Text='<%# Eval("PlanId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ServiceAreaIdLabel" runat="server" Text='<%# Eval("ServiceAreaId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ImageLabel" runat="server" Text='<%# Eval("Image") %>' />
                    </td>
                    <td>
                        <button type="button" class="btn btn-outline-primary mt-3 btn-sm" data-target="#loginmodal" data-toggle="modal">Add</button>
                        <br />
                        <a href="#" class="btn btn-outline-success btn-sm">Edit</a>
                        <br />
                        <a href="#" class="btn btn-outline-danger btn-sm">Delete</a>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;" class="table table-bordered table-hover table-dark table-sm mt-5">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">ID</th>
                                    <th runat="server">Name</th>
                                    <th runat="server">Contact</th>
                                    <th runat="server">Email</th>
                                    <th runat="server">IP Number</th>
                                    <th runat="server">Connection Start Date</th>
                                    <th runat="server">Plan Id</th>
                                    <th runat="server">Area Id</th>
                                    <th runat="server">Image</th>
                                    <th class="text-center">Action</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="CustomerIdLabel" runat="server" Text='<%# Eval("CustomerId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Eval("CustomerName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ContactLabel" runat="server" Text='<%# Eval("Contact") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IPNumberLabel" runat="server" Text='<%# Eval("IPNumber") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ConnectionStartDateLabel" runat="server" Text='<%# Eval("ConnectionStartDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PlanIdLabel" runat="server" Text='<%# Eval("PlanId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ServiceAreaIdLabel" runat="server" Text='<%# Eval("ServiceAreaId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ImageLabel" runat="server" Text='<%# Eval("Image") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="objCustomer" runat="server" SelectMethod="GetCustomers" TypeName="Project.Models.CustomerDataAccessLayer" DataObjectTypeName="Project.Models.Customer" DeleteMethod="DeleteCustomer" InsertMethod="InsertCustomer" UpdateMethod="UpdateCustomer"></asp:ObjectDataSource>
        <asp:SqlDataSource ID="dsPlanId" runat="server" ConnectionString="<%$ ConnectionStrings:OfficeAddressCon %>" SelectCommand="SELECT * FROM [PackagePlan]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsServiceAreaId" runat="server" ConnectionString="<%$ ConnectionStrings:OfficeAddressCon %>" SelectCommand="SELECT * FROM [tblServiceArea]"></asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
    <script src="../Scripts/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("input[name$='txtConnectionStartDate']").datepicker({ format: "yyyy-mm-dd" });
        })
    </script>
</asp:Content>
