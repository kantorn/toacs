using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace Toacts.KanbanPost.Layout.Helper
{
    public class SessionHelper
    {

        private static string S_DBCOMMON = "common";

        public static Utilities.DB.Common dbCommon
        {
            get { return ((Utilities.DB.Common)HttpContext.Current.Session[S_DBCOMMON]); }
            set { HttpContext.Current.Session[S_DBCOMMON] = value; }
        }

        public SessionHelper()
        {
            SessionHelper.dbCommon = new Utilities.DB.Common();
            SessionHelper.dbCommon.currentContext = HttpContext.Current;
        }
    }
}