using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Project.Models
{
    public class Customer
    {
        public int CustomerId { get; set; }
        public string CustomerName { get; set; }
        public int Contact { get; set; }
        public string Email { get; set; }
        public int IPNumber { get; set; }
        public DateTime ConnectionStartDate { get; set; }
        public int PlanId { get; set; }
        public int ServiceAreaId { get; set; }
        public string Image { get; set; }
    }
    public class CustomerDataAccessLayer
    {
        public static List<Customer> GetCustomers()
        {
            List<Customer> customers = new List<Customer>();
            using(SqlConnection con=new SqlConnection(GetConnection()))
            {
                string query = "SELECT * FROM tblCustomer";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Customer c = new Customer();
                    c.CustomerId = (int)dr["customerId"];
                    c.CustomerName = dr["customerName"].ToString();
                    c.Contact = Convert.ToInt32(dr["contact"].ToString());
                    c.Email = dr["email"].ToString();
                    c.IPNumber = Convert.ToInt32(dr["IPNumber"].ToString());
                    c.ConnectionStartDate = (DateTime)dr["connectionStartDate"];
                    c.PlanId =(int) dr["planId"];
                    c.ServiceAreaId =(int) dr["serviceAreaId"];
                    c.Image = dr["image"].ToString();
                    customers.Add(c);
                }
                dr.Close();
            }
            return customers;
        }
        public static void InsertCustomer(Customer customer)
        {
            using(SqlConnection con=new SqlConnection(GetConnection()))
            {
                string query = "INSERT INTO tblCustomer VALUES(@Name, @Contact, @Email, @IP, @Connection, @PlanId, @ServiceArea, @image)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", customer.CustomerName);
                cmd.Parameters.AddWithValue("@Contact", customer.Contact);
                cmd.Parameters.AddWithValue("@Email", customer.Email);
                cmd.Parameters.AddWithValue("@IP", customer.IPNumber);
                cmd.Parameters.AddWithValue("@PlanId", customer.PlanId);
                cmd.Parameters.AddWithValue("@ServiceArea", customer.ServiceAreaId);
                cmd.Parameters.AddWithValue("@Connection", customer.ConnectionStartDate);
                cmd.Parameters.Add(new SqlParameter("@image", customer.Image));

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static void UpdateCustomer(Customer customer)
        {
            using (SqlConnection con = new SqlConnection(GetConnection()))
            {
                string query = "UPDATE tblCustomer SET customerName=@Name, contact=@Contact, email=@Email, IPNumber=@IP, connectionStartDate=@Connection, planId=@PlanId, serviceAreaId=@ServiceArea, image=@image WHERE customerId=@ID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ID", customer.CustomerId);
                cmd.Parameters.AddWithValue("@Name", customer.CustomerName);
                cmd.Parameters.AddWithValue("@Contact", customer.Contact);
                cmd.Parameters.AddWithValue("@Email", customer.Email);
                cmd.Parameters.AddWithValue("@IP", customer.IPNumber);
                cmd.Parameters.AddWithValue("@PlanId", customer.PlanId);
                cmd.Parameters.AddWithValue("@ServiceArea", customer.ServiceAreaId);
                cmd.Parameters.AddWithValue("@Connection", customer.ConnectionStartDate);
                cmd.Parameters.AddWithValue("@image", customer.Image);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public static void DeleteCustomer(Customer customer)
        {
            using (SqlConnection con = new SqlConnection(GetConnection()))
            {
                string query = "DELETE tblCustomer WHERE customerId=@ID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ID", customer.CustomerId);

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