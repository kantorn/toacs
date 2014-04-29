<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlSetServer.ascx.cs" Inherits="Toacts.KanbanPost.Layout.Administrator.UserControls.ctrlSetServer" %>
 <div>
        <h2>Server Selection</h2>
        <table> 
            <tr>
                <td>
                     <table>
                        <tr>
                            <td>
                               <span>Server Name</span> 
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="drpServerName" />
                                <asp:TextBox runat="server" ID="txtServerName"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                    
                            </td>
                            <td>
                                <asp:RadioButton runat="server" ID="chkWindowsAuth"  Checked="True" AutoPostBack="True"
                                    Text="Widows Authentication" GroupName="SqlAuthen" 
                                    oncheckedchanged="chkWindowsAuth_CheckedChanged"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                    
                            </td>
                            <td>
                                <asp:RadioButton runat="server" ID="chkSQLAuth"  AutoPostBack="True"
                                    Text="SQL Server Authentication" GroupName="SqlAuthen" 
                                    oncheckedchanged="chkSQLAuth_CheckedChanged" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                
                            </td>
                            <td>
                                <asp:Button runat="server" ID="btnSetServer" Text="Set Server" 
                                    onclick="btnSetServer_Click"/>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <asp:Panel runat="server" ID="pnlSQLAuthen" Visible="False">
                         <table>
                            <tr>
                                <td colspan="2" style="text-align:center;">
                                   <span>Credential</span> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>User Name</span>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtUserName" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Password</span>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                
                                </td>
                                <td>
                                
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>