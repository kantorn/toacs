<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Production.Master" AutoEventWireup="true" CodeBehind="ExtrusionScan.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Production.Extrusion.ExtrusionScan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:650px;margin-left:auto;margin-right:auto;margin-top: 200px;border: solid 1px #cccccc;border-radius:15px;box-shadow: 0px 0px 9px rgba(0,0,0,0.15);padding: 9px;background:white;">
            <span style="position:absolute;margin-top:-60px;font-size:28px;color:#428bca">CREATE EXTRUSION WORK ORDER</span>
		    <asp:TextBox runat="server" ID="txtKanban" 
                style="height:100px;width:100%;font-size:50px;" 
                ontextchanged="txtKanban_TextChanged" />	
            <span style="position:absolute;margin-top:20px;font-size:14px;color:#428bca;text-align:center;width: inherit;">Please scan KABAN tag for create work order.</span>
    </div>
</asp:Content>
