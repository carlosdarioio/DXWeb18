using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Telefonos : System.Web.UI.Page
{
    DataTable xDT = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        xDT = MainClass.xGetFromSQL("SELECT [numero],[puesto],[departamento],[nombre] FROM [blog].[dbo].[Telefonos]");
        BootstrapGridView1.DataSource = xDT;
        BootstrapGridView1.DataBind();


        //GridView1.DataSource = xDT;
        //GridView1.DataBind();
    }
}