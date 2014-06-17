using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Toacts.KanbanPost.Services.Objects
{
    public class MAModelObject
    {
        public int ID
        {
            get;
            set;
        }

        public int? CUSTOMER_ID
        {
            get;
            set;
        }

        public string MODEL_NAME
        {
            get;
            set;
        }

        public string PREFIX
        {
            get;
            set;
        }

        public string CUSTOMER_NAME
        {
            get;
            set;
        }

        public string CUSTOMER_SHOT
        {
            get;
            set;
        }
    }

    public class RequestMAModelObject
    {
        public int ID
        {
            get;
            set;
        }

        public int CUSTOMER_ID
        {
            get;
            set;
        }

        public string MODEL_NAME
        {
            get;
            set;
        }

        public string PREFIX
        {
            get;
            set;
        }
    }
}