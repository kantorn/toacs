/*
Copyright � 2005 - 2013 Annpoint, s.r.o.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

-------------------------------------------------------------------------

NOTE: Reuse requires the following acknowledgement (see also NOTICE):
This product includes DayPilot (http://www.daypilot.org) developed by Annpoint, s.r.o.
*/


using System;

namespace Utilities.Web.DayPilotLite.Web.Ui.Events
{
    /// <summary>
    /// Delegate for <see cref="DayPilotCalendar.EventClick">DayPilotCalendar.EventClick</see> event and <see cref="DayPilotScheduler.EventClick">DayPilotScheduler.EventClick</see>.
    /// </summary>
    public delegate void EventClickEventHandler(object sender, EventClickEventArgs e);


    /// <summary>
    /// Class that holds event arguments for <see cref="DayPilotCalendar.EventClick">DayPilotCalendar.EventClick</see> event and <see cref="DayPilotScheduler.EventClick">DayPilotScheduler.EventClick</see>.
    /// </summary>
    public class EventClickEventArgs : EventArgs
    {
        internal EventClickEventArgs(string value)
        {
            Value = value;
        }

        ///<summary>
        /// Calendar event value (see <see cref="DayPilotCalendar.DataValueField">DayPilotCalendar.DataValueField</see> property and <see cref="DayPilotScheduler.DataValueField">DayPilotScheduler.DataValueField</see> property).
        ///</summary>
        public string Value { get; private set; }
    }
}
