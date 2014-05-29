﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Toacts.KanbanPost.Layout.Production.Extrusion
{
    public partial class ExtrusionScan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtKanban_TextChanged(object sender, EventArgs e)
        {
            if (this.txtKanban.Text == "TG00001") 
            {
                if (Session["action"] == "Create")
                {
                    Response.Redirect("../Production/ExtrusionOrderCreate.aspx");
                
                }
                else if (Session["action"] == "Complete")
                {
                    Response.Redirect("../Production/ExtrusionOrderComplete.aspx");
                }
            }
        }
    }
}