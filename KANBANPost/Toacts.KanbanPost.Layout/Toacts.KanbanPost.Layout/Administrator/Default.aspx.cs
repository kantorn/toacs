using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Toacts.KanbanPost.Layout.Helper;
using Utilities.DB;
using System.Threading;

namespace Toacts.KanbanPost.Layout.Administrator
{
    public partial class Default : System.Web.UI.Page
    {
        
        #region Page Event

        protected void Page_Init(object sender, EventArgs e)
        {
            ctrlSetServer1.Success += new UserControls.ctrlSetServer.EventHandler(setServerSuccess);
            ctrlSetServer1.Fail += new UserControls.ctrlSetServer.EventHandler(setServerFail);
            ctrlSetServer1.Start += new UserControls.ctrlSetServer.EventHandler(setServerStart);

            SessionHelper.dbCommon.setupOnComplete += new Common.OnComplete_Handler(setupComplete);
            SessionHelper.dbCommon.setupOnFail += new Common.OnFail_Handler(setupFail);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        private bool IsConnectionDetailsValid()
        {
            if (!ctrlSetServer1.IsServerDetailsValid())
            {
                return false;
            }

            if (chkExistDB.Checked)
            {
                if (!fileDBUpload.HasFile)
                {
                    return false;
                }

                if (Path.GetExtension(fileDBUpload.FileName.Trim()).ToLower() != ".mdf")
                {
                    return false;
                }
            }

            return true;
        }
        #endregion

        #region Metod

        protected void setServerStart(Object obj, EventArgs e)
        {
            Timer1.Enabled = true;
            updatePnlDBSelect.Update();
        }
        protected void setServerSuccess(Object obj, EventArgs e)
        {
            Timer1.Enabled = false;
            updatePnlDBSelect.Update();
            pnlDBSelect.Visible = true;
        }

        protected void setServerFail(Object obj, EventArgs e)
        {

        }

        protected void setupComplete()
        {

        }

        protected void setupFail(String message)
        {

        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
            ctrlSetServer1.Enabled = false;
            updatePnlDBSelect.Update();
            pnlDBSelect.Visible = true;
        }

        protected void chkNewDB_CheckedChanged(object sender, EventArgs e)
        {
            this.fileDBUpload.Enabled = false;
        }

        protected void chkExistDB_CheckedChanged(object sender, EventArgs e)
        {
            this.fileDBUpload.Enabled = true;
        }

        protected void btnSetup_Click(object sender, EventArgs e)
        {
            if (IsConnectionDetailsValid())
            {
                ctrlSetServer1.objDatabaseConfig.IsNewDatabase = chkNewDB.Checked;
                ctrlSetServer1.objDatabaseConfig.NewDatabaseName = "TAC_KANBAN.mdf";
                string applicationPath = HttpContext.Current.Server.MapPath("~/");
                DirectoryInfo appDirectory = new DirectoryInfo(applicationPath);
                applicationPath = appDirectory.FullName + "App_Data";
                ctrlSetServer1.objDatabaseConfig.NewDatabaseLocation = applicationPath;
                ctrlSetServer1.objDatabaseConfig.AttachDBFileName = fileDBUpload.FileName;
                SessionHelper.dbCommon.OnSetup(ctrlSetServer1.objDatabaseConfig);
            }
        }
        #endregion
        

    }
}