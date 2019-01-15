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
    public partial class CEGuia : System.Web.UI.Page
    {
        public static string titulo;
        public static string g;
        public DataTable xDT = new DataTable();
        public static DataTable xDT2 = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {

            string[] tableHeaders = {
                "0/10 Abierta ",
                "error",
                "2/10 En Recoleccion",
                "error",
                "error",
                "5/10 Empacado No Revisado",
                "error",
                "7/10 Guia Revisado",
                "8/10 Pendiente Aplicacion",
                "9/10 Guia Cerrada",
                "10/10 Liquidado"

            };
            string op = "3227";
            xDT2 = MainClass.xGetFromSQL(string.Format("SELECT T2.U_DocNum AS GUIA,T2.U_CamionID AS CAMION,T3.firstName+' '+T3.lastName[Motorista],T2.UpdateDate AS FECHA,T2.U_DocStatus AS ESTADO FROM [@RLOWTRGUIA] T2 INNER JOIN OHEM T3 ON T2.U_EmpIdMotorista=T3.empID where  (T2.U_DocStatus=0 or T2.U_DocStatus=2 or T2.U_DocStatus=5 or T2.U_DocStatus=7) and T2.Canceled='N' ORDER BY T2.U_DocStatus "));
            titulo = op;

            xDT2.Columns.Add("EstadoGuia", typeof(System.String));
            foreach (DataRow dr in xDT2.Rows) // search whole table
            {
                dr["EstadoGuia"] = tableHeaders[Convert.ToInt32(dr["ESTADO"])]; //change the name                    
            }

            this.GridViewGuias.Visible = true;
            GridViewGuias.DataSource = xDT2;
            GridViewGuias.DataBind();



        }




        [WebMethod]
        public static string GetData(string guia)
        {

            string sql = "SELECT T2.U_DocNum AS GUIA,T2.U_CamionID AS CAMION,T3.firstName+' '+T3.lastName[Motorista],T2.UpdateDate AS FECHA,T2.U_DocStatus AS ESTADO FROM [@RLOWTRGUIA] T2 INNER JOIN OHEM T3 ON T2.U_EmpIdMotorista=T3.empID where T2.U_DocNum=" + guia;
            DataTable xDT = MainClass.xGetFromSQL(string.Format(sql));
            Dictionary<string, string> name = new Dictionary<string, string>();
            name.Add("1", xDT.Rows[0]["GUIA"].ToString());
            name.Add("2", xDT.Rows[0]["CAMION"].ToString());
            name.Add("3", xDT.Rows[0]["Motorista"].ToString());
            name.Add("4", xDT.Rows[0]["FECHA"].ToString());
            name.Add("5", xDT.Rows[0]["ESTADO"].ToString());
            //name.Add("2", guia);





            string myJsonString = (new JavaScriptSerializer()).Serialize(name);
            return myJsonString;

        }

        [WebMethod]
        public static string UpdateData(string guia, string estado)
        {
            string sql = string.Format("UPDATE [@RLOWTRGUIA] SET U_DocStatus={0} WHERE U_DocNum={1}", estado, guia);
            MainClass.xPOSTToSQL(sql);
            Dictionary<string, string> name = new Dictionary<string, string>();
            name.Add("1", "Guia Actualizada");
            name.Add("2", sql);
            string myJsonString = (new JavaScriptSerializer()).Serialize(name);
            return myJsonString;
        }

    }
}