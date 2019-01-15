using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWeb18.Bodega
{
    public partial class ReimprimirEntrega : System.Web.UI.Page
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

                        if (tipo.Items[tipo.SelectedIndex].Value == "F")
                        {
                            //por aqui vas
                            sql3 = " SELECT * FROM ODLN T0 WHERE T0.DocDate='{0}' and T0.Comments like '%{1}%' and T0.CANCELED='N' ";
                            test = MainClass.xGetFromSQL(string.Format(sql3, Fecha.Text.ToString(), numero.Text.ToString())).Rows[0]["DocNum"].ToString();
                        }
                        else
                        {
                            test = numero.Text.ToString();
                        }
                        sql3 = test;
                        //contabilidad4
                        //por aqui vas falta probar
                        string sql = " EXEC [dbo].[RLReprint] @DocumentType = N'ENTREGA',	@DocNum = N'{0}',@DocDate = N'{1}',	@Ticket = N'N' ";
                        xDT = MainClass.xGetFromSQL(string.Format(sql, test, Fecha.Text.ToString()));

                        // Response.Redirect("ReimprimirEntrega.aspx");
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
            string sql2 = " SELECT U_DataBase AS Tienda,U_DocEntry as Codigo, U_PrinterCode as Impresora FROM [@RLPRINTER1] T0 WITH (NOLOCK) WHERE U_ReportName ='CR_ODLNNOPOS' ";
            xDT2 = MainClass.xGetFromSQL(string.Format(sql2));
            this.GridViewReimpEntre.Visible = true;
            GridViewReimpEntre.DataSource = xDT2;
            GridViewReimpEntre.DataBind();
        }
    }
}