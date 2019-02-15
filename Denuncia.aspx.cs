using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
public class Mail
{
    public string Nombre { get; set; }
    public string Fecha { get; set; }
    public string Descripcion { get; set; }

    public string File { get; set; }

}
public partial class Denuncia : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack)
        {/*
            MailMessage mail2 = new MailMessage();
            mail2.From = new System.Net.Mail.MailAddress("comunicacioninternaanm@gmail.com");

            // The important part -- configuring the SMTP client
            SmtpClient smtp = new SmtpClient();
            smtp.Port = 587;   // [1] You can try with 465 also, I always used 587 and got success
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network; // [2] Added this
            smtp.UseDefaultCredentials = false; // [3] Changed this
            smtp.Credentials = new NetworkCredential("comunicacioninternaanm@gmail.com", "Femosa01");  // [4] Added this. Note, first parameter is NOT string.
            smtp.Host = "smtp.gmail.com";

            //recipient address
            mail2.Bcc.Add(new MailAddress("comunicacioninternaanm@gmail.com"));
            mail2.To.Add(new MailAddress("Michelle@acefemosa.com"));
            mail2.Subject = "Solicitud de Denuncia";
            //Formatted mail body -->Nombre, Ubicacion, Telefono, Descripcion
            mail2.IsBodyHtml = true;
            string st = "Por medio de la presente se efectua una solicitud sobre denuncia. <br> ";            
            st += " Nombre: " + Nombre.Text+"<br>";
            st += " Ubicacion: " + Ubicacion.Text + "<br>";
            st += " Telefono: " + Telefono.Text + "<br>";
            st += " Descripcion: " + Descripcion.Text + "<br>";

            if (Filed.HasFile)
            {
                string fileName = Path.GetFileName(Filed.PostedFile.FileName);
                mail2.Attachments.Add(new Attachment(Filed.PostedFile.InputStream, fileName));
            }

            mail2.Body = st;
            smtp.Send(mail2);

            txts.Text = "Sus datos han sido enviados, Ya puede Cerrar Esta Pagina.";
            */
        
        }
    }

    //---------
    protected void bttn_Send_Click(object sender, EventArgs e)
    {

        //EXTERNO
        /*string from = "comunicacioninternaanm@gmail.com";
        string textTo = "Michelle@acefemosa.com";*/

        //interno
        string from = "denuncia@acefemosa.intra";
        string textTo = "MICHELLE@ACEFEMOSA.ADMON";
        
        using (MailMessage mail = new MailMessage(from, textTo))
        {

            mail.Bcc.Add(new MailAddress("cflores@acefemosa.info"));
            mail.Subject = "Solicitud de Denuncia";

            

            //----
            string st = "Por medio de la presente se efectua una solicitud sobre denuncia. <br> ";
            st += " Nombre: " + Nombre.Text + "<br>";
            st += " Ubicacion: " + Ubicacion.Text + "<br>";
            st += " Telefono: " + Telefono.Text + "<br>";
            st += " Descripcion: " + Descripcion.Text + "<br>";            
            //----
            mail.Body = st;

            if (fileUploader.HasFile)
            {
                string fileName = Path.GetFileName(fileUploader.PostedFile.FileName);
                mail.Attachments.Add(new Attachment(fileUploader.PostedFile.InputStream, fileName));
            }
            mail.IsBodyHtml = true;
            //
            //
            SmtpClient smtp = new SmtpClient();
            //smtp.Host = "smtp.gmail.com";
            smtp.Host = "10.1.201.4";
            //smtp.EnableSsl = true;
            smtp.EnableSsl = false;
            NetworkCredential networkCredential = new NetworkCredential(from, "4321");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = networkCredential;
            //smtp.Port = 587; //externo
            smtp.Port = 25; //interno
            smtp.Send(mail);

            

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Su Denuncia se envio correctamente.');", true);
            Nombre.Text = "";
            Ubicacion.Text = "";
            Telefono.Text = "";
            Descripcion.Text = "";
        }
    }

    //----------

}
 
 