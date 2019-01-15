using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWeb18.Bodega
{
    public partial class ReimpDev : System.Web.UI.Page
    {
        public static DataTable xDT2 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            //inputDate.Value = DateTime.Now.ToString("MM/dd/yyyy hh:mm tt");

            //CR_ODLNNOPOS

            if (IsPostBack)
            {
                try
                {
                    string test = "", sql3 = "";
                    DataTable xDT = new DataTable();
                    if (numero.Text != "0")
                    {

                        if (Formato.Items[Formato.SelectedIndex].Value.ToString() == "F")
                        {
                            sql3 = " SELECT DocNum FROM ORDN T0 WHERE T0.U_OINVDevDocNumDEI LIKE '%{0}' AND T0.DocDate='{1}' AND T0.CANCELED='N' ";
                            test = MainClass.xGetFromSQL(string.Format(sql3, numero.Text.ToString(), Fecha.Text.ToString())).Rows[0]["DocNum"].ToString();
                        }
                        else
                        {
                            test = numero.Text.ToString();
                        }
                        sql3 = test;
                        string sql = " EXEC [dbo].[RLReprint] @DocumentType = N'DEVOLUCION', @DocNum = N'{0}', @DocDate = N'{1}',@Ticket = N'N' ";
                        xDT = MainClass.xGetFromSQL(string.Format(sql, test, Fecha.Text.ToString()));

                        // Response.Redirect("ReimpDev.aspx");
                    }
                    else { ASPxLabel1.Text = " La numeracion introducida no esta permitida "; }
                }
                catch (Exception e2)
                {
                    ASPxLabel1.Text = " Error " + e2.ToString();

                }
            }
            else
            {


                Fecha.Text = DateTime.Now.ToString("yyyyMMdd");
            }
            string sql2 = " SELECT U_DataBase AS Tienda,U_DocEntry as Codigo, U_PrinterCode as Impresora FROM [@RLPRINTER1] T0 WITH (NOLOCK) WHERE U_ReportName ='CR_ORDNNOPOS' ";
            xDT2 = MainClass.xGetFromSQL(string.Format(sql2));
            this.BootstrapGridView1.Visible = true;
            BootstrapGridView1.DataSource = xDT2;
            BootstrapGridView1.DataBind();
        }
    }
}