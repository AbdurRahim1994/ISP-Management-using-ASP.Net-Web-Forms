using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Project.Admin
{
    public partial class LockedAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (User.Identity.Name.ToLower() == "adnandu2014@gmail.com")
                {
                    GetData();
                }
                else
                {
                    Response.Redirect("Member/MemberPanel.aspx");
                    

                }
            }
        }
        private void GetData()
        {
            string CS = ConfigurationManager.ConnectionStrings["ISPDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spGetAllLocakedUserAccounts", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                grdLockedAccount.DataSource = cmd.ExecuteReader();
                grdLockedAccount.DataBind();
            }
        }
        private void EnableUserAccount(string UserName)
        {
            string CS = ConfigurationManager.ConnectionStrings["ISPDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spEnableUserAccount", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramUserName = new SqlParameter()
                {
                    ParameterName = "@userName",
                    Value = UserName
                };

                cmd.Parameters.Add(paramUserName);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void grdLockedAccount_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            EnableUserAccount(e.CommandArgument.ToString());
            GetData();
        }
    }
}