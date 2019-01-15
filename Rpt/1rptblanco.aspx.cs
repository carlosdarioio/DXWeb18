using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXWeb18.Rpt
{
    public partial class _1rptblanco : System.Web.UI.Page
    {
        public DataTable xDT = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                try
                {

                }
                catch (Exception e2)
                {
                    error.Text = " Error " + e2.ToString();
                }
            }

        }
    }
}