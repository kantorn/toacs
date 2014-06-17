<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Site1.Master" AutoEventWireup="true" CodeBehind="Parts.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Masters.Parts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script  type="text/javascript" language="javascript" src="../Scripts/javascript.grid.js"></script>

<script  type="text/javascript" language="javascript" >
    $(function () {

        grid_option.id = '#ma_part';
        grid_option.url = '/Masters/Parts.aspx/GetList';
        grid_option.url_delete ="/Masters/Parts.aspx/Delete";

        grid_option.frozenColumns = [[
                { field: 'ID', title: 'ID', width: 60 },
                { field: 'PART_NAME', title: 'PART NAME', width: 180,  editor: 'text' },
                { field: 'SHORT_NAME', title: 'SHORT NAME', width: 90,  editor: 'text' },
                { field: 'PART_NO', title: 'PART NO', width: 180, editor: 'text' }
                ]];

        grid_option.columns = [[
                { field: 'PROD_LENGTH', title: 'PROD LENGTH', width: 120, align: 'right', editor: 'numberbox' },
                { field: 'PACKING_TYPE', title: 'PART TYPE', width: 90, editor: 'text' }
                , { field: 'PLASTIC_1', title: 'PLASTIC 1', width: 90, editor: 'text' }
                , { field: 'PLASTIC_2', title: 'PLASTIC 2', width: 90, editor: 'text' }
                , { field: 'PLASTIC_3', title: 'PLASTIC 3', width: 90, editor: 'text' }
                , { field: 'METAL', title: 'METAL', width: 90, editor: 'text' }
                , { field: 'PROFILE_1', title: 'PROFILE_1', width: 90, editor: 'text' }
                , { field: 'PROFILE_2', title: 'PROFILE_2', width: 90, editor: 'text' }
                , { field: 'EXTCUT', title: 'EXTCUT', width: 90, editor: 'numberbox', align: 'right' }
                , { field: 'PACK_PCS_LOT', title: 'PACK_PCS_LOT', width: 110, editor: 'numberbox', align: 'right' }
                , { field: 'PCS_TRAY', title: 'PCS_TRAY', width: 90, editor: 'numberbox', align: 'right' }
                , { field: 'PCS_CART_LOT', title: 'PCS_CART_LOT', width: 90, editor: 'numberbox', align: 'right' }
                , { field: 'SIZECART', title: 'SIZECART', width: 90, editor: 'text' }
                , { field: 'LENGTH', title: 'LENGTH', width: 90, editor: 'numberbox', align: 'right'  }
                , { field: 'LINE_SPEED', title: 'LINE_SPEED', width: 90, editor: 'numberbox', align: 'right'  }
                ]];

        grid_option.fn_save_update = fn_save_change;
        grid_option.fn_save_create = fn_save_create;
        ini_grid();
    });

    function fn_save_create(row, changes) {
        $.messager.confirm('Confirm', 'Are you sure?', function (isSave) {
            if (isSave) {
                var updateObj = { part:
                    {
                        ID: -1
                        , PART_NAME: row.PART_NAME
                        , SHORT_NAME: row.SHORT_NAME
                        , PART_NO: row.PART_NO
                        , PROD_LENGTH: row.PROD_LENGTH
                        , PACKING_TYPE: row.PACKING_TYPE
                        , PLASTIC_1: row.PLASTIC_1
                        , PLASTIC_2: row.PLASTIC_2
                        , PLASTIC_3: row.PLASTIC_3
                        , METAL: row.METAL
                        , PROFILE_1: row.PROFILE_1
                        , PROFILE_2: row.PROFILE_2
                        , EXTCUT: row.EXTCUT
                        , PACK_PCS_LOT: row.PACK_PCS_LOT
                        , PCS_TRAY: row.PCS_TRAY
                        , PCS_CART_LOT: row.PCS_CART_LOT
                        , SIZECART: row.SIZECART
                        , LENGTH: row.LENGTH
                        , LINE_SPEED: row.LINE_SPEED
                        , PART_IMAGE: row.PART_IMAGE
                    }
                }

                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: '/Masters/Parts.aspx/Create',
                    data: JSON.stringify(updateObj),
                    success: function (result) {
                        load_datalist();
                    }
                });
            }
            else {
                $(grid_option.id).datagrid('rejectChanges');
            }
        });
    }

    function fn_save_change(row, changes) {
        $.messager.confirm('Confirm', 'Are you sure?', function (isSave) {
            if (isSave) {
                var updateObj = { part:
                    {
                        ID: row.ID
                        , PART_NAME: row.PART_NAME
                        , SHORT_NAME: row.SHORT_NAME
                        , PART_NO: row.PART_NO
                        , PROD_LENGTH: row.PROD_LENGTH
                        , PACKING_TYPE: row.PACKING_TYPE
                        , PLASTIC_1: row.PLASTIC_1
                        , PLASTIC_2: row.PLASTIC_2
                        , PLASTIC_3: row.PLASTIC_3
                        , METAL: row.METAL
                        , PROFILE_1: row.PROFILE_1
                        , PROFILE_2: row.PROFILE_2
                        , EXTCUT: row.EXTCUT
                        , PACK_PCS_LOT: row.PACK_PCS_LOT
                        , PCS_TRAY: row.PCS_TRAY
                        , PCS_CART_LOT: row.PCS_CART_LOT
                        , SIZECART: row.SIZECART
                        , LENGTH: row.LENGTH
                        , LINE_SPEED: row.LINE_SPEED
                        , PART_IMAGE: row.PART_IMAGE
                    }
                }

                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: '/Masters/Parts.aspx/Update',
                    data: JSON.stringify(updateObj),
                    success: function (result) {
                        load_datalist();
                    }
                });
            }
            else {
                $(grid_option.id).datagrid('rejectChanges');
            }
        });
    }

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <br/>      
        <div class="o-1" style="margin-left: auto;height: 75px;margin-right: auto;width: 930px;">
	            <h1 id="h2" style="float:left; margin-left:30px;font-size: 23px;color: #264DB1;font-weight: bold;">Part Master Data</h1>
	            <div class="page-options-nav" style="margin-top:15px;float:right;margin-right:20px;">
                    <a class="fancy-button insert-button arrow-down" href="javascript:void(0)">Insert Row<span class="arrow-down-icon"></span></a> 
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="fancy-button filter-button arrow-down" href="javascript:void(0)">Filter Data<span class="arrow-down-icon"></span></a> 
                    &nbsp;&nbsp;&nbsp;&nbsp;
	            </div>
	        <div class="cb"></div>
        </div>  
        <div class="filter-display">
        </div>
        <div style="margin-left:auto;margin-right:auto;width:930px;">
	        <table id="ma_part" title="Issued KANBAN" style="width:930px;height:500px;"
			        singleSelect="true" iconCls="icon-save" rownumbers="false"
			        idField="itemid" pagination="true" toolbar="#tb"
                    data-options="pageSize: 20">
		        <thead>
                    <%--KanbnaId,customer_name,model_name,part_name,part_no,tag_id,quantity,total_quantity--%>
			        <tr>
				        <th field="ID" width="95" >ID</th>
				        <th field="PART_NAME" width="250">Part Name</th>
				        <th field="PART_NO" width="200" >Paet No</th>
				        <th field="PROD_LENGTH" width="130">Prod. Length</th>
				        <th field="PART_TYPE" width="100" align="center">Part Type</th>
				        <th field="UNIT_QTY" width="100" align="right">Quantity/Unit</th>
				        <th field="ACTION" width="120" align="right">Action</th>
			        </tr>
		        </thead>
	        </table>
            <div id="tb" class="grid-toolbar" >
		        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:insert_row();">Add</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="javascript:edit_row();">Edit</a>
		        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:delete_row();">remove</a>
	        </div>
        </div>
</asp:Content>
