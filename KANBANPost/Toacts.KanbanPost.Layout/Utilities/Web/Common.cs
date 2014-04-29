using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Utilities.Web
{
    public static  class Common
    {

        public static void GetControlList<T>(ControlCollection controlCollection, List<T> resultCollection)
where T : Control
        {
            foreach (Control control in controlCollection)
            {
                //if (control.GetType() == typeof(T))
                if (control is T) // This is cleaner
                    resultCollection.Add((T)control);

                if (control.HasControls())
                    GetControlList(control.Controls, resultCollection);
            }
        }

        public static void DisableControls(Control control, bool isEnable)
        {
            if (control.HasControls())
            {
                foreach (Control c in control.Controls)
                {
                    DisableControls(c, isEnable);
                }
            }
            else
            {
                if (control is IPostBackDataHandler && !(control is IPostBackEventHandler))
                {
                    if (control is WebControl)
                    {
                        ((WebControl)control).Enabled = isEnable;
                    }
                    else if (control is HtmlControl)
                    {
                        ((HtmlControl)control).Disabled = !isEnable;
                    }
                }
            }
        }  
    }
}
