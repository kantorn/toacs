using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Toacts.KanbanPost.Services.EF;
using Toacts.KanbanPost.Services.Objects;
using System.Transactions;

namespace Toacts.KanbanPost.Services.BLL
{
    public class ModelStructures
    {
        public static List<ModelStructureObject> getModelStructuresList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            List<ModelStructureObject> result = new List<ModelStructureObject>();
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    var query = from st in ef.MA_MODEL_STRUCTURE
                                join mp in ef.MA_PART on st.PART_ID equals mp.ID
                                select new ModelStructureObject
                                {
                                    ID = st.ID,
                                    PART_ID = st.PART_ID,
                                    PART_NAME = mp.PART_NAME,
                                    PART_NO = mp.PART_NO,
                                    PROD_LENGTH = mp.PROD_LENGTH,
                                    PART_TYPE = mp.PACKING_TYPE,
                                    UNIT_QTY = mp.PACK_PCS_LOT,
                                    LOT_SIZE = st.LOT_SIZE,
                                    LINE_SPEED = st.LINE_SPEED,
                                };
                    totalRecord = query.Count();
                    if (pageindex.HasValue && pagesize.HasValue)
                    {
                        if (query.Any())
                        {
                            IQueryable<ModelStructureObject> iqQuery = query.AsQueryable().OrderBy(x => x.ID);
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

        public static List<ModelStructureObject> getModelStructuresList()
        {
            List<ModelStructureObject> result = new List<ModelStructureObject>();
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    var query = from st in ef.MA_MODEL_STRUCTURE
                                join mp in ef.MA_PART on st.PART_ID equals mp.ID
                                select new ModelStructureObject
                                {
                                    ID = st.ID,
                                    PART_ID = st.PART_ID,
                                    PART_NAME = mp.PART_NAME,
                                    PART_NO = mp.PART_NO,
                                    PROD_LENGTH = mp.PROD_LENGTH,
                                    PART_TYPE = mp.PACKING_TYPE,
                                    UNIT_QTY = mp.PACK_PCS_LOT,
                                    LOT_SIZE = st.LOT_SIZE,
                                    LINE_SPEED = st.LINE_SPEED,
                                };
                    result = query.ToList();
                }
                catch
                {

                }
            }

            return result;
        }

        public static bool updateModelStructure(RequsetUpdateModelStructureObject updateObj)
        {
            bool isSuccess = false;
            MA_MODEL_STRUCTURE editMAStructure = new MA_MODEL_STRUCTURE();

            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    using (TransactionScope trans = EntityUtils.CreateTransactionScope())
                    {
                        ef.Connection.Open();

                        var obj = from oStructure in ef.MA_MODEL_STRUCTURE
                                  where oStructure.ID == updateObj.ID
                                  select oStructure;
                        if (obj.ToList().Count > 0)
                        {
                            editMAStructure = obj.ToList<MA_MODEL_STRUCTURE>()[0] as MA_MODEL_STRUCTURE;
                            ef.MA_MODEL_STRUCTURE.Detach(editMAStructure);

                            editMAStructure.PART_ID = updateObj.PART_ID;
                            editMAStructure.LOT_SIZE = updateObj.LOT_SIZE;
                            editMAStructure.LINE_SPEED = updateObj.LINE_SPEED;

                            ef.AttachUpdated(editMAStructure);
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

        public static bool createModelStructure(RequsetUpdateModelStructureObject createObj)
        {
            bool isSuccess = false;
            MA_MODEL_STRUCTURE addModelStructure = new MA_MODEL_STRUCTURE();

            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    using (TransactionScope trans = EntityUtils.CreateTransactionScope())
                    {
                        ef.Connection.Open();

                        addModelStructure.PART_ID = createObj.PART_ID;
                        addModelStructure.LOT_SIZE = createObj.LOT_SIZE;
                        addModelStructure.LINE_SPEED = createObj.LINE_SPEED;

                        ef.MA_MODEL_STRUCTURE.AddObject(addModelStructure);
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

        public static bool deleteModelStructure(int ID)
        {
            bool isSuccess = false;
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    using (TransactionScope trans = EntityUtils.CreateTransactionScope())
                    {
                        ef.Connection.Open();
                        var obj = from o in ef.MA_MODEL_STRUCTURE
                                  where o.ID == ID
                                  select o;
                        if (obj.ToList().Count > 0)
                        {
                            foreach (MA_MODEL_STRUCTURE delObj in obj)
                            {
                                ef.MA_MODEL_STRUCTURE.DeleteObject(delObj);
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