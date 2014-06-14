using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Reflection;
using System.Collections;
using Toacts.KanbanPost.Services;
using Utilities.Web.Grid;

namespace Toacts.KanbanPost.Layout.Handler
{
    public class KanbanListHandler : IHttpHandler
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
            //List<Toacts.KanbanPost.Services.BLL.KanbanList> list = svc.getKanbanList(ref totalRecord, pageindex, pagesize);
            List<Toacts.KanbanPost.Services.BLL.KanbanList> list = getTestData();
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

        public  List<Services.BLL.KanbanList> getTestData()
        {
            List<Services.BLL.KanbanList> list = new List<Services.BLL.KanbanList>();

            list.Add(new Toacts.KanbanPost.Services.BLL.KanbanList() {
                customer_name = "HATC",
                model_name = "2PK",
                part_name = "2PK Outer",
                part_no = "72410/50-TM0-T110-M1",
                tag_id = "EXT00000001",
                quantity = 100,
                total_quantity = 100,
                KanbnaId = 1
            });
            
            list.Add(new Toacts.KanbanPost.Services.BLL.KanbanList() {
                customer_name = "HATC",
                model_name = "2TU",
                part_name = "2TU Inner",
                part_no = "72335/75-TM0-T111-M1",
                tag_id = "EXT00000002",
                quantity = 400,
                total_quantity = 400,
                KanbnaId = 2
            });
            
            list.Add(new Toacts.KanbanPost.Services.BLL.KanbanList() {
                customer_name = "TMAP",
                model_name = "301L",
                part_name = "301L Outer",
                part_no = "75710/20/30/40-02250",
                tag_id = "EXT00000003",
                quantity = 200,
                total_quantity = 200,
                KanbnaId = 2
            });

            list.Add(new Toacts.KanbanPost.Services.BLL.KanbanList() {
                customer_name = "TMAP",
                model_name = "301L",
                part_name = "301L Outer",
                part_no = "75710/20-02270",
                tag_id = "EXT00000004",
                quantity = 500,
                total_quantity = 500,
                KanbnaId = 2
            });

            list.Add(new Toacts.KanbanPost.Services.BLL.KanbanList() {
                customer_name = "TMAP",
                model_name = "301L",
                part_name = "301L Outer",
                part_no = "75710/20/30/40-02250",
                tag_id = "EXT00000005",
                quantity = 400,
                total_quantity = 400,
                KanbnaId = 2
            });

            list.Add(new Toacts.KanbanPost.Services.BLL.KanbanList() {
                customer_name = "TMAP",
                model_name = "301L",
                part_name = "301L Outer",
                part_no = "75710/20-02270",
                tag_id = "EXT00000006",
                quantity = 300,
                total_quantity = 300,
                KanbnaId = 2
            });

            list.Add(new Toacts.KanbanPost.Services.BLL.KanbanList() {
                customer_name = "TMAP",
                model_name = "301L",
                part_name = "301L Outer",
                part_no = "75730/40-02230/40",
                tag_id = "EXT00000007",
                quantity = 800,
                total_quantity = 800,
                KanbnaId = 2
            });

            list.Add(new Toacts.KanbanPost.Services.BLL.KanbanList()
            {
                customer_name = "TMAP",
                model_name = "301L",
                part_name = "301L Outer",
                part_no = "75710/20/30/40-02250",
                tag_id = "EXT00000008",
                quantity = 500,
                total_quantity = 500,
                KanbnaId = 2
            });

            list.Add(new Toacts.KanbanPost.Services.BLL.KanbanList()
            {
                customer_name = "TMAP",
                model_name = "301L",
                part_name = "301L Outer",
                part_no = "75730/40-02230/40",
                tag_id = "EXT00000009",
                quantity = 200,
                total_quantity = 200,
                KanbnaId = 2
            });
            return list;
        }
    }

}