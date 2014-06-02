<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Production.Master" AutoEventWireup="true" CodeBehind="FinishingOrderCreate.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Production.Finishing.FinishingOrderCreate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 930px;padding-top: 10px;border-left: 1px solid #cccccc;border-right: 1px solid #cccccc;position: absolute;height: 100%;padding:0px 27px;" ><br/>      
        <div class="o-1" style="margin-left: auto;margin-right: auto;width: 930px;">             
	        <div class="page-options-nav" style="margin-top:5px;">
                <a href="../Production/FinishingSelection.aspx">Finishing Process Selection</a> 
                <span>></span>
                <a href="javascript:void(0)">Finishing Work Order Request</a>
	        </div>
        </div>  
        <div style="width:650px;margin-left:auto;margin-right:auto;margin-top: 65px;border: solid 1px #cccccc;border-radius:15px;box-shadow: 0px 0px 9px rgba(0,0,0,0.15);padding: 9px">
                <span style="position:absolute;margin-top:-60px;font-size:28px;color:#428bca">FINISHIG WORK ORDER REQUEST</span>
		         <asp:TextBox runat="server" ID="txtKanban" 
                 style="height:100px;width:100%;font-size:50px;" 
                ontextchanged="txtKanban_TextChanged" />
                <span style="position:absolute;margin-top:20px;font-size:14px;color:#428bca;text-align:center;width: inherit;">Please scan KABAN tag for request work order.</span>
        </div>
        <div id="divInfo" runat="server" style="margin-left:auto;margin-right:auto;width:95%;margin-top:35px;border:solid 1px #cccccc;border-radius: 5px;padding: 5px 0px 40px 0px; ">
            <span class="lot-information" style="margin-left:25px;font-size:14px;" >Production Information</span>
            <div style="padding: 20px 0px;">
                <span class="lot-information" style="margin-left:25px;" >LOT NO:</span><span class="lot-information data" >XXX-000001</span>
                <br />
                <span class="lot-information" style="margin-left:25px;" >PART NO:</span><span class="lot-information data" >XXX-XXX-XXXX</span>
                <span class="lot-information" >PART NAME:</span><span class="lot-information data">XXX-XXXX-XXXXX</span>
                <span class="lot-information" >MODEL NAME:</span><span class="lot-information data">MODEL-01</span>
                <br />
                <span class="lot-information" style="margin-left:25px;">LOT SIZE:</span><span class="lot-information data">1000</span><span>pcs.</span>     
                <span class="lot-information" >Extrusion FG:</span><span class="lot-information data">1000</span>
                <span class="lot-information" >Extrusion NG:</span><span class="lot-information data">0</span>           
                <br />
                <span  class="lot-information"  style="margin-left:25px;">Start Date:</span>
                <input type="text" class="easyui-datebox" />
                <span class="lot-information" >Start Time</span>
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
                <br />                    
                <span class="lot-information"  style="margin-left:25px;">Production by:</span><span class="lot-information data">User01</span>    
            </div>
	        <div class="page-options-nav" style="float:right;margin-right:20px;">
                <a class="fancy-button filter-button arrow-down" href="javascript:void(0)">Request</a> 
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" class="fancy-button"  Text="Cancel" 
                    onclick="btnCancel_Click" />
	        </div>
        </div>
    </div>
</asp:Content>
