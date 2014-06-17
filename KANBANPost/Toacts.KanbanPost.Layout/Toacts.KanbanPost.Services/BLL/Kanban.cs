using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Toacts.KanbanPost.Services.EF;
using System.ServiceModel;

namespace Toacts.KanbanPost.Services.BLL
{
    public class Kanban
    {
        [OperationBehavior(Impersonation = ImpersonationOption.Allowed)]
        public static List<KanbanList> getKanbanList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            List<KanbanList> result = new List<KanbanList>();
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    var query = from kb in ef.EXT_KANBAN
                                join mds in ef.MA_MODEL_STRUCTURE on kb.MODEL_STRUCTURE_ID equals mds.ID
                                join m in ef.MA_MODEL on mds.MODEL_ID equals m.ID
                                where (kb.STATUS == null)
                                select new KanbanList
                                {
                                    KanbnaId = kb.ID,
                                    customer_name = m.MA_CUSTOMER.CUSTOMER_NAME,
                                    model_name = m.MODEL_NAME,
                                    part_name = mds.MA_PART.PART_NAME,
                                    part_no = mds.MA_PART.PART_NO,
                                    tag_id = kb.TAG_ID,
                                    quantity = mds.LOT_SIZE,
                                    total_quantity = kb.EXT_PLAN.LOT_SIZE
                                };
                    totalRecord = query.Count();
                    if (pageindex.HasValue && pagesize.HasValue)
                    {
                        if (query.Any())
                        {
                            IQueryable<KanbanList> iqQuery = query.AsQueryable().OrderBy(x => x.customer_name);
                            result = iqQuery.Skip(pagesize.Value * (pageindex.Value - 1)).Take(pagesize.Value).ToList();
                        }
                    }
                    else if (query.Any())
                    {
                        result = query.ToList();
                    }
                }
                catch
                {

                }
            }

            return result;
        }
    }

    #region Wrapper Class
    public class KanbanList
    {

        public string customer_name
        {
            get;
            set;
        }

        public string model_name
        {
            get;
            set;
        }

        public string part_name
        {
            get;
            set;
        }

        public string part_no
        {
            get;
            set;
        }

        public string tag_id
        {
            get;
            set;
        }

        public int? quantity
        {
            get;
            set;
        }

        public int? total_quantity
        {
            get;
            set;
        }
        public int KanbnaId
        {
            get;
            set;
        }
    }
    #endregion
}