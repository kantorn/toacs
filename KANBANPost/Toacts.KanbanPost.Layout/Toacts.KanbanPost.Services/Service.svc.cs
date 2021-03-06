﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using Toacts.KanbanPost.Services.EF;

namespace Toacts.KanbanPost.Services
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    public class Service1 : IService
    {
        public List<Toacts.KanbanPost.Services.BLL.KanbanList> getKanbanList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            return Toacts.KanbanPost.Services.BLL.Kanban.getKanbanList(ref totalRecord, pageindex, pagesize);
        }

        #region Master Data
        public List<Toacts.KanbanPost.Services.BLL.Part> getPartMaster(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            return Toacts.KanbanPost.Services.BLL.MAParts.getPartsList(ref totalRecord, pageindex, pagesize);
        }
        public List<Toacts.KanbanPost.Services.BLL.LosttimeMaster> getLosttimeMaster(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            return Toacts.KanbanPost.Services.BLL.MALosttime.getLosttimeList(ref totalRecord, pageindex, pagesize);
        }

        public List<Toacts.KanbanPost.Services.BLL.LineMaster> getLineMaster(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            return Toacts.KanbanPost.Services.BLL.MALine.getLineList(ref totalRecord, pageindex, pagesize);
        }

        public List<Toacts.KanbanPost.Services.BLL.OpeatorRoleMaster> getOperatorRoleMaster(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            return Toacts.KanbanPost.Services.BLL.MAOperatorRoles.getOperatorRoleList(ref totalRecord, pageindex, pagesize);
        }

        public List<Toacts.KanbanPost.Services.BLL.CustomerMaster> getCustomerMaster(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            return Toacts.KanbanPost.Services.BLL.MACustomer.getCustomerMasterList(ref totalRecord, pageindex, pagesize);
        }

        public List<Toacts.KanbanPost.Services.BLL.OperatorMaster> getOperatorMaster(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            return Toacts.KanbanPost.Services.BLL.MAOperator.getOperatorMasterList(ref totalRecord, pageindex, pagesize);
        }
        #endregion

        #region Monitoring Data
        public List<Toacts.KanbanPost.Services.BLL.MonitoringList> getMonitoringList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            return Toacts.KanbanPost.Services.BLL.Monitoring.getMonitoringList(ref totalRecord, pageindex, pagesize);
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
