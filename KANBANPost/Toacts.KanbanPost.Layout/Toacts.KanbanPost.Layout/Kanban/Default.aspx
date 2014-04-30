<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Kanban.Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Contents/Styles/ui.jqgrid.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../Scripts/list-view.js"></script>
    <script src="../Scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.jqGrid.src.js" type="text/javascript"></script>
    <script src="../Scripts/grid.locale-en.js" type="text/javascript"></script>
    <script src="../Scripts/json2.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <script src="../Scripts/activity-indicator.js" type="text/javascript"></script>
    <style >
        tr .datagrid-cell
        {
            height:25px;
        }
    </style>
    <script type="text/javascript" language="javascript">
    
        // Doc Ready
            //<![CDATA[
        $(function () {
            $('#h1').activity({ segments: 8, width: 2, space: 0, length: 3, speed: 1.5, align: 'right' });

            $('#kanban').datagrid({
                onLoadSuccess: function (res) {
                    $('#h1').activity(false);
                    for (var i = 0; i < res.merges.length; i++) {
                        $('#kanban').datagrid('mergeCells', {
                            index: res.merges[i].index,
                            field: res.merges[i].field,
                            rowspan: res.merges[i].rowspan
                        });
                    }
                }
            });
            //$("#pager_left").hide();
        });
            //]]>
    
          //
        // FG Data Load
        function fgDataLoad(sender, args)
        {
            // Hide - Loading Spinner 
            $('#h1').activity(false);
        }
        //
        // FG Row Click
        function fgRowClick(sender, args)
        {
            return false;
        }
        //
         //
        // FG No Data
        function fgNoData()
        {
            // Hide - Loading Spinner 
            $('#h1').activity(false);
        }
            // FG Before Send Data
        function fgBeforeSendData(data)
        {
            // Show - Loading Spinner
            $('#h1').activity({ segments: 8, width: 2, space: 0, length: 3, speed: 1.5, align: 'right' });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1 id="h1" style="float:left; padding-top:3px; padding-right:30px;"></h1>        
	    <table id="kanban" title="Issued KANBAN" style="width:930px;height:450px"
			    url="/Handler/HandlerKanbanList.axd"
			    singleSelect="true" iconCls="icon-save" rownumbers="true"
			    idField="itemid" pagination="true">
		    <thead>
                <%--KanbnaId,customer_name,model_name,part_name,part_no,tag_id,quantity,total_quantity--%>
			    <tr>
				    <th field="customer_name" width="85" >customer_name</th>
				    <th field="model_name" width="100">model_name</th>
				    <th field="part_name" width="200" >part_name</th>
				    <th field="part_no" width="180">part_no</th>
				    <th field="total_quantity" width="90" align="center">total_quantity</th>
				    <th field="tag_id" width="160" align="right">tag_id</th>
				    <th field="quantity" width="80" align="right">quantity</th>
			    </tr>
		    </thead>
	    </table>
	
</asp:Content>
