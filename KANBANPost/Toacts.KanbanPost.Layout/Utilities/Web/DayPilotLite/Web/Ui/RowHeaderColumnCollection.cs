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

using System.Collections;
using System.ComponentModel;
using Utilities.Web.DayPilotLite.Web.Ui.Serialization;

namespace Utilities.Web.DayPilotLite.Web.Ui
{
    /// <summary>
    /// Collection of resources definitions.
    /// </summary>

    [TypeConverter(typeof(RowHeaderColumnCollectionConverter))]
    public class RowHeaderColumnCollection : CollectionBase
    {
        internal bool designMode;

        /// <summary>
        /// Gets the specified <see cref="Resource">Resource</see>.
        /// </summary>
        /// <param name="index">Item index</param>
        /// <returns>Resource at the specified position.</returns>
        public RowHeaderColumn this[int index]
        {
            get
            {
                return ((RowHeaderColumn)List[index]);
            }
            set
            {
                List[index] = value;
            }
        }

        /// <summary>
        /// Converts ResourceCollection to ArrayList.
        /// </summary>
        /// <returns>ArrayList with ResourceCollection items.</returns>
        public ArrayList ToArrayList()
        {
            ArrayList retArray = new ArrayList();
            for (int i = 0; i < this.Count; i++)
            {
                retArray.Add(this[i]);
            }

            return retArray;
        }

        /// <summary>
        /// Adds a new <see cref="Resource">Resource</see> to the collection.
        /// </summary>
        /// <param name="value">Resource to be added.</param>
        /// <returns></returns>
        public int Add(RowHeaderColumn value)
        {
            return (List.Add(value));
        }

        /// <summary>
        /// Adds a new <see cref="Resource">Resource</see> to the collection.
        /// </summary>
        /// <param name="name">Resource name</param>
        /// <param name="id">Resource id</param>
        /// <returns></returns>
        public int Add(string title, int width)
        {
            return Add(new RowHeaderColumn(title, width));
        }

        /// <summary>
        /// Determines the index of a specific item in the collection.
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public int IndexOf(RowHeaderColumn value)
        {
            return (List.IndexOf(value));
        }

        /// <summary>
        /// Inserts a new resource at the specified position.
        /// </summary>
        /// <param name="index">New resource position.</param>
        /// <param name="value">Resource to be added.</param>
        public void Insert(int index, RowHeaderColumn value)
        {
            List.Insert(index, value);
        }

        /// <summary>
        /// Removes a Resource from the collection.
        /// </summary>
        /// <param name="value">Resource to be removed.</param>
        public void Remove(RowHeaderColumn value)
        {
            List.Remove(value);
        }


        /// <summary>
        /// Determines whether the collection contains a specified resource.
        /// </summary>
        /// <param name="value">Resource to be found.</param>
        /// <returns>True if the collection contains the resource</returns>
        public bool Contains(RowHeaderColumn value)
        {
            return (List.Contains(value));
        }


        /// <summary>
        /// Creates a new collection from an ArrayList.
        /// </summary>
        /// <param name="items">ArrayList that contains the new resources.</param>
        public RowHeaderColumnCollection(ArrayList items)
            : base()
        {
            for (int i = 0; i < items.Count; i++)
            {
                if (items[i] is RowHeaderColumn)
                {
                    this.Add((RowHeaderColumn)items[i]);
                }
            }
        }

        /// <summary>
        /// Creates a new ResourceCollection.
        /// </summary>
        public RowHeaderColumnCollection()
            : base()
        { }
    }

}
