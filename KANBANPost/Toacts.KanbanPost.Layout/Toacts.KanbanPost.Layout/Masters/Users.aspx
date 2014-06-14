<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Site1.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Masters.Users" %>
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

        $('#ma_part').datagrid({
            pageable: true,
            autoheight: true,
            rownumbers: false,
            singleSelect: true, columns: [[
            { field: 'id', title: 'id', width: 60, hidden: true },
            { field: 'username', title: 'User Name', width: 240, align: 'left', editor: 'text' },
            { field: 'password', title: 'Password', width: 190, align: 'rigleftht', editor: 'text' },
            { field: 'roleid', title: 'RoleId', hidden: true },
            { field: 'rolename', title: 'Role Name', align: 'left', width: 90, editor: 'text' },
            { field: 'Action', title: 'Action', width: 190, align: 'center',
                formatter: function (value, row, index) {
                    if (row.editing) {
                        var s = '<a href="#" onclick="saverow(this)">Save</a> ';
                        var c = '<a href="#" onclick="cancelrow(this)">Cancel</a>';
                        return s + c;
                    } else {
                        var e = '<a href="#" onclick="editrow(this)">Edit</a> ';
                        var d = '<a href="#" onclick="deleterow(this)">Delete</a>';
                        return e + d;
                    }
                }
            }
        ]],
            onBeforeEdit: function (index, row) {
                row.editing = true;
                updateActions(index);
            },
            onAfterEdit: function (index, row) {
                row.editing = false;
                updateActions(index);
            },
            onCancelEdit: function (index, row) {
                row.editing = false;
                updateActions(index);
            }
        })

        $('#ma_part').datagrid('getPanel').addClass('lines-bottom');

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

        $('.insert-button').click(function () {
            insert();
        });
    });
    //]]>

    function updateActions(index) {
        $('#ma_part').datagrid('updateRow', {
            index: index,
            row: {}
        });
    }
    function getRowIndex(target) {
        var tr = $(target).closest('tr.datagrid-row');
        return parseInt(tr.attr('datagrid-row-index'));
    }
    function editrow(target) {
        $('#ma_part').datagrid('beginEdit', getRowIndex(target));
    }
    function deleterow(target) {
        $.messager.confirm('Confirm', 'Are you sure?', function (r) {
            if (r) {
                $('#tt').datagrid('deleteRow', getRowIndex(target));
            }
        });
    }
    function saverow(target) {
        $('#ma_part').datagrid('endEdit', getRowIndex(target));
    }
    function cancelrow(target) {
        $('#ma_part').datagrid('cancelEdit', getRowIndex(target));
    }
    function insert() {
        var row = $('#ma_part').datagrid('getSelected');
        if (row) {
            var index = $('#ma_part').datagrid('getRowIndex', row);
        } else {
            index = 0;
        }
        $('#ma_part').datagrid('insertRow', {
            index: index,
            row: {
                status: 'P'
            }
        });
        $('#ma_part').datagrid('selectRow', index);
        $('#ma_part').datagrid('beginEdit', index);
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
        <div class="o-1"  >
	            <h1 id="h2"  >User Data</h1>
	            <div class="page-options-nav" >
                    <a class="fancy-button insert-button arrow-down" href="javascript:void(0)">Insert Row<span class="arrow-down-icon"></span></a> 
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="fancy-button filter-button arrow-down" href="javascript:void(0)">Filter Data<span class="arrow-down-icon"></span></a> 
                    &nbsp;&nbsp;&nbsp;&nbsp;
	            </div>
	        <div class="cb"></div>
        </div>  
        <div class="filter-display">
        </div>
        <div style="width:730px;margin-left:auto;margin-right:auto;" >
	        <table id="ma_part" title="Issued KANBAN" style="width:730px;height:auto;"
			        url="/Handler/OperatorMasterHandler.axd" 
			        singleSelect="true" iconCls="icon-save" rownumbers="true"
			        idField="itemid" pagination="true" 
                    data-options="pageSize: 20">
	        </table>
        </div>
    </div>
</asp:Content>
