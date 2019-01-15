using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWeb18.Caja
{
    public partial class ReimprimirFactura : System.Web.UI.Page
    {
        public static DataTable xDT2 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            //CR_ORINPOS

            if (IsPostBack)
            {
                try
                {
                    string test = "";
                    DataTable xDT = new DataTable();
                    if (numero.Text != "0")
                    {

                        string sql = " EXEC [dbo].[RLReprint] @DocumentType = N'FACTURA', @DocNum = N'{0}', @DocDate = N'{1}',@Ticket = N'{2}' ";
                        xDT = MainClass.xGetFromSQL(string.Format(sql, numero.Text.ToString(), Fecha.Text.ToString(), tipo.Items[tipo.SelectedIndex].Value.ToString()));

                        // Response.Redirect("ReimprimirFactura.aspx");
                    }
                    else { ASPxLabel1.Text = " La numeracion introducida no esta permitida "; }
                }
                catch (Exception e2)
                {
                    ASPxLabel1.Text = " Error " + e2.ToString();

                }
            }

            Fecha.Text = DateTime.Now.ToString("yyyyMMdd");
            string sql2 = " SELECT U_DataBase AS Tienda,U_DocEntry as Codigo, U_PrinterCode as Impresora FROM [@RLPRINTER1] T0 WITH (NOLOCK) WHERE U_ReportName = 'CR_OINVPOS' OR U_ReportName = 'CR_OINVNOPOS' ";
            xDT2 = MainClass.xGetFromSQL(string.Format(sql2));
            this.GridViewReimpFac.Visible = true;
            GridViewReimpFac.DataSource = xDT2;
            GridViewReimpFac.DataBind();

            //this.ASPxGridView1.Visible = true;
            //ASPxGridView1.DataSource = xDT2;
            //ASPxGridView1.DataBind();
        }
    }
}