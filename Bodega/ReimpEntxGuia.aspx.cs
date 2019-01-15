using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWeb18.Bodega
{
    public partial class ReimpEntxGuia : System.Web.UI.Page
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
                    string sql = "SELECT T2.U_DocNum as Guia, T0.DocEntry,T0.DocNum as Entrega,T2.U_CamionID as Camion,T0.CardCode[Codigo],T0.CardCode+' '+T0.CardName[Cliente],CONVERT(VARCHAR(10), T0.DocDate, 112)[Fecha],T0.U_WebUserSign[Usuario],(SELECT U_Print2 FROM OUSR WHERE USER_CODE=T0.U_WebUserSign)[Impresora]FROM ODLN T0 INNER JOIN [@RLOWTRGUIA1] T1 ON T0.DocEntry=T1.U_DocEntry INNER JOIN [@RLOWTRGUIA] T2 ON T1.Code=T2.Code WHERE T2.U_DocNum = {0} AND T1.U_ObjType=15";
                    xDT2 = MainClass.xGetFromSQL(string.Format(sql, numero.Text.ToString()));

                    this.GridViewEntGuias.Visible = true;
                    GridViewEntGuias.DataSource = xDT2;
                    GridViewEntGuias.DataBind();

                }
                catch (Exception e2)
                {
                    //ASPxLabel1.Text = " Error " + e2.ToString();

                }
            }


            string sql2 = " SELECT U_DataBase AS Tienda,U_DocEntry as Codigo, U_PrinterCode as Impresora FROM [@RLPRINTER1] T0 WITH (NOLOCK) WHERE U_ReportName ='CR_ODLNNOPOS' ";
            xDT3 = MainClass.xGetFromSQL(string.Format(sql2));
            this.GridViewDR.Visible = true;
            GridViewDR.DataSource = xDT3;
            GridViewDR.DataBind();

        }

        [WebMethod]
        public static string GetData(string Entrega, string Fecha, string Impresora)
        {
            //2018 aqui ejecutarias el [RLReprint]
            /*
            EXEC [dbo].[RLReprint] @DocumentType = N'ENTREGA', @DocNum = N'{0}', @DocDate = N'{1}', @Ticket = N'N'
             */

            string sql = "EXEC    [oFM].[dbo].[RLReprint]		@DocumentType = N'ENTREGA',		@DocNum = N'{0}', @DocDate = N'{1}', @Ticket = N'Y' ";
            DataTable xDT = MainClass.xGetFromSQL(string.Format(sql, Entrega, Fecha));

            Dictionary<string, string> name = new Dictionary<string, string>();
            name.Add("1", "Listo");//
            name.Add("2", Entrega);

            string myJsonString = (new JavaScriptSerializer()).Serialize(name);
            return myJsonString;

        }

        protected void BootstrapButton1_Click(object sender, EventArgs e)
        {

        }
    }
}