<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Site1.Master" AutoEventWireup="true" CodeBehind="Schedule2.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Kanban.Schedule2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
		<meta charset="utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=Edge;chrome=1" />
        <link href="../Contents/Styles/jquery.Gantt.css" rel="stylesheet" type="text/css" />
		<style type="text/css">			
			.contain {
				width: 95%;
				margin:  -35px auto 0px auto;
			}
		</style>       
        
    
    <script src="../Scripts/jquery.fn.gantt.js" type="text/javascript"></script>
    <script src="../Scripts/prettify.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(function () {

            "use strict";
            var data = [{
                            name: "Sprint 0",
                            desc: "Analysis",
                            values: [{
                                id: "t01",
                                from: "/Date(1320192000000)/",
                                to: "/Date(1322401600000)/",
                                label: "Requirement Gathering",
                                customClass: "ganttRed"
                            }]
                        }, {
                            name: " ",
                            desc: "Scoping",
                            values: [{
                                id: "t02",
                                from: "/Date(1322611200000)/",
                                to: "/Date(1323302400000)/",
                                label: "Scoping",
                                customClass: "ganttRed",
                                dep: "t01"
                            }]
                        }, {
                            name: "Sprint 1",
                            desc: "Development",
                            values: [{
                                from: "/Date(1323802400000)/",
                                to: "/Date(1325685200000)/",
                                label: "Development",
                                customClass: "ganttGreen"
                            }]
                        }, {
                            name: " ",
                            desc: "Showcasing",
                            values: [{
                                from: "/Date(1325685200000)/",
                                to: "/Date(1325695200000)/",
                                label: "Showcasing",
                                customClass: "ganttBlue"
                            }]
                        }, {
                            name: "Sprint 2",
                            desc: "Development",
                            values: [{
                                from: "/Date(1326785200000)/",
                                to: "/Date(1325785200000)/",
                                label: "Development",
                                customClass: "ganttGreen"
                            }]
                        }, {
                            name: " ",
                            desc: "Showcasing",
                            values: [{
                                from: "/Date(1328785200000)/",
                                to: "/Date(1328905200000)/",
                                label: "Showcasing",
                                customClass: "ganttBlue"
                            }]
                        }, {
                            name: "Release Stage",
                            desc: "Training",
                            values: [{
                                from: "/Date(1330011200000)/",
                                to: "/Date(1336611200000)/",
                                label: "Training",
                                customClass: "ganttOrange"
                            }]
                        }, {
                            name: " ",
                            desc: "Deployment",
                            values: [{
                                from: "/Date(1336611200000)/",
                                to: "/Date(1338711200000)/",
                                label: "Deployment",
                                customClass: "ganttOrange"
                            }]
                        }, {
                            name: " ",
                            desc: "Warranty Period",
                            values: [{
                                from: "/Date(1336611200000)/",
                                to: "/Date(1349711200000)/",
                                label: "Warranty Period",
                                customClass: "ganttOrange"
                            }]
                        }];
            $(".gantt").gantt({
                source: data,
                navigate: "scroll",
                scale: "hours",
                minScale: "hours",
                maxScale: "hours",
                itemsPerPage: 15,
                waitText: "Please Wait...",
                onItemClick: function (data) {
                    alert("Item clicked - show some details");
                },
                onAddClick: function (dt, rowId) {
                    alert("Empty space clicked - add an item!");
                },
                onRender: function () {
                    if (window.console && typeof console.log === "function") {
                        console.log("chart rendered");
                    }
                }
            });

            $(".gantt").popover({
                selector: ".bar",
                title: "I'm a popover",
                content: "And I'm the content of said popover.",
                trigger: "hover"
            });

            prettyPrint();

        });

    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br/>      
    <div class="o-1" style="margin-left: auto;height: 75px;margin-right: auto;width: 930px;">
	        <h1 id="h2" style="float:left; margin-left:30px;font-size: 23px;color: #264DB1;font-weight: bold;">Extrusion Plan Schedule</h1>
	        <div class="page-options-nav" style="margin-top:15px;float:right;margin-right:20px;">
                <a class="fancy-button filter-button arrow-down" href="javascript:void(0)">Filter Data<span class="arrow-down-icon"></span></a> 
                <a id="modalBtnExternalSaveFilter" class="fancy-button save-filter-button" href="javascript:void(0)">KANBAN Calculate</a>
                &nbsp;&nbsp;&nbsp;&nbsp;
		        <a id="modalBtnExternal" class="fancy-button" href="javascript:void(0)">Print KANBAN tags</a>
	        </div>
	    <div class="cb"></div>
    </div>  
    <div class="contain">				
		<div class="gantt"></div>
    </div>
</asp:Content>
