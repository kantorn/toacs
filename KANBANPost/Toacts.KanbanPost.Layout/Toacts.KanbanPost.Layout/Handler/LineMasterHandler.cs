using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Utilities.Web.Grid;
using System.Web.Script.Serialization;
using Toacts.KanbanPost.Services;
using Toacts.KanbanPost.Services.BLL;


namespace Toacts.KanbanPost.Layout.Handler
{
    public class LineMasterHandler : IHttpHandler
    {
        public const string KEY_PAGEINDEX = "page";
        public const string KEY_PAGESIZE = "rows";
        public void ProcessRequest(HttpContext context)
        {
            // Variables
            Nullable<int> pageindex = null;
            Nullable<int> pagesize = null;
            GridResult result = new GridResult();

            foreach (string key in HttpContext.Current.Request.Form.AllKeys)
            {
                if (key == KEY_PAGEINDEX)
                {
                    pageindex = Convert.ToInt32(HttpContext.Current.Request.Form[key]);
                }
                else if (key == KEY_PAGESIZE)
                {
                    pagesize = Convert.ToInt32(HttpContext.Current.Request.Form[key]);
                }
            }
            int totalRecord = 0;
            Toacts.KanbanPost.Services.Service1 svc = new Service1();
            List<LineMaster> list = svc.getLineMaster(ref totalRecord, pageindex, pagesize);
            if (list.Any())
            {
                result.rows = list;
            }
            result.total = totalRecord;

            JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
            string sresult = javaScriptSerializer.Serialize(result);
            context.Response.Clear();
            context.Response.ContentType = "application/json; charset=utf-8";
            context.Response.Write(sresult);
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
}