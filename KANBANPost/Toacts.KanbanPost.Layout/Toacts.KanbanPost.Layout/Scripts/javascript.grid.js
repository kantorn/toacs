// Doc Ready
//<![CDATA[

var grid_option = {
    id: "",
    pageable: true,
    autoheight: true,
    singleSelect: true,
    frozenColumns: [[]],
    columns: [[]],
    url: "",
    url_delete : "",
    fn_save_update: function () { },
    fn_save_create: function () { }
};

    var _INDEX = null;
    var _IS_INSERT = false;
    var _IS_UPDATE = false;

    var _IS_SAVE_INSERT = false;
    var _IS_SAVE_UPDATE = false;
    var _PAGE_NUMBER = 1;
    var _PAGE_SIZE = 20;

    function ini_grid(){
        $('#h1').activity({ segments: 8, width: 2, space: 0, length: 3, speed: 1.5, align: 'right' });

        $(grid_option.id).datagrid({
            pageable: grid_option.pageable,
            autoheight: grid_option.autoheight,
            singleSelect: grid_option.singleSelect,
            frozenColumns: grid_option.frozenColumns,
            columns: grid_option.columns,
            onBeforeEdit: function (index, row) {
                // console.log('START==> onBeforeEdit');
                row.editing = true;
                // console.log('END==> onBeforeEdit');
            },
            onAfterEdit: function (index, row, changes) {
                // console.log('START==> onAfterEdit');
                row.editing = false;
                if (_IS_SAVE_UPDATE) {
                    grid_option.fn_save_update(row, changes);
                    _IS_SAVE_UPDATE = false;
                }
                else if (_IS_SAVE_INSERT) {
                    grid_option.fn_save_create(row, changes);
                    _IS_SAVE_INSERT = false;
                }
                // console.log('END==> onAfterEdit');
            },
            onCancelEdit: function (index, row) {
                // console.log('START==> onCancelEdit');
                row.editing = false;
                // console.log('END==> onCancelEdit');
            },
            onSelect: function (index, row) {
                // console.log('START==> onSelect');
                if (_IS_UPDATE && (index != _INDEX)) {
                    row.editing = false;
                    _IS_UPDATE = false;
                    _IS_SAVE_UPDATE = true;
                    $(grid_option.id).datagrid('endEdit', _INDEX);
                }
                else if (_IS_INSERT && (index != _INDEX)) {
                    row.editing = false;
                    _IS_INSERT = false;
                    _IS_SAVE_INSERT = true;
                    $(grid_option.id).datagrid('endEdit', _INDEX);
                }
                // console.log('END==> onSelect');
            },
            onLoadSuccess: function () {
                ini_paging();
            }
        });

        load_datalist()
    }

    function getIndex() {
        var selectedrow = $(grid_option.id).datagrid("getSelected");
        var rowIndex = $(grid_option.id).datagrid("getRowIndex", selectedrow);
        _INDEX = rowIndex;
    }


    function editrow(target) {
        $(grid_option.id).datagrid('beginEdit', getRowIndex(target));
    }

    function getRowIndex(target) {
        var tr = $(target).closest('tr.datagrid-row');
        return parseInt(tr.attr('datagrid-row-index'));
    }


    function saverow(target) {
        $(grid_option.id).datagrid('endEdit', getRowIndex(target));
    }

    function cancelrow(target) {
        $(grid_option.id).datagrid('cancelEdit', getRowIndex(target));
    }

    function deleterow(target) {
        $.messager.confirm('Confirm', 'Are you sure?', function (r) {
            if (r) {
                $(grid_option.id).datagrid('deleterow', getRowIndex(target));
            }
        });
    }

    function insert_row() {
        if (!_IS_INSERT) {
            _IS_INSERT = true; _IS_UPDATE = false;
            _INDEX = 0;
            $(grid_option.id).datagrid('insertRow', { index: 0, row: {} });
            $(grid_option.id).datagrid('selectRow', 0);
            $(grid_option.id).datagrid('beginEdit', 0);
        }
    }

    function edit_row() {
        getIndex();
        if (!_IS_UPDATE) {
            _IS_UPDATE = true;
            var row = $(grid_option.id).datagrid('getSelected');
            row.editing = true;
            $(grid_option.id).datagrid('updateRow', {
                index: _INDEX,
                row: {}
            });
            $(grid_option.id).datagrid('beginEdit', _INDEX);
        }
    }

    function delete_row() {
        getIndex();
        $.messager.confirm('Confirm', 'Are you sure?', function (isSave) {
            if (isSave) {
                var row = $(grid_option.id).datagrid('getSelected');
                var obj = { ID: row.ID }
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: grid_option.url_delete,
                    data: JSON.stringify(obj),
                    success: function (result) {
                        load_datalist();
                    }
                });
            }
        });
    }

    function updateActions(index, row) {
        $(grid_option.id).datagrid('updateRow', {
            index: index,
            row: row
        });
    }

    function load_datalist() {
        var url = grid_option.url;
        var obj = { pageNumber: _PAGE_NUMBER, pageSize: _PAGE_SIZE };

       $.ajax({
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(obj),
            url: url,
            success: function (result) {
                $(grid_option.id).datagrid({
                    data: result.d
                });
                $('.pagination').pagination('refresh', {	
                    total: result.d.total,
                    pageNumber: _PAGE_NUMBER,
                    pageSize: _PAGE_SIZE
                });
                $(grid_option.id).datagrid('clearSelections');
            }
        });
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
//]]>

    // paging

    function ini_paging() {
        $('.pagination').pagination({
            onSelectPage: function (pageNumber, pageSize) {
                _PAGE_NUMBER = pageNumber;
                _PAGE_SIZE = pageSize;
                load_datalist();
            }
        });
    }


