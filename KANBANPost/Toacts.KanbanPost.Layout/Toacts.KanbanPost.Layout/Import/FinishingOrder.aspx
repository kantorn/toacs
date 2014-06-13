<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Site1.Master" AutoEventWireup="true" CodeBehind="FinishingOrder.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Import.FinishingOrder" %>
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
        
        .lines-bottom .datagrid-body td{
            border-bottom:1px solid #cccccc;
            border-right:1px dotted transparent;
        }
    </style>
  <script type="text/javascript" language="javascript">

      // Doc Ready
      //<![CDATA[
      $(function () {
          $('#h1').activity({ segments: 8, width: 2, space: 0, length: 3, speed: 1.5, align: 'right' });

          $('#finishing-data').datagrid({
              pageable: true,
              autoheight: true,
              rownumbers: false,
              onLoadSuccess: function (res) {
                  $('#h1').activity(false);
                  for (var i = 0; i < res.merges.length; i++) {
                      $('#kanban').datagrid('mergeCells', {
                          index: res.merges[i].index,
                          field: res.merges[i].field,
                          rowspan: res.merges[i].rowspan
                      });
                  }
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
     <div class="o-1" ">
	        <h1 id="h2"  >Import Finishing Order</h1>
	        <div class="page-options-nav show-border" >
                    <span>Import Finishing Order :</span>
                    <input type="text" value="" style="width:220px;" />
                    <div class="fileUpload btn btn-primary">
                        <span>Browse</span>
                        <input type="file" class="upload" />
                    </div>
                    <a id="modalBtnExternalSaveFilter" class="fancy-button save-filter-button" style="float:right"  href="javascript:void(0)">Plan Calculate</a>
                    <a class="fancy-button filter-button arrow-down" style="float:right;margin-right:20px;" href="javascript:void(0)">Upload<span class="arrow-down-icon"></span></a> 
	        </div>
	        <div class="cb"></div>
    </div>  
    <div class="main-contain-inner"  >
	        <h1 id="h3">Finishing Order</h1>
	        <table id="finishing-data" title="Finishing Order" style="width:930px;height:auto;"
			        url="/Handler/HandlerKanbanList.axd" 
			        singleSelect="true" iconCls="icon-save" rownumbers="true"
			        idField="itemid" pagination="true" 
                    data-options="pageSize: 20">
		        <thead>
			        <tr>
				        <th field="customer_name" width="95" >Customer Name</th>
				        <th field="model_name" width="100">Model Name</th>
				        <th field="part_name" width="200" >Paet Name</th>
				        <th field="part_no" width="180">Part No.</th>
				        <th field="total_quantity" width="90" align="center">Total Quantity</th>
				        <th field="tag_id" width="160" align="right">Tag Id</th>
				        <th field="quantity" width="81" align="right">Lot Size</th>
			        </tr>
		        </thead>
	        </table>
    </div>
</asp:Content>
