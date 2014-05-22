<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Production.Master" AutoEventWireup="true" CodeBehind="PdLogin.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Production.PdLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Panel1" class="Panel_Login" style="text-align:center;">	
		<div id="Panel2" class="Border_Login" style="text-align:left;">	
			<label for="LoginUser_UserName" id="LoginUser_UserNameLabel" class="Label_Normal">User ID</label>
			<br>
			<div id="LoginUser_Panel7" style="white-space:nowrap;">			
			    <input name="LoginUser$UserName" type="text" id="LoginUser_UserName" class="TextBox_Login">					
		    </div>
			<label for="LoginUser_Password" id="LoginUser_PasswordLabel" class="Label_Normal">Password</label>
			<input name="LoginUser$Password" type="password" id="LoginUser_Password" class="TextBox_Login">
			<br>
			<input id="LoginUser_RememberMe" type="checkbox" name="LoginUser$RememberMe">
			<label for="LoginUser_RememberMe" id="LoginUser_RememberMeLabel" class="Label_Normal">Remember Me</label>
			<div id="LoginUser_Panel3" style="text-align:right;">			
			    <input type="submit" name="LoginUser$LoginButton" value="Sign In" id="LoginUser_LoginButton" class="fancy-button ui-button ui-widget ui-state-default ui-corner-all" role="button" aria-disabled="false">					
		    </div>
	    </div>
		    <div id="Panel5" class="Panel_Nav" style="text-align:left;">		
			<a id="HyperLink1" href="ResetPassword.aspx">Forgot password?</a>		
	    </div>	
    </div>
</asp:Content>
