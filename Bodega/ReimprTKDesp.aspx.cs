using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWeb18.Bodega
{
    public partial class ReimprTKDesp : System.Web.UI.Page
    {
        public static DataTable xDT2 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql2 = " SELECT U_DataBase as Tienda, U_DocEntry as Numero, U_PrinterCode as Impresora FROM [@RLPRINTER1] T0 WITH (NOLOCK) where U_PrinterCode like '%TICKET' ";
            //por aqui vas llenando  el selecr para seleccionar impresora
            //Select1.Items[Select1.SelectedIndex].Value
            if (IsPostBack)
            {
                try
                {
                    DataTable xDT = new DataTable();
                    if (numero.Text != "")
                    {
                        string sql = " declare @entr as varchar(30) Set @entr = (select DocEntry from OINV t0 where t0.DocNum like '%{0}%') EXEC	[SBO-COMMON].[dbo].[RLSetPrinterQueue] @DataBase = N'oFM',@Entry = @entr,@RPTName = N'CR_OINVPOS',@RPTDataBase = N'oFM',@PrinterCode = '{1}' ";
                        xDT = MainClass.xGetFromSQL(string.Format(sql, numero.Text, impresora.Items[impresora.SelectedIndex].Value));
                        Response.Redirect("ReimprTKDesp.aspx");
                    }
                    ASPxLabel1.Text = "";
                }
                catch (Exception e2)
                {
                    ASPxLabel1.Text = " Error " + e2.ToString();
                }
            }
            else
            {
                xDT2 = MainClass.xGetFromSQL(string.Format(sql2));
            }
            this.GridViewTKDesp.Visible = true;
            GridViewTKDesp.DataSource = xDT2;
            GridViewTKDesp.DataBind();
        }
    }
}