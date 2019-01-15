using DevExpress.Export;
using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWeb18.Rpt.Fora
{
    public partial class VtaXRutXCl : System.Web.UI.Page
    {
        public DataTable xDT = new DataTable();
        public DataTable xDT2 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            string user = "";
            try
            {
                user = HttpContext.Current.Request.Url.Query.Split('=')[1].ToString();
            }
            catch (Exception e2)
            {
                error.Text = "Error de usuario ";
            }
            PivotGridViewXX.OptionsPager.Visible = false;
            //solo faltaria cargar sucursales
            /*
             WHEN Code =  'RPTTIENDASFEMOSA' THEN 'TIENDAS FEMOSA'
                 WHEN Code = 'RPTTIENDASSTJACKS' THEN 'TIENDAS STJACKS'     
				 WHEN Code = 'RPTMAYOREOTEXTIL' THEN 'MAYOREO TEXTIL'
                 
             */
            xDT2 = MainClass.xGetFromSQL(string.Format(@"
            select 
             CASE 
                 WHEN Code = 'RPTMAYOREOFORANEO' THEN 'MAYOREO FORANEO'     
                 WHEN Code = '*' THEN '*'     
                 ELSE 'Nada'
              END[Code]
            from [oFM].[dbo].[@RLPERMISOSWEB1] T0 WITH(NOLOCK) WHERE T0.Code ='RPTMAYOREOFORANEO'
            and T0.U_USER='{0}'
        ", user));



            /**/
            if (IsPostBack)
            {
                try
                {
                    string sql = "EXEC	[AS400Sync].[dbo].[CFRepVtaXRutXCl]		@DESDE = '{1}',		@HASTA = '{2}',		@SlpName = N'{0}'";
                    xDT = MainClass.xGetFromSQL(string.Format(sql, Tipo2.Text, Convert.ToDateTime(Desde.Text).ToString("yyyyMMdd"), Convert.ToDateTime(Hasta.Text).ToString("yyyyMMdd")));
                    this.PivotGridViewXX.Visible = true;
                    PivotGridViewXX.DataSource = xDT;
                    PivotGridViewXX.DataBind();
                }
                catch (Exception e2)
                {
                    error.Text = " Error " + e2.ToString();
                }
            }
            else
            {
                Desde.Date = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                Hasta.Date = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                Tipo2.DataSource = xDT2;
                Tipo2.DataBind();
                Tipo2.Value = "Code";
                Tipo2.Text = "Code";
            }

        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            //---------------------------------
            ASPxPivotGridExporter1.ASPxPivotGridID = "PivotGridViewXX";
            ASPxPivotGridExporter1.ExportXlsToResponse("VtaXRutXCl.xls", new XlsExportOptionsEx() { ExportType = ExportType.WYSIWYG });
            //---------------------------------

        }
    }
}