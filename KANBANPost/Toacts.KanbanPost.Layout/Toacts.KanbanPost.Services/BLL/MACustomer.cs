using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Toacts.KanbanPost.Services.EF;

namespace Toacts.KanbanPost.Services.BLL
{
    public class MACustomer
    {
        public static List<CustomerMaster> getCustomerMasterList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            List<CustomerMaster> result = new List<CustomerMaster>();
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    var query = from mp in ef.MA_CUSTOMER
                                select new CustomerMaster
                                {
                                    id = mp.ID,
                                    customer_name = mp.CUSTOMER_NAME,
                                    customer_shortname = mp.CUSTOMER_SHOT
                                };
                    totalRecord = query.Count();
                    if (pageindex.HasValue && pagesize.HasValue)
                    {
                        if (query.Any())
                        {
                            IQueryable<CustomerMaster> iqQuery = query.AsQueryable().OrderBy(x => x.id);
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
    public class CustomerMaster
    {

        public int id
        {
            get;
            set;
        }

        public string customer_name
        {
            get;
            set;
        }
        public string customer_shortname
        {
            get;
            set;
        }

    }
    #endregion
}