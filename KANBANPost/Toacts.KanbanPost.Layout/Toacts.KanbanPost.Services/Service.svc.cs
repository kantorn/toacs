using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Toacts.KanbanPost.Services
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    public class Service1 : IService
    {
        public List<Toacts.KanbanPost.Services.BLL.KanbanList> getKanbanList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            return Toacts.KanbanPost.Services.BLL.Kanban.getKanbanList(ref totalRecord, pageindex, pagesize);
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }
    }
}
