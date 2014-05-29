<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Production.Master" AutoEventWireup="true" CodeBehind="ExtrusionSelection.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Production.Extrusion.ExtrusionSelection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:650px;margin-left:auto;margin-right:auto;margin-top: 200px;border: solid 1px #cccccc;border-radius:15px;box-shadow: 0px 0px 9px rgba(0,0,0,0.15);padding: 50px">
            <span style="position:absolute;margin-top:-90px;font-size:24px;color:#428bca">Please select operation for Extrusion process</span>
		    <asp:Button runat="server" id="CreateNewOrder"  
                class="fancy-button ui-button ui-widget ui-state-default ui-corner-all" 
                style="width: 100%;height: 70px;margin-bottom:40px;" 
                Text="Create New Work Order" onclick="CreateNewOrder_Click" />	
            <hr style="margin-top:-20px;" />
            <span style="position:fixed;top: 380px;width:550px;text-align: center;font-weight:bold;color:#2e6e9e;">OR</span>
		     <asp:Button runat="server" id="CompleteOrder"  
                class="fancy-button ui-button ui-widget ui-state-default ui-corner-all" 
                style="width: 100%;height: 70px;"  Text="Complete Work Order" 
                onclick="CompleteOrder_Click" />	
    </div>
</asp:Content>
