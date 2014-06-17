/*********************
* List View - JS
**********************/

/** Dialog **/

    /** Constants **/
    var ListViewConstants = {
        dialogWidth: 780,
        dialogIframeMinWidth: 700,
        dialogIframeMinHeight: 650,
        modalLoadingMessage: "LOADING... PLEASE WAIT",
        modalAddPageUrl: "Add.aspx"
    };

    var ListViewImportConstants = {
        dialogWidth: 800,
        dialogIframeMinWidth: 700,
        dialogIframeMinHeight: 570,
        modalLoadingMessage: "LOADING... PLEASE WAIT",
        modalAddPageUrl: "/LeaseApplications/TrackiTImport.aspx"
    };
    
    var TMTTransferConstants = {
        dialogWidth: 800,
        dialogIframeMinWidth: 700,
        dialogIframeMinHeight: 570,
        modalLoadingMessage: "LOADING... PLEASE WAIT",
        modalImportPageUrl: "/LeaseApplications/TMTtransfer.aspx"
    };

    var SiteAddDialogConstants = {
        dWidth: 730,
        iframe_minHeight: 320,
        iframe_minWidth: 730
    };

    /** Globals **/
    var site_id = "";
    var HasId = false;
    var m_txtGS = "";
    var m_isGSDelete = false;
    var m_isGSFilter = false;
    var m_sCurrentGSLabel = "gs"; //using gs as default
    /** /Globals **/

    //Accessor for global search string.
    var GS_CONTROL_NAME = 'txtGeneral';
    function getCurrentGS() {
        return m_txtGS;
    }
    function setCurrentGS(sInput) {
        m_txtGS = decodeURIComponent(sInput);
    }
    //-->
    //Utility for global search
    function CheckGSFilter(postText) {
        var queries = postText.split("|");
        var blnIsProcess = false;
        for (var i = 0; i < queries.length; i += 2) {
            if (queries[i] == GS_CONTROL_NAME) {
                setCurrentGS(queries[i + 1]);
                blnIsProcess = true;
                m_isGSFilter = true;
                break;
            }
        }
        return blnIsProcess;
    }
    //-->

    // Create resizable modal function to apply before call 
    function setModalSize(dWidth, iframe_minWidth, iframe_minHeight) {
        ListViewConstants = null;
        ListViewConstants = {
            dialogWidth: dWidth,
            dialogIframeMinWidth: iframe_minWidth,
            dialogIframeMinHeight: iframe_minHeight,
            modalLoadingMessage: "LOADING... PLEASE WAIT",
            modalAddPageUrl: "Add.aspx"
        };
    }
    //-->

    // Setup List Create Modal
    function setupListCreateModal(title) {

        // Create New Dialog
        var optionsCreate = {
            autoOpen: false,
            width: ListViewConstants.dialogWidth,
            modal: true,
            title: title,
            open: function (event, ui) {
                $('#modal-loading').show();
                $('#modalIframeId').load(function () {
                    $('#modal-loading').fadeOut();
                });
            }
        };
        //
        $("#modalExternal").dialog(optionsCreate);
        //
        $('#modalBtnExternal').click(function () {
            showCreateDialog();
        });
    }
    //-->

    // Setup Create Import Modal
    function setupListImportCreateModal(title) {

        // Create New Dialog
        var optionsCreate = {
            autoOpen: false,
            width: ListViewImportConstants.dialogWidth,
            modal: true,
            title: title,
            open: function (event, ui) {
                $('#modal-loading').show();
                $('#modalMasterIframeId').load(function () {
                    $('#modal-loading').fadeOut();
                });
            }
        };
        //
        $("#modalMasterExternal").dialog(optionsCreate);
        //
        $('#topNav_HeadLoginView_hypImportApplication').click(function () {
            showImportDialog();
        });
    }
    //-->

    // Setup Create Import Modal
    function setupTMTViewApplicationModal(title) {

        // Create New Dialog
        var optionsCreate = {
            autoOpen: false,
            width: ListViewImportConstants.dialogWidth,
            modal: true,
            title: title,
            open: function (event, ui) {
                $('#tmt-modal-loading').show();
                $('#modalMasterTMTIframeId').load(function () {
                    $('#tmt-modal-loading').fadeOut();
                });
            }
        };
        //
        $("#modalMasterTMTExternal").dialog(optionsCreate);
        
    }
    //-->


    // Setup List Create Modal
    function setupListCreateModalWithID(title, id) {
        HasId = true;
        site_id = id;
        // Create New Dialog
        var optionsCreate = {
            autoOpen: false,
            width: ListViewConstants.dialogWidth,
            modal: true,
            title: title,
            open: function (event, ui) {
                $('#modal-loading').show();
                $('#modalIframeId').load(function () {
                    $('#modal-loading').fadeOut();
                });
            }
        };
        //
        $("#modalExternal").dialog(optionsCreate);
        //
        $('#modalBtnExternal').click(function () {
            showCreateDialog();
        });
    }
    //-->

    // Show Create Dialog
    function showCreateDialog() {

        //$("#modalExternal").html('<iframe id="modalIframeId" scrolling="no" style="width:100%;height:100%;overflow:hidden;min-height:' + ListViewConstants.dialogIframeMinHeight + 'px;min-width:' + ListViewConstants.dialogIframeMinWidth + 'px;" marginWidth="0" marginHeight="0" frameBorder="0" scrolling="no" /><div id="modal-loading">' + ListViewConstants.modalLoadingMessage + '</div>').dialog("open");
        
        // Set the modal "height" to "auto" for Safari

        $("#modalExternal").html('<iframe id="modalIframeId" scrolling="no" style="width:100%;height:auto;overflow:hidden;min-height:' + ListViewConstants.dialogIframeMinHeight + 'px;min-width:' + ListViewConstants.dialogIframeMinWidth + 'px;" marginWidth="0" marginHeight="0" frameBorder="0" scrolling="no" /><div id="modal-loading">' + ListViewConstants.modalLoadingMessage + '</div>').dialog("open");

        if (HasId) {
            $("#modalIframeId").attr("src", ListViewConstants.modalAddPageUrl + "?id=" + site_id);
        }
        else {
            $("#modalIframeId").attr("src", ListViewConstants.modalAddPageUrl);
        }
        
        return false;
    }
    //-->

    function getIframeWindow(iframe_object) {
        var doc;

        if (iframe_object.contentWindow) {
            return iframe_object.contentWindow;
        }

        if (iframe_object.window) {
            return iframe_object.window;
        }

        if (!doc && iframe_object.contentDocument) {
            doc = iframe_object.contentDocument;
        }

        if (!doc && iframe_object.document) {
            doc = iframe_object.document;
        }

        if (doc && doc.defaultView) {
            return doc.defaultView;
        }

        if (doc && doc.parentWindow) {
            return doc.parentWindow;
        }

        return undefined;
    }

    function setupImportApplicationModal(title) {
        // Create New Dialog
        var optionsCreate = {
            autoOpen: false,
            width: TMTTransferConstants.dialogWidth,
            modal: true,
            title: title,
            open: function (event, ui) {
                $('#modal-loading').show();
                $('#modalImportIframeId').load(function () {
                    $('#modal-loading').fadeOut();
                });
            },
            close: function (event, ui) {
                var el = document.getElementById('modalMasterIframeId');
                getIframeWindow(el).closeDialog();
            }
        };
        //
        $("#modalImportExternal").dialog(optionsCreate);
    }

    function OnImportApplication(TMO_AppID, site, apptype, customer, dba) {
        $("#modalImportExternal").html('<iframe id="modalImportIframeId" scrolling="no" style="overflow-x:hidden;width:100%;height:100%;overflow:hidden;min-height:' + TMTTransferConstants.dialogIframeMinHeight + 'px;min-width:' + TMTTransferConstants.dialogIframeMinWidth + 'px;" marginWidth="0" marginHeight="0" frameBorder="0" scrolling="no" /><div id="modal-loading">' + TMTTransferConstants.modalLoadingMessage + '</div>').dialog("open");
        $("#modalImportIframeId").attr("src", TMTTransferConstants.modalImportPageUrl + "?tmoid=" + TMO_AppID + "&site=" + site + "&apptype=" + apptype + "&customer=" + customer + "&dba=" + dba);
        return false;
    }

    // Show Create Import Dialog
    function showImportDialog() {

        //$("#modalExternal").html('<iframe id="modalIframeId" scrolling="no" style="width:100%;height:100%;overflow:hidden;min-height:' + ListViewConstants.dialogIframeMinHeight + 'px;min-width:' + ListViewConstants.dialogIframeMinWidth + 'px;" marginWidth="0" marginHeight="0" frameBorder="0" scrolling="no" /><div id="modal-loading">' + ListViewConstants.modalLoadingMessage + '</div>').dialog("open");

        // Set the modal "height" to "auto" for Safari

        $("#modalMasterExternal").html('<iframe id="modalMasterIframeId" scrolling="yes" style="overflow:auto;width:100%;height:auto;min-height:' + ListViewImportConstants.dialogIframeMinHeight + 'px;min-width:' + ListViewImportConstants.dialogIframeMinWidth + 'px;" marginWidth="0" marginHeight="0" frameBorder="0" scrolling="no" /><div id="modal-loading">' + ListViewImportConstants.modalLoadingMessage + '</div>').dialog("open");

        $("#modalMasterIframeId").attr("src", ListViewImportConstants.modalAddPageUrl);

        return false;
    }

    // Show Create Import Dialog
    function showViewAppDialog(url) {

        //$("#modalExternal").html('<iframe id="modalIframeId" scrolling="no" style="width:100%;height:100%;overflow:hidden;min-height:' + ListViewConstants.dialogIframeMinHeight + 'px;min-width:' + ListViewConstants.dialogIframeMinWidth + 'px;" marginWidth="0" marginHeight="0" frameBorder="0" scrolling="no" /><div id="modal-loading">' + ListViewConstants.modalLoadingMessage + '</div>').dialog("open");

        // Set the modal "height" to "auto" for Safari

        $("#modalMasterTMTExternal").html('<iframe id="modalMasterTMTIframeId" scrolling="yes" style="width:100%;height:auto;overflow-y:auto;overflow-x:hidden;min-height:' + ListViewImportConstants.dialogIframeMinHeight + 'px;min-width:' + ListViewImportConstants.dialogIframeMinWidth + 'px;" marginWidth="0" marginHeight="0" frameBorder="0" scrolling="no" /><div id="tmt-modal-loading">' + ListViewImportConstants.modalLoadingMessage + '</div>').dialog("open");

        $("#modalMasterTMTIframeId").attr("src", url);

        return false;
    }
    //-->
/** /Dialog **/

/** Search List Filter **/

    // Global Variables
    var searchFilterFields = "";
    var currentFlexiGridID = null;
    var arrayOfFilters = new Array();
    var arrayOfExcludeFilters = new Array();
    var savedFiltersQueryString = "";
    var isNewSearchFilter = false;
    //>

    // Constants
    var SearchFilterControlTypes = {
        TextBox: 'txt',
        DropDownList: 'ddl',
        UserControl: 'ctr',
        ListBox: 'lsb'
    };
    //>

    // Setup Search Filter
    function setupSearchFilter() {

        // Clear Filter Button
        $('.clear-filter-button').click(function () {
            resetFilterTags();
            resetSearchFilter();
        });
        //
        // Filter Button
        $('.filter-button').click(function () {
            $('.filter-box').slideToggle();
        });
        //
        // Close Filter Button
        $('.close-filter').click(function () {
            $('.filter-box').slideUp();
        });
        //
        // Apply Search Filter
        $('.apply-search-filter').click(function () {
            applySearchFilter(true);
            isNewSearchFilter = true;
        });
        //>
    }
    //-->

    // Apply Search Filter
    function applySearchFilter(process)
    {
       // Since the same method is used on all the search filters, we check for existence and
       // the validator status before proceeding with the filter.
       if (
           (typeof valAppReceivedFrom != 'undefined' && valAppReceivedFrom.isvalid == false) ||
           (typeof valAppReceivedTo != 'undefined' && valAppReceivedTo.isvalid == false) ||
           (typeof valAppFeeReceivedFrom != 'undefined' && valAppFeeReceivedFrom.isvalid == false) ||
           (typeof valAppFeeReceivedTo != 'undefined' && valAppFeeReceivedTo.isvalid == false) ||
           (typeof valSiteOnAirDateFrom != 'undefined' && valSiteOnAirDateFrom.isvalid == false) ||
           (typeof valSiteOnAirDateTo != 'undefined' && valSiteOnAirDateTo.isvalid == false) ||
           (typeof valSDPRequestDateFrom != 'undefined' && valSDPRequestDateFrom.isvalid == false) ||
           (typeof valSDPRequestDateTo != 'undefined' && valSDPRequestDateTo.isvalid == false) ||
           (typeof valCurrentPackedRcvdFrom != 'undefined' && valCurrentPackedRcvdFrom.isvalid == false) ||
           (typeof valCurrentPackedRcvdTo != 'undefined' && valCurrentPackedRcvdFrom.isvalid == false) ||
           (typeof valProjectCompleteFrom != 'undefined' && valProjectCompleteFrom.isvalid == false) ||
           (typeof valProjectCompleteTo != 'undefined' && valProjectCompleteTo.isvalid == false)
          )
           {
              alert('Please fix invalid date(s) before continuing.');
           }
           else 
       {
          // Global Var
          arrayOfFilters = new Array();
          savedFiltersQueryString = "";

          // Show Filter Container
          $('.filter-tags-container').removeClass('not-displayed');

          // Reset Filter Tags
          resetFilterTags();
           
          //For Advance search : added by Nam 2012/01/20
          var totalSearchFields = searchFilterFields;
          var advSearchFields;
          if ( typeof GetCurrentAddedControlString != "undefined") {
             advSearchFields = GetCurrentAddedControlString();
          }

          if (advSearchFields != "") {
             totalSearchFields += ',' + advSearchFields;
         }
         //For Global search : added by Nam 2012/03/19
         if (!m_isGSDelete && getCurrentGS() != "") {
             var sGSLabel = "General Search"
             addFilterTag("gs", "General Search:", getCurrentGS(), "txt" + sGSLabel, getCurrentGS());
             m_sCurrentGSLabel = sGSLabel;
             // Add to Saved Filter QS
             if (savedFiltersQueryString.length > 0) {
                 savedFiltersQueryString += "|";
             }
             savedFiltersQueryString += ("txtGeneral|" + getCurrentGS());
             //Check if global search come from filter
             if (m_isGSFilter) {
                 addFilterPostParam('gs', getCurrentGS());
             }
         }
         //Check if global search come from filter
          // Build the Filter Tags
          var fields = totalSearchFields.split(",");

          for (var i = 0; i < fields.length; i++) {

             // Var
              //var field = $('#' + fields[i]);
             var field = $(document.getElementById(fields[i]));
             var fieldType = fields[i].substr(0, 3);
             var fieldLabel = new String(fields[i].substr(3, fields[i].length));
             var fieldDisplayValue = new String();
             var fieldValue = new String();
             var arrListBoxValues = [];
             var arrListBoxTextValues = [];

             // Field Type?
             switch (fieldType) {

                // TextBox
                 case (SearchFilterControlTypes.TextBox || SearchFilterControlTypes.UserControl):

                     var tv = new String(String($(field).val()));
                     if (!tv.isNullOrEmpty()) {

                         // Type of TextBox?
                         if ($(field).hasClass("datepicker")) {

                             // Date
                             var timestamp = Date.parse(tv);
                             if (isNaN(timestamp) == false) {
                                 fieldDisplayValue = tv;
                                 fieldValue = tv;
                             }
                         } else {
                             if ($(field).hasClass("moneyfield")) {
                                 tv = tv.replace("$", "");
                             }
                             // Standard
                             fieldDisplayValue = tv;
                             fieldValue = tv;
                         }
                         //>
                     }
                     break;

                // DropDownList   
                case SearchFilterControlTypes.DropDownList:
                //case SearchFilterControlTypes.sha:
                    if ($(field).get(0).selectedIndex > 0) {
                        fieldDisplayValue = $('#' + fields[i] + ' :selected').text();
                        fieldValue = $('#' + fields[i] + ' :selected').val();
                    }
                    break;

                // ListBox (Multi-selector) 
                case SearchFilterControlTypes.ListBox:
                    
                    $('#' + $(field).attr("id") + ' :selected').each(function (j, selected) {
                        if (!$(selected).val().toString().isNullOrEmpty()) {
                            arrListBoxValues.push($(selected).val());
                            arrListBoxTextValues.push($(selected).text());
                        }
                    });
                    break;
             }
             //>

            // Process,  Add Filters & Tags
            if (!fieldDisplayValue.isNullOrEmpty()) {

                // Add to Saved Filter QS
                if (savedFiltersQueryString.length > 0) savedFiltersQueryString += "|";
                savedFiltersQueryString += (fieldType + fieldLabel + "|" + fieldValue);

                // Add Filter Tag
                addFilterTag(fieldLabel, (fieldLabel.camelCaseToStringWithSpacesTest() + ":"), fieldDisplayValue, fieldType + fieldLabel, fieldValue);
                addFilterPostParam(fieldLabel, fieldValue);

            } else if ((fieldType == SearchFilterControlTypes.ListBox) && (arrListBoxValues.length > 0) && (arrListBoxTextValues.length > 0)) {
                
                // Multi-selector (ListBox)
                //alert('Multi-selector!');

                for (var k = 0; k < arrListBoxValues.length; k++) {

                    // Add to Saved Filter QS
                    if (savedFiltersQueryString.length > 0) savedFiltersQueryString += "|";
                    savedFiltersQueryString += (fieldType + fieldLabel + "|" + arrListBoxValues[k]);

                    // Add Filter Tag
                    addFilterTag(fieldLabel, (fieldLabel.camelCaseToStringWithSpacesTest() + ":"), arrListBoxTextValues[k], fieldType + fieldLabel, arrListBoxValues[k]);
                    addFilterPostParam(fieldLabel, arrListBoxValues[k]);

                }
            }
            //>
          }
          //>

          // Bind Remove Filter Buttons
          bindRemoveFilterButtons();

          // Show Filters
            $('.filter-tags-container').fadeIn("medium", function () {

                // Close Filter Box
                $('.filter-box').slideUp(function () {

                    // Process?
                    if (process) {

                        // update Default session
                        addFilterPostParam(ConstGlobal.DEFAULT.applyClick, "onRemoveClick");

                        // Re-load DataGrid
                        reloadDataGrid();
                    }
                    //>        
                });
            });
       }        
    }
    //-->

    // Re-load DataGrid
    function reloadDataGrid() {

        //Set interval to wait until find currentFlexigrid 
        var waitReload = setInterval(function () {
            if ($find(currentFlexiGridID) != null) {
                clearInterval(waitReload);
			    // Get Current FlexiGrid
                fg = $find(currentFlexiGridID).getFlexigrid();

                if ((fg !== null) && (fg !== undefined)) {

                    // Page number reset?
                    if (isNewSearchFilter) {
                        fg.flexOptions({ newp: 1 });
                        isNewSearchFilter = false;
                    }

                    // Reload and filter the FlexiGrid
                    fg.flexReload();
                }
            }
        }, 100)
    }
    //-->

    // Add Filter POST Param
    function addFilterPostParam(n, v) {
        //Ignore global search if tag was deleted.
        if (n != 'gs' || !m_isGSDelete) {
            arrayOfFilters.push({ name: n, value: v });
        }
    }
    //-->

    // Remove Filter Post Param
    function removeFilterPostParam(n) {
        arrayOfFilters = jQuery.grep(arrayOfFilters, function (a) {
            return (a.name != n);
        });
    }
    //-->

    // Remove Filter Post Param With Value Check
    function removeFilterPostParamWithValueCheck(n, v) {

        arrayOfFilters = jQuery.grep(arrayOfFilters, function (a) {
            if (a.name !== n && a.value !== v) {
                return true;
            }
            return false;
        });
    }
    //-->

    // Add Filter Tag
    function addFilterTag(tagID, tagType, tagContent, formControl, fieldValue) {
        tagType = tagType.replace("(", " (");
        if (tagType.indexOf('__') > -1) {
            tagType = tagType.replace("__", " (").replace("__", ")");
        }
        if (tagType.indexOf(')') < (tagType.length - 2)) {
            tagType = tagType.replace(")", ") ");
        }

        $(".filter-tags-container").append("<div class='filter-tag' id='tag" + tagID + "'><div style='float:left;'>" + tagType + "<br />" + tagContent + "</div><div class='remove-filter-button'>x</div><div class='filter-form-control' style='display:none;'>" + formControl + "</div><div class='filter-form-control-value' style='display:none;'>" + fieldValue + "</div></div>");
    }
    //-->

    // Reset Filter Tags
    function resetFilterTags() {

        $('.filter-tags-container').empty();
        $('.filter-tags-container').hide();
    }
    //-->

    // Bind Remove Filter Buttons
    function bindRemoveFilterButtons() {

        $('.remove-filter-button').click(function () {
            // Parent
            var parent = $(this).parent();

            // Get the Params
            var filterFormControl = $(parent).find('.filter-form-control').text();
            var fieldType = filterFormControl.substring(0, 3);
            var fieldLabel = filterFormControl.substring(3, filterFormControl.length);

            // Global Search?
            if (fieldLabel == m_sCurrentGSLabel) {
                m_isGSDelete = true;
            }

            // Is a multi-selector?
            if (fieldType != SearchFilterControlTypes.ListBox) {

                // No - single
                //-------------

                // Remove Param
                removeFilterPostParam(fieldLabel);

                // Reset Search Field
                resetSearchField(filterFormControl);

            } else {
                // Yes - multi
                //-------------

                // Get Field Value
                var fieldValue = $(parent).find('.filter-form-control-value').text();

                // Remove Param with Value Check
                removeFilterPostParamWithValueCheck(fieldLabel, fieldValue);

                // Reset Search Field With Value to Remove
                resetSearchFieldMultiWithValueToRemove(filterFormControl, fieldValue);
            }
            //>

           

            // Hide Tags Container?
            $(parent).fadeOut('medium', function () {

                // Re-load DataGrid
                applySearchFilter(true);

                // Remove & Clean-up
                $(parent).remove();
                if ($('.filter-tags-container').is(':empty')) {
                    $('.filter-tags-container').hide();
                    $('.filter-tags-container').addClass('not-displayed');
                    return false;
                }
            });
        });
    }
    //-->

    // Reset Search Filter
    function resetSearchFilter() {
        
        //For Advance search : added by Nam 2012/01/20
        var totalSearchFields = searchFilterFields;
        var advSearchFields = GetCurrentAddedControlString();
        if (advSearchFields != "") {
            totalSearchFields += ',' + advSearchFields;
        }
        
        // Iterate and reset fields
        var fields = totalSearchFields.split(",");
        // var fields = searchFilterFields.split(",");
        //
        for (var i = 0; i < fields.length; i++) {

            // Is a multi-selector?
            var fieldType = fields[i].substr(0, 3);
            if (fieldType != SearchFilterControlTypes.ListBox) {
                
                // Reset Search Field
                resetSearchField(fields[i]);

            } else {

                // Reset Search Field With Value to Remove
                resetSearchFieldMultiWithValueToRemove(fields[i], -1); // -1 = clear all options!
            }
        }
        //>

        // Reset Filters
        arrayOfFilters = new Array();
        arrayOfExcludeFilters = new Array();
        savedFiltersQueryString = "";

        // Re-load DataGrid
        reloadDataGrid();
    }
    //-->

    // Reset Search Field
    function resetSearchField(fieldId) {
     
        // Var
        //var field = $('#' + fieldId);
        var field = $(document.getElementById(fieldId));

        // Field Type?
        if ($(field).length > 0) {
            var fieldType = fieldId.substr(0, 3);
            switch (fieldType) {

                // TextBox  
                case SearchFilterControlTypes.TextBox:
                    $(field).val("");
                    break;

                // DropDownList  
                case SearchFilterControlTypes.DropDownList:
                    $(field).get(0).selectedIndex = 0;
                    break;
            }
        }
        //>
    }
    //-->
    
    // Reset Search Field
    function resetSearchFieldMultiWithValueToRemove(fieldId, value) {
        
        // Field Type?
        var fieldType = fieldId.substr(0, 3);
        switch (fieldType) {

            // ListBox
            case SearchFilterControlTypes.ListBox:

                // Mode?
                var removeall = false;
                if (value != '') {
                    if (value == -1) {
                        removeall = true;
                    }
                }

                if (!removeall) {
                    // Single Value

                    $('#' + fieldId + ' option[value="' + value + '"]').removeAttr('selected');
                    //Add to remove multi dropdown by Kantorn J. 2012-08-01
                    var idRemove = $('#' + fieldId + ' option[value="' + value + '"]').attr('id');
                    $(".asmOptionDisabled").each(function () {
                        if (idRemove == $(this).attr('rel')) {
                            $(this).removeAttr("disabled");
                            $(this).removeClass("asmOptionDisabled");
                        }
                    });

                    $("ol.asmList li.asmListItem").each(function () {
                        if (idRemove == $(this).attr('rel')) {
                            $(this).remove();
                        }
                    });

                    var _index = 0;
                    if (idRemove.indexOf('asm') == 0) {
                        _index = idRemove.substr(3, 1)
                    }
                    $oSelect = $("#" + fieldId);
                    $oSelect.fnRemoveSelected(_index, 1);
                } else {
                    // Clear All
                    $('#' + fieldId + ' option:selected').removeAttr('selected');
                    //Add to remove multi dropdown by Kantorn J. 2012-08-01
                    $(".asmOptionDisabled").each(function () {
                        $(this).removeAttr("disabled");
                        $(this).removeClass("asmOptionDisabled");
                    });
                    $("ol.asmList li.asmListItem").remove();

                    $oSelect = $("#" + fieldId);
                    $oSelect.fnRemoveSelected(0, null);
                }
                break;
        }
        //>
    }
    //-->

    // send Search Filter Data To Handler
    function sendSearchFilterDataToHandler(data) {
        
        // Filter Data
        try {
            $.merge(data, arrayOfFilters);
        } catch (e) { }
    }
    //-->

/** Search List Filter **/

/** DataGrid **/

    /** Constants **/
    var ColumnTypes = {
        TOWER_MOD:
        {
            activeState: "<a href='/TowerModifications/?filter=txtSiteID|{0}'><img alt='Tower Modification' title='Tower Modification' src='/images/icons/Wrench.png'></a>",
            inactiveState: "<img alt='None' title='None' src='/images/icons/Wrench-Disabled.png'>"
        },
        ROGUE_EQUIP:
        {
            activeState: "<img alt='Rogue Equipment' title='Rogue Equipment' src='/images/icons/Pirate.png'>",
            inactiveState: "<img alt='None'  title='None' src='/images/icons/Pirate-Disabled.png'>"
        },
        ISSUE_TRACKER:
        {
            activeState: "<a href='/IssueTracker/?filter=txtSiteID|{0}'><img alt='Issue Tracker' title='Issue Tracker' src='/images/icons/Warning.png'></a>",
            inactiveState: "<img alt='None'  title='None' src='/images/icons/Warning-Disabled.png'>"
        },
        UNDERCONSTRUCTION:
        {
            activeState: "<img alt='Under Construction' title='Under Construction' src='/images/icons/Construction.png'></a>",
            inactiveState: "<img alt='None'  title='None' src='/images/icons/Construction-Disabled.png'>"
        }
    };
    /** /Constants **/

    // getColumnImageIcon
    function getColumnImageIcon(colType, colVal, towerID) {

        var sRet = "";

        // Col type?
        switch (colType) {

            // Tower Modification
            case ColumnTypes.TOWER_MOD:
                if (colVal.toLowerCase() == "true") {
                    sRet = ColumnTypes.TOWER_MOD.activeState.replace("{0}", towerID);
                } else {
                    sRet = ColumnTypes.TOWER_MOD.inactiveState;
                }
                break;
            
            // Rogue Equipment
            case ColumnTypes.ROGUE_EQUIP:
                if (colVal.toLowerCase() == "true") {
                    sRet = ColumnTypes.ROGUE_EQUIP.activeState;
                } else {
                    sRet = ColumnTypes.ROGUE_EQUIP.inactiveState;
                }
                break;

            // OA 
            case ColumnTypes.UNDERCONSTRUCTION:
                if (colVal.toLowerCase() == "true") {
                    sRet = ColumnTypes.UNDERCONSTRUCTION.activeState;
                } else {
                    sRet = ColumnTypes.UNDERCONSTRUCTION.inactiveState;
                }
                break;

            case ColumnTypes.ISSUE_TRACKER:
                if (colVal.toLowerCase() == "true") {
                    sRet = ColumnTypes.ISSUE_TRACKER.activeState.replace("{0}", towerID);
                } else {
                    sRet = ColumnTypes.ISSUE_TRACKER.inactiveState;
                }
                break;
        }
        //>

        return sRet;
    }
    //-->

/** /DataGrid **/

