using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace Project.Models
{
    public class ConnectionDB
    {
        public void con()
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\ASP.NET Practise File\ASP_Final_Project\Project\App_Data\ISPDB.mdf;Integrated Security=True");
        }
    }
}