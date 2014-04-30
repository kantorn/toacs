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
        private const string LABEL_FORMAT = "Date: {0} ~ {1}";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTime d = DateTime.Today;
                //int offset = d.DayOfWeek - DayOfWeek.Monday;
                //Label1.Text = String.Format(LABEL_FORMAT, d.AddDays(-offset).ToShortDateString(), d.AddDays(-offset).AddDays(6).ToShortDateString());
            }
        }

    }
}