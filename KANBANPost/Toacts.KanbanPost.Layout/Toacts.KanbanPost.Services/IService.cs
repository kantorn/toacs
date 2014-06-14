using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Toacts.KanbanPost.Services
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService
    {

        [OperationContract]
        List<Toacts.KanbanPost.Services.BLL.KanbanList> getKanbanList(ref int totalRecord, int? pageindex = null,
                                                                      int? pagesize = null);

        [OperationContract]
        List<Toacts.KanbanPost.Services.BLL.Part> getPartMaster(ref int totalRecord, int? pageindex = null,
                                                                      int? pagesize = null);
        [OperationContract]
        List<Toacts.KanbanPost.Services.BLL.LosttimeMaster> getLosttimeMaster(ref int totalRecord, int? pageindex = null,
                                                                      int? pagesize = null);

        [OperationContract]
        List<Toacts.KanbanPost.Services.BLL.LineMaster> getLineMaster(ref int totalRecord, int? pageindex = null,
                                                                      int? pagesize = null);

        [OperationContract]
        List<Toacts.KanbanPost.Services.BLL.OpeatorRoleMaster> getOperatorRoleMaster(ref int totalRecord, int? pageindex = null,
                                                                      int? pagesize = null);

        [OperationContract]
        List<Toacts.KanbanPost.Services.BLL.CustomerMaster> getCustomerMaster(ref int totalRecord, int? pageindex = null,
                                                                      int? pagesize = null);

        [OperationContract]
        List<Toacts.KanbanPost.Services.BLL.OperatorMaster> getOperatorMaster(ref int totalRecord, int? pageindex = null,
                                                                      int? pagesize = null);

        [OperationContract]
        CompositeType GetDataUsingDataContract(CompositeType composite);

        // TODO: Add your service operations here
    }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    [DataContract]
    public class CompositeType
    {
        bool boolValue = true;
        string stringValue = "Hello ";

        [DataMember]
        public bool BoolValue
        {
            get { return boolValue; }
            set { boolValue = value; }
        }

        [DataMember]
        public string StringValue
        {
            get { return stringValue; }
            set { stringValue = value; }
        }
    }
}
