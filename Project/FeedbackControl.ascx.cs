using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class FeedbackControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage message = new MailMessage(from.Text, to.Text, subject.Text, body.Text);
                if (upload.HasFile)
                {
                    HttpFileCollection fc = Request.Files;
                    for (int i = 0; i <= fc.Count - 1; i++)
                    {
                        HttpPostedFile pf = fc[i];
                        Attachment attach = new Attachment(pf.InputStream, pf.FileName);
                        message.Attachments.Add(attach);
                    }
                }
                SmtpClient client = new SmtpClient("mail.mahmudsabuj.com", 587);
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential("smtp@mahmudsabuj.com", "M05))y$hL[A1");
                client.Send(message);
                status.Text = "message was sent successfully";
            }
            catch (Exception ex)
            {
                status.Text = ex.StackTrace;
            }
        }
    }
}