using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Reflection;
using System.Collections;
using Utilities.Web.Grid;

namespace Toacts.KanbanPost.Layout.Handler
{
    public class MasterStockHandler : IHttpHandler
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
            List<MasterStockData> list = getTestData();
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

        public List<MasterStockData> getTestData()
        {
            List<MasterStockData> list = new List<MasterStockData>();

            for (int i = 0; i < 10; i++)
            {
                list.Add(new MasterStockData()
                {
                    part_no = "75730/40-02230/40",
                    part_name = "301L Outer",
                    line_no = "1-A-" + i.ToString(),
                    lot_size = "300",
                    max = "3",
                    min = "1",
                    current = "100",
                    status = "NG"
                });
            
            }

            return list;
        }
    }

    public class MasterStockData
    {
        public string part_no { get; set; }
        public string part_name { get; set; }
        public string line_no { get; set; }
        public string lot_size { get; set; }
        public string max { get; set; }
        public string min { get; set; }
        public string current { get; set; }
        public string status { get; set; }
    }
}