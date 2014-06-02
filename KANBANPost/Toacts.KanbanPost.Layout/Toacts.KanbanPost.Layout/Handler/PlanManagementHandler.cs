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
    public class PlanManagementHandler: IHttpHandler
    {
        public const string KEY_PAGEINDEX = "page";
        public const string KEY_PAGESIZE = "rows";
        public void ProcessRequest(HttpContext context)
        {
            bool initials =  !String.IsNullOrEmpty(context.Request.QueryString["init"]);
            string result = initials ? "[" + initialGrid() + "]" :  getPlanData() ;
            context.Response.Clear();
            context.Response.ContentType = "application/json; charset=utf-8";
            context.Response.Write(result);
        }

        public bool IsReusable
        {
            get { return false; }
        }

        private string initialGrid()
        {
            List<GridHeaderProperties> result = new List<GridHeaderProperties>();

            PropertyInfo[] propInfos = typeof(PlanManagementsData).GetProperties();

            DateTime now = DateTime.Now;
            int dayOfWeek = (int)now.DayOfWeek;
            dayOfWeek = dayOfWeek == 0 ? 7 : dayOfWeek;
            DateTime startOfWeek = now.AddDays(1 - (int)now.DayOfWeek);
            int dayCount = 0;
            foreach (PropertyInfo p in propInfos)
            {
                if (p.Name.Contains("day") || p.Name.Contains("Total"))
                {
                    string fieldName = startOfWeek.AddDays(dayCount).DayOfWeek.ToString().Substring(0,3) + "(" + startOfWeek.AddDays(dayCount).Day.ToString()  + ")";
                    result.Add(new GridHeaderProperties(p.Name, fieldName, "", "numberbox"));
                    dayCount++;
                }
            }
                 
            return new JavaScriptSerializer().Serialize(result);
        }

        private string getPlanData()
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
            List<PlanManagementsData> list = new List<PlanManagementsData>();
            for (int i = 0; i < 10; i++)
            {
                list.Add(new PlanManagementsData()
                {
                    Part_No = "AB39 21201A38 A" + i.ToString(),
                    Customer_Name = "AAT",
                    Model_Name = "P375",
                    Line_Speed = 25,
                    Packing = 30,
                    Forecast_Qty = 2940,
                    day1 = 0,
                    day2 = 0,
                    day3 = 0,
                    day4 = 0,
                    day5 = 0,
                    day6 = 0,
                    day7 = 0,
                    day8 = 0,
                    day9 = 0,
                    day10 = 0,
                    day11 = 0,
                    day12 = 0,
                    day13 = 0,
                    day14 = 0,
                    Total = 0
                });
            }
            if (list.Any())
            {
                result.rows = list;
            }
            result.total = 20;
                      
            return new JavaScriptSerializer().Serialize(result);
        }
    }

    public class PlanManagementsData
    {
        public string Part_No { get; set; }

        public string Customer_Name { get; set; }

        public string Model_Name { get; set; }

        public int Line_Speed {get; set;}

        public int Packing {get; set;}

        public int Forecast_Qty { get; set; }

        public int day1 { get; set; }

        public int day2 { get; set; }

        public int day3 { get; set; }

        public int day4 { get; set; }

        public int day5 { get; set; }

        public int day6 { get; set; }

        public int day7 { get; set; }

        public int day8 { get; set; }

        public int day9 { get; set; }

        public int day10 { get; set; }

        public int day11 { get; set; }

        public int day12 { get; set; }

        public int day13 { get; set; }

        public int day14 { get; set; }

        public int Total { get; set; }
    }
}