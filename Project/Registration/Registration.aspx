<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Project.Registration.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <link href="../css/pikaday.css" rel="stylesheet" />
    <link href="../css/site.css" rel="stylesheet" />
    <link href="../css/theme.css" rel="stylesheet" />
    <script src="../Scripts/moment.min.js"></script>
    <script src="../pikaday.js"></script>
    <style type="text/css">
        body{
            background-color:gray;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="jumbotron m-auto col-lg-7 bg-secondary">
            <div class="row">
                <div class="col-lg-5">
                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" Text="Name" ForeColor="Gray" CssClass="form-control rounded-pill" onfocus="ClearWaterMark('Name',this)" onblur="CreateWaterMark('Name',this)"></asp:TextBox>
                </div>
                <div class="col-lg-5">
                    <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" Text="Email" ForeColor="Gray" CssClass="form-control rounded-pill" onfocus="ClearWaterMark('Email',this)" onblur="CreateWaterMark('Email',this)"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Format" ControlToValidate="txtEmail" Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <div class="col-lg-5">
                    <asp:Label ID="Label3" runat="server" Text="Contact"></asp:Label>
                    <asp:TextBox ID="txtContact" runat="server" Text="Contact" ForeColor="Gray" CssClass="form-control rounded-pill" onfocus="ClearWaterMark('Contact',this)" onblur="CreateWaterMark('Contact',this)"></asp:TextBox>
                </div>
                <div class="col-lg-5">
                    <asp:Label ID="Label4" runat="server" Text="User Name"></asp:Label>
                    <asp:TextBox ID="txtUserName" runat="server" Text="User Name" ForeColor="Gray" CssClass="form-control rounded-pill" onfocus="ClearWaterMark('User Name',this)" onblur="CreateWaterMark('User Name',this)"></asp:TextBox>
                </div>
                <div class="col-lg-5">
                    <asp:Label ID="Label5" runat="server" Text="Date of Birth"></asp:Label>
                    <asp:TextBox ID="txtDOB" runat="server" Text="dd/mm/yyyy" ForeColor="Gray" CssClass="form-control rounded-pill" onfocus="ClearWaterMark('dd/mm/yyyy',this)" onblur="CreateWaterMark('dd/mm/yyyy',this)"></asp:TextBox>
                </div>
                
                <div class="col-lg-5">
                    <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" Text="Password" ForeColor="Gray" CssClass="form-control rounded-pill" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password is Required *" ControlToValidate="txtPassword" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="col-lg-5">
                    <asp:Label ID="Label7" runat="server" Text="Gender"></asp:Label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control rounded-pill">
                        <asp:ListItem Value="">-----Select-----</asp:ListItem>
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                    </asp:DropDownList>
                 </div>
                <div class="col-lg-5">
                    <asp:Label ID="Label8" runat="server" Text="Confirm Password"></asp:Label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" Text="Confirm Password" ForeColor="Gray" CssClass="form-control rounded-pill" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Confirm Password is Required *" ControlToValidate="txtConfirmPassword" Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password don't match *" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" Font-Bold="True" ForeColor="Red"></asp:CompareValidator>
                </div>
                <div>
                    <asp:Label ID="lblmsg" Font-Size="Small" runat="server" CssClass="container"></asp:Label>
                </div>
                <br />
                <div class="col-lg-10 mt-5">
                    <asp:Button ID="btnRegister" runat="server" Text="Registration" CssClass="btn btn-success font-weight-bolder d-flex justify-content-lg-end offset-5" Font-Size="Medium" Height="40px" Font-Bold="true" ForeColor="White" OnClick="btnRegister_Click"  />
                </div>
            </div>
        </div>
        <script type="text/javascript">
            var picker = new Pikaday(
        {
            field: document.getElementById('txtDOB'),
            firstDay: 1,
            minDate: new Date('1991-01-01'),
            maxDate: new Date('2022-12-31'),
            yearRange: [1991, 2022],
            numberOfMonths: 1,
            theme: 'dark-theme',
            format: 'MM - DD - YYYY',
            onSelect: function() {
            console.log(this.getMoment().format('MM- DD- YYYY'));
        }
            });

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
