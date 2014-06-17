using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using Toacts.KanbanPost.Services.EF;
using Toacts.KanbanPost.Services.BLL;
using Toacts.KanbanPost.Services.Objects;

namespace Toacts.KanbanPost.Services
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    public class Service1 : IService
    {
        public List<KanbanList> getKanbanList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            return Kanban.getKanbanList(ref totalRecord, pageindex, pagesize);
        }

        #region Master Data

        #region Part
        public List<Part> getPartMaster(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            return MAParts.getPartsList(ref totalRecord, pageindex, pagesize);
        }

        public List<Part> getPartMaster()
        {
            return MAParts.getPartsList();
        }

        public bool updatePart(Part part)
        {
            return MAParts.updatePart(part); 
        }

        public bool deletePart(int ID)
        {
            return MAParts.deletePart(ID);
        }

        public bool createPart(Part part)
        {
            return MAParts.createPart(part);
        }

        public Part getPartByID(int ID)
        {
            return MAParts.getPartByID(ID);
        }
        #endregion

        #region ModelStructures
        public List<Toacts.KanbanPost.Services.Objects.ModelStructureObject> getModelStructuresList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            return ModelStructures.getModelStructuresList(ref totalRecord, pageindex, pagesize);
        }

        public List<Toacts.KanbanPost.Services.Objects.ModelStructureObject> getModelStructuresList()
        {
            return ModelStructures.getModelStructuresList();
        }

        public bool updateModelStructure(RequsetUpdateModelStructureObject obj)
        {
            return ModelStructures.updateModelStructure(obj);
        }

        public bool deleteModelStructure(int ID)
        {
            return ModelStructures.deleteModelStructure(ID);
        }

        public bool createModelStructure(RequsetUpdateModelStructureObject obj)
        {
            return ModelStructures.createModelStructure(obj);
        }
        #endregion

        #region Customer

        public List<MACustomerObject> getModelCustomerList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            return MACustomers.getModelCustomerList(ref totalRecord, pageindex, pagesize);
        }

        public bool updateModelCustomer(RequsetMACustomerObject reqObj)
        {
            return MACustomers.updateModelCustomer(reqObj);
        }

        public bool deleteModelCustomer(int ID)
        {
            return MACustomers.deleteModelCustomer(ID);
        }

        public bool createModelCustomer(RequsetMACustomerObject reqObj)
        {
            return MACustomers.createModelCustomer(reqObj);
        }

        public List<MACustomerObject> getModelCustomerList()
        {
            return MACustomers.getModelCustomerList();
        }

        #endregion

        #region Model

        public List<MAModelObject> getModelList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            return MAModel.getModelList(ref totalRecord, pageindex, pagesize);
        }

        public bool createModel(RequestMAModelObject obj)
        {
            return MAModel.createModel(obj);
        }

        public bool updateModel(RequestMAModelObject obj)
        {
            return MAModel.updateModel(obj);
        }

        public bool deleteModel(int ID)
        {
            return MAModel.deleteModel(ID);
        }

        #endregion 

        #endregion

        #region Monitoring Data
        public List<MonitoringList> getMonitoringList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            return Monitoring.getMonitoringList(ref totalRecord, pageindex, pagesize);
        }
        #endregion

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
