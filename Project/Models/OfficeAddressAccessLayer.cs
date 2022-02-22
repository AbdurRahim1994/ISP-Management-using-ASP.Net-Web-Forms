using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Project.Models
{
    public class OfficeAddressAccessLayer
    {
        public DataTable GetAllAddress()
        {
            string CS = ConfigurationManager.ConnectionStrings["ASPDB"].ConnectionString;
            using(SqlConnection con=new SqlConnection(CS))
            {
                string query = "SELECT * FROM OfficeAddress";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                return dt;
            }
        }
        public int InsertOfficeAddress(string address)
        {
            string CS = ConfigurationManager.ConnectionStrings["ASPDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                string query = "INSERT INTO OfficeAddress VALUES('" + address + "')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }
        public int UpdateOfficeAddress(int addressId, string address)
        {
            string CS = ConfigurationManager.ConnectionStrings["ASPDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                string query = "UPDATE OfficeAddress SET address='" + address + "' WHERE addressId='" + addressId + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }
        public int DeleteOfficeAddress(int addressId)
        {
            string CS = ConfigurationManager.ConnectionStrings["ASPDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                string query = "DELETE OfficeAddress WHERE addressId='" + addressId + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                return addressId;
            }
        }
    }
}