using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Toacts.KanbanPost.Services.EF;
using Toacts.KanbanPost.Services.Objects;
using System.Transactions;

namespace Toacts.KanbanPost.Services.BLL
{
    public class MACustomers
    {
        public static List<MACustomerObject> getModelCustomerList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            List<MACustomerObject> result = new List<MACustomerObject>();
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    var query = from c in ef.MA_CUSTOMER
                                select new MACustomerObject
                                {
                                    ID = c.ID,
                                    CUSTOMER_SHOT = c.CUSTOMER_SHOT,
                                    CUSTOMER_NAME = c.CUSTOMER_NAME
                                };
                    totalRecord = query.Count();
                    if (pageindex.HasValue && pagesize.HasValue)
                    {
                        if (query.Any())
                        {
                            IQueryable<MACustomerObject> iqQuery = query.AsQueryable().OrderBy(x => x.ID);
                            result = iqQuery.Skip(pagesize.Value * (pageindex.Value - 1)).Take(pagesize.Value).ToList();
                        }
                    }
                    else if (query.Any())
                    {
                        result = query.ToList();
                    }
                }
                catch
                {

                }
            }

            return result;
        }

        public static List<MACustomerObject> getModelCustomerList()
        {
            List<MACustomerObject> result = new List<MACustomerObject>();
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    var query = from c in ef.MA_CUSTOMER
                                select new MACustomerObject
                                {
                                    ID = c.ID,
                                    CUSTOMER_SHOT = c.CUSTOMER_SHOT,
                                    CUSTOMER_NAME = c.CUSTOMER_NAME
                                };
                    result = query.ToList();
                }
                catch
                {

                }
            }

            return result;
        }

        public static bool updateModelCustomer(RequsetMACustomerObject reqObj)
        {
            bool isSuccess = false;
            MA_CUSTOMER updateObj = new MA_CUSTOMER();

            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    using (TransactionScope trans = EntityUtils.CreateTransactionScope())
                    {
                        ef.Connection.Open();

                        var obj = from o in ef.MA_CUSTOMER
                                  where o.ID == reqObj.ID
                                  select o;
                        if (obj.ToList().Count > 0)
                        {
                            updateObj = obj.ToList<MA_CUSTOMER>()[0] as MA_CUSTOMER;
                            ef.MA_CUSTOMER.Detach(updateObj);

                            updateObj.CUSTOMER_NAME = reqObj.CUSTOMER_NAME;
                            updateObj.CUSTOMER_SHOT = reqObj.CUSTOMER_SHOT;

                            ef.AttachUpdated(updateObj);
                            ef.SaveChanges();
                            trans.Complete();
                            isSuccess = true;
                        }
                    }
                }
                catch (Exception e)
                {

                }
                finally
                {
                    ef.Connection.Dispose();
                }
            }
            return isSuccess;
        }

        public static bool createModelCustomer(RequsetMACustomerObject reqObj)
        {
            bool isSuccess = false;
            MA_CUSTOMER createObj = new MA_CUSTOMER();

            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    using (TransactionScope trans = EntityUtils.CreateTransactionScope())
                    {
                        ef.Connection.Open();

                        createObj.CUSTOMER_SHOT = reqObj.CUSTOMER_SHOT;
                        createObj.CUSTOMER_NAME = reqObj.CUSTOMER_NAME;

                        ef.MA_CUSTOMER.AddObject(createObj);
                        ef.SaveChanges();
                        trans.Complete();
                        isSuccess = true;
                    }
                }
                catch (Exception e)
                {

                }
                finally
                {
                    ef.Connection.Dispose();
                }
            }
            return isSuccess;
        }

        public static bool deleteModelCustomer(int ID)
        {
            bool isSuccess = false;
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    using (TransactionScope trans = EntityUtils.CreateTransactionScope())
                    {
                        ef.Connection.Open();
                        var obj = from o in ef.MA_CUSTOMER
                                  where o.ID == ID
                                  select o;
                        if (obj.ToList().Count > 0)
                        {
                            foreach (MA_CUSTOMER delObj in obj)
                            {
                                ef.MA_CUSTOMER.DeleteObject(delObj);
                            }
                            ef.SaveChanges();
                            trans.Complete();
                            isSuccess = true;
                        }
                    }
                }
                catch (Exception e)
                {

                }
                finally
                {
                    ef.Connection.Dispose();
                }
            }
            return isSuccess;
        }
    }
}