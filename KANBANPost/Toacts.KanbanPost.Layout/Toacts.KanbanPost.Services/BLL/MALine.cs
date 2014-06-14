using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Toacts.KanbanPost.Services.EF;

namespace Toacts.KanbanPost.Services.BLL
{
    public class MALine
    {
        public static List<LineMaster> getLineList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            List<LineMaster> result = new List<LineMaster>();
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    var query = from mp in ef.MA_LINE
                                select new LineMaster
                                {
                                    id = mp.ID,
                                    Line = mp.LINE_NAME,
                                    Process = mp.PROCESS_NAME,
                                    Sequence = mp.PROCESS_SEQ
                                };
                    totalRecord = query.Count();
                    if (pageindex.HasValue && pagesize.HasValue)
                    {
                        if (query.Any())
                        {
                            IQueryable<LineMaster> iqQuery = query.AsQueryable().OrderBy(x => x.id);
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
    public class LineMaster
    {

        public int id
        {
            get;
            set;
        }

        public string Line
        {
            get;
            set;
        }

        public int? Factory
        {
            get;
            set;
        }

        public string Process
        {
            get;
            set;
        }

        public int? Sequence
        {
            get;
            set;
        }
    }
    #endregion
}