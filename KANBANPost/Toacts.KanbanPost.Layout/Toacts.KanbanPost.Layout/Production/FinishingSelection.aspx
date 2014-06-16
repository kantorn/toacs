<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Production.Master" AutoEventWireup="true" CodeBehind="FinishingSelection.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Production.FinishingSelection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="production-scan-box" style="padding: 50px;" >
            <h1 style="margin-top: -90px;" >Please select operation for Bending process</h1>
		    <asp:Button runat="server" id="CreateNewOrder"  style="margin-bottom:40px;"
                class="fancy-button ui-button ui-widget ui-state-default ui-corner-all" 
                Text="Request Extrusion Work Order" onclick="CreateNewOrder_Click" />	
            <hr style="margin-top:-20px;" />
            <span class="separator-text" >OR</span>
		     <asp:Button runat="server" id="CompleteOrder"  
                class="fancy-button ui-button ui-widget ui-state-default ui-corner-all"   
                Text="Complete Bending Work Order"  onclick="CompleteOrder_Click" />	
    </div>
</asp:Content>
