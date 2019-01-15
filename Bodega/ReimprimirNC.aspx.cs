using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWeb18.Bodega
{
    public partial class ReimprimirNC : System.Web.UI.Page
    {
        public static DataTable xDT2 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            //CR_ORINPOS

            if (IsPostBack)
            {
                try
                {
                    string test = "", sql3 = "";
                    DataTable xDT = new DataTable();
                    if (numero.Text != "0")
                    {

                        if (tipo.Items[tipo.SelectedIndex].Value == "F")
                        {
                            sql3 = " SELECT DocNum FROM ORIN T0 WHERE T0.U_OINVDevDocNumDEI LIKE '%{0}' AND T0.DocDate='{1}' AND T0.CANCELED='N' ";
                            test = MainClass.xGetFromSQL(string.Format(sql3, numero.Text.ToString(), Fecha.Text.ToString())).Rows[0]["DocNum"].ToString();
                        }
                        else
                        {
                            test = numero.Text.ToString();
                        }
                        sql3 = test;
                        string sql = " EXEC [dbo].[RLReprint] @DocumentType = N'NC', @DocNum = N'{0}', @DocDate = N'{1}',@Ticket = N'Y' ";
                        xDT = MainClass.xGetFromSQL(string.Format(sql, test, Fecha.Text.ToString()));

                        // Response.Redirect("ReimprimirNC.aspx");
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
            string sql2 = " SELECT U_DataBase AS Tienda,U_DocEntry as Codigo, U_PrinterCode as Impresora FROM [@RLPRINTER1] T0 WITH (NOLOCK) WHERE U_ReportName ='CR_ORINPOS' ";
            xDT2 = MainClass.xGetFromSQL(string.Format(sql2));
            this.GridViewReimpNC.Visible = true;
            GridViewReimpNC.DataSource = xDT2;
            GridViewReimpNC.DataBind();



        }
    }
}