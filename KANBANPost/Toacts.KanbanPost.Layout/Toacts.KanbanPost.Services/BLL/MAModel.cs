using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Toacts.KanbanPost.Services.EF;
using Toacts.KanbanPost.Services.Objects;
using System.Transactions;


namespace Toacts.KanbanPost.Services.BLL
{
    public class MAModel
    {
        public static List<MAModelObject> getModelList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            List<MAModelObject> result = new List<MAModelObject>();
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    var query = from m in ef.MA_MODEL
                                join c in ef.MA_CUSTOMER on m.CUSTOMER_ID equals c.ID
                                select new MAModelObject
                                {
                                    ID = m.ID,
                                    CUSTOMER_ID = m.CUSTOMER_ID,
                                    MODEL_NAME = m.MODEL_NAME,
                                    PREFIX = m.PREFIX,
                                    CUSTOMER_NAME = c.CUSTOMER_NAME,
                                    CUSTOMER_SHOT = c.CUSTOMER_SHOT
                                };
                    totalRecord = query.Count();
                    if (pageindex.HasValue && pagesize.HasValue)
                    {
                        if (query.Any())
                        {
                            IQueryable<MAModelObject> iqQuery = query.AsQueryable().OrderBy(x => x.ID);
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

        public static bool createModel(RequestMAModelObject reqObj)
        {
            bool isSuccess = false;
            MA_MODEL createObject = new MA_MODEL();

            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    using (TransactionScope trans = EntityUtils.CreateTransactionScope())
                    {
                        ef.Connection.Open();

                        createObject.CUSTOMER_ID = reqObj.CUSTOMER_ID;
                        createObject.MODEL_NAME = reqObj.MODEL_NAME;
                        createObject.PREFIX = reqObj.PREFIX;

                        ef.MA_MODEL.AddObject(createObject);
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

        public static bool updateModel(RequestMAModelObject reqObj)
        {
            bool isSuccess = false;
            MA_MODEL updateObject = new MA_MODEL();

            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    using (TransactionScope trans = EntityUtils.CreateTransactionScope())
                    {
                        ef.Connection.Open();

                        var obj = from o in ef.MA_MODEL
                                  where o.ID == reqObj.ID
                                  select o;
                        if (obj.ToList().Count > 0)
                        {
                            updateObject = obj.ToList<MA_MODEL>()[0] as MA_MODEL;
                            ef.MA_MODEL.Detach(updateObject);

                            updateObject.CUSTOMER_ID = reqObj.CUSTOMER_ID;
                            updateObject.MODEL_NAME = reqObj.MODEL_NAME;
                            updateObject.PREFIX = reqObj.PREFIX;

                            ef.AttachUpdated(updateObject);
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

        public static bool deleteModel(int ID)
        {
            bool isSuccess = false;
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    using (TransactionScope trans = EntityUtils.CreateTransactionScope())
                    {
                        ef.Connection.Open();
                        var obj = from o in ef.MA_MODEL
                                  where o.ID == ID
                                  select o;
                        if (obj.ToList().Count > 0)
                        {
                            foreach (MA_MODEL delObj in obj)
                            {
                                ef.MA_MODEL.DeleteObject(delObj);
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