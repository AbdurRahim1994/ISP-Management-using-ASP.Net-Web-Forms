﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Project
{
    public partial class WrongPasswordRedirect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (FormsAuthentication.Authenticate(txtUserName.Text, txtPassword.Text))
            {
                FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, true);
            }
            else
            {
                lblmsg.Text = "You have entered wrong User Name and/or Password";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Font.Bold = true;
            }
        }
    }
}