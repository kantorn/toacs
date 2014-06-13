using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities.Web.DayPilotLite.Web.Ui;

namespace Toacts.KanbanPost.Layout
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.lblToday.Text = "Date :" + DateTime.Today.ToShortDateString();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
        }
    }
}