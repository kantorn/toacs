using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Toacts.KanbanPost.Services.EF;

namespace Toacts.KanbanPost.Services.BLL
{
    public class MAOperatorRoles
    {
        public static List<OpeatorRoleMaster> getOperatorRoleList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            List<OpeatorRoleMaster> result = new List<OpeatorRoleMaster>();
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    var query = from mp in ef.MA_OPT_ROLE
                                select new OpeatorRoleMaster 
                                {
                                    id = mp.ID,
                                    rolename = mp.ROLE_NAME,
                                    description = mp.DESCRIPTION
                                };
                    totalRecord = query.Count();
                    if (pageindex.HasValue && pagesize.HasValue)
                    {
                        if (query.Any())
                        {
                            IQueryable<OpeatorRoleMaster> iqQuery = query.AsQueryable().OrderBy(x => x.id);
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
    public class OpeatorRoleMaster
    {

        public int id
        {
            get;
            set;
        }

        public string rolename
        {
            get;
            set;
        }
        public string description
        {
            get;
            set;
        }

    }
    #endregion
}