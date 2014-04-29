<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Administrator.Default" EnableViewState="true" Async="true" %>
<%@ Register src="UserControls/ctrlSetServer.ascx" tagname="ctrlSetServer" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div>
        <asp:UpdatePanel runat="server" ID="updatePnlDBSelect" UpdateMode="Conditional" >
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="100" Enabled="false" ontick="Timer1_Tick"></asp:Timer>
                <uc1:ctrlSetServer ID="ctrlSetServer1" runat="server"  />
                <asp:Label ID="lbProgress" runat="server" Text=""></asp:Label><br />
                <div ID="pnlDBSelect" runat="server"  Visible="False">
                    <h2>Database Selection</h2>
                    <table >
                        <tr>
                            <td>
                                <asp:RadioButton runat="server" ID="chkNewDB" GroupName="DBType"  
                                    Text="Create and use new blank database" AutoPostBack="True" Checked="True" 
                                    oncheckedchanged="chkNewDB_CheckedChanged"/>
                            </td>
                            <td>
                                <asp:RadioButton runat="server" ID="chkExistDB" GroupName="DBType"  
                                    Text="Broswse and user an existing database" AutoPostBack="True" 
                                    oncheckedchanged="chkExistDB_CheckedChanged"/>
                                
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                    <asp:FileUpload ID="fileDBUpload" runat="server"  Enabled="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button runat="server" ID="btnSetup" Text="Setup Connection" 
                                    onclick="btnSetup_Click"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
