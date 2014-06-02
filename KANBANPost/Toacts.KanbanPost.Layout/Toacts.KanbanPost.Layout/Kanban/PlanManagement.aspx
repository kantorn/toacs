<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Site1.Master" AutoEventWireup="true" CodeBehind="PlanManagement.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Kanban.PlanManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script type="text/javascript" language="javascript">

       // Doc Ready
       //<![CDATA[
       var column = [];
       var frozen = [[{ field: 'Part_No', title: 'Part No' },
                       { field: 'Customer_Name', title: 'Customer', width: 50 },
                       { field: 'Model_Name', title: 'Model', width: 40 },
                       { field: 'Line_Speed', title: 'CT' ,width:40},
                       { field: 'Packing', title: 'Packing', width: 40 },
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
       });
       //]]>


       function loadDataGrid(currentGrid) {
           $(currentGrid).datagrid({
                   url : "/Handler/PlanManagementHandler.axd" ,
                   pageable: true,
                   autoheight: true,
                   frozenColumns : frozen,
                   columns : column,
                   onClickRow: function (rowIndex) {
                       if (lastIndex[i] != rowIndex) {
                           $(currentGrid).datagrid('endEdit', lastIndex[currentGrid]);
                           $(currentGrid).datagrid('beginEdit', rowIndex);
                           setEditing(rowIndex, currentGrid);
                       }
                       lastIndex[currentGrid] = rowIndex;
                   }
            });
       }

       function setEditing(rowIndex,girdId) {
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
  <br/>      
        <div class="o-1" style="margin-left: auto;height: 55px;margin-right: auto;width: 930px;">
	            <h1 id="h2" style="float:left; margin-left:30px;font-size: 23px;color: #264DB1;font-weight: bold;">Planing Management</h1>
	    <div class="cb"></div>
        </div>  
        <div class="filter-display">
        </div>
        <div  class="easyui-tabs"  style="margin-left:auto;margin-right:auto;width:940px;">
            <div title="Finishing Line 1-A-1"  >
	            <div class="page-options-nav" style="margin-top:15px;margin-left:30px;height:40px;width:900px;">
	                <h1 id="h3" style="margin-left:30px;font-size: 23px;color: #264DB1;font-weight: bold;float:left;margin-top: 2px;">Finishing Line 1-A-1</h1>
		            <a  class="fancy-button" style="float:right;margin-right:10px;" href="javascript:void(0)">Save</a>
	            </div>
	            <table id="plan1" title="Plan Management" style="width:938px;height:auto;
			            singleSelect="true" iconCls="icon-save" rownumbers="true"
			            idField="itemid" pagination="true" 
                        data-options="pageSize: 20 " >
	            </table>
            </div>
            <div title="Finishing Line 1-B-1" >
	            <div class="page-options-nav" style="margin-top:15px;margin-left:30px;height:40px;width:900px;">
	                <h1 id="h4" style="margin-left:30px;font-size: 23px;color: #264DB1;font-weight: bold;float:left;margin-top: 2px;">Finishing Line 1-B-1</h1>
		            <a  class="fancy-button" style="float:right;margin-right:10px;" href="javascript:void(0)">Save</a>
	            </div>
	            <table id="plan2" title="Plan Management" style="width:938px;height:auto;
			            singleSelect="true" iconCls="icon-save" rownumbers="true"
			            idField="itemid" pagination="true" 
                        data-options="pageSize: 20 " >
	            </table>
            </div>
        </div>
</asp:Content>
