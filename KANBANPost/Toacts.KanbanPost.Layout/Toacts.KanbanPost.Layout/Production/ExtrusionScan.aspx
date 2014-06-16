<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Production.Master" AutoEventWireup="true" CodeBehind="ExtrusionScan.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Production.Extrusion.ExtrusionScan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="production-scan-box"> 
            <h1 >CREATE EXTRUSION WORK ORDER</h1>
		    <asp:TextBox runat="server" ID="txtKanban" 
                ontextchanged="txtKanban_TextChanged" />	
            <span >Please scan KABAN tag for create work order.</span>
    </div>
</asp:Content>
