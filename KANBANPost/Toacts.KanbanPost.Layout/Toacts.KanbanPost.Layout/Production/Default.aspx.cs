using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Toacts.KanbanPost.Layout.Production
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if((this.UserName.Text == "extrusion" ) && (this.Password.Text == "123"))
            {
                Response.Redirect("../Production/ExtrusionSelection.aspx");
            }
            else if((this.UserName.Text == "finishing" ) && (this.Password.Text == "123"))
            {
                Response.Redirect("../Production/FinishingSelection.aspx");
            }
        }
    }
}