﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Toacts.KanbanPost.Layout.Template
{
    public partial class Production : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                logout.Visible = false;
            }
            else
            {
                logout.Visible = true;
            }
        }
    }
}