using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Toacts.KanbanPost.Services.Objects
{
    public class ModelStructureObject
    {
        public int ID
        {
            get;
            set;
        }

        public int? PART_ID
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

        public int? LOT_SIZE
        {
            get;
            set;
        }

        public int? LINE_SPEED
        {
            get;
            set;
        }
    }

    public class RequsetUpdateModelStructureObject
    {
        public int ID
        {
            get;
            set;
        }


        public int? PART_ID
        {
            get;
            set;
        }

        public int? LOT_SIZE
        {
            get;
            set;
        }

        public int? LINE_SPEED
        {
            get;
            set;
        }
    }
}