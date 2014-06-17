<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Site1.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Masters.Customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script  type="text/javascript" language="javascript" src="../Scripts/javascript.grid.js"></script>

<script  type="text/javascript" language="javascript" >
    $(function () {
        grid_option.id = '#ma_customer';
        grid_option.url = '/Masters/Customers.aspx/GetList';
        grid_option.url_delete = "/Masters/Customers.aspx/Delete";

        grid_option.columns = [[
                { field: 'ID', title: 'ID', width: 100 },
                { field: 'CUSTOMER_NAME', title: 'CUSTOMER NAME', width: 390, editor: 'text' },
                { field: 'CUSTOMER_SHOT', title: 'CUSTOMER SHOT', width: 390,  editor: 'text' }]];

        grid_option.fn_save_update = fn_save_change;
        grid_option.fn_save_create = fn_save_create;
        ini_grid();
    });

    function fn_save_create(row, changes) {
        $.messager.confirm('Confirm', 'Are you sure?', function (isSave) {
            if (isSave) {
                var reqObj = { reqObj:
                    {
                        ID: -1
                        , CUSTOMER_NAME: row.CUSTOMER_NAME
                        , CUSTOMER_SHOT: row.CUSTOMER_SHOT
                    }
                }

                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: '/Masters/Customers.aspx/Create',
                    data: JSON.stringify(reqObj),
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
                var reqObj = { reqObj:
                    {
                        ID: row.ID
                        , CUSTOMER_NAME: row.CUSTOMER_NAME
                        , CUSTOMER_SHOT: row.CUSTOMER_SHOT
                    }
                }

                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: '/Masters/Customers.aspx/Update',
                    data: JSON.stringify(reqObj),
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
                    <a class="fancy-button filter-button arrow-down" href="javascript:void(0)">Filter Data<span class="arrow-down-icon"></span></a> 
                    &nbsp;&nbsp;&nbsp;&nbsp;
	            </div>
	        <div class="cb"></div>
        </div>  
        <div class="filter-display">
        </div>
        <div style="margin-left:auto;margin-right:auto;width:930px;">
	        <table id="ma_customer" title="Issued KANBAN" style="width:930px;height:500px;"
			        singleSelect="true" iconCls="icon-save" rownumbers="false"
			        idField="itemid" pagination="true" toolbar="#tb"
                    data-options="pageSize: 20">
	        </table>
            <div id="tb" class="grid-toolbar" >
		        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:insert_row();">Add</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="javascript:edit_row();">Edit</a>
		        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:delete_row();">remove</a>
	        </div>
        </div>
</asp:Content>
