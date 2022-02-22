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
    public partial class PackageEntry : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["ASPDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                string query = "INSERT INTO PackagePlan VALUES(@Name, @speed, @price)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@speed", txtSpeed.Text);
                cmd.Parameters.AddWithValue("@price", txtPrice.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("PackagePlan.aspx");
            }
        }
    }
}