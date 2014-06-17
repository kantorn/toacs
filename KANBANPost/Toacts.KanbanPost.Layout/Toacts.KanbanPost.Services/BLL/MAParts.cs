using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Toacts.KanbanPost.Services.EF;
using Toacts.KanbanPost.Services.Objects;
using System.Transactions;

namespace Toacts.KanbanPost.Services.BLL
{
    public class MAParts
    {
        public static List<Part> getPartsList(ref int totalRecord, int? pageindex = null, int? pagesize = null)
        {
            List<Part> result = new List<Part>();
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    var query = from mp in ef.MA_PART
                                select new Part 
                                {
                                    ID = mp.ID,
                                    PART_NAME = mp.PART_NAME,
                                    SHORT_NAME = mp.SHORT_NAME,
                                    PART_NO = mp.PART_NO,
                                    PROD_LENGTH = mp.PROD_LENGTH,
                                    PACKING_TYPE = mp.PACKING_TYPE,
                                    UNIT_QTY = mp.PACK_PCS_LOT,
                                    PLASTIC_1 = mp.PLASTIC_1,
                                    PLASTIC_2 = mp.PLASTIC_2,
                                    PLASTIC_3 = mp.PLASTIC_3,
                                    METAL = mp.METAL,
                                    PROFILE_1 = mp.PROFILE_1,
                                    PROFILE_2 = mp.PROFILE_2,
                                    EXTCUT = mp.EXTCUT,
                                    PACK_PCS_LOT = mp.PACK_PCS_LOT,
                                    PCS_TRAY = mp.PCS_TRAY,
                                    PCS_CART_LOT = mp.PCS_CART_LOT,
                                    SIZECART = mp.SIZECART,
                                    LENGTH = mp.LENGTH,
                                    LINE_SPEED = mp.LINE_SPEED
                                };
                    totalRecord = query.Count();
                    if (pageindex.HasValue && pagesize.HasValue)
                    {
                        if (query.Any())
                        {
                            IQueryable<Part> iqQuery = query.AsQueryable().OrderBy(x => x.ID);
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

        public static List<Part> getPartsList()
        {
            List<Part> result = new List<Part>();
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    var query = from mp in ef.MA_PART
                                select new Part
                                {
                                    ID = mp.ID,
                                    PART_NAME = mp.PART_NAME,
                                    SHORT_NAME = mp.SHORT_NAME,
                                    PART_NO = mp.PART_NO,
                                    PROD_LENGTH = mp.PROD_LENGTH,
                                    PACKING_TYPE = mp.PACKING_TYPE,
                                    UNIT_QTY = mp.PACK_PCS_LOT,
                                    PLASTIC_1 = mp.PLASTIC_1,
                                    PLASTIC_2 = mp.PLASTIC_2,
                                    PLASTIC_3 = mp.PLASTIC_3,
                                    METAL = mp.METAL,
                                    PROFILE_1 = mp.PROFILE_1,
                                    PROFILE_2 = mp.PROFILE_2,
                                    EXTCUT = mp.EXTCUT,
                                    PACK_PCS_LOT = mp.PACK_PCS_LOT,
                                    PCS_TRAY = mp.PCS_TRAY,
                                    PCS_CART_LOT = mp.PCS_CART_LOT,
                                    SIZECART = mp.SIZECART,
                                    LENGTH = mp.LENGTH,
                                    LINE_SPEED = mp.LINE_SPEED
                                };
                    result = query.ToList();
                }
                catch
                {

                }
            }

            return result;
        }

        public static bool updatePart(Part part)
        {
            bool isSuccess = false;
            MA_PART editMAPart = new MA_PART();

            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    using (TransactionScope trans = EntityUtils.CreateTransactionScope())
                    {
                        ef.Connection.Open();

                        var obj = from oPart in ef.MA_PART
                                  where oPart.ID == part.ID
                                  select oPart;
                        if (obj.ToList().Count > 0)
                        {
                            editMAPart = obj.ToList<MA_PART>()[0] as MA_PART;
                            ef.MA_PART.Detach(editMAPart);

                            editMAPart.PACKING_TYPE = part.PACKING_TYPE;
                            editMAPart.PART_NAME = part.PART_NAME;
                            editMAPart.PART_NO = part.PART_NO;
                            editMAPart.PROD_LENGTH = part.PROD_LENGTH;
                            editMAPart.PACK_PCS_LOT = part.UNIT_QTY;
                            editMAPart.PART_NAME = part.PART_NAME;
                            editMAPart.SHORT_NAME = part.SHORT_NAME;
                            editMAPart.PART_NO = part.PART_NO;
                            editMAPart.PROD_LENGTH = part.PROD_LENGTH;
                            editMAPart.PACKING_TYPE = part.PACKING_TYPE;
                            editMAPart.PACK_PCS_LOT = part.PACK_PCS_LOT;
                            editMAPart.PLASTIC_1 = part.PLASTIC_1;
                            editMAPart.PLASTIC_2 = part.PLASTIC_2;
                            editMAPart.PLASTIC_3 = part.PLASTIC_3;
                            editMAPart.METAL = part.METAL;
                            editMAPart.PROFILE_1 = part.PROFILE_1;
                            editMAPart.PROFILE_2 = part.PROFILE_2;
                            editMAPart.EXTCUT = part.EXTCUT;
                            editMAPart.PACK_PCS_LOT = part.PACK_PCS_LOT;
                            editMAPart.PCS_TRAY = part.PCS_TRAY;
                            editMAPart.PCS_CART_LOT = part.PCS_CART_LOT;
                            editMAPart.SIZECART = part.SIZECART;
                            editMAPart.LENGTH = part.LENGTH;
                            editMAPart.LINE_SPEED = part.LINE_SPEED;

                            ef.AttachUpdated(editMAPart);
                            ef.SaveChanges();
                            trans.Complete();
                            isSuccess = true;
                        }
                    }
                }
                catch(Exception e)
                {

                }
                finally
                {
                    ef.Connection.Dispose();
                }
            }
            return isSuccess;
        }

        public static bool createPart(Part part)
        {
            bool isSuccess = false;
            MA_PART addMAPart = new MA_PART();

            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    using (TransactionScope trans = EntityUtils.CreateTransactionScope())
                    {
                        ef.Connection.Open();

                        addMAPart.PACKING_TYPE = part.PACKING_TYPE;
                        addMAPart.PART_NAME = part.PART_NAME;
                        addMAPart.PART_NO = part.PART_NO;
                        addMAPart.PROD_LENGTH = part.PROD_LENGTH;
                        addMAPart.PACK_PCS_LOT = part.UNIT_QTY;
                        addMAPart.PART_NAME = part.PART_NAME;
                        addMAPart.SHORT_NAME = part.SHORT_NAME;
                        addMAPart.PART_NO = part.PART_NO;
                        addMAPart.PROD_LENGTH = part.PROD_LENGTH;
                        addMAPart.PACKING_TYPE = part.PACKING_TYPE;
                        addMAPart.PACK_PCS_LOT = part.PACK_PCS_LOT;
                        addMAPart.PLASTIC_1 = part.PLASTIC_1;
                        addMAPart.PLASTIC_2 = part.PLASTIC_2;
                        addMAPart.PLASTIC_3 = part.PLASTIC_3;
                        addMAPart.METAL = part.METAL;
                        addMAPart.PROFILE_1 = part.PROFILE_1;
                        addMAPart.PROFILE_2 = part.PROFILE_2;
                        addMAPart.EXTCUT = part.EXTCUT;
                        addMAPart.PACK_PCS_LOT = part.PACK_PCS_LOT;
                        addMAPart.PCS_TRAY = part.PCS_TRAY;
                        addMAPart.PCS_CART_LOT = part.PCS_CART_LOT;
                        addMAPart.SIZECART = part.SIZECART;
                        addMAPart.LENGTH = part.LENGTH;
                        addMAPart.LINE_SPEED = part.LINE_SPEED;

                        ef.MA_PART.AddObject(addMAPart);
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

        public static bool deletePart(int ID)
        {
            bool isSuccess = false;
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                try
                {
                    using (TransactionScope trans = EntityUtils.CreateTransactionScope())
                    {
                        ef.Connection.Open();
                        var obj = from oPart in ef.MA_PART
                                  where oPart.ID == ID
                                  select oPart;
                        if (obj.ToList().Count > 0)
                        {
                            foreach (MA_PART delObj in obj)
                            {
                                ef.MA_PART.DeleteObject(delObj);
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

        public static Part getPartByID(int ID)
        {
            Part partObj = new Part();
            using (TAC_KANBANEntities ef = new TAC_KANBANEntities())
            {
                var obj = from oPart in ef.MA_PART
                          where oPart.ID == ID
                          select oPart;
                if (obj.ToList().Count > 0)
                {
                    MA_PART part = obj.ToList()[0];
                    partObj.ID = part.ID;
                    partObj.PACKING_TYPE = part.PACKING_TYPE;
                    partObj.PART_NAME = part.PART_NAME;
                    partObj.PART_NO = part.PART_NO;
                    partObj.PROD_LENGTH = part.PROD_LENGTH;
                    partObj.PACK_PCS_LOT = part.PACK_PCS_LOT;
                    partObj.PART_NAME = part.PART_NAME;
                    partObj.SHORT_NAME = part.SHORT_NAME;
                    partObj.PART_NO = part.PART_NO;
                    partObj.PROD_LENGTH = part.PROD_LENGTH;
                    partObj.PACKING_TYPE = part.PACKING_TYPE;
                    partObj.PACK_PCS_LOT = part.PACK_PCS_LOT;
                    partObj.PLASTIC_1 = part.PLASTIC_1;
                    partObj.PLASTIC_2 = part.PLASTIC_2;
                    partObj.PLASTIC_3 = part.PLASTIC_3;
                    partObj.METAL = part.METAL;
                    partObj.PROFILE_1 = part.PROFILE_1;
                    partObj.PROFILE_2 = part.PROFILE_2;
                    partObj.EXTCUT = part.EXTCUT;
                    partObj.PACK_PCS_LOT = part.PACK_PCS_LOT;
                    partObj.PCS_TRAY = part.PCS_TRAY;
                    partObj.PCS_CART_LOT = part.PCS_CART_LOT;
                    partObj.SIZECART = part.SIZECART;
                    partObj.LENGTH = part.LENGTH;
                    partObj.LINE_SPEED = part.LINE_SPEED;
                }
            }
            return partObj;
        }
    }
}