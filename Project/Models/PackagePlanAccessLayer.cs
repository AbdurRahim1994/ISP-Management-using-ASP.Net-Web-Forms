using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Project.Models;

namespace Project.Models
{
    public class PackagePlan
    {
        public int planId { get; set; }
        public string planName  { get; set; }
        public string speed { get; set; }
        public string price { get; set; }
    }
    public class PackagePlanAccessLayer
    {
        public DataTable GetAllPlan()
        {
            string CS = ConfigurationManager.ConnectionStrings["ASPDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                string query = "SELECT * FROM PackagePlan";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                return dt;
            }
        }
        public int InsertPackagePlan(string name, string speed, string price)
        {
            string CS = ConfigurationManager.ConnectionStrings["ASPDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                string query = "INSERT INTO PackagePlan VALUES(@Name, @speed, @price)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@speed", speed);
                cmd.Parameters.AddWithValue("@price", price);

                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }
        public static void UpdatePackagePlan(PackagePlan package)
        {
            string CS = ConfigurationManager.ConnectionStrings["ASPDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                string query = "UPDATE PackagePlan SET planName=@Name, speed=@speed, price=@price WHERE planId=@Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Id", package.planId);
                cmd.Parameters.AddWithValue("@Name", package.planName);
                cmd.Parameters.AddWithValue("@speed", package.speed);
                cmd.Parameters.AddWithValue("@price", package.price);

                con.Open();
                cmd.ExecuteNonQuery();
                
            }
        }
        public static void DeletePackagePlan(PackagePlan package)
        {
            string CS = ConfigurationManager.ConnectionStrings["ASPDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                string query = "DELETE FROM PackagePlan WHERE planId=@Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Id", package.planId);

                con.Open();
                cmd.ExecuteNonQuery();
                
            }
        }
    }
}