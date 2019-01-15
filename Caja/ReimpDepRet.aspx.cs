using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWeb18.Caja
{
    public partial class ReimpDepRet : System.Web.UI.Page
    {
        public static string titulo;
        public static string g;
        public DataTable xDT = new DataTable();
        public static DataTable xDT2 = new DataTable();
        public static DataTable xDT3 = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {



            if (IsPostBack)
            {
                try
                {
                    string sql = "SELECT (SELECT CASE WHEN T1.DpsBank = 'RETIRO' then T1.DpsBank  else 'DEPOSITO' end)[Tipo], T0.BaseRef[NUM],T0.RefDate[FECHA],T0.LocTotal[TOTAL],T0.U_WebUserSign[USUARIO] from [OFM].[dbo].[OJDT] T0 INNER JOIN [OFM].[dbo].[ODPS] T1 ON T0.BaseRef=T1.DeposNum WHERE T0.U_Batch='{0}' AND T0.LocTotal>0 AND T1.DpsBank!='CIERRE TARJETA'";
                    xDT2 = MainClass.xGetFromSQL(string.Format(sql, numero.Text.ToString()));
                    //xDT2.Columns.Add("EstadoGuia", typeof(System.String));           

                    this.GridViewGuias.Visible = true;
                    GridViewGuias.DataSource = xDT2;
                    GridViewGuias.DataBind();

                }
                catch (Exception e2)
                {
                    //ASPxLabel1.Text = " Error " + e2.ToString();

                }
            }


            string sql2 = " SELECT U_DataBase AS Tienda,U_DocEntry as Codigo, U_PrinterCode as Impresora FROM [@RLPRINTER1] T0 WITH (NOLOCK) WHERE U_ReportName ='CR_RetirodeCaja' ";
            xDT3 = MainClass.xGetFromSQL(string.Format(sql2));
            this.GridViewDR.Visible = true;
            GridViewDR.DataSource = xDT3;
            GridViewDR.DataBind();

        }

        [WebMethod]
        public static string GetData(string Tipo, string Factura, string Fecha)
        {
            //2018 aqui ejecutarias el [RLReprint]
            /*
            EXEC    [oFM].[dbo].[RLReprint]		@DocumentType = N'{0}',		@DocNum = N'{1}',  		@DocDate = N'{2}',  		@Ticket = N'Y' select 'Listo'[r]
             */

            string sql = "EXEC    [oFM].[dbo].[RLReprint]		@DocumentType = N'{0}',		@DocNum = N'{1}',  		@DocDate = N'{2}',  		@Ticket = N'Y' select 'Listo'[r]";
            DataTable xDT = MainClass.xGetFromSQL(string.Format(sql, Tipo, Factura, Fecha));

            Dictionary<string, string> name = new Dictionary<string, string>();
            name.Add("1", "Listo");//
            name.Add("2", Factura);

            string myJsonString = (new JavaScriptSerializer()).Serialize(name);
            return myJsonString;

        }

        protected void BootstrapButton1_Click(object sender, EventArgs e)
        {

        }
    }
}