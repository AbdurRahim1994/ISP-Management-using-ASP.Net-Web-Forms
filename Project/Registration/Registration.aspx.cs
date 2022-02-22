using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace Project.Registration
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string CS = ConfigurationManager.ConnectionStrings["ISPDB"].ConnectionString;
                using(SqlConnection con=new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("spRegisterUser", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    string EncryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");

                    cmd.Parameters.AddWithValue("@name", txtName.Text);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@contact", txtContact.Text);
                    cmd.Parameters.AddWithValue("@dateOfBirth", txtDOB.Text);
                    cmd.Parameters.AddWithValue("@userName", txtUserName.Text);
                    cmd.Parameters.AddWithValue("@password", EncryptedPassword);
                    cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);

                    con.Open();
                    int ReturnCode = (int)cmd.ExecuteScalar();
                    if (ReturnCode == -1)
                    {
                        lblmsg.Text = "User Name already in use, please choose another user name";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        Response.Redirect("~/Login.aspx");
                    }
                }
            }
        }
    }
}