<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Kanban.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style type="text/css" >
        .datagrid-body tr:nth-child(odd) 
        {
            background: #ffffff;
        }
    </style>
    <script type="text/javascript" language="javascript">

        // Doc Ready
        //<![CDATA[
        $(function () {
            $('#h1').activity({ segments: 8, width: 2, space: 0, length: 3, speed: 1.5, align: 'right' });


            $('#kanban').datagrid({
                rownumbers: false,
                autoRowHeight: false,
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
            $('#kanban').datagrid('getPanel').addClass('lines-bottom');
            $('#kanban').datagrid('getPanel').addClass('lines-right');
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
    <div class="main-contain-inner">    
        <div class="o-1" >
	            <h1 id="h2" >Extrusion KANBAN List</h1>
	            <div class="page-options-nav noborder" >
                    <a class="fancy-button filter-button arrow-down" href="javascript:void(0)">Filter Data<span class="arrow-down-icon"></span></a> 
                    <a id="modalBtnExternalSaveFilter" class="fancy-button save-filter-button" href="javascript:void(0)">KANBAN Calculate</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
		            <a id="modalBtnExternal" class="fancy-button" href="javascript:void(0)">Print KANBAN tags</a>
	            </div>
	        <div class="cb"></div>
        </div>  
        <div class="filter-display">
            <div class="filter-button-close" style="float: right;padding: 10px;" >
                <a  style="padding:2px 6px 2px 6px;" href="javascript:$('.filter-button').click();">x</a>
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
	    <table id="kanban" title="Issued KANBAN" style="width:930px;height:auto;"
			    url="/Handler/HandlerKanbanList.axd" 
			    singleSelect="true" iconCls="icon-save" rownumbers="false"
			    idField="itemid" pagination="true" 
                data-options="pageSize:20">
		    <thead>
                <%--KanbnaId,customer_name,model_name,part_name,part_no,tag_id,quantity,total_quantity--%>
			    <tr>
				    <th field="customer_name" width="90" >Customer</th>
				    <th field="model_name" width="100">Model Name</th>
				    <th field="part_name" width="200" >Part Name</th>
				    <th field="part_no" width="180">Part No.</th>
				    <th field="total_quantity" width="95" align="center">Total Quantity</th>
				    <th field="tag_id" width="160" align="right">Tag Id</th>
				    <th field="quantity" width="80" align="right">Lot Size</th>
			    </tr>
		    </thead>
	    </table>
    </div>
</asp:Content>
