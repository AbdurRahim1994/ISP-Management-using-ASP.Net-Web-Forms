<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackageEntry.aspx.cs" Inherits="Project.Admin.PackageEntry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Package Entry</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron col-lg-8 m-auto">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <div>
                                <asp:Label ID="Label1" runat="server" Text="Plan Name"></asp:Label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div>
                                <asp:Label ID="Label2" runat="server" Text="Speed"></asp:Label>
                                <asp:TextBox ID="txtSpeed" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div>
                                <asp:Label ID="Label3" runat="server" Text="Price"></asp:Label>
                                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div>
                                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-outline-success mt-3" OnClick="btnSave_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </form>
    <script src="../Scripts/bootstrap.js"></script>
</body>
</html>
