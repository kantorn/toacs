using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities.Web.Grid;
using System.Web.Script.Serialization;
using Toacts.KanbanPost.Services;
using Toacts.KanbanPost.Services.BLL;
using Toacts.KanbanPost.Services.Objects;
using Toacts.KanbanPost.Layout.Objects;
using Toacts.KanbanPost.Layout.Resource;
using System.Web.Script.Services;
using Newtonsoft.Json;

namespace Toacts.KanbanPost.Layout.Masters
{
    public partial class ModelStructures : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public const string KEY_PAGEINDEX = "page";
        public const string KEY_PAGESIZE = "rows";

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static GridResult GetList(int? pageNumber, int? pageSize)
        {
            pageNumber = pageNumber == null ? 1 : pageNumber;
            pageSize = pageSize == null ? 20 : pageSize;

            GridResult result = new GridResult();
            int totalRecord = 0;
            Toacts.KanbanPost.Services.Service1 svc = new Service1();
            List<ModelStructureObject> list = svc.getModelStructuresList(ref totalRecord, pageNumber, pageSize);
            if (list.Any())
            {
                result.rows = list;
            }
            result.total = totalRecord;
            return result;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static ResponseData Create(RequsetUpdateModelStructureObject obj)
        {
            ResponseData resData = new ResponseData();
            try
            {
                Toacts.KanbanPost.Services.Service1 svc = new Service1();
                if (svc.createModelStructure(obj))
                {
                    resData.error = false;
                    resData.message = SystemResource.SUCCESS;
                    System.Diagnostics.EventLog.WriteEntry(ModelStructureLog.CREATE, SystemResource.SUCCESS);
                }
                else
                {
                    resData.error = true;
                    resData.message = SystemResource.FAIL;
                    System.Diagnostics.EventLog.WriteEntry(ModelStructureLog.CREATE, SystemResource.FAIL);
                }

            }
            catch (Exception e)
            {
                resData.error = true;
                resData.message = e.Message;
                System.Diagnostics.EventLog.WriteEntry(ModelStructureLog.CREATE, e.Message);
            }
            return resData;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static ResponseData Update(RequsetUpdateModelStructureObject obj)
        {
            ResponseData resData = new ResponseData();
            try
            {
                Toacts.KanbanPost.Services.Service1 svc = new Service1();
                if (svc.updateModelStructure(obj))
                {
                    resData.error = false;
                    resData.message = SystemResource.SUCCESS;
                    System.Diagnostics.EventLog.WriteEntry(ModelStructureLog.UPDATE, SystemResource.SUCCESS);
                }
                else
                {
                    resData.error = true;
                    resData.message = SystemResource.FAIL;
                    System.Diagnostics.EventLog.WriteEntry(ModelStructureLog.UPDATE, SystemResource.FAIL);
                }

            }
            catch (Exception e)
            {
                resData.error = true;
                resData.message = e.Message;
                System.Diagnostics.EventLog.WriteEntry(ModelStructureLog.UPDATE, e.Message);
            }
            return resData;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static ResponseData Delete(int ID)
        {
            ResponseData resData = new ResponseData();
            try
            {
                Toacts.KanbanPost.Services.Service1 svc = new Service1();
                if (svc.deleteModelStructure(ID))
                {
                    resData.error = false;
                    resData.message = SystemResource.SUCCESS;
                    System.Diagnostics.EventLog.WriteEntry(ModelStructureLog.DELETE, SystemResource.SUCCESS);
                }
                else
                {
                    resData.error = true;
                    resData.message = SystemResource.FAIL;
                    System.Diagnostics.EventLog.WriteEntry(ModelStructureLog.DELETE, SystemResource.FAIL);
                }
            }
            catch (Exception e)
            {
                resData.error = true;
                resData.message = e.Message;
                System.Diagnostics.EventLog.WriteEntry(ModelStructureLog.DELETE, e.Message);
            }
            return resData;
        }
    }
}