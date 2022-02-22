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
    public partial class ServiceArea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    string CS = ConfigurationManager.ConnectionStrings["ASPDB"].ConnectionString;
            //    using(SqlConnection con=new SqlConnection(CS))
            //    {
            //        con.Open();
            //        var dropdown = (DropDownList)e.Row.FindControl("ddlOfficeAddress");
            //        string query = "SELECT address FROM OfficeAddress";
            //        SqlCommand cmd = new SqlCommand(query, con);
            //        SqlDataAdapter sda = new SqlDataAdapter(cmd);
            //        DataTable dt = new DataTable();
            //        sda.Fill(dt);
            //        con.Close();
            //        dropdown.DataSource = dt;
            //        dropdown.DataTextField = "address";
            //        dropdown.DataValueField = "address";
            //        dropdown.DataBind();
            //        dropdown.Items.Insert(0, new ListItem("----Select Area----", "0"));
            //    }
            //}
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["ASPDB"].ConnectionString;
            using(SqlConnection con=new SqlConnection(CS))
            {
                string query = "INSERT INTO tblServiceArea VALUES(@Name, @AddressId)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtAreaName.Text);
                cmd.Parameters.AddWithValue("@AddressId", ddlInsertOfficeAddress.SelectedValue);

                con.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("ServiceArea.aspx");
            }
        }
    }
}
