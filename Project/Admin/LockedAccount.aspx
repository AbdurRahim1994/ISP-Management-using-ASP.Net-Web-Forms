<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LockedAccount.aspx.cs" Inherits="Project.Admin.LockedAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Locked Account</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron mt-3">
                <div class="row">
                    <div class="col-lg-12">
                        <asp:GridView ID="grdLockedAccount" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" OnRowCommand="grdLockedAccount_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="userName" HeaderText="User Name" />
                                <asp:BoundField DataField="email" HeaderText="Email" />
                                <asp:BoundField DataField="contact" HeaderText="Contact" />
                                <asp:BoundField DataField="lockedDateTime" HeaderText="Locked Date &amp; Time" />
                                <asp:BoundField DataField="HoursElapsed" HeaderText="Hours Elapsed" />
                                <asp:TemplateField HeaderText="Enable">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEnable" runat="server" Enabled='<%# Convert.ToInt32(Eval("HoursElapsed")) > 24 %>' Text="Enable" CssClass="btn btn-primary" CommandArgument='<%# Eval("userName") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div>
                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
