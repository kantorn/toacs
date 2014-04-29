using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Reflection;
using System.Collections;

namespace Utilities.Web.Grid
{
    public class GridResult
    {
        private IList _rows;
        private  List<MergerdGrid> _merged;
        public int total { get; set; }
        public IList rows
        {
            get
            {
                return _rows;
            }
            set
            {
                _rows = value;
                this._merged = new List<MergerdGrid>();
                Type stype = _rows[0].GetType();
                var itemFirst = Convert.ChangeType(_rows[0], stype);
                string prevValue = String.Empty;
                int rowIndex = 0;
                int colIndex = 0;
                int startRowIndex = 0;
                foreach (var prop in itemFirst.GetType().GetProperties())
                {
                    if (colIndex < 6)
                    {
                        MergerdGrid mergerItem = new MergerdGrid();
                        mergerItem.field = prop.Name.ToString();
                        rowIndex = 0;
                        startRowIndex = 0;
                        prevValue = String.Empty;
                        foreach (object obj in _rows)
                        {
                            var p = Convert.ChangeType(obj, stype);
                            if (prevValue != prop.GetValue(p, null).ToString())
                            {
                                if (!String.IsNullOrEmpty(prevValue))
                                {
                                    mergerItem.rowspan = rowIndex - startRowIndex;
                                    mergerItem.index = rowIndex - mergerItem.rowspan;
                                    this._merged.Add(mergerItem);
                                    mergerItem = new MergerdGrid();
                                    mergerItem.field = prop.Name.ToString();
                                    startRowIndex = rowIndex;
                                }
                                prevValue = prop.GetValue(p, null).ToString();
                            }
                            rowIndex++;
                        }

                        mergerItem.index = startRowIndex;
                        mergerItem.rowspan = rowIndex - startRowIndex;
                        this._merged.Add(mergerItem);
                        colIndex++;
                    }
                    else
                    {
                        break;
                    }
                }

            }
        }
        public List<MergerdGrid> merges
        { 
            get
            {
                 return this._merged ;
            }
        }
    }

    public class MergerdGrid
    {
        public int index { get; set; }
        public string field { get; set; }
        public int rowspan { get; set; }        
    }

    public static class Converter
    {
        public static DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);

            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Setting column names as Property names
                dataTable.Columns.Add(prop.Name);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    //inserting property values to datatable rows
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            //put a breakpoint here and check datatable
            return dataTable;
        }

    }
}