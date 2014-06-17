using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Toacts.KanbanPost.Layout.Resource
{
    public class SystemResource
    {
        public const string SUCCESS = "Success";
        public const string FAIL = "Fail";
    }

    public class ModelPartLog
    {
        public const string GET_PART_BY_ID = "Get part by ID";
        public const string GET_LIST = "Get List Model Part";
        public const string CREATE = "Create Model Part";
        public const string UPDATE = "Update Model Part";
        public const string DELETE = "Delete Model Part";
    }

    public class ModelStructureLog
    {
        public const string GET_LIST = "Get Model Structure List";
        public const string CREATE = "Create Model Structure";
        public const string UPDATE = "Update Model Structure";
        public const string DELETE = "Delete Model Structure";
    }
}