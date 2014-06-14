using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Toacts.KanbanPost.Services.EF;

namespace Toacts.KanbanPost.Services.BLL
{
    public class MAOperator
    {
        public static List<OperatorMaster> getOperatorMasterList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            List<OperatorMaster> result = new List<OperatorMaster>();
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    var query = from mp in ef.MA_OPT_USER
                                join ro in ef.MA_OPT_ROLE on mp.ROLE_ID equals ro.ID
                                select new OperatorMaster
                                {
                                    id = mp.ID,
                                    username = mp.USER_NAME,
                                    password = mp.PASSWORD,
                                    roleid = mp.ROLE_ID,
                                    rolename = ro.DESCRIPTION
                                };
                    totalRecord = query.Count();
                    if (pageindex.HasValue && pagesize.HasValue)
                    {
                        if (query.Any())
                        {
                            IQueryable<OperatorMaster> iqQuery = query.AsQueryable().OrderBy(x => x.id);
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
    public class OperatorMaster
    {

        public int id
        {
            get;
            set;
        }

        public string username
        {
            get;
            set;
        }
        public string password
        {
            get;
            set;
        }

        public int? roleid
        {
            get;
            set;
        }

        public string rolename
        {
            get;
            set;
        }
    }
    #endregion
}