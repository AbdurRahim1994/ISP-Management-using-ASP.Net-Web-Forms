using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Project.Models
{
    public class ServiceArea
    {
        public int AreaId { get; set; }
        public string AreaName { get; set; }
        public int AddressId { get; set; }
    }
    public class ServiceAreaAccessLayer
    {
        public static List<ServiceArea> GetServiceAreas()
        {
            List<ServiceArea> serviceAreas = new List<ServiceArea>();
            using(SqlConnection con=new SqlConnection(GetConnection()))
            {
                string query = "SELECT * FROM tblServiceArea";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ServiceArea area = new ServiceArea();
                    area.AreaId = Convert.ToInt32(dr["areaId"].ToString());
                    area.AreaName = dr["areaName"].ToString();
                    area.AddressId = Convert.ToInt32(dr["addressId"].ToString());
                    serviceAreas.Add(area);
                }
                dr.Close();
            }
            return serviceAreas;
        }
        public static void InsertServiceArea(ServiceArea serviceArea)
        {
            using(SqlConnection con=new SqlConnection(GetConnection()))
            {
                string query = "INSERT INTO tblServiceArea VALUES(@Name, @AddressId)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", serviceArea.AreaName);
                cmd.Parameters.AddWithValue("@AddressId", serviceArea.AddressId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static void UpdateServiceArea(ServiceArea serviceArea)
        {
            using(SqlConnection con=new SqlConnection(GetConnection()))
            {
                string query = "UPDATE tblServiceArea SET areaName=@Name, addressId=@AddressId WHERE areaId=@ID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", serviceArea.AreaName);
                cmd.Parameters.AddWithValue("@AddressId", serviceArea.AddressId);
                cmd.Parameters.AddWithValue("@ID", serviceArea.AreaId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static void DeleteServiceArea(ServiceArea serviceArea)
        {
            using (SqlConnection con = new SqlConnection(GetConnection()))
            {
                string query = "DELETE FROM tblServiceArea WHERE areaId=@ID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ID", serviceArea.AreaId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static string GetConnection()
        {
            return ConfigurationManager.ConnectionStrings["ASPDB"].ConnectionString;
        }
    }
}