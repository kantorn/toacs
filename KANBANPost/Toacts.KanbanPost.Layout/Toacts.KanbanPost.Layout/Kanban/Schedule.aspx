<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Site1.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Kanban.Schedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
		<meta charset="utf-8" />
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
                            name: "Line 01",
                            desc: "",
                            values: [{
                                id: "t01",                                
                                from: "/Date(1400745600000)/",
                                to: "/Date(1400778000000)/",
                                label: "Lot 0000001",
                                customClass: "ganttRed"
                            }, {
                                id: "t10",
                                from: "/Date(1400796000000)/",
                                to: "/Date(1400828400000)/",
                                label: "Lot 0000010",
                                customClass: "ganttRed"
                            }, {
                                id: "t11",
                                from: "/Date(1400832000000)/",
                                to: "/Date(1400860800000)/",
                                label: "Lot 0000011",
                                customClass: "ganttRed"
                            }, {
                                id: "t12",
                                from: "/Date(1400875200000)/",
                                to: "/Date(1400907600000)/",
                                label: "Lot 0000012",
                                customClass: "ganttRed"
                            }, {
                                id: "t14",
                                from: "/Date(1400922000000)/",
                                to: "/Date(1400954400000)/",
                                label: "Lot 0000013",
                                customClass: "ganttRed"
                            }, {
                                id: "t14",
                                from: "/Date(1400961600000)/",
                                to: "/Date(1400994000000)/",
                                label: "Lot 0000014",
                                customClass: "ganttRed"
                            }, {
                                id: "t15",
                                from: "/Date(1401004800000)/",
                                to: "/Date(1401033600000)/",
                                label: "Lot 0000015",
                                customClass: "ganttRed"
                            }]
                        }, {
                            name: "Line 02",
                            desc: "",
                            values: [{
                                id: "t02",
                                from: "/Date(1400745600000)/",
                                to: "/Date(1400778000000)/",
                                label: "Lot 0000002",
                                customClass: "ganttRed",
                                dep: "t01"
                            }, {
                                id: "t16",
                                from: "/Date(1400796000000)/",
                                to: "/Date(1400828400000)/",
                                label: "Lot 0000016",
                                customClass: "ganttRed"
                            }, {
                                id: "t17",
                                from: "/Date(1400832000000)/",
                                to: "/Date(1400860800000)/",
                                label: "Lot 0000017",
                                customClass: "ganttRed"
                            }, {
                                id: "t18",
                                from: "/Date(1400875200000)/",
                                to: "/Date(1400907600000)/",
                                label: "Lot 0000018",
                                customClass: "ganttRed"
                            }, {
                                id: "t19",
                                from: "/Date(1400922000000)/",
                                to: "/Date(1400954400000)/",
                                label: "Lot 0000019",
                                customClass: "ganttRed"
                            }, {
                                id: "t20",
                                from: "/Date(1400961600000)/",
                                to: "/Date(1400994000000)/",
                                label: "Lot 0000020",
                                customClass: "ganttRed"
                            }, {
                                id: "t21",
                                from: "/Date(1401004800000)/",
                                to: "/Date(1401033600000)/",
                                label: "Lot 0000021",
                                customClass: "ganttRed"
                            }]
                        }, {
                            name: "Line 03",
                            desc: "",
                            values: [{
                                from: "/Date(1400745600000)/",
                                to: "/Date(1400778000000)/",
                                label: "Lot 0000003",
                                customClass: "ganttGreen"
                            }, {
                                id: "t16",
                                from: "/Date(1400796000000)/",
                                to: "/Date(1400828400000)/",
                                label: "Lot 0000016",
                                customClass: "ganttGreen"
                            }, {
                                id: "t17",
                                from: "/Date(1400832000000)/",
                                to: "/Date(1400860800000)/",
                                label: "Lot 0000017",
                                customClass: "ganttGreen"
                            }, {
                                id: "t18",
                                from: "/Date(1400875200000)/",
                                to: "/Date(1400907600000)/",
                                label: "Lot 0000018",
                                customClass: "ganttGreen"
                            }, {
                                id: "t19",
                                from: "/Date(1400922000000)/",
                                to: "/Date(1400954400000)/",
                                label: "Lot 0000019",
                                customClass: "ganttGreen"
                            }, {
                                id: "t20",
                                from: "/Date(1400961600000)/",
                                to: "/Date(1400994000000)/",
                                label: "Lot 0000020",
                                customClass: "ganttGreen"
                            }, {
                                id: "t21",
                                from: "/Date(1401004800000)/",
                                to: "/Date(1401033600000)/",
                                label: "Lot 0000021",
                                customClass: "ganttGreen"
                            }]
                        }, {
                            name: "Line 04",
                            desc: "",
                            values: [{
                                from: "/Date(1400745600000)/",
                                to: "/Date(1400778000000)/",
                                label: "Lot 0000004",
                                customClass: "ganttGreen"
                            }, {
                                id: "t16",
                                from: "/Date(1400796000000)/",
                                to: "/Date(1400828400000)/",
                                label: "Lot 0000016",
                                customClass: "ganttGreen"
                            }, {
                                id: "t17",
                                from: "/Date(1400832000000)/",
                                to: "/Date(1400860800000)/",
                                label: "Lot 0000017",
                                customClass: "ganttGreen"
                            }, {
                                id: "t18",
                                from: "/Date(1400875200000)/",
                                to: "/Date(1400907600000)/",
                                label: "Lot 0000018",
                                customClass: "ganttGreen"
                            }, {
                                id: "t19",
                                from: "/Date(1400922000000)/",
                                to: "/Date(1400954400000)/",
                                label: "Lot 0000019",
                                customClass: "ganttGreen"
                            }, {
                                id: "t20",
                                from: "/Date(1400961600000)/",
                                to: "/Date(1400994000000)/",
                                label: "Lot 0000020",
                                customClass: "ganttGreen"
                            }, {
                                id: "t21",
                                from: "/Date(1401004800000)/",
                                to: "/Date(1401033600000)/",
                                label: "Lot 0000021",
                                customClass: "ganttGreen"
                            }]
                        }, {
                            name: "Line 05",
                            desc: "",
                            values: [{
                                from: "/Date(1400745600000)/",
                                to: "/Date(1400778000000)/",
                                label: "Lot 0000005",
                                customClass: "ganttGreen"
                            }, {
                                id: "t16",
                                from: "/Date(1400796000000)/",
                                to: "/Date(1400828400000)/",
                                label: "Lot 0000016",
                                customClass: "ganttGreen"
                            }, {
                                id: "t17",
                                from: "/Date(1400832000000)/",
                                to: "/Date(1400860800000)/",
                                label: "Lot 0000017",
                                customClass: "ganttGreen"
                            }, {
                                id: "t18",
                                from: "/Date(1400875200000)/",
                                to: "/Date(1400907600000)/",
                                label: "Lot 0000018",
                                customClass: "ganttGreen"
                            }, {
                                id: "t19",
                                from: "/Date(1400922000000)/",
                                to: "/Date(1400954400000)/",
                                label: "Lot 0000019",
                                customClass: "ganttGreen"
                            }, {
                                id: "t20",
                                from: "/Date(1400961600000)/",
                                to: "/Date(1400994000000)/",
                                label: "Lot 0000020",
                                customClass: "ganttGreen"
                            }, {
                                id: "t21",
                                from: "/Date(1401004800000)/",
                                to: "/Date(1401033600000)/",
                                label: "Lot 0000021",
                                customClass: "ganttGreen"
                            }]
                        }, {
                            name: "Line 06",
                            desc: "",
                            values: [{
                                from: "/Date(1400745600000)/",
                                to: "/Date(1400778000000)/",
                                label: "Lot 0000006",
                                customClass: "ganttBlue"
                            }, {
                                id: "t16",
                                from: "/Date(1400796000000)/",
                                to: "/Date(1400828400000)/",
                                label: "Lot 0000016",
                                customClass: "ganttBlue"
                            }, {
                                id: "t17",
                                from: "/Date(1400832000000)/",
                                to: "/Date(1400860800000)/",
                                label: "Lot 0000017",
                                customClass: "ganttBlue"
                            }, {
                                id: "t18",
                                from: "/Date(1400875200000)/",
                                to: "/Date(1400907600000)/",
                                label: "Lot 0000018",
                                customClass: "ganttBlue"
                            }, {
                                id: "t19",
                                from: "/Date(1400922000000)/",
                                to: "/Date(1400954400000)/",
                                label: "Lot 0000019",
                                customClass: "ganttBlue"
                            }, {
                                id: "t20",
                                from: "/Date(1400961600000)/",
                                to: "/Date(1400994000000)/",
                                label: "Lot 0000020",
                                customClass: "ganttBlue"
                            }, {
                                id: "t21",
                                from: "/Date(1401004800000)/",
                                to: "/Date(1401033600000)/",
                                label: "Lot 0000021",
                                customClass: "ganttBlue"
                            }]
                        }, {
                            name: "Line 07",
                            desc: "",
                            values: [{
                                from: "/Date(1400745600000)/",
                                to: "/Date(1400778000000)/",
                                label: "Lot 0000007",
                                customClass: "ganttOrange"
                            }, {
                                id: "t16",
                                from: "/Date(1400796000000)/",
                                to: "/Date(1400828400000)/",
                                label: "Lot 0000016",
                                customClass: "ganttBlue"
                            }, {
                                id: "t17",
                                from: "/Date(1400832000000)/",
                                to: "/Date(1400860800000)/",
                                label: "Lot 0000017",
                                customClass: "ganttBlue"
                            }, {
                                id: "t18",
                                from: "/Date(1400875200000)/",
                                to: "/Date(1400907600000)/",
                                label: "Lot 0000018",
                                customClass: "ganttBlue"
                            }, {
                                id: "t19",
                                from: "/Date(1400922000000)/",
                                to: "/Date(1400954400000)/",
                                label: "Lot 0000019",
                                customClass: "ganttBlue"
                            }, {
                                id: "t20",
                                from: "/Date(1400961600000)/",
                                to: "/Date(1400994000000)/",
                                label: "Lot 0000020",
                                customClass: "ganttBlue"
                            }, {
                                id: "t21",
                                from: "/Date(1401004800000)/",
                                to: "/Date(1401033600000)/",
                                label: "Lot 0000021",
                                customClass: "ganttBlue"
                            }]
                        }, {
                            name: "Line 08",
                            desc: "",
                            values: [{
                                from: "/Date(1400745600000)/",
                                to: "/Date(1400778000000)/",
                                label: "Lot 0000008",
                                customClass: "ganttOrange"
                            }, {
                                id: "t16",
                                from: "/Date(1400796000000)/",
                                to: "/Date(1400828400000)/",
                                label: "Lot 0000016",
                                customClass: "ganttOrange"
                            }, {
                                id: "t17",
                                from: "/Date(1400832000000)/",
                                to: "/Date(1400860800000)/",
                                label: "Lot 0000017",
                                customClass: "ganttOrange"
                            }, {
                                id: "t18",
                                from: "/Date(1400875200000)/",
                                to: "/Date(1400907600000)/",
                                label: "Lot 0000018",
                                customClass: "ganttOrange"
                            }, {
                                id: "t19",
                                from: "/Date(1400922000000)/",
                                to: "/Date(1400954400000)/",
                                label: "Lot 0000019",
                                customClass: "ganttOrange"
                            }, {
                                id: "t20",
                                from: "/Date(1400961600000)/",
                                to: "/Date(1400994000000)/",
                                label: "Lot 0000020",
                                customClass: "ganttOrange"
                            }, {
                                id: "t21",
                                from: "/Date(1401004800000)/",
                                to: "/Date(1401033600000)/",
                                label: "Lot 0000021",
                                customClass: "ganttOrange"
                            }]
                        }, {
                            name: "Line 09",
                            desc: "",
                            values: [{
                                from: "/Date(1400745600000)/",
                                to: "/Date(1400778000000)/",
                                label: "Lot 0000009",
                                customClass: "ganttOrange"
                            }, {
                                id: "t16",
                                from: "/Date(1400796000000)/",
                                to: "/Date(1400828400000)/",
                                label: "Lot 0000016",
                                customClass: "ganttOrange"
                            }, {
                                id: "t17",
                                from: "/Date(1400832000000)/",
                                to: "/Date(1400860800000)/",
                                label: "Lot 0000017",
                                customClass: "ganttOrange"
                            }, {
                                id: "t18",
                                from: "/Date(1400875200000)/",
                                to: "/Date(1400907600000)/",
                                label: "Lot 0000018",
                                customClass: "ganttOrange"
                            }, {
                                id: "t19",
                                from: "/Date(1400922000000)/",
                                to: "/Date(1400954400000)/",
                                label: "Lot 0000019",
                                customClass: "ganttOrange"
                            }, {
                                id: "t20",
                                from: "/Date(1400961600000)/",
                                to: "/Date(1400994000000)/",
                                label: "Lot 0000020",
                                customClass: "ganttOrange"
                            }, {
                                id: "t21",
                                from: "/Date(1401004800000)/",
                                to: "/Date(1401033600000)/",
                                label: "Lot 0000021",
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
