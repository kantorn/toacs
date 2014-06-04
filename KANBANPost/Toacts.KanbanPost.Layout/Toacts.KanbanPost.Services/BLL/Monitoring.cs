using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Toacts.KanbanPost.Services.EF;

namespace Toacts.KanbanPost.Services.BLL
{
    public class Monitoring
    {

        public static List<MonitoringList> getMonitoringList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            List<MonitoringList> result = new List<MonitoringList>();
            //using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            //{
            //    try
            //    {
            //        var query = from kb in ef.KANBAN_EXT
            //                    join mds in ef.MA_MODEL_STRUCTURE on kb.MODEL_STRUCTURE_ID equals mds.ID
            //                    where (kb.STATUS == null)
            //                    select new MonitoringList
            //                    {
            //                        KanbnaId = kb.ID,
            //                        customer_name = kb.FORECAST_ORDER.MA_CUSTOMER.CUSTOMER_NAME,
            //                        model_name = mds.MA_MODEL.MODEL_NAME,
            //                        part_name = mds.MA_PART.PART_NAME,
            //                        part_no = mds.MA_PART.PART_NO,
            //                        tag_id = kb.TAG_ID,
            //                        quantity = kb.LOST_SIZE,
            //                        total_quantity = kb.FORECAST_ORDER.QUANTITY
            //                    };
            //        totalRecord = query.Count();
            //        if (pageindex.HasValue && pagesize.HasValue)
            //        {
            //            if (query.Any())
            //            {
            //                IQueryable<MonitoringList> iqQuery = query.AsQueryable().OrderBy(x => x.customer_name);
            //                result = iqQuery.Skip(pagesize.Value * (pageindex.Value - 1)).Take(pagesize.Value).ToList();
            //            }
            //        }
            //        else if (query.Any())
            //        {
            //            result = query.ToList();
            //        }
            //    }
            //    catch
            //    { 

            //    }
            //}   
            Random rnd = new Random();

            string[] pd_line = new string[3] { "1-T-1", "1-F-1", "2-T-1" };

            for (int i = 0; i < 10; i++)
            {
               
                int min = rnd.Next(2999);
                int max = rnd.Next(min, 7999);
                int now_stock = now_stock = rnd.Next(min, max + 2000);
                string status = now_stock >= max ? "<span style='color:green'>OK</span>" : "<span style='color:red'>NG</span>";
                int index = rnd.Next(2);
                int lot_size = rnd.Next(0, max);

                result.Add(new MonitoringList()
                {
                    part_no = "AB39 21201A38 A" + i.ToString(),
                    part_number = "AB39 21201A38 A" + i.ToString(),
                    pd_line = pd_line[index],
                    lot_size = lot_size.ToString(),
                    max = max.ToString(),
                    min = min.ToString(),
                    now_stock = now_stock.ToString(),
                    status = status.ToString() 
                });
            }
            return result;
        }
    }

    #region Wrapper Class
    public class MonitoringList
    {

        public string part_no
        {
            get;
            set;
        }

        public string part_number
        {
            get;
            set;
        }

        public string pd_line
        {
            get;
            set;
        }

        public string lot_size
        {
            get;
            set;
        }

        public string max
        {
            get;
            set;
        }

        public string min
        {
            get;
            set;
        }

        public string now_stock
        {
            get;
            set;
        }

        public string status
        {
            get;
            set;
        }
       
    }
    #endregion
}
