using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Project.Admin
{
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            FileUpload fu = DetailsView1.FindControl("InsertPicutre") as FileUpload;
            if (fu.HasFiles)
            {
                if (fu.PostedFile.ContentLength > 0)
                {
                    string f = Guid.NewGuid() + Path.GetExtension(fu.PostedFile.FileName);
                    string fileName = Server.MapPath("~/Images/") + f;
                    fu.PostedFile.SaveAs(fileName);
                    e.Values["image"] = f;
                }
                else
                {
                    e.Cancel = false;
                }
            }
            else
            {
                e.Cancel = true;
            }
        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            FileUpload fu = DetailsView1.FindControl("UpdatePicture") as FileUpload;

            if (fu.HasFiles)
            {
                if (fu.PostedFile.ContentLength > 0)
                {
                    string f = Guid.NewGuid() + Path.GetExtension(fu.PostedFile.FileName);
                    string fileName = Server.MapPath("~/Images/") + f;
                    fu.PostedFile.SaveAs(fileName);
                    e.NewValues["image"] = f;
                }
                else
                {
                    e.NewValues["image"] = e.OldValues["image"];
                }
            }
            else
            {
                e.NewValues["image"] = e.OldValues["image"];
            }
        }

        
    }
}