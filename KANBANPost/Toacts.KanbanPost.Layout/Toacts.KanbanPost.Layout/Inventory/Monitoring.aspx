<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Site1.Master" AutoEventWireup="true" CodeBehind="Monitoring.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Inventory._Monitoring" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css" >
        .datagrid-body tr:nth-child(odd) 
        {
            background: #ffffff;
        }
    </style>
    <script type="text/javascript" src="../Scripts/datagrid-detailview.js"></script>
   <script type="text/javascript" language="javascript">

       // Doc Ready
       //<![CDATA[
       var column = [[{ field: 'FGR', title: 'FGR' },
                       { field: 'SIF_RMF', title: 'SIF/RMF', width: 70 },
                       { field: 'Order', title: 'Order', width: 40 },
                       { field: 'Stock', title: 'Stock', width: 40 },
                       { field: 'STOCK_DAY', title: 'STOCK/DAY', width: 50 },
                       { field: 'P_Stock', title: '%Stock', width: 80 },
                       { field: 'P_Ship', title: '%Stock', width: 50 },
                       { field: 'Remain', title: 'Remain', width: 50 },
                       { field: 'P_Complete', title: '%Complete', width: 50 }, ]];
       var frozen = [[{ field: 'Part_No', title: 'Part No' },
                       { field: 'Customer_Name', title: 'Customer', width: 70 },
                       { field: 'Line', title: 'Line', width: 40 },
                       { field: 'Model_Name', title: 'Model', width: 40 },
                       { field: 'Forecast', title: 'Forecast', width: 50 },
                       { field: 'EOF', title: 'EOF', width: 80}]];

       var lastIndex;
       var gridList = new Array("#plan1");

       $(document).ready(function () {
           $('#h1').activity({ segments: 8, width: 2, space: 0, length: 3, speed: 1.5, align: 'right' });
           loadDataGrid(gridList[0]);

           $('.filter-button').click(function () {
               if (!$('.filter-button').hasClass('actived')) {
                   $('.filter-button').addClass('actived')
                   $('.filter-display').fadeIn('fast');
               }
               else {
                   $('.filter-button').removeClass('actived')
                   $('.filter-display').fadeOut('fast');
               }
           });

           $('#h_extrusion').click(function () {
               if ($(this).hasClass('hide-content')) {
                   $(this).removeClass('hide-content');
                   $('#content_extrusion').fadeIn('fast');
               }
               else {
                   $(this).addClass('hide-content');
                   $('#content_extrusion').fadeOut('fast');
               }
           });
           $('#h_bending').click(function () {
               if ($(this).hasClass('hide-content')) {
                   $(this).removeClass('hide-content');
                   $('#content_bending').fadeIn('fast');
               }
               else {
                   $(this).addClass('hide-content');
                   $('#content_bending').fadeOut('fast');
               }
           });
       });
       //]]>


       var str_header = '<table style="width:100%;text-align:right;"><tr><td style="width:50%;" >Min Stock : 3</td><td style="padding-right:15px;">Plan Use Time</td></tr>' +
                         '<tr><td >Max Stock : 3</td><td style="padding-right:15px;">Actual Stock In</td></tr>' +
                         '<tr><td ></td><td style="padding-right:15px;" >Plan Stock Out</td></tr>' +
                         '<tr><td >EOF Stock : 481</td><td style="padding-right:15px;" >Actual Stock Out</td></tr>' +
                        '</table>';

       var str_result = '<table><tr><td field="day1"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day1">0</div></td><td field="day2"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day2">0</div></td><td field="day3"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day3">0</div></td><td field="day4"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day4">0</div></td><td field="day5"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day5">0</div></td><td field="day6"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day6">0</div></td><td field="day7"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day7">0</div></td><td field="day8"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day8">0</div></td><td field="day9"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day9">0</div></td><td field="day10"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day10">0</div></td><td field="day11"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day11">0</div></td><td field="day12"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day12">0</div></td><td field="day13"><div style="" class="datagrid-cell datagrid-cell-c1-day13">0</div></td><td field="day14"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day14">0</div></td><td field="Total"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-Total">0</div></td></tr>' +
                        '<tr><td field="day1"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day1">0</div></td><td field="day2"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day2">0</div></td><td field="day3"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day3">0</div></td><td field="day4"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day4">0</div></td><td field="day5"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day5">0</div></td><td field="day6"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day6">0</div></td><td field="day7"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day7">0</div></td><td field="day8"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day8">0</div></td><td field="day9"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day9">0</div></td><td field="day10"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day10">0</div></td><td field="day11"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day11">0</div></td><td field="day12"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day12">0</div></td><td field="day13"><div style="" class="datagrid-cell datagrid-cell-c1-day13">0</div></td><td field="day14"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day14">0</div></td><td field="Total"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-Total">0</div></td></tr>' +
                        '<tr><td field="day1"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day1">0</div></td><td field="day2"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day2">0</div></td><td field="day3"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day3">0</div></td><td field="day4"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day4">0</div></td><td field="day5"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day5">0</div></td><td field="day6"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day6">0</div></td><td field="day7"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day7">0</div></td><td field="day8"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day8">0</div></td><td field="day9"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day9">0</div></td><td field="day10"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day10">0</div></td><td field="day11"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day11">0</div></td><td field="day12"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day12">0</div></td><td field="day13"><div style="" class="datagrid-cell datagrid-cell-c1-day13">0</div></td><td field="day14"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day14">0</div></td><td field="Total"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-Total">0</div></td></tr>' +
                        '<tr><td field="day1"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day1">0</div></td><td field="day2"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day2">0</div></td><td field="day3"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day3">0</div></td><td field="day4"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day4">0</div></td><td field="day5"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day5">0</div></td><td field="day6"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day6">0</div></td><td field="day7"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day7">0</div></td><td field="day8"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day8">0</div></td><td field="day9"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day9">0</div></td><td field="day10"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day10">0</div></td><td field="day11"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day11">0</div></td><td field="day12"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day12">0</div></td><td field="day13"><div style="" class="datagrid-cell datagrid-cell-c1-day13">0</div></td><td field="day14"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day14">0</div></td><td field="Total"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-Total">0</div></td></tr>' +
                        '</table>';

       function loadDataGrid(currentGrid) {

           $(currentGrid).datagrid({
               url: "/Handler/PlanManagementHandler.axd",
               pageable: true,
               autoheight: true,
               rownumbers: false,
               frozenColumns: frozen,
               autoRowHeight: false,
               columns: column,
               onClickRow: function (rowIndex) {
                   $('.datagrid-row-selected').removeClass('datagrid-row-selected')
                   if (lastIndex!= rowIndex) {
                       $(currentGrid).datagrid('endEdit', lastIndex[currentGrid]);
                       $(currentGrid).datagrid('beginEdit', rowIndex);
                       setEditing(rowIndex, currentGrid);
                   }
                   lastIndex = rowIndex;
               },
               view: detailview,
               detailFormatter: function (rowIndex, rowData) {
                   return str_result;
               },
               onExpandRow: function (index, row) {
                   if ($('#datagrid-row-r1-1-' + index).next().find('table').length == 0) {
                       $('#datagrid-row-r1-1-' + index).next().find('.datagrid-row-detail').empty();
                       $('#datagrid-row-r1-1-' + index).next().find('.datagrid-row-detail').append(str_header);
                   }

               }
           });

           $(currentGrid).datagrid('getPanel').addClass('lines-bottom');
       }

       function setEditing(rowIndex, girdId) {
           var editors = $(girdId).datagrid('getEditors', rowIndex);
           var priceEditor = editors[0];
           var amountEditor = editors[1];
           var costEditor = editors[2];
           priceEditor.target.bind('change', function () {
               calculate();
           });
           amountEditor.target.bind('change', function () {
               calculate();
           });
           function calculate() {
               var cost = priceEditor.target.val() * amountEditor.target.val();
               $(costEditor.target).numberbox('setValue', cost);
           }
       }

       //
       // FG Data Load
       function fgDataLoad(sender, args) {
           // Hide - Loading Spinner 
           $('#h1').activity(false);
       }
       //
       // FG Row Click
       function fgRowClick(sender, args) {
           return false;
       }
       //
       //
       // FG No Data
       function fgNoData() {
           // Hide - Loading Spinner 
           $('#h1').activity(false);
       }
       // FG Before Send Data
       function fgBeforeSendData(data) {
           // Show - Loading Spinner
           $('#h1').activity({ segments: 8, width: 2, space: 0, length: 3, speed: 1.5, align: 'right' });
       }
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-contain-inner">   
         <div class="o-1"  >
	        <h1 id="h4" >Stock Monitoring</h1>
        </div> 
        <div  id="content_extrusion"   >
	        <table id="plan1" title="Extrusion Stock Monitoring" style="width:938px;height:auto;
			        singleSelect="true" iconCls="icon-save" rownumbers="true"
			        idField="itemid" pagination="true" 
                    data-options="pageSize: 20 " >
	        </table>
        </div>
    </div>
</asp:Content>
