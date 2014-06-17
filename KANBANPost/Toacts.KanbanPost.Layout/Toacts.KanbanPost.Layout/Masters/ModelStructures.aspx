<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Site1.Master" AutoEventWireup="true" CodeBehind="ModelStructures.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Masters.ModelStructures" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script  type="text/javascript" language="javascript" src="../Scripts/javascript.grid.js"></script>

<script  type="text/javascript" language="javascript" >
    var _BUFFER_PART_ID = 0;
    var _BUFFER_PART_TEXT = "";
    var data_buffer;

    $(function () {

        grid_option.id = "#ma_structures";
        grid_option.frozenColumns = [[
                    { field: 'PART_ID', title: 'ID', width: 60, hidden: true },
                    { field: 'ID', title: 'ID', width: 60 },
                    { field: 'PART_NAME', title: 'PART NAME', width: 180, align: 'right',
                        formatter: function (value, row, index) {
                            // console.log('START==> formatter');
                            if (_IS_UPDATE || _IS_INSERT) {
                                value = load_dll_part();
                            }
                            else{
                                if (_BUFFER_PART_TEXT != null && _BUFFER_PART_TEXT != '')
                                    value = _BUFFER_PART_TEXT;
                            }
                            // console.log('END==> formatter');
                            return value;
                        }
                    },
                    { field: 'PART_NO', title: 'PART NO', width: 180, align: 'right'}]];
        grid_option.columns = [[
                    { field: 'PROD_LENGTH', title: 'PROD_LENGTH', width: 120, align: 'right' },
                    { field: 'PART_TYPE', title: 'PART TYPE', width: 90, align: 'right' },
                    { field: 'UNIT_QTY', title: 'UNIT QTY', width: 90, align: 'center' },
                    { field: 'LOT_SIZE', title: 'Lot Size', width: 110, align: 'center', editor: 'numberbox' },
                    { field: 'LINE_SPEED', title: 'Line Speed', width: 110, align: 'center', editor: 'numberbox' }
                ]];
        grid_option.url = '/Masters/ModelStructures.aspx/GetList';
        grid_option.url_delete = "/Masters/ModelStructures.aspx/Delete";
        grid_option.fn_save_update = fn_save_change;
        grid_option.fn_save_create = fn_save_create;
        ini_grid();
        load_part_list();
    });

    function fn_save_create(row, changes) {
        if (((changes.LOT_SIZE != undefined && changes.LOT_SIZE != '') || (changes.LINE_SPEED != undefined && changes.LINE_SPEED != '')) && (_BUFFER_PART_ID != null && _BUFFER_PART_ID != '')) {
            $.messager.confirm('Confirm', 'Are you sure?', function (isSave) {
                if (isSave) {
                    var updateObj = { obj:
                        {
                            
                            ID: -1,
                            PART_ID: _BUFFER_PART_ID,
                            LOT_SIZE: row.LOT_SIZE,
                            LINE_SPEED: row.LINE_SPEED
                        }
                    }

                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        url: '/Masters/ModelStructures.aspx/Create',
                        data: JSON.stringify(updateObj),
                        success: function (result) {
                            load_datalist();
                        }
                    });
                    _BUFFER_PART_ID = null;
                    _BUFFER_PART_TEXT = null;
                }
                else {
                    _BUFFER_PART_ID = null;
                    _BUFFER_PART_TEXT = null;
                    $(grid_option.id).datagrid('rejectChanges');
                }
            });
        }
        else {
            _BUFFER_PART_ID = null;
            _BUFFER_PART_TEXT = null;
            $(grid_option.id).datagrid('rejectChanges');
        }
    }

    function fn_save_change(row, changes) {
        var i = _INDEX;
        var r = row;

        if (changes.LOT_SIZE != undefined || changes.LINE_SPEED != undefined || (_BUFFER_PART_ID != null && _BUFFER_PART_ID != '')) {
            $.messager.confirm('Confirm', 'Are you sure?', function (isSave) {
                if (isSave) {
                    if (_BUFFER_PART_ID != null && _BUFFER_PART_ID != '') {
                        r.PART_ID = _BUFFER_PART_ID;
                        _BUFFER_PART_ID = null;
                        _BUFFER_PART_TEXT = null;
                    }

                    var updateObj = { obj:
                        {
                            ID: row.ID,
                            PART_ID: r.PART_ID,
                            LOT_SIZE: r.LOT_SIZE,
                            LINE_SPEED: r.LINE_SPEED
                        }
                    }

                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        url: '/Masters/ModelStructures.aspx/Update',
                        data: JSON.stringify(updateObj),
                        success: function (result) {
                            load_datalist();
                        }
                    });
                }
                else {
                    _BUFFER_PART_ID = null;
                    _BUFFER_PART_TEXT = null;
                    $(grid_option.id).datagrid('rejectChanges');
                }
            });
        }
    }

    function load_dll_part() {
        var dll = '';
        if (data_buffer != undefined && data_buffer != null) {
            var data = data_buffer.rows;
            dll = "<select id='dll_ma_part' onchange='onDllChange(this);' style='width:170px;' >";
            for (var i = 0; i < data.length; i++) {
                dll += "<option value='" + data[i].ID + "' >" + data[i].PART_NAME + "</option>";
            }
            dll += "</select>";
        }
        return dll;
    }

    function load_part_list() {
        $.ajax({
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            url: '/Masters/Parts.aspx/GetDllList',
            success: function (result) {
                data_buffer = result.d;
            }
        });
    }

    function onDllChange(obj) {
        _BUFFER_PART_ID = $(obj).val();
        _BUFFER_PART_TEXT = $("#"+obj.id+" option:selected").text();
    }

</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br/>  
        <div class="o-1" style="margin-left: auto;height: 75px;margin-right: auto;width: 930px;">
	            <h1 id="h2" style="float:left; margin-left:30px;font-size: 23px;color: #264DB1;font-weight: bold;">Model Structures Data</h1>
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
	        <table id="ma_structures" title="Issued KANBAN" style="width:930px;height:500px;"
			        singleSelect="true" iconCls="icon-save" rownumbers="false"
			        idField="itemid" pagination="true" toolbar="#tb"
                    data-options="pageSize: 20" >
		        <thead>
                    <%--KanbnaId,customer_name,model_name,part_name,part_no,tag_id,quantity,total_quantity--%>
			        <tr>
				        <th field="ID" width="95" >ID</th>
                        <th field="PART_ID" width="95">Part ID</th>
				        <th field="PART_NAME" width="250">Part Name</th>
				        <th field="PART_NO" width="200" >Paet No</th>
				        <th field="PROD_LENGTH" width="130">Prod. Length</th>
				        <th field="PACKING_TYPE" width="100" align="center">Part Type</th>
				        <th field="UNIT_QTY" width="100" align="right">Quantity/Unit</th>
				        <th field="ACTION" width="120" align="right">Action</th>
                        <th field="LOT_SIZE" width="100" align="right">Lot Size</th>
				        <th field="LINE_SPEED" width="100" align="right">Line Speed</th>
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
