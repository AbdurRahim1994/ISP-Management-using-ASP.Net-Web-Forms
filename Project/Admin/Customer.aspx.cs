using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Project.Admin
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["ASPDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                if (FileUpload1.HasFile)
                {
                    string fileExtension = Path.GetExtension(FileUpload1.FileName);

                    if (fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".jpeg")
                    {
                        int fileSize = FileUpload1.PostedFile.ContentLength;

                        if (fileSize > 10240 && fileSize < 53248)
                        {
                            FileUpload1.SaveAs(Server.MapPath("~/Images/" + FileUpload1.FileName));
                            //PicImage.ImageUrl = "~/ImageUpload/" + FileUpload1.FileName;

                            Stream stream = FileUpload1.PostedFile.InputStream;
                            BinaryReader binaryReader = new BinaryReader(stream);
                            byte[] img = binaryReader.ReadBytes((int)stream.Length);

                            string query = "INSERT INTO tblCustomer VALUES(@Name, @Contact, @Email, @IP, @Connection, @PlanId, @ServiceArea, @image)";
                            SqlCommand cmd = new SqlCommand(query, con);
                            cmd.Parameters.AddWithValue("@Name", txtName.Text);
                            cmd.Parameters.AddWithValue("@Contact", txtContact.Text);
                            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                            cmd.Parameters.AddWithValue("@IP", txtIPNumber.Text);
                            cmd.Parameters.AddWithValue("@PlanId", ddlPlanId.SelectedValue);
                            cmd.Parameters.AddWithValue("@ServiceArea", ddlServiceAreaId.SelectedValue);
                            cmd.Parameters.AddWithValue("@Connection", txtConnectionStartDate.Text);
                            cmd.Parameters.Add(new SqlParameter("@image", img));

                            con.Open();
                            cmd.ExecuteNonQuery();
                            
                        }
                        else
                        {
                            Response.Write("<script>alert(Maximum file size should be between 10 KB and 25 KB);</script>");
                        }

                    }
                    else
                    {
                        Response.Write("<script>alert(Only png, jpg, jpeg files can be uploaded);</script>");
                    }

                }
                else
                {
                    Response.Write("<script>alert(Please Select a Picture);</script>");
                }

            }
        }
        public string GetConnection()
        {
            return ConfigurationManager.ConnectionStrings["ASPDB"].ConnectionString;
        }
    }
}