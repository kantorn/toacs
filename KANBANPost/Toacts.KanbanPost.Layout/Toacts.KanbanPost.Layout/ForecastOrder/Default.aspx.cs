using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Toacts.KanbanPost.Services.BLL;
using Utilities.Excel;

namespace Toacts.KanbanPost.Layout.ForecastOrder
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                DataTable dt = ExcelLayer.GetDataTable("App_Data\\forecast.xlsx", "Sheet1$");
                List<ForeCastObject> list = ForecastUtility.generateTemplate(dt);
                gvData.DataSource = dt;
                gvData.DataBind();
            }
        }

    }

}