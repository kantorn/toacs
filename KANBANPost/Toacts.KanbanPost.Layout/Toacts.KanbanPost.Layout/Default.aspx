<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Production.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style type="text/css" >
        .datagrid-body tr:nth-child(odd) 
        {
            background: #ffffff;
        }      
        .datagrid-view2
        {
            border-right:none;
        }
    </style>
   <script type="text/javascript" language="javascript">

       // Doc Ready
       //<![CDATA[
       var column = [];

       var lastIndex = {};
       var gridList = new Array("#plan1", "#plan2");

       $(document).ready(function () {
           $('#h1').activity({ segments: 8, width: 2, space: 0, length: 3, speed: 1.5, align: 'right' });

           //alert(sPage);
           $.ajax({
               url: '/Handler/PDScheduleHandler.axd',
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

       function loadDataGrid(currentGrid) {
           // setTimeout(function () {
           $(currentGrid).datagrid({
               url: "/Handler/PDScheduleHandler.axd",
               pageable: true,
               autoheight: true,
               rownumbers: false,
               autoRowHeight: false
           });

           $(currentGrid).datagrid('getPanel').addClass('lines-bottom');
           //}, 100);

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
        <div style="text-align:center;margin-bottom: -30px;">
            <span style="font-size:17px;font-weight:bold;">Today Production Plan</span>
            <br />
            <asp:Label id="lblToday" runat="server" ></asp:Label>
        </div>
        <div class="main-contain-inner" style="width:900px;">  
            <h3 id="h3" style="">Extruison</h3>
	        <table id="plan1" title="Plan Management" style="width:900px;height:auto;"
			        singleSelect="true" iconCls="icon-save" rownumbers="false"
			        idField="itemid" pagination="true" 
                    data-options="pageSize: 20 " >
                <thead>
			        <tr>
				        <th field="line_id" width="95" >Line</th>
				        <th field="lot_no" width="130">Lot No.</th>
				        <th field="part_name" width="200" >Part Name</th>
				        <th field="lot_size" width="130">Lot Size</th>
				        <th field="fg" width="50" align="center">FG</th>
				        <th field="ng" width="50" align="right">NG</th>
				        <th field="status" width="100" align="center">Status</th>
				        <th field="action" width="135" align="center">Action</th>
			        </tr>
		        </thead>
	        </table>
            <h3 id="h2" style="">Bending</h3>
	        <table id="plan2" title="Plan Management" style="width:900px;height:auto;"
			        singleSelect="true" iconCls="icon-save" rownumbers="false"
			        idField="itemid" pagination="true" 
                    data-options="pageSize: 20 " >
                <thead>
			        <tr>
				        <th field="line_id" width="95" >Line</th>
				        <th field="lot_no" width="130">Lot No.</th>
				        <th field="part_name" width="200" >Part Name</th>
				        <th field="lot_size" width="130">Lot Size</th>
				        <th field="fg" width="50" align="center">FG</th>
				        <th field="ng" width="50" align="right">NG</th>
				        <th field="status" width="100" align="center">Status</th>
				        <th field="action" width="135" align="center">Action</th>
			        </tr>
		        </thead>
	        </table>
        </div>
    </div>
</asp:Content>
