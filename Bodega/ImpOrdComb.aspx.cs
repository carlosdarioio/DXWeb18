using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWeb18.Bodega
{
    public partial class ImpOrdComb : System.Web.UI.Page
    {
        public static DataTable xDT2 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            //OCFM O OCTM

            if (IsPostBack)
            {
                try
                {
                    DataTable xDT = new DataTable();
                    if (numero.Text != "0" && Convert.ToInt32(numero.Text) <= 50)
                    {
                        string sql = " EXEC [dbo].[SBO_SP_PostTransactionNotificationRL] @object_type = N'{0}', @DocEntry = N'{1}' ";
                        for (int i = 0; i < Convert.ToInt32(numero.Text); i++)
                        {
                            xDT = MainClass.xGetFromSQL(string.Format(sql, Impresora.Items[Impresora.SelectedIndex].Value, Impresora.Items[Impresora.SelectedIndex].Value));
                        }
                        //Response.Redirect("ImpOrdComb.aspx");
                    }
                    else { ASPxLabel1.Text = "La cantidad introducida no esta permitida "; }
                }
                catch (Exception e2)
                {
                    ASPxLabel1.Text = " Error " + e2.ToString();
                }
            }
            //else { ELSE VA EL FORMULARIOS DIF COMO X EJEMPLO ZONAXDEP
            string sql2 = " SELECT U_DataBase AS Tienda,U_PrinterCode as Impresora,U_Variable1 as Formato FROM [@RLPRINTER1] T0 where U_Variable1='OCFM' or U_Variable1='OCTM' ";
            xDT2 = MainClass.xGetFromSQL(string.Format(sql2));
            this.GridViewOrdComb.Visible = true;
            GridViewOrdComb.DataSource = xDT2;
            GridViewOrdComb.DataBind();
            //}
        }

    }
}