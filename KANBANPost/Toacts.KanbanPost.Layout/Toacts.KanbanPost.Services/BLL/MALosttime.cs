using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Toacts.KanbanPost.Services.EF;

namespace Toacts.KanbanPost.Services.BLL
{
    public class MALosttime
    {
        public static List<LosttimeMaster> getLosttimeList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            List<LosttimeMaster> result = new List<LosttimeMaster>();
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    var query = from mp in ef.MA_LOSTTIME
                                select new LosttimeMaster 
                                {
                                    id = mp.ID,
                                    description = mp.DESCRIPTION,
                                    losttime = mp.LISTTIME
                                };
                    totalRecord = query.Count();
                    if (pageindex.HasValue && pagesize.HasValue)
                    {
                        if (query.Any())
                        {
                            IQueryable<LosttimeMaster> iqQuery = query.AsQueryable().OrderBy(x => x.id);
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
    public class LosttimeMaster
    {

        public int id
        {
            get;
            set;
        }

        public string description
        {
            get;
            set;
        }

        public int? losttime
        {
            get;
            set;
        }
    }
    #endregion
}