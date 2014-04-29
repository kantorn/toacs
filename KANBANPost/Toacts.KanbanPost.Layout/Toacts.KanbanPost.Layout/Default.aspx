<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Default" %>

<%@ Register TagPrefix="DayPilot" Namespace="Utilities.Web.DayPilotLite.Web.Ui" Assembly="Utilities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Contents/Styles/DayPivot/calendar_green.css" rel="stylesheet" type="text/css" />
    <link href="Contents/Styles/DayPivot/scheduler_transparent.css" rel="stylesheet"  type="text/css" />
    <link href="Contents/Styles/DayPivot/calendar_transparent.css" rel="stylesheet" type="text/css" />
    <link href="Contents/Styles/DayPivot/calendar_white.css" rel="stylesheet" type="text/css" />
    <link href="Contents/Styles/DayPivot/scheduler_8.css" rel="stylesheet" type="text/css" />
    <link href="Contents/Styles/DayPivot/scheduler_blue.css" rel="stylesheet" type="text/css" />
    <link href="Contents/Styles/DayPivot/scheduler_green.css" rel="stylesheet" type="text/css" />
    <link href="Contents/Styles/DayPivot/scheduler_white.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="true" Font-Size="16pt"></asp:Label><br />
    <DayPilot:DayPilotScheduler ID="DayPilotScheduler1" runat="server" 
        HeaderFontSize="8pt" 
        HeaderHeight="20" 
        DataStartField="start" 
        DataEndField="end" 
        DataTextField="name" 
        DataValueField="id" 
        DataResourceField="resource" 
        EventFontSize="11px" 
        CellDuration="1440" 
        CellWidth="20"
        Days="30" 
        ViewType="Gantt"
        CssOnly="true"
        CssClassPrefix="scheduler_white"
        EventHeight="25" >
    </DayPilot:DayPilotScheduler>
</asp:Content>
