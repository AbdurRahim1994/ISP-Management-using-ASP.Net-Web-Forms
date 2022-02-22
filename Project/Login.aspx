<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style type="text/css">
        
    </style>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron mt-3">
                <div class="mr-auto">
                    <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
                </div>
                <div class="jumbotron col-lg-5 bg-dark ml-auto rounded" style="height:550px;">
                    <div class="form-group">
                        <i class="fa fa-user-circle-o text-white"> User Name</i>
                        <br />
                        <br />
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control rounded-pill bg-transparent" ForeColor="Gray" BorderStyle="Solid" BorderWidth="1px" Height="50px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User Name is Required *" ControlToValidate="txtUserName" Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock text-white"> Password</i>
                        <br />
                        <br />
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control rounded-pill bg-transparent" Font-Bold="true" ForeColor="Gray" BorderStyle="Solid" BorderWidth="1px" Height="50px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is Required *" ControlToValidate="txtPassword" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:Button ID="btnLogin" runat="server" Text="Log In" Font-Bold="true" CssClass="btn btn-primary text-center font-weight-bolder rounded-pill" ForeColor="White" Height="50px" Width="370px" Font-Size="X-Large" OnClick="btnLogin_Click" />
                    </div>
                    <div class="form-group text-center">
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="text-primary" Font-Size="Medium">Forgotten Password?</asp:LinkButton>
                    </div>
                    <hr />
                    <div class="form-group">
                        <asp:Button ID="btnRegistration" runat="server" Text="Create New Account" CssClass="btn btn-success font-weight-bolder offset-lg-3" ForeColor="White" Font-Bold="true" Font-Size="Medium" Height="40px" OnClick="btnRegistration_Click" />
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function ClearWaterMark(defaultText, TextBoxControl) {
                if (TextBoxControl.value == defaultText) {
                    TextBoxControl.style.color = "Black";
                    TextBoxControl.value = "";
                }
            }
            function CreateWaterMark(defaultText, TextBoxControl) {
                if (TextBoxControl.value.length == 0) {
                    TextBoxControl.style.color = "Gray";
                    TextBoxControl.value = defaultText;
                }
            }
        </script>
    </form>
</body>
</html>
