using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Transactions;
using System.Data.Objects;
using System.Data;
using System.Data.Objects.DataClasses;

namespace Toacts.KanbanPost.Services.EF
{

    public static class EntityUtils
    {
        #region Context Extention

        public static TransactionScope CreateTransactionScope()
        {
            var transactionOptions = new TransactionOptions();
            transactionOptions.IsolationLevel = System.Transactions.IsolationLevel.ReadCommitted;
            transactionOptions.Timeout = new TimeSpan(0);

            return new TransactionScope(TransactionScopeOption.Required, transactionOptions);
        }

        public static void AttachUpdated(this ObjectContext objContext, EntityObject objDetached)
        {
            if (objDetached.EntityState == EntityState.Detached)
            {
                object original = null;
                if (objContext.TryGetObjectByKey(objDetached.EntityKey, out original))
                {
                    objContext.ApplyCurrentValues(objDetached.EntityKey.EntitySetName, objDetached);
                }
                else
                {
                    throw new ObjectNotFoundException();
                }
            }
        }

        #endregion
    }
}