using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Toacts.KanbanPost.Layout.Production.Extrusion
{
    public partial class ExtrusionSelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateNewOrder_Click(object sender, EventArgs e)
        {
            Session["action"] = "Create";
            Response.Redirect("../Production/ExtrusionScan.aspx");
        }

        protected void CompleteOrder_Click(object sender, EventArgs e)
        {
            Session["action"] = "Complete";
            Response.Redirect("../Production/ExtrusionScan.aspx");
        }
    }
}