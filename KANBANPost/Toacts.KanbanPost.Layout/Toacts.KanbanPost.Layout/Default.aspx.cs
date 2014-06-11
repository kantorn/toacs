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
                Session["user"] = null;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if ((this.UserName.Text == "extrusion") && (this.Password.Text == "123"))
            {
                Session["user"] = "extrusion";
                Response.Redirect("/Production/ExtrusionSelection.aspx");
            }
            else if ((this.UserName.Text == "finishing") && (this.Password.Text == "123"))
            {
                Session["user"] = "finishing";
                Response.Redirect("/Production/FinishingSelection.aspx");
            }
            else if ((this.UserName.Text == "plan") && (this.Password.Text == "123"))
            {
                Session["user"] = "plan";
                Response.Redirect("/Kanban/Default.aspx");
            }
        }
    }
}