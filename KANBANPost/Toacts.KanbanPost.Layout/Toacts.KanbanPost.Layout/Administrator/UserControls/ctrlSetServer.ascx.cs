using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Toacts.KanbanPost.Layout.Helper;
using Utilities.DB;
using System.Threading;

namespace Toacts.KanbanPost.Layout.Administrator.UserControls
{
    public partial class ctrlSetServer : System.Web.UI.UserControl
    {

        #region Properties

        public delegate void EventHandler(Object obj, EventArgs e);
        public event EventHandler Start;
        public event EventHandler Success;
        public event EventHandler Fail;


        private clsDatabaseConfig _objDatabaseConfig = new clsDatabaseConfig();
        public clsDatabaseConfig objDatabaseConfig
        {
            get { return this._objDatabaseConfig; }
            set { _objDatabaseConfig = value; }
        }


        private bool _Enabled;
        public bool Enabled
        {
            get { return _Enabled; }
            set
            {
                _Enabled = value;
                List<Control> allControls = new List<Control>();
                Utilities.Web.Common.GetControlList<Control>(this.Controls, allControls);
                foreach (Control childControl in allControls )
                {
                    Utilities.Web.Common.DisableControls(childControl, value);
                }
            }
        }

        #endregion

        #region Method

        private void setServerStart()
        {
            Start(this, new EventArgs());
        }
        private void setServerComplete()
        {
            Success(this,new EventArgs());
        }

        private void setServerFail(string message)
        {
            Fail(this, new EventArgs());
        }

        private void BindingData()
        {
            SessionHelper.dbCommon.setServerOnComplete += new Common.OnComplete_Handler(setServerComplete);
            SessionHelper.dbCommon.setServerOnFail += new Common.OnFail_Handler(setServerFail);

            if (SessionHelper.dbCommon.listServer.Any())
            {
                this.txtServerName.Visible = false;
                this.drpServerName.DataSource = SessionHelper.dbCommon.listServer;
                this.drpServerName.DataBind();   
            }
            else
            {
                this.txtServerName.Visible = true;
            }
            this.drpServerName.Visible = !this.txtServerName.Visible;
        }

        public bool IsServerDetailsValid()
        {
            if (String.IsNullOrEmpty(drpServerName.Text.Trim()) && String.IsNullOrEmpty(txtServerName.Text))
            {
                return false;
            }

            if (chkSQLAuth.Checked)
            {
                if (txtUserName.Text.Trim() == "")
                {
                    return false;
                }

                if (txtPassword.Text.Trim() == "")
                {
                    return false;
                }
            }

            return true;
        }
        #endregion
        #region Page Event
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingData();
            }
        }

        protected void chkWindowsAuth_CheckedChanged(object sender, EventArgs e)
        {
            pnlSQLAuthen.Visible = false;
        }

        protected void chkSQLAuth_CheckedChanged(object sender, EventArgs e)
        {
            pnlSQLAuthen.Visible = true;
        }

        protected void btnSetServer_Click(object sender, EventArgs e)
        {
            if (IsServerDetailsValid())
            {
                setServerStart();
                this._objDatabaseConfig = new clsDatabaseConfig();
                this.objDatabaseConfig.ServerName = !String.IsNullOrEmpty(drpServerName.Text.Trim())
                                                   ? drpServerName.Text.Trim()
                                                   : txtServerName.Text.Trim();
                this.objDatabaseConfig.IsIntegratedSecurity = chkWindowsAuth.Checked;
                this.objDatabaseConfig.UserName = txtUserName.Text.Trim();
                this.objDatabaseConfig.Password = txtPassword.Text.Trim();
                SessionHelper.dbCommon.OnSetServer(objDatabaseConfig);
            }
        }
        #endregion
    }
}