using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWeb18.Zonas
{
    public partial class ZonaXDep : System.Web.UI.Page
    {
        public static DataTable xDT2 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                try
                {
                    //por aqui vas
                    string sql3 = " SELECT T0.Code[Zona],T2.Name[DEP],T0.U_DeptoCode[CODDEP],T1.U_CityCode[CODCIUDAD],T1.U_CityName[CIUDAD] FROM [oFM].[dbo].[@RLZONABYCIUDAD1] T0 with(nolock) INNER JOIN [oFM].[dbo].[@RLCIUDADESBYDEPTO1] T1 with(nolock) ON T0.U_CityCode=T1.U_CityCode INNER JOIN [oFM].[dbo].[@RLCIUDADESBYDEPTO] T2 with(nolock) ON T1.Code=T2.Code WHERE T2.Name LIKE '{0}' ";
                    xDT2 = MainClass.xGetFromSQL(string.Format(sql3, tipo.Items[tipo.SelectedIndex].Value));
                    this.GridViewReimpEntre.Visible = true;
                    GridViewReimpEntre.DataSource = xDT2;
                    GridViewReimpEntre.DataBind();
                    //Response.Redirect("ReimprimirEntrega.aspx");
                }
                catch (Exception e2)
                {
                    ASPxLabel1.Text = " Error " + e2.ToString();
                }
            }
            else
            {

                string sql2 = " SELECT T0.Code[Zona],T2.Name[DEP],T0.U_DeptoCode[CODDEP],T1.U_CityCode[CODCIUDAD],T1.U_CityName[CIUDAD] FROM [oFM].[dbo].[@RLZONABYCIUDAD1] T0 with(nolock) INNER JOIN [oFM].[dbo].[@RLCIUDADESBYDEPTO1] T1 with(nolock) ON T0.U_CityCode=T1.U_CityCode INNER JOIN [oFM].[dbo].[@RLCIUDADESBYDEPTO] T2 with(nolock) ON T1.Code=T2.Code WHERE T2.Name LIKE 'ATLANTICO4'";
                xDT2 = MainClass.xGetFromSQL(string.Format(sql2));
                this.GridViewReimpEntre.Visible = true;
                GridViewReimpEntre.DataSource = xDT2;
                GridViewReimpEntre.DataBind();
                string sql1 = "SELECT DISTINCT T0.Name FROM [oFM].[dbo].[@RLCIUDADESBYDEPTO] T0 with(nolock) order by Name";
                xDT2 = MainClass.xGetFromSQL(string.Format(sql1));
                tipo.DataSource = xDT2;
                tipo.DataBind();
                tipo.Value = "Name";
                tipo.Text = "Name";

            }

        }
    }
}