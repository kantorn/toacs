<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Site1.Master" AutoEventWireup="true" CodeBehind="Monitoring.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Inventory._Monitoring" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script type="text/javascript" language="javascript">

     // Doc Ready
     //<![CDATA[
     $(function () {
         $('#h1').activity({ segments: 8, width: 2, space: 0, length: 3, speed: 1.5, align: 'right' });


         $('#kanban').datagrid({
             pageable: true,
             autoheight: true,
             onLoadSuccess: function (res) {
                 $('#h1').activity(false);
                 var height = $('.datagrid-view1').height();
                 $('.datagrid-body').height(height + 10);
             }
         });
         //$("#pager_left").hide();

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
        <div class="o-1" style="margin-left: auto;height: 75px;margin-right: auto;width: 930px;">
	            <h1 id="h2" style="float:left; margin-left:30px;font-size: 23px;color: #264DB1;font-weight: bold;">Stock Monitoring</h1>
	            <div class="page-options-nav" style="margin-top:15px;float:right;margin-right:20px;">
                    <a class="fancy-button filter-button arrow-down" href="javascript:void(0)">Filter Data<span class="arrow-down-icon"></span></a> 
                    &nbsp;&nbsp;&nbsp;&nbsp;
	            </div>
	        <div class="cb"></div>
        </div>  
        <div class="filter-display">
        </div>
        <div style="margin-left:auto;margin-right:auto;width:930px;">
	        <table id="kanban" title="Issued KANBAN" style="width:930px;height:auto;"
			        url="/Handler/StockMonitoringHandler.axd" 
			        singleSelect="true" iconCls="icon-save" rownumbers="true"
			        idField="itemid" pagination="true" 
                    data-options="pageSize: 20">
		        <thead>
                    <%--KanbnaId,customer_name,model_name,part_name,part_no,tag_id,quantity,total_quantity--%>
			        <tr>
				        <th field="part_no" width="150" >Part No.</th>
				        <th field="part_number" width="195">Part Number</th>
				        <th field="pd_line" width="90" >PD Line</th>
				        <th field="lot_size" width="90">Lot Size</th>
				        <th field="max" width="90" align="center">Max</th>
				        <th field="min" width="90" align="right">Min</th>
				        <th field="now_stock" width="90" align="right">Now Stock</th>
                        <th field="status" width="90 align="right">Status</th>
			        </tr>
		        </thead>
	        </table>
        </div>
</asp:Content>
