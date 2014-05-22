using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Toacts.KanbanPost.Services.EF;

namespace Toacts.KanbanPost.Services.BLL
{
    public class MAParts
    {
        public static List<Part> getPartsList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            List<Part> result = new List<Part>();
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    var query = from mp in ef.MA_PART
                                select new Part 
                                {
                                    ID = mp.ID,
                                    PART_NAME = mp.PART_NAME,
                                    PART_NO = mp.PART_NO,
                                    PROD_LENGTH = mp.PROD_LENGTH,
                                    PART_TYPE = mp.PART_TYPE,
                                    UNIT_QTY = mp.UNIT_QTY,
                                };
                    totalRecord = query.Count();
                    if (pageindex.HasValue && pagesize.HasValue)
                    {
                        if (query.Any())
                        {
                            IQueryable<Part> iqQuery = query.AsQueryable().OrderBy(x => x.ID);
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
    public class Part
    {

        public int ID
        {
            get;
            set;
        }

        public string PART_NAME
        {
            get;
            set;
        }

        public string PART_NO
        {
            get;
            set;
        }

        public int? PROD_LENGTH
        {
            get;
            set;
        }

        public string PART_TYPE
        {
            get;
            set;
        }

        public int? UNIT_QTY
        {
            get;
            set;
        }

    }
    #endregion
}