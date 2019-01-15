using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWeb18.Ventas
{
    public partial class ReimprContEntrega : System.Web.UI.Page
    {
        public static DataTable xDT2 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                try
                {
                    DataTable xDT = new DataTable();
                    if (numero.Text != "")
                    {
                        string sql = " DECLARE @DocNumm as nvarchar(20)=(SELECT MAX(T1.DocEntry) FROM RDR1 T1 WHERE T1.TrgetEntry=(SELECT MAX(T0.DocEntry) FROM OINV T0 WHERE T0.DocNum LIKE '%{0}')) EXEC	[dbo].[SBO_SP_PostTransactionNotificationRL] @object_type = N'17', @DocEntry = @DocNumm ";
                        xDT = MainClass.xGetFromSQL(string.Format(sql, numero.Text));
                        //Response.Redirect("ReimprContEntrega.aspx");
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

            }
            string sql2 = " SELECT U_DocEntry as Numero, U_PrinterCode as Impresora, U_ReportName as Nombre FROM [@RLPRINTER1] WITH(NOLOCK) where U_ReportName like '%ContraEnt' ";
            this.GridViewReimpContEnt.Visible = true;
            xDT2 = MainClass.xGetFromSQL(string.Format(sql2));
            GridViewReimpContEnt.DataSource = xDT2;
            GridViewReimpContEnt.DataBind();
        }
    }
}