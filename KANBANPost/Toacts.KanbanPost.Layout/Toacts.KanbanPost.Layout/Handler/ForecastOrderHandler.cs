using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FlexigridASPNET;
using System.Web.Script.Serialization;
using System.Reflection;
using System.Collections;
using Toacts.KanbanPost.Services;
using Utilities.Web.Grid;

namespace Toacts.KanbanPost.Layout.Handler
{
    public class ForecastOrderHandler : IHttpHandler
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
            List<ForecastOrderData> list = getTestData();
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

        public List<ForecastOrderData> getTestData()
        {
            List<ForecastOrderData> list = new List<ForecastOrderData>();

            for (int i = 0; i < 4; i++)
            {
                list.Add(new ForecastOrderData()
                {
                    part_no = "AB39 21201A38 AC",
                    customer = "AAT",
                    line_no = "1-A-1",
                    factory = "FAC#1",
                    model = "P375  ",
                    packing_size = "30",
                    packing_type = "Carton Box",
                    forecast = "2940",
                    ct = "25"
                });


                list.Add(new ForecastOrderData()
                {
                    part_no = "AB39 21201A39 AC",
                    customer = "AAT",
                    line_no = "1-A-1",
                    factory = "FAC#1",
                    model = "P375  ",
                    packing_size = "30",
                    packing_type = "Carton Box",
                    forecast = "2940",
                    ct = "25"
                });

                list.Add(new ForecastOrderData()
                {
                    part_no = "AB39 26201A38 AC",
                    customer = "AAT",
                    line_no = "1-A-1",
                    factory = "FAC#1",
                    model = "P375  ",
                    packing_size = "30",
                    packing_type = "Carton Box",
                    forecast = "11340",
                    ct = "25"
                });
            }
            return list;
        }
    }

    public class ForecastOrderData
    {
        public string part_no { get; set; }
        public string customer { get; set; }
        public string line_no { get; set; }
        public string factory { get; set; }
        public string model { get; set; }
        public string packing_size { get; set; }
        public string packing_type { get; set; }
        public string forecast { get; set; }
        public string ct { get; set; }
    }
}