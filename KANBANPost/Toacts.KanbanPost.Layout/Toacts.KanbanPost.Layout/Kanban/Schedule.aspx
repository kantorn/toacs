﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Site1.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Kanban.Schedule" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Contents/Styles/jquery.ganttView.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/js/date.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.ganttView.js" type="text/javascript"></script>
  
    <script type="text/javascript">
        var ganttData = [
	        {
	            id: 1, name: "Feature 1", series: [
			        { name: "Planned", start: new Date(2010, 00, 01), end: new Date(2010, 00, 03) },
			        { name: "Actual", start: new Date(2010, 00, 02), end: new Date(2010, 00, 05), color: "#f0f0f0" }
		        ]
	        },
	        {
	            id: 2, name: "Feature 2", series: [
			        { name: "Planned", start: new Date(2010, 00, 05), end: new Date(2010, 00, 20) },
			        { name: "Actual", start: new Date(2010, 00, 06), end: new Date(2010, 00, 17), color: "#f0f0f0" },
			        { name: "Projected", start: new Date(2010, 00, 06), end: new Date(2010, 00, 17), color: "#e0e0e0" }
		        ]
	        },
	        {
	            id: 3, name: "Feature 3", series: [
			        { name: "Planned", start: new Date(2010, 00, 11), end: new Date(2010, 01, 03) },
			        { name: "Actual", start: new Date(2010, 00, 15), end: new Date(2010, 01, 03), color: "#f0f0f0" }
		        ]
	        },
	        {
	            id: 4, name: "Feature 4", series: [
			        { name: "Planned", start: new Date(2010, 01, 01), end: new Date(2010, 01, 03) },
			        { name: "Actual", start: new Date(2010, 01, 01), end: new Date(2010, 01, 05), color: "#f0f0f0" }
		        ]
	        },
	        {
	            id: 5, name: "Feature 5", series: [
			        { name: "Planned", start: new Date(2010, 02, 01), end: new Date(2010, 03, 20) },
			        { name: "Actual", start: new Date(2010, 02, 01), end: new Date(2010, 03, 26), color: "#f0f0f0" }
		        ]
	        },
	        {
	            id: 6, name: "Feature 6", series: [
			        { name: "Planned", start: new Date(2010, 00, 05), end: new Date(2010, 00, 20) },
			        { name: "Actual", start: new Date(2010, 00, 06), end: new Date(2010, 00, 17), color: "#f0f0f0" },
			        { name: "Projected", start: new Date(2010, 00, 06), end: new Date(2010, 00, 20), color: "#e0e0e0" }
		        ]
	        },
	        {
	            id: 7, name: "Feature 7", series: [
			        { name: "Planned", start: new Date(2010, 00, 11), end: new Date(2010, 01, 03) }
		        ]
	        },
	        {
	            id: 8, name: "Feature 8", series: [
			        { name: "Planned", start: new Date(2010, 01, 01), end: new Date(2010, 01, 03) },
			        { name: "Actual", start: new Date(2010, 01, 01), end: new Date(2010, 01, 05), color: "#f0f0f0" }
		        ]
	        }
        ];
        $(function () {
            $("#ganttChart").ganttView({
                data: ganttData,
                behavior: {
                    onClick: function (data) {
                        var msg = "You clicked on an event: { start: " + data.start.toString("M/d/yyyy") + ", end: " + data.end.toString("M/d/yyyy") + " }";
                        $("#eventMessage").text(msg);
                    },
                    onResize: function (data) {
                        var msg = "You resized an event: { start: " + data.start.toString("M/d/yyyy") + ", end: " + data.end.toString("M/d/yyyy") + " }";
                        $("#eventMessage").text(msg);
                    },
                    onDrag: function (data) {
                        var msg = "You dragged an event: { start: " + data.start.toString("M/d/yyyy") + ", end: " + data.end.toString("M/d/yyyy") + " }";
                        $("#eventMessage").text(msg);
                    }
                }
            });

            // $("#ganttChart").ganttView("setSlideWidth", 600);
        });
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
        <div style="margin-left:auto;margin-right:auto;margin-top:60px; ">        
	        <div id="ganttChart" style="width:930px"></div>
	        <br/><br/>
	        <div id="eventMessage"></div>
        </div>
</asp:Content>
