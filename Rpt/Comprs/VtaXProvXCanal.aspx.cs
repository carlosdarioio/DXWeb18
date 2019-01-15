using DevExpress.Export;
using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWeb18.Rpt.Comprs
{
    public partial class VtaXProvXCanal : System.Web.UI.Page
    {
        public DataTable xDT = new DataTable();
        public DataTable xDT2 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            PivotGridViewXX.OptionsPager.Visible = false;

            /**/
            if (IsPostBack)
            {
                try
                {
                    string sql = @"EXEC	[AS400Sync].[dbo].[CFRptVtaXProvXCanal]
		                        @DESDE = '{0}',
		                        @HASTA = '{1}'";
                    xDT = MainClass.xGetFromSQL(string.Format(sql, Convert.ToDateTime(Desde.Text).ToString("yyyyMMdd"), Convert.ToDateTime(Hasta.Text).ToString("yyyyMMdd")));
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

            }

        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            //---------------------------------
            ASPxPivotGridExporter1.ASPxPivotGridID = "PivotGridViewXX";
            ASPxPivotGridExporter1.ExportXlsToResponse("VtaXProvXCanal.xls", new XlsExportOptionsEx() { ExportType = ExportType.WYSIWYG });
            //---------------------------------

        }
    }
}