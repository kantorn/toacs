using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;


/// <summary>
/// Summary description for GroupedGridView
/// </summary>
namespace CustomControls
{
    [
    ToolboxData("<{0}:GroupedGridView runat=\"server\"> </{0}:GroupedGridView>")
    ]
    public class GroupedGridView : GridView
    {
        public GroupedGridView() { }

        public int GroupedDepth
        {
            get
            {
                object val = this.ViewState["GroupedDepth"];
                if (null == val)
                {
                    return 0;
                }

                return (int)val;
            }
            set
            {
                if (value < 0)
                    throw new ArgumentOutOfRangeException("value", "value must be greater than or equal to zero");

                this.ViewState["GroupedDepth"] = value;
            }
        }

        protected override void OnDataBound(EventArgs e)
        {
            base.OnDataBound(e);

            this.SpanCellsRecursive(0, 0, this.Rows.Count);
        }

        private void SpanCellsRecursive(int columnIndex, int startRowIndex, int endRowIndex)
        {
            if (columnIndex >= this.GroupedDepth || columnIndex >= this.Columns.Count)
                return;

            TableCell groupStartCell = null;
            int groupStartRowIndex = startRowIndex;

            for (int i = startRowIndex; i < endRowIndex; i++)
            {
                TableCell currentCell = this.Rows[i].Cells[columnIndex];

                bool isNewGroup = (null == groupStartCell) || (0 != String.CompareOrdinal(currentCell.Text, groupStartCell.Text));

                if (isNewGroup)
                {
                    if (null != groupStartCell)
                    {
                        SpanCellsRecursive(columnIndex + 1, groupStartRowIndex, i);
                    }

                    groupStartCell = currentCell;
                    groupStartCell.RowSpan = 1;
                    groupStartRowIndex = i;
                }
                else
                {
                    currentCell.Visible = false;
                    groupStartCell.RowSpan += 1;
                }
            }

            SpanCellsRecursive(columnIndex + 1, groupStartRowIndex, endRowIndex);
        }
    }
}

