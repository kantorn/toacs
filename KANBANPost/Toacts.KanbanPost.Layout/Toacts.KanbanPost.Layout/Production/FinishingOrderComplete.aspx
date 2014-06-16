<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Production.Master" AutoEventWireup="true" CodeBehind="FinishingOrderComplete.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Production.Finishing.FinishingOrderComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="production-contain" style="padding-bottom: 40px;" >
        <div class="o-1 step" >             
	        <ul  >
                <li ><a href="FinishingSelection.aspx" >Extrusion Process Selection</a></li>
                <li  style="171px;" ><a href="#"   >Create Work Order</a></li>
                <li  class="active" style="width:190px;" ><a href="#" >Complete Work Order</a></li>
            </ul>
        </div>  
        <div class="production-scan-box" style=margin-top:65px;"> 
                <h1 >BENDING WORK ORDER COMPLETE</h1>
		        <asp:TextBox runat="server" ID="txtKanban"  ontextchanged="txtKanban_TextChanged" />	
                <span >Please scan KABAN tag for request work order.</span>
        </div>
       <div id="divInfo" runat="server" style="display:block;"  class="production-contain-inner">
            <div style="padding: 20px 0px;">
                <span class="lot-information header" >Lot Information</span>
                <hr />
                <table class="highligh-row" >
                    <tr>
                        <td>    
                            <span class="lot-information" style="margin-left:25px;" >LOT NO:</span><span class="lot-information data" >XXX-000001</span>
                        </td>
                    </tr>
                    <tr>
                        <td>                   
                            <span class="lot-information" style="margin-left:25px;" >MODEL NAME:</span><span class="lot-information data">MODEL-01</span>
                            <span class="lot-information" >PART NO:</span><span class="lot-information data" >XXX-XXX-XXXX</span>
                            <span class="lot-information" >PART NAME:</span><span class="lot-information data">XXX-XXXX-XXXXX</span>
                        </td>
                    </tr>
                    <tr>
                        <td>    
                            <span class="lot-information" style="margin-left:25px;" >LOT SIZE:</span><span class="lot-information data">1000</span><span>pcs.</span>
                        </td>
                    </tr>
                </table>
            </div>
            <hr/>
            <div  style="margin-bottom:20px;">
                <span class="lot-information header" >Production Information</span>
                <hr/>
                <table class="highligh-row" >
                    <tr>
                        <td>    
                            <span class="lot-information" style="margin-left:25px;">LOT SIZE:</span><span class="lot-information data">1000</span><span>pcs.</span>     
                            <span class="lot-information" >Extrusion FG:</span><span class="lot-information data">1000</span>
                            <span class="lot-information" >Extrusion NG:</span><span class="lot-information data">0</span>     
                        </td>
                    </tr>
                    <tr>
                        <td>                   
                             <span class="lot-information"  style="margin-left:25px;" >Start Date:</span><span  class="lot-information data"  >01-01-2014 8:30</span>
                             <span class="lot-information"  style="margin-left:25px;" >Estimate  End Date:</span><span  class="lot-information data"  >01/01/2014 20:00</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="lot-information" style="margin-left:25px;" >Finishing FG:</span><input style="font-size:12px;" type="text" />
                            <span class="lot-information" >Finishing NG:</span><span class="lot-information data">0</span>  
                        </td>
                    </tr>
                    <tr>
                        <td>                   
                            <span  class="lot-information"  style="margin-left:25px;">End Date:</span> <input type="text" class="easyui-datebox" />
                            <span class="lot-information" >End Time</span>
                            <select style="width:45px;">
                                <option value="saab">00</option>
                                <option value="saab">01</option>
                                <option value="saab">02</option>
                                <option value="saab">03</option>
                                <option value="saab">04</option>
                                <option value="saab">05</option>
                                <option value="saab">06</option>
                                <option value="saab">07</option>
                                <option value="saab">08</option>
                                <option value="saab">09</option>
                                <option value="saab">10</option>
                                <option value="saab">11</option>
                                <option value="saab">12</option>
                                <option value="saab">13</option>
                                <option value="saab">14</option>
                                <option value="saab">15</option>
                                <option value="saab">16</option>
                                <option value="saab">17</option>
                                <option value="saab">18</option>
                                <option value="saab">19</option>
                                <option value="saab">20</option>
                                <option value="saab">21</option>
                                <option value="saab">22</option>
                                <option value="saab">23</option>
                            </select>
                            <span style="margin:0px 0px">:</span>
                            <select class="minute " style="width: ;"></option><option value="0">00</option><option value="5">05</option><option value="10">10</option><option value="15">15</option><option value="20">20</option><option value="25">25</option><option value="30">30</option><option value="35">35</option><option value="40">40</option><option value="45">45</option><option value="50">50</option><option value="55">55</option></select>
                        </td>
                    </tr>
                    <tr>
                        <td>    
                            <span class="lot-information"  style="margin-left:25px;">Production by:</span><span class="lot-information data">User01</span>  
                        </td>
                    </tr>
                </table>                    
            </div>
	        <div class="page-options-nav" style="float:right;margin-right:20px;">
                <a class="fancy-button filter-button arrow-down" href="javascript:void(0)">Request</a> 
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" class="fancy-button"  Text="Cancel" 
                    onclick="btnCancel_Click" />
	        </div>
            <div style="width:100%;margin-top: 40px;"></div>
        </div>
    </div>
            
      
</asp:Content>
