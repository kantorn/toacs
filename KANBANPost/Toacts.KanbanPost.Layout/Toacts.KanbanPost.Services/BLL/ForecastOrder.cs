using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Toacts.KanbanPost.Services.EF;
using System.Transactions;

namespace Toacts.KanbanPost.Services.BLL
{
    public static class ForecastOrder
    {

        #region ExecuteNonquery

        public static string Add(FORECAST_ORDER fc, TAC_KANBANEntities ceRef = null)
        {
            String results = null;
            bool isSuccess = false;
            bool isRootTransaction = true;

            TAC_KANBANEntities ce;
            if (ceRef == null)
            {
                //using new entity object
                ce = new TAC_KANBANEntities();
            }
            else
            {
                //using current entity object
                ce = ceRef;
                isRootTransaction = false;
            }

            // Start transaction for insert a Lease admin record.
            try
            {
                using (TransactionScope trans = EntityUtils.CreateTransactionScope())
                {
                    if (isRootTransaction)
                    {
                        // Manually open connection to prevent EF from auto closing
                        // connection and causing issues with future queries.
                        ce.Connection.Open();
                    }

                    // Checking for version
                    ce.FORECAST_ORDER.AddObject(fc);
                    ce.SaveChanges();
                    isSuccess = true;
                    trans.Complete();     // Transaction complete
                }
            }
            catch (OptimisticConcurrencyException oex)
            {
                // Log error in ELMAH for any diagnostic needs.

                results = "The current record has been modifed since you have " +
                          "last retrieved it. Please reload the record and " +
                          "attempt to save it again.";
            }
            catch (Exception ex)
            {
                // Error occurs
                // Log error in ELMAH for any diagnostic needs.

                isSuccess = false;
                results = "An error occurred saving the record. Please try again.";
            }
            finally
            {
                if (isRootTransaction)
                {
                    ce.Connection.Dispose();
                }
            }

            // Finally accept all changes from the transaction.
            if (isSuccess && isRootTransaction)
            {
                ce.Dispose();
            }

            return results;
        }

        public static string Update(FORECAST_ORDER fc, TAC_KANBANEntities ceRef = null)
        {
            String results = null;
            bool isSuccess = false;
            bool isRootTransaction = true;

            TAC_KANBANEntities ce;
            if (ceRef == null)
            {
                //using new entity object
                ce = new TAC_KANBANEntities();
            }
            else
            {
                //using current entity object
                ce = ceRef;
                isRootTransaction = false;
            }

            // Start transaction for update a Lease Admin record.
            try
            {
                using (TransactionScope trans = EntityUtils.CreateTransactionScope())
                {
                    if (isRootTransaction)
                    {
                        // Manually open connection to prevent EF from auto closing
                        // connection and causing issues with future queries.
                        ce.Connection.Open();
                    }

                    // Checking for version
                    ce.AttachUpdated(fc);
                    ce.SaveChanges(System.Data.Objects.SaveOptions.DetectChangesBeforeSave);

                    isSuccess = true;
                    trans.Complete();     // Transaction complete
                }
            }
            catch (OptimisticConcurrencyException oex)
            {
                // Log error in ELMAH for any diagnostic needs.

                results = "The current record has been modifed since you have " +
                          "last retrieved it. Please reload the record and " +
                          "attempt to save it again.";
            }
            catch (Exception ex)
            {
                // Error occurs
                // Log error in ELMAH for any diagnostic needs.

                isSuccess = false;
                results = "An error occurred saving the record. Please try again.";
            }
            finally
            {
                if (isRootTransaction)
                {
                    ce.Connection.Dispose();
                }
            }

            // Finally accept all changes from the transaction.
            if (isSuccess && isRootTransaction)
            {
                ce.Dispose();
            }

            return results;

        }

        public static String Delete(int id, TAC_KANBANEntities ceRef = null)
        {
            String sResult = null;
            bool isSuccess = false;
            bool isRootTransaction = true;

            TAC_KANBANEntities ce;
            if (ceRef == null)
            {
                //using new entity object
                ce = new TAC_KANBANEntities();
            }
            else
            {
                //using current entity object
                ce = ceRef;
                isRootTransaction = false;
            }

            try
            {
                using (TransactionScope trans = EntityUtils.CreateTransactionScope())
                {
                    if (isRootTransaction)
                    {
                        // Manually open connection to prevent EF from auto closing
                        // connection and causing issues with future queries.
                        ce.Connection.Open();
                    }

                    var forecastDetail = from com in ce.FORECAST_ORDER_DETAIL
                                           where com.FORCAST_ID == id
                                           select com;

                    if (forecastDetail.Count() > 0)
                    {
                        foreach (FORECAST_ORDER_DETAIL item in forecastDetail.ToList<FORECAST_ORDER_DETAIL>())
                        {
                            ce.DeleteObject(item);
                        }
                    }

                    //Delete record
                    var forecast = from doc in ce.FORECAST_ORDER
                                   where doc.ID == id
                                   select doc;

                    if (forecast.Any())
                    {
                        FORECAST_ORDER fc = forecast.FirstOrDefault();
                        ce.FORECAST_ORDER.DeleteObject(fc);
                    }
                    else
                    {
                        throw new NullReferenceException();
                    }

                    if (isRootTransaction)
                    {
                        // We tentatively save the changes so that we can finish 
                        // processing the transaction.foreach (var bk in books)
                        ce.SaveChanges(System.Data.Objects.SaveOptions.DetectChangesBeforeSave);
                    }

                    isSuccess = true;
                    trans.Complete();     //Transaction complete.
                }
            }
            catch (Exception ex)
            {
                // Log error in ELMAH for any diagnostic needs.
                

                sResult = ex.ToString();
                isSuccess = false;
            }
            finally
            {
                if (isRootTransaction)
                {
                    ce.Connection.Dispose();
                }
            }

            // Finally accept all changes from the transaction.
            if (isSuccess && isRootTransaction)
            {
                ce.AcceptAllChanges();
                ce.Dispose();
            }

            return sResult;
        }
        #endregion

    }

    public static class ForecastOrderDetail
    {
       
    }
 
    public static class ForecastUtility
    {   
        #region Method
        public static List<ForeCastObject> generateTemplate(DataTable dt)
        {
            List<ForeCastObject> res = new List<ForeCastObject>();
            Boolean bIsData = false;
            DataRow prevResult = null;
            int tempMonth = 0;
            ForeCastObject ftemp = new ForeCastObject();

            //get start table index
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if ((dt.Rows[i][0] != null) && (dt.Rows[i][0].ToString() == "Customer"))
                {
                    bIsData = true;
                    i++;
                    continue;
                }
                else if (bIsData)
                {
                    if ((prevResult == null) || (!string.IsNullOrEmpty(dt.Rows[i][0].ToString())))
                    {
                        prevResult = dt.Rows[i];
                        ftemp.Customer = dt.Rows[i][ForeCastObjectTemplate.indexCustomer].ToString();
                        ftemp.StartDate = dt.Rows[i][ForeCastObjectTemplate.indexStartDate].ToString();
                        ftemp.Model = dt.Rows[i][ForeCastObjectTemplate.indexModel].ToString();
                    }
                    else if (!string.IsNullOrEmpty(dt.Rows[i][ForeCastObjectTemplate.indexStartDate].ToString()))
                    {
                        ftemp.StartDate = dt.Rows[i][ForeCastObjectTemplate.indexStartDate].ToString();
                        ftemp.Model = dt.Rows[i][ForeCastObjectTemplate.indexModel].ToString();
                    }
                    else if (!string.IsNullOrEmpty(dt.Rows[i][ForeCastObjectTemplate.indexModel].ToString()))
                    {
                        ftemp.Model = dt.Rows[i][ForeCastObjectTemplate.indexModel].ToString();
                    }
                    else
                    {
                        ftemp.Customer = prevResult[ForeCastObjectTemplate.indexCustomer].ToString();
                        ftemp.StartDate = prevResult[ForeCastObjectTemplate.indexStartDate].ToString();
                        ftemp.Model = prevResult[ForeCastObjectTemplate.indexModel].ToString();
                    }
                    ftemp.PartName = dt.Rows[i][ForeCastObjectTemplate.indexPartName].ToString();
                    ftemp.Type = dt.Rows[i][ForeCastObjectTemplate.indexType].ToString();
                    ftemp.UnitQty = dt.Rows[i][ForeCastObjectTemplate.indexUnitQty].ToString();
                    ftemp.forecastDtl = new List<ForeCastObjectDetail>();
                    tempMonth = 0;
                    for (int j = 6; j < dt.Rows[i].ItemArray.Length - 1; j++)
                    {
                        if (!String.IsNullOrEmpty(dt.Rows[i][j + 1].ToString()))
                        {
                            ForeCastObjectDetail fcDetail = new ForeCastObjectDetail();
                            fcDetail.Month = tempMonth++;
                            fcDetail.PlanQty = dt.Rows[i][j].ToString();
                            fcDetail.ForecastQty = dt.Rows[i][j + 1].ToString();
                            ftemp.forecastDtl.Add(fcDetail);
                            j++;
                        }
                    }
                    res.Add(ftemp);
                }
            }
            return res;
        }
        #endregion
    }

    public static class ForeCastObjectTemplate
    {
        public static int indexCustomer { get { return 0; } }
        public static int indexStartDate { get { return 1; } }
        public static int indexModel { get { return 2; } }
        public static int indexPartName { get { return 3; } }
        public static int indexType { get { return 4; } }
        public static int indexUnitQty { get { return 5; } }
    }

    public  class ForeCastObject
    {
        public string Customer { get; set; }
        public string StartDate { get; set; }
        public string Model { get; set; }
        public string PartName { get; set; }
        public string Type { get; set; }
        public string UnitQty { get; set; }
        public List<ForeCastObjectDetail> forecastDtl { get; set; }
    }

    public class ForeCastObjectDetail
    {
        public int Month { get; set; }
        public string PlanQty { get; set; }
        public string ForecastQty { get; set; }
    }
}