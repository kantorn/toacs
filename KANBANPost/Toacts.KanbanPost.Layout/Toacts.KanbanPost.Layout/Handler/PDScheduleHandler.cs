using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FlexigridASPNET;
using System.Web.Script.Serialization;
using System.Reflection;
using System.Collections;
using Utilities.Web.Grid;

namespace Toacts.KanbanPost.Layout.Handler
{
    public class PDScheduleHandler : IHttpHandler
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
            List<PDSchedule> list = getListData();
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
        public List<PDSchedule> getListData()
        { 
            List<PDSchedule> list = new List<PDSchedule>();
            for (int i = 1; i <= 5; i++)
            {
                list.Add(new PDSchedule()
                {
                    line_id = "1-A-" + i.ToString(),
                    lot_no = "Lot-0000000" + i.ToString(),
                    part_name = "72335/75-TM0-T111-M1",
                    lot_size = "250",
                    fg =  "0",
                    ng ="0",
                    status = "Next",
                    action = "<a class='fancy-button filter-button arrow-down' style='padding: 0.1em 1em;font-size:11px;' href='Login.aspx'>Go<span class='arrow-down-icon'></span></a>"
                });
            }
            return list;
        }
        public bool IsReusable
        {
            get { return false; }
        }
    }

    public class PDSchedule
    {
        public string line_id { get; set; }
        public string lot_no { get; set; }
        public string part_name { get; set; }
        public string lot_size { get; set; }
        public string fg { get; set; }
        public string ng { get; set; }
        public string status { get; set; }
        public string action { get; set; }
    }
}