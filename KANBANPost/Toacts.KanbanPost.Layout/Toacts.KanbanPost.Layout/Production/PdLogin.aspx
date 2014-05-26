<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Production.Master" AutoEventWireup="true" CodeBehind="PdLogin.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Production.PdLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Panel1" class="Panel_Login" style="text-align:center;margin-left: auto;margin-right: auto;width: 390px;margin-top:220px;border:1px solid #cccccc;border-radius:15px;box-shadow: 0px 0px 9px rgba(0,0,0,0.15);">	
		<div id="Panel2" class="Border_Login" style="text-align:left;padding: 30px 70px;">	
            <div style="padding: 5px 5px;">
			    <label for="LoginUser_UserName" id="LoginUser_UserNameLabel" class="Label_Normal">User ID</label>
			    <input name="LoginUser$UserName" type="text" id="LoginUser_UserName" class="TextBox_Login" style="float:right">	
            </div>
            <div style="padding: 5px 5px;">
			    <label for="LoginUser_Password" id="LoginUser_PasswordLabel" class="Label_Normal" >Password</label>
			    <input name="LoginUser$Password" type="password" id="LoginUser_Password" class="TextBox_Login" style="float:right" >
            </div>
            <div style="margin: auto;width: 120px;">
			    <input id="LoginUser_RememberMe" type="checkbox" name="LoginUser$RememberMe">
			    <label for="LoginUser_RememberMe" id="LoginUser_RememberMeLabel" class="Label_Normal">Remember Me</label>
            </div>
			<div id="LoginUser_Panel3" style="text-align:right;">			
			    <input type="submit" name="LoginUser$LoginButton" value="Sign In" id="LoginUser_LoginButton" class="fancy-button ui-button ui-widget ui-state-default ui-corner-all" role="button" aria-disabled="false">					
		    </div>
	    </div>
    </div>
</asp:Content>
