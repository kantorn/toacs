using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Web;
using System.Windows.Forms;
using System.IO;
using Microsoft.Win32;

namespace Utilities.DB
{
    public  class Common
    {
        #region Attibutes
        //back ground worker
        private static BackgroundWorker bgwSetServer = new BackgroundWorker();
        private static BackgroundWorker bgwSetupConnection = new BackgroundWorker();

        //event handler
        public delegate void OnComplete_Handler();
        public delegate void OnFail_Handler(string message);

        //set server event
        public event OnComplete_Handler setServerOnComplete;
        public event OnFail_Handler setServerOnFail;

        //setup db event
        public event OnComplete_Handler setupOnComplete;
        public event OnFail_Handler setupOnFail;
        #endregion

        #region Properties

        private HttpContext _currentContext;
        public HttpContext currentContext
        {
            set { _currentContext = value; }
            get { return _currentContext; }
        }
        private List<string> _listServer  = new List<string>();
        public List<string> listServer
        {
            get { return _listServer; }
        }

        private clsDatabaseConfig _objDatabaseConfig = new clsDatabaseConfig();
        public clsDatabaseConfig objDatabaseConfig
        {
            get { return _objDatabaseConfig; }
            set { _objDatabaseConfig = value; }
        }

        private int _setServerProgress;
        public int setServerProgress
        {
            get { return _setServerProgress; }
        }
        private int _setupProgress;
        public int setupProgress
        {
            get { return _setupProgress; }
        }

        #endregion

        public  Common()
        {
            bgwSetServer.DoWork += bgwSetServer_DoWork;
            bgwSetServer.ProgressChanged += bgwSetServer_ProgressChanged;
            bgwSetServer.RunWorkerCompleted += bgwSetServer_RunWorkerCompleted;
            bgwSetServer.WorkerReportsProgress = true;

            bgwSetupConnection.DoWork += bgwSetupConnection_DoWork;
            bgwSetupConnection.ProgressChanged += bgwSetupConnection_ProgressChanged;
            bgwSetupConnection.RunWorkerCompleted += bgwSetupConnection_RunWorkerCompleted;
            bgwSetupConnection.WorkerReportsProgress = true;

            FillSqlServerInstalledInstances();
        }

        public void OnSetServer(clsDatabaseConfig config = null)
        {
            if (config == null)
            {
                bgwSetServer.RunWorkerAsync(this._objDatabaseConfig);
            }
            else
            {
                bgwSetServer.RunWorkerAsync(config);
            }
        }

        public void OnSetup(clsDatabaseConfig config = null)
        {
            if (config == null)
            {
                bgwSetupConnection.RunWorkerAsync(this._objDatabaseConfig);
            }
            else
            {
                bgwSetupConnection.RunWorkerAsync(config);
            }
        }

        #region Method

        private void FillSqlServerInstalledInstances()
        {
            //Doesn't require SQLBrowser service to be running. Better Code.
            //Microsoft.Win32.RegistryKey k = Microsoft.Win32.Registry.LocalMachine.OpenSubKey("SOFTWARE\\Microsoft\\Microsoft SQL Server");
            var localMachine = RegistryKey.OpenBaseKey(RegistryHive.LocalMachine, RegistryView.Registry64);
            var rk = localMachine.OpenSubKey("SOFTWARE\\Microsoft\\Microsoft SQL Server");
            foreach (string strServer in ((String[])rk.GetValue("InstalledInstances", new string[] { })))
            {
                _listServer.Add(".\\" + strServer);
            }
        }
        #endregion

        #region Set Server
        private void bgwSetServer_DoWork(object sender, DoWorkEventArgs e)
        {
            clsDatabaseConfig objdb = (clsDatabaseConfig)e.Argument;
            e.Result = objdb.IsServerNameValid();
        }

        private void bgwSetServer_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            string errorMessage = e.Result.ToString();
            if (errorMessage == ErrorStates.Success.ToString())
            {
                setServerComplete();
            }
            else
            {
                setServerFail("Following error occured in validating server." + Environment.NewLine + errorMessage);
            }
        }

        private void bgwSetServer_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            this._setServerProgress = e.ProgressPercentage;
        }

        protected virtual void setServerComplete()
        {
            setServerOnComplete();
        }

        protected virtual void setServerFail(string message)
        {
            setServerOnFail(message);
        }
        #endregion

        #region Setup 
        
        private void bgwSetupConnection_DoWork(object sender, DoWorkEventArgs e)
        {
            clsDatabaseConfig objdb = (clsDatabaseConfig)e.Argument;
            string errorMessage = "";
            string applicationPath = Path.GetDirectoryName(Application.ExecutablePath);
            //application
            if (applicationPath != null && applicationPath.IndexOf("bin") > -1)
            {
                applicationPath = applicationPath.Substring(0, applicationPath.IndexOf("bin")) + "DB";
            }
            //web server
            else
            {
                applicationPath = _currentContext.Server.MapPath("~/");
                DirectoryInfo appDirectory = new DirectoryInfo(applicationPath);
                applicationPath = appDirectory.Parent.FullName + "\\Utilities";
            }
            if (objdb.IsNewDatabase)
            {

                bgwSetupConnection.ReportProgress(10, "(1/6) Creating the database file...");
                errorMessage = objdb.CreateNewDatabase();
                if (errorMessage != ErrorStates.Success.ToString())
                {
                    bgwSetupConnection.ReportProgress(100, "Creating the database failed.");
                    e.Result = "Following error occured while creating the database:" + Environment.NewLine + errorMessage;
                    return;
                }

                bgwSetupConnection.ReportProgress(30, "(2/6) Verifying if database was attached...");
                errorMessage = objdb.IsNewDatabaseAttached();
                if (errorMessage == ErrorStates.Failure.ToString())
                {
                    bgwSetupConnection.ReportProgress(100, "Database was not attached to the server.");
                    e.Result = "Database was not attached to the server." + Environment.NewLine + "Try attaching it manually and rerun the configuration process";
                    return;
                }
                else if (errorMessage != ErrorStates.Success.ToString())
                {
                    bgwSetupConnection.ReportProgress(100, "Verifying the attached database failed.");
                    e.Result = "Following error occured while verifying the attached database:" + Environment.NewLine + errorMessage;
                    return;
                }

                bgwSetupConnection.ReportProgress(50, "(3/6) Installing schema onto the blank database...");
                errorMessage = objdb.InstallScriptFile(applicationPath + "\\Scripts\\InstallDatabaseSchema.sql");
                if (errorMessage != ErrorStates.Success.ToString())
                {
                    bgwSetupConnection.ReportProgress(100, "Installing schema to the database failed.");
                    e.Result = "Following error occured while installing schema to the database:" + Environment.NewLine + errorMessage;
                    return;
                }

                bgwSetupConnection.ReportProgress(70, "(4/6) Verifying the integrifty of database schema...");
                errorMessage = objdb.VerifySchema(applicationPath + "\\DB\\Scripts\\InstallDatabaseSchema.sql");
                if (errorMessage != ErrorStates.Success.ToString())
                {
                    bgwSetupConnection.ReportProgress(100, "Verifying integrity of the database schema failed.");
                    e.Result = "Following error occured while verifying integrity of the database schema:" + Environment.NewLine + errorMessage;
                    return;
                }

                bgwSetupConnection.ReportProgress(90, "(5/6) Fetching connection settings...");
                System.Threading.Thread.Sleep(500);
                e.Result = "|Success|" + objdb.GetConnectionString();

                bgwSetupConnection.ReportProgress(100, "(6/6) Database connection complete. Opening application...");
                System.Threading.Thread.Sleep(1000);
            }
            else
            {
                bgwSetupConnection.ReportProgress(10, "(1/5) Attaching the database file...");
                errorMessage = objdb.AttachExistingDatabase();
                if (errorMessage != ErrorStates.Success.ToString())
                {
                    bgwSetupConnection.ReportProgress(100, "Attaching the database failed.");
                    e.Result = "Following error occured while attaching the database:" + Environment.NewLine + errorMessage;
                    return;
                }

                bgwSetupConnection.ReportProgress(30, "(2/5) Verifying if database was attached...");
                errorMessage = objdb.IsExistingDatabaseAttached();
                if (errorMessage == ErrorStates.Failure.ToString())
                {
                    bgwSetupConnection.ReportProgress(100, "Database was not attached to the server.");
                    e.Result = "Database was not attached to the server." + Environment.NewLine + "Try attaching it manually and rerun the configuration process";
                    return;
                }
                else if (errorMessage != ErrorStates.Success.ToString())
                {
                    bgwSetupConnection.ReportProgress(100, "Verifying the attached database failed.");
                    e.Result = "Following error occured while verifying the attached database:" + Environment.NewLine + errorMessage;
                    return;
                }

                bgwSetupConnection.ReportProgress(50, "(3/5) Verifying the integrifty of database schema...");
                errorMessage = objdb.VerifySchema(applicationPath + "\\Scripts\\InstallDatabaseSchema.sql");
                if (errorMessage != ErrorStates.Success.ToString())
                {
                    bgwSetupConnection.ReportProgress(100, "Verifying integrity of the database schema failed.");
                    e.Result = "Following error occured while verifying integrity of the database schema:" + Environment.NewLine + errorMessage;
                    return;
                }

                bgwSetupConnection.ReportProgress(85, "(4/5) Fetching connection settings...");
                System.Threading.Thread.Sleep(500);
                e.Result = "|Success|" + objdb.GetConnectionString();

                bgwSetupConnection.ReportProgress(100, "(5/5) Database connection complete. Opening application...");
                System.Threading.Thread.Sleep(1000);
            }
        }

        private void bgwSetupConnection_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            this._setupProgress = e.ProgressPercentage;
        }

        private void bgwSetupConnection_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            string errorMessage = e.Result.ToString();
            if (errorMessage.StartsWith("|Success|"))
            {
                setupComplete();
            }
            else
            {
                setupFail(errorMessage);
            }
        }

        protected virtual void setupComplete()
        {
            setupOnComplete();
        }

        protected virtual void setupFail(string message)
        {
            setupOnFail(message);
        }
        #endregion
    }
}
