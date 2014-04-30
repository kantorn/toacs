<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    </script>   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="14px"></asp:Label>
    <hr />
    
	<div id="ganttChart"></div>
</asp:Content>
