using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Objects;
using System.Web;
using Toacts.KanbanPost.Services.BLL;


namespace Toacts.KanbanPost.Services.EF
{
    public partial class TAC_KANBANEntities
    {
      partial void OnContextCreated()
      {         
         this.SavingChanges += new System.EventHandler(context_SavingChanges);
      }
      
      private static void context_SavingChanges(object sender, EventArgs e)
      {     
         
         // Find any new or modified entities using our user/timestampting 
         // fields and update them accordingly.
         foreach (ObjectStateEntry entry in
                  ((ObjectContext)sender).ObjectStateManager.GetObjectStateEntries
                                          (EntityState.Added | EntityState.Modified))
         {
            // Only work with entities that have our user/timestamp records in them.
             try
             {
                 if (!entry.IsRelationship)
                 {
                     CurrentValueRecord entryValues = entry.CurrentValues;
                     System.Collections.Specialized.NameValueCollection updateField = CheckEntityUpdateField(entry.CurrentValues);
                    
                     HttpContext currContext = HttpContext.Current;
                     int userId = -1;
                     DateTime now = DateTime.Now;

                     if(currContext != null)
                     {
                        if (currContext.User.Identity.IsAuthenticated)
                        {
                            if (currContext.Session!= null && currContext.Session["userId"] != null)
                            {
                                userId = (int)currContext.Session["userId"];
                            }
                            else
                            {
                                //userId = Security.GetUserId(currContext.User.Identity.Name);
                            }
                        }
                     }

                    if (entry.State == EntityState.Modified)
                    {
                        if (updateField["updater_id"] == "true")
                        {
                            entryValues.SetInt32(entryValues.GetOrdinal("updater_id"), userId);
                        }

                        if (updateField["updated_at"] == "true")
                        {
                            entryValues.SetDateTime(entryValues.GetOrdinal("updated_at"), now);
                        }
                    }
                     
                    if (entry.State == EntityState.Added)
                    {
                        // If creator/updater values have not already been set, 
                        // default them to the current user/time. We will already have 
                        // creator/updater for version records.

                        for (int x = 0; x < updateField.Count; x++)
                        {
                            string key = updateField.Keys[x];
                            if (key.Contains("_id") && updateField[x] == "true")
                            {
                                // Sometimes when a new object is created, the creator_id is defaulted
                                // to 0. This is invalid for our processing.
                                if (entryValues.IsDBNull(entryValues.GetOrdinal(key)) ||
                                    entryValues.GetInt32(entryValues.GetOrdinal(key)) == 0
                                )
                                {
                                    entryValues.SetInt32(entryValues.GetOrdinal(key), userId);
                                }
                            }
                            else if (updateField.Keys[x].Contains("_at") && updateField[x] == "true")
                            {
                                // Sometimes when a new object is created, the year is defaulted to
                                // 1/1/0001. This is an invalid year or our processing
                                if (entryValues.IsDBNull(entryValues.GetOrdinal(key)) ||
                                    entryValues.GetDateTime(entryValues.GetOrdinal(key)).Year == 1
                                )
                                {
                                    entryValues.SetDateTime(entryValues.GetOrdinal(key), now);
                                }
                            }
                        }
                    }
                }
             }
             catch(Exception ex)
             {
                 //Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
             }            
         }
      }

      private static System.Collections.Specialized.NameValueCollection CheckEntityUpdateField(CurrentValueRecord entry)
      {
          System.Collections.Specialized.NameValueCollection returnResult = new System.Collections.Specialized.NameValueCollection(4);
          returnResult.Add("creator_id", "false");
          returnResult.Add("created_at", "false");
          returnResult.Add("updater_id", "false");
          returnResult.Add("updated_at", "false");
                  
          foreach (var field in entry.DataRecordInfo.FieldMetadata)
          {
              switch (field.FieldType.Name)
              {
                  case "creator_id":
                  case "created_at":
                  case "updater_id":
                  case "updated_at":
                      returnResult[field.FieldType.Name] = "true";
                      break;
              }
          }

          return returnResult;
      }
   }
}