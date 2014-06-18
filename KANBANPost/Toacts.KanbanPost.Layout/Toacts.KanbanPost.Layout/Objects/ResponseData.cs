using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Toacts.KanbanPost.Layout.Objects
{
    public class ResponseData
    {
        public bool error { get; set; }
        public string message { get; set; }
        public object data { get; set; }
    }
}