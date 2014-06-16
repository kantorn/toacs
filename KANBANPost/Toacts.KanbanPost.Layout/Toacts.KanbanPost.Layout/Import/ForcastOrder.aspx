<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Site1.Master" AutoEventWireup="true" CodeBehind="ForcastOrder.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Import.ForcastOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style type="text/css" >
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
//                for (var i = 0; i < res.merges.length; i++) {
//                    $('#finishing-data').datagrid('mergeCells', {
//                        index: res.merges[i].index,
//                        field: res.merges[i].field,
//                        rowspan: res.merges[i].rowspan
//                    });
//                }
                var height = $('.datagrid-view1').height();
                $('.datagrid-body').height(height + 10);
            }
        });
        $('#finishing-data').datagrid('getPanel').addClass('lines-bottom');


        $('#master-stock').datagrid({
            pageable: true,
            autoheight: true,
            rownumbers: false,
            onLoadSuccess: function (res) {
                $('#h1').activity(false);
//                for (var i = 0; i < res.merges.length; i++) {
//                    $('#finishing-data').datagrid('mergeCells', {
//                        index: res.merges[i].index,
//                        field: res.merges[i].field,
//                        rowspan: res.merges[i].rowspan
//                    });
//                }
                var height = $('.datagrid-view1').height();
                $('.datagrid-body').height(height + 10);
            }
        });

        $('#master-stock').datagrid('getPanel').addClass('lines-bottom');
        
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
    <div class="main-contain-inner"  >    
        <div class="o-1"  >
	        <h1 id="h2"  >Import Forcast Order</h1>
	        <div class="page-options-nav show-border" >
                    <span>Import Forcast Order :</span>
                    <input type="text" value="" style="width:220px;" />
                    <div class="fileUpload btn btn-primary">
                        <span>Browse</span>
                        <input type="file" class="upload" />
                    </div>
                    <a id="modalBtnExternalSaveFilter" class="fancy-button save-filter-button" style="float:right"  href="javascript:void(0)">Master Stock Calculate</a>
                    <a class="fancy-button filter-button arrow-down" style="float:right;margin-right:20px;" href="javascript:void(0)">Upload<span class="arrow-down-icon"></span></a> 
	            </div>
	        <div class="cb"></div>
        </div>  
        
        <div  class="easyui-tabs"  style="margin-left:auto;margin-right:auto;width:940px;margin-top: 15px;">
            <div id="forecast" title="Forcast Order"  >            
	            <h3 id="h3"  >Forcast Order</h3>
	            <div class="page-options-nav noborder" >
                    <a class="fancy-button filter-button" href="javascript:void(0)">Filter Data<span class="arrow-down-icon"></span></a> 
                    &nbsp;&nbsp;&nbsp;&nbsp;
	            </div>
                 <div class="filter-display">
                    <div class="filter-button-close" style="float: right;padding: 10px;" >
                         <a style="padding:2px 6px 2px 6px;" href="javascript:$('.filter-button').click();">x</a>
                    </div>
                    <div style="width: 50%;float: left;padding:20px 50px;"> 
                        <span class="lot-information" style="width:180px;padding:5px 10px;text-align:right;">Customer :</span>
                        <asp:TextBox id="txtCustomer" runat="server" ></asp:TextBox>
                        <br/>
                        <span class="lot-information" style="width:180px;padding:5px 10px;text-align:right;">Model :</span>
                        <asp:TextBox id="TextBox1"  runat="server" ></asp:TextBox>
                        <br/>
                    </div>
                    <div style="width: 50%;float: left;padding:20px 0px;margin-left:-75px;"> 
                        <span class="lot-information" style="width:180px;padding:5px 10px;text-align:right;">Part Name :</span>
                        <asp:TextBox id="TextBox2" runat="server" ></asp:TextBox>
                        <br/>
                        <span class="lot-information" style="width:180px;padding:5px 10px;text-align:right;">Part Short Name :</span>
                        <asp:TextBox id="TextBox3" runat="server" ></asp:TextBox>
                        <br/>
                    </div>
            
	                <div class="page-options-nav button-group" style="margin-top:-30px">
                        <a class="fancy-button" href="javascript:void(0)">Apply Filter</a> 
	                </div>
                </div>
	            <table id="finishing-data" title="Finishing Order" style="width:930px;height:auto;"
			            url="/Handler/ForecastOrderHandler.axd" 
			            singleSelect="true" iconCls="icon-save" 
			            idField="itemid" pagination="true" 
                        data-options="pageSize: 20">
		            <thead>
			            <tr>
				            <th field="part_no" width="200" >Part No</th>
				            <th field="customer" width="175">Customer</th>
				            <th field="line_no" width="95" >Line</th>
				            <th field="factory" width="80">Factory</th>
				            <th field="model" width="50" align="center">Model</th>
				            <th field="packing_size" width="75" align="center">Pack Size</th>
				            <th field="packing_type" width="75" align="center">Pack Type</th>
				            <th field="forecast" width="100" align="center">Forecast</th>
				            <th field="ct" width="60" align="center">CT</th>
			            </tr>
		            </thead>
	            </table>
            </div>
            <div  id="masterstock"  title="Master Stock Data"  >     
	            <h3 id="h2"  >Master stock data</h3>
                 <div class="page-options-nav noborder" >
                    <a class="fancy-button filter-button" href="javascript:void(0)">Filter Data<span class="arrow-down-icon"></span></a> 
                    &nbsp;&nbsp;&nbsp;&nbsp;
	            </div>
                 <div class="filter-display">
                    <div class="filter-button-close" style="float: right;padding: 10px;" >
                       <a style="padding:2px 6px 2px 6px;" href="javascript:$('.filter-button').click();">x</a>
                    </div>
                    <div style="width: 50%;float: left;padding:20px 50px;"> 
                        <span class="lot-information" style="width:180px;padding:5px 10px;text-align:right;">Customer :</span>
                        <asp:TextBox id="TextBox4" runat="server" ></asp:TextBox>
                        <br/>
                        <span class="lot-information" style="width:180px;padding:5px 10px;text-align:right;">Model :</span>
                        <asp:TextBox id="TextBox5"  runat="server" ></asp:TextBox>
                        <br/>
                    </div>
                    <div style="width: 50%;float: left;padding:20px 0px;margin-left:-75px;"> 
                        <span class="lot-information" style="width:180px;padding:5px 10px;text-align:right;">Part Name :</span>
                        <asp:TextBox id="TextBox6" runat="server" ></asp:TextBox>
                        <br/>
                        <span class="lot-information" style="width:180px;padding:5px 10px;text-align:right;">Part Short Name :</span>
                        <asp:TextBox id="TextBox7" runat="server" ></asp:TextBox>
                        <br/>
                    </div>
            
	                <div class="page-options-nav button-group" style="margin-top:-30px">
                        <a class="fancy-button" href="javascript:void(0)">Apply Filter</a> 
	                </div>
                </div>
	            <table id="master-stock" title="Finishing Order" style="width:930px;height:auto;"
			            url="/Handler/MasterStockHandler.axd" 
			            singleSelect="true" iconCls="icon-save"  
			            idField="itemid" pagination="true" 
                        data-options="pageSize: 20">
		            <thead>
			            <tr>
				            <th field="part_no" width="200" >Part No</th>
				            <th field="part_name" width="175">Part Name</th>
				            <th field="line_no" width="95" >Line</th>
				            <th field="lot_size" width="100">Lot Size</th>
				            <th field="max" width="50" align="center">Max</th>
				            <th field="min" width="50" align="right">Min</th>
				            <th field="current" width="75" align="center">Current</th>
				            <th field="status" width="160" align="center">Status</th>
			            </tr>
		            </thead>
	            </table>
            </div>
        </div>
    </div>
</asp:Content>
