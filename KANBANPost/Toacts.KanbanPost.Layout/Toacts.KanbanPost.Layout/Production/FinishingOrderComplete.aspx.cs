using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Toacts.KanbanPost.Layout.Production.Finishing
{
    public partial class FinishingOrderComplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //divInfo.Visible = false;
            }
        }
        protected void txtKanban_TextChanged(object sender, EventArgs e)
        {
            if (this.txtKanban.Text == "TG00001")
            {
                //txtKanban.Enabled = false;
                //divInfo.Visible = true;  
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtKanban.Text = "";
            divInfo.Visible = false;
            txtKanban.Enabled = true;
        }
    }
}