<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Site1.Master" AutoEventWireup="true" CodeBehind="Models.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Masters.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script  type="text/javascript" language="javascript" src="../Scripts/javascript.grid.js"></script>

<script  type="text/javascript" language="javascript" >
    var _BUFFER_ID = 0;
    var _BUFFER_TEXT = "";
    var data_buffer;

    $(function () {

        grid_option.id = "#ma_model";
        grid_option.url = '/Masters/Models.aspx/GetList';
        grid_option.url_delete = "/Masters/Models.aspx/Delete";

        grid_option.frozenColumns = [[
                    { field: 'CUSTOMER_ID', title: 'ID', hidden: true },
                    { field: 'ID', title: 'ID', width: 80 },
                    { field: 'MODEL_NAME', title: 'MODEL NAME', width: 200, editor: 'text' },
                    { field: 'PREFIX', title: 'PREFIX', width: 200, editor: 'text' },
                    { field: 'CUSTOMER_NAME', title: 'CUSTOMER_NAME', width: 200 ,
                        formatter: function (value, row, index) {
                            if (_IS_UPDATE || _IS_INSERT) {
                                value = bind_customer_data_dll();
                            }
                            else {
                                if (_BUFFER_TEXT != null && _BUFFER_TEXT != '')
                                    value = _BUFFER_TEXT;
                            }
                            return value;
                        }
                    },
                    { field: 'CUSTOMER_SHOT', title: 'CUSTOMER_SHOT', width: 200 }
                    ]];

        grid_option.fn_save_update = fn_save_change;
        grid_option.fn_save_create = fn_save_create;
        load_customer_list();
        ini_grid();
    });

    function fn_save_create(row, changes) {
        $.messager.confirm('Confirm', 'Are you sure?', function (isSave) {
            if (isSave) {
                var reqObj = { reqObj:
                    {
                        ID: -1
                        , CUSTOMER_ID: _BUFFER_ID
                        , MODEL_NAME: row.MODEL_NAME
                        , PREFIX: row.PREFIX
                    }
                }

                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: '/Masters/Models.aspx/Create',
                    data: JSON.stringify(reqObj),
                    success: function (result) {
                        load_datalist();
                    }
                });
                _BUFFER_ID = null;
                _BUFFER_TEXT = null;
            }
            else {
                _BUFFER_ID = null;
                _BUFFER_TEXT = null;
                $(grid_option.id).datagrid('rejectChanges');
            }
        });
    }

    function fn_save_change(row, changes) {
        $.messager.confirm('Confirm', 'Are you sure?', function (isSave) {
            if (isSave) {
                if (_BUFFER_ID != null && _BUFFER_ID != '') {
                    row.CUSTOMER_ID = _BUFFER_ID;
                    _BUFFER_ID = null;
                    _BUFFER_TEXT = null;
                }

                var reqObj = { reqObj:
                    {
                        ID: row.ID
                        , CUSTOMER_ID: row.CUSTOMER_ID
                        , MODEL_NAME: row.MODEL_NAME
                        , PREFIX: row.PREFIX
                    }
                }

                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: '/Masters/Models.aspx/Update',
                    data: JSON.stringify(reqObj),
                    success: function (result) {
                        load_datalist();
                    }
                });
            }
            else {
                _BUFFER_ID = null;
                _BUFFER_TEXT = null;
                $(grid_option.id).datagrid('rejectChanges');
            }
        });
    }

    function load_customer_list() {
        $.ajax({
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            url: '/Masters/Customers.aspx/GetDllList',
            success: function (result) {
                data_buffer = result.d;
            }
        });
    }

    function bind_customer_data_dll() {
        var dll = '';
        if (data_buffer != undefined && data_buffer != null) {
            var data = data_buffer.rows;
            dll = "<select id='dll_ma_customer' onchange='onDllChange(this);' style='width:170px;' ><option></option>";
            for (var i = 0; i < data.length; i++) {
                dll += "<option value='" + data[i].ID + "' >" + data[i].CUSTOMER_NAME + "</option>";
            }
            dll += "</select>";
        }
        return dll;
    }

    function onDllChange(obj) {
        _BUFFER_ID = $(obj).val();
        _BUFFER_TEXT = $("#" + obj.id + " option:selected").text();
    }
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br/>  
        <div class="o-1" style="margin-left: auto;height: 75px;margin-right: auto;width: 930px;">
	            <h1 id="h2" style="float:left; margin-left:30px;font-size: 23px;color: #264DB1;font-weight: bold;">Model Structures Data</h1>
	            <div class="page-options-nav" style="margin-top:15px;float:right;margin-right:20px;">
                    <a class="fancy-button filter-button arrow-down" href="javascript:void(0)">Filter Data<span class="arrow-down-icon"></span></a> 
                    &nbsp;&nbsp;&nbsp;&nbsp;
	            </div>
	        <div class="cb"></div>
        </div>  
        <div class="filter-display">
        </div>
        <div style="margin-left:auto;margin-right:auto;width:930px;">
	        <table id="ma_model" title="Issued KANBAN" style="width:930px;height:500px;"
			        singleSelect="true" iconCls="icon-save" rownumbers="false"
			        idField="itemid" pagination="true" toolbar="#tb"
                    data-options="pageSize: 20" >
	        </table>
            <div id="tb" class="grid-toolbar" >
		        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:insert_row();">Add</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="javascript:edit_row();">Edit</a>
		        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:delete_row();">remove</a>
	        </div>
        </div>
</asp:Content>
