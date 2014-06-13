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
       var column = [];
       var frozen = [[{ field: 'Part_No', title: 'Part No' },
                       { field: 'Customer_Name', title: 'Customer', width: 70 },
                       { field: 'Model_Name', title: 'Model', width: 40 },
                       { field: 'Line_Speed', title: 'CT', width: 40 },
                       { field: 'Packing', title: 'Packing', width: 50 },
                       { field: 'Forecast_Qty', title: 'Forecast', width: 80}]];

       var lastIndex = {};
       var gridList = new Array("#plan1", "#plan2");

       $(document).ready(function () {
           $('#h1').activity({ segments: 8, width: 2, space: 0, length: 3, speed: 1.5, align: 'right' });

           //alert(sPage);
           $.ajax({
               url: '/Handler/PlanManagementHandler.axd?init=true',
               type: "POST",
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (data) {
                   column = data;
                   for (i = 0; i < gridList.length; i++) {
                       lastIndex[gridList[i]] = 0;
                       loadDataGrid(gridList[i]);
                   }

               },
               error: function () {
                   alert("Error with AJAX callback");
               }
           });

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
                        '</table>'

       var str_result = '<table><tr><td field="day1"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day1">0</div></td><td field="day2"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day2">0</div></td><td field="day3"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day3">0</div></td><td field="day4"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day4">0</div></td><td field="day5"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day5">0</div></td><td field="day6"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day6">0</div></td><td field="day7"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day7">0</div></td><td field="day8"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day8">0</div></td><td field="day9"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day9">0</div></td><td field="day10"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day10">0</div></td><td field="day11"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day11">0</div></td><td field="day12"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day12">0</div></td><td field="day13"><div style="" class="datagrid-cell datagrid-cell-c1-day13">0</div></td><td field="day14"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day14">0</div></td><td field="Total"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-Total">0</div></td></tr>' +
                        '<tr><td field="day1"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day1">0</div></td><td field="day2"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day2">0</div></td><td field="day3"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day3">0</div></td><td field="day4"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day4">0</div></td><td field="day5"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day5">0</div></td><td field="day6"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day6">0</div></td><td field="day7"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day7">0</div></td><td field="day8"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day8">0</div></td><td field="day9"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day9">0</div></td><td field="day10"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day10">0</div></td><td field="day11"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day11">0</div></td><td field="day12"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day12">0</div></td><td field="day13"><div style="" class="datagrid-cell datagrid-cell-c1-day13">0</div></td><td field="day14"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day14">0</div></td><td field="Total"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-Total">0</div></td></tr>' +
                        '<tr><td field="day1"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day1">0</div></td><td field="day2"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day2">0</div></td><td field="day3"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day3">0</div></td><td field="day4"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day4">0</div></td><td field="day5"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day5">0</div></td><td field="day6"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day6">0</div></td><td field="day7"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day7">0</div></td><td field="day8"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day8">0</div></td><td field="day9"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day9">0</div></td><td field="day10"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day10">0</div></td><td field="day11"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day11">0</div></td><td field="day12"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day12">0</div></td><td field="day13"><div style="" class="datagrid-cell datagrid-cell-c1-day13">0</div></td><td field="day14"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day14">0</div></td><td field="Total"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-Total">0</div></td></tr>' +
                        '<tr><td field="day1"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day1">0</div></td><td field="day2"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day2">0</div></td><td field="day3"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day3">0</div></td><td field="day4"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day4">0</div></td><td field="day5"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day5">0</div></td><td field="day6"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day6">0</div></td><td field="day7"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day7">0</div></td><td field="day8"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day8">0</div></td><td field="day9"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day9">0</div></td><td field="day10"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day10">0</div></td><td field="day11"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day11">0</div></td><td field="day12"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day12">0</div></td><td field="day13"><div style="" class="datagrid-cell datagrid-cell-c1-day13">0</div></td><td field="day14"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-day14">0</div></td><td field="Total"><div style="border:none;" class="datagrid-cell datagrid-cell-c1-Total">0</div></td></tr>' +
                        '</table>'
       function loadDataGrid(currentGrid) {
           // setTimeout(function () {
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
                   if (lastIndex[i] != rowIndex) {
                       $(currentGrid).datagrid('endEdit', lastIndex[currentGrid]);
                       $(currentGrid).datagrid('beginEdit', rowIndex);
                       setEditing(rowIndex, currentGrid);
                   }
                   lastIndex[currentGrid] = rowIndex;
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
           //}, 100);

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
	        <h2 id="h2" style="">Extrusion Stock</h2>
	        <table id="plan1" title="Extrusion Stock Monitoring" style="width:938px;height:auto;
			        singleSelect="true" iconCls="icon-save" rownumbers="true"
			        idField="itemid" pagination="true" 
                    data-options="pageSize: 20 " >
	        </table>
        </div>
        <div id="content_bending"  >
            <h2 id="h3" style="">Bending Stock</h2>
	        <table id="plan2" title="Bending Stock Monitoring" style="width:938px;height:auto;
			        singleSelect="true" iconCls="icon-save" rownumbers="true"
			        idField="itemid" pagination="true" 
                    data-options="pageSize: 20 " >
	        </table>
        </div>
    </div>
</asp:Content>
