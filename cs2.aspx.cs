using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cs2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //---------
    protected void bttn_Send_Click(object sender, EventArgs e)
    {
        string from = "comunicacioninternaanm@gmail.com";
        string textTo = "comunicacioninternaanm@gmail.com";
        using (MailMessage mail = new MailMessage(from, textTo))
        {

            mail.Subject = "test";

            mail.Body = string.Format(@"Name: {0} ", txtName.Text);

            if (fileUploader.HasFile)
            {
                string fileName = Path.GetFileName(fileUploader.PostedFile.FileName);
                mail.Attachments.Add(new Attachment(fileUploader.PostedFile.InputStream, fileName));
            }
            mail.IsBodyHtml = true;
            //
            //
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential networkCredential = new NetworkCredential(from, "Femosa01");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = networkCredential;
            smtp.Port = 587;
            smtp.Send(mail);
           // ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Message has been sent successfully.');", true);
        }
    }

    //----------
    //***************************************
       
           
    //*****************************************
}