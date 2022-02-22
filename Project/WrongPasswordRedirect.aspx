<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WrongPasswordRedirect.aspx.cs" Inherits="Project.WrongPasswordRedirect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Password Redirect</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron col-lg-8 mt-3 ml-5">
                <div class="jumbotron col-lg-8 bg-white m-auto rounded">
                    <div class="form-group">
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control rounded" ForeColor="Gray" BorderStyle="Solid" BorderWidth="2px" Height="50px" Text="User Name" onfocus="ClearWaterMark('User Name',this)" onblur="CreateWaterMark('User Name',this)"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control rounded" Text="Password" ForeColor="Gray" BorderStyle="Solid" BorderWidth="2px" Height="50px" onfocus="ClearWaterMark('Password',this)" onblur="CreateWaterMark('Password',this)"></asp:TextBox>
                        <asp:Label ID="lblmsg" runat="server" Text="You have entered wrong User Name and/or Password" ForeColor="Red"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnLogin" runat="server" Text="Log In" Font-Bold="true" CssClass="btn btn-primary text-center font-weight-bolder rounded" ForeColor="White" Height="50px" Width="385px" Font-Size="X-Large" OnClick="btnLogin_Click" />
                    </div>
                    <div class="form-group text-center">
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="text-primary" Font-Size="Medium">Forgotten Password?</asp:LinkButton>
                    </div>
                    <hr />
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
