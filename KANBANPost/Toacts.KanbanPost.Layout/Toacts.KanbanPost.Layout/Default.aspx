<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style >
        tr .datagrid-cell
        {
            height:25px;
        }
		.fancy-button:hover {
            background: url("../Styles/Images/ui-bg_highlight-hard_75_dadada_1x100.png") repeat-x scroll 50% 50% #CCCCCC;
        }
        a:hover {
            text-decoration: none;
        }
        .fancy-button {
            border: 2px solid #E1E1E1;
            background: url("../Styles/Images/ui-bg_highlight-hard_75_e6e6e6_1x100.png") repeat-x scroll 50% 50% #E6E6E6;
            padding: 0.4em 1em;
            text-decoration: none;
            border-radius: 4px;
            color: #555555;
            font-weight: normal;
            font-size: 12px;
            position: relative;
            cursor: pointer;
        }
    </style>
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
        <h1 id="h1" style="float:left; padding-top:3px; padding-right:30px;"></h1></br>      
        <div class="o-1" style="margin:0;">
	            <h1 id="h2" style="float:left; margin-left:30px;font-size: 23px">Extrusion KANBAN List</h1>
	            <div class="page-options-nav" style="margin-top:15px;float:right;margin-right:20px;">
                    <a class="fancy-button filter-button arrow-down" href="javascript:void(0)">Filter Results<span class="arrow-down-icon"></span></a> 
                    <a id="modalBtnExternalSaveFilter" class="fancy-button save-filter-button" href="javascript:void(0)">Save Filter</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
		            <a id="modalBtnExternal" class="fancy-button" href="javascript:void(0)">Print KANBAN tags</a>
	            </div>
	        <div class="cb"></div>
        </div>  
        <div style="margin-left:auto;margin-right:auto;">
	        <table id="kanban" title="Issued KANBAN" style="width:930px;height:auto;"
			        url="/Handler/HandlerKanbanList.axd" 
			        singleSelect="true" iconCls="icon-save" rownumbers="true"
			        idField="itemid" pagination="true" 
                    data-options="pageSize: 20">
		        <thead>
                    <%--KanbnaId,customer_name,model_name,part_name,part_no,tag_id,quantity,total_quantity--%>
			        <tr>
				        <th field="customer_name" width="95" >Customer Name</th>
				        <th field="model_name" width="100">Model Name</th>
				        <th field="part_name" width="200" >Paet Name</th>
				        <th field="part_no" width="180">Part No.</th>
				        <th field="total_quantity" width="90" align="center">Total Quantity</th>
				        <th field="tag_id" width="160" align="right">Tag Id</th>
				        <th field="quantity" width="70" align="right">Lot Size</th>
			        </tr>
		        </thead>
	        </table>
        </div>
	
</asp:Content>
