using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWeb18.Ventas
{
    public partial class ImprimirPedidoConstruTelema : System.Web.UI.Page
    {
        public static DataTable xDT2 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql2 = " SELECT U_DataBase AS Tienda,U_PrinterCode as Impresora,U_Variable1 as Formato FROM [@RLPRINTER1] T0 where U_Variable1='PEDIDO' ";
            if (IsPostBack)
            {
                try
                {
                    DataTable xDT = new DataTable();
                    ASPxLabel1.Text = "";
                    if (numero.Text != "0" && Convert.ToInt32(numero.Text) <= 50)
                    {
                        string sql = " EXEC [dbo].[SBO_SP_PostTransactionNotificationRL] @object_type = N'PEDIDO', @DocEntry = N'PEDIDO' ";
                        for (int i = 0; i < Convert.ToInt32(numero.Text); i++)
                        {
                            xDT = MainClass.xGetFromSQL(string.Format(sql));
                        }
                        Response.Redirect("ImprimirPedidoConstruTelema.aspx");
                    }
                    else { ASPxLabel1.Text = "La cantidad introducida no esta permitida "; }

                }
                catch (Exception e2)
                {
                    ASPxLabel1.Text = " Error " + e2.ToString();
                }
                xDT2 = MainClass.xGetFromSQL(string.Format(sql2));
            }
            else
            {
                xDT2 = MainClass.xGetFromSQL(string.Format(sql2));
            }
            this.GridViewOrdCons.Visible = true;
            GridViewOrdCons.DataSource = xDT2;
            GridViewOrdCons.DataBind();
        }
    }
}