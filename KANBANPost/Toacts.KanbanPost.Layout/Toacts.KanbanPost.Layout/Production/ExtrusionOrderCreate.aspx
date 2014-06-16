<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Production.Master" AutoEventWireup="true" CodeBehind="ExtrusionOrderCreate.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Production.Extrusion.ExtrusionOrderCreate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="production-contain" >
        <div class="o-1 step" >             
	        <ul  >
                <li ><a href="ExtrusionSelection.aspx" >Extrusion Process Selection</a></li>
                <li  class="active" style="171px;" ><a href="#"   >Create Work Order</a></li>
                <li style="width:190px;" ><span   >Complete Work Order</span></li>
            </ul>
        </div>  
	    <h1 >Create Extrusion Work Order</h1>
        <div class="production-contain-inner">
            <div style="padding: 20px 0px;">
                <span class="lot-information header"  >Lot Information</span>
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
                <span class="lot-information header">Production Line:</span>
                <select style="width:120px;">
                  <option value="volvo">Line 01</option>
                  <option value="saab">Line 02</option>
                  <option value="mercedes">Line 03</option>
                  <option value="audi">Line 04</option>
                </select>
                <hr/>
                <span class="lot-information header" >Lost time Information</span>
                <hr/>
                <table>
                    <tr >
                        <td style="width:30%">                        
                            <input type="checkbox" value="1"/><span style="margin-left: 10px;">Model Change (30 Min.)</span>
                        </td>
                        <td style="width:30%">  
                            <input type="checkbox"  value="2"/><span style="margin-left: 10px;">Machine Setup(60 Min.)</span> 
                        </td> 
                        <td style="width:30%">   
                            <input type="checkbox" value="3"/><span style="margin-left: 10px;" >Other (30 Min.)</span>
                        </td>                
                    </tr>
                    <tr>
                        <td style="width:30%">                       
                            <input type="checkbox" value="1"/><span style="margin-left: 10px;" >Material Change (30 Min.)</span>
                        </td>
                        <td style="width:30%">    
                            <input type="checkbox"  value="2"/><span style="margin-left: 10px;">Role Forming Change (20 Min.)</span>
                        </td>
                        <td style="width:30%">  
                        </td> 
                    </tr>
                </table>
                
	            <div class="page-options-nav" style="float:right;margin-right:20px;">
                    <span style="margin-left:30px;" >Total Lost time:</span><span  class="lot-information data"  >90</span><span >min.</span>
	            </div>
            </div>
             <hr/>
            <div style="width:100%;">
                <span class="lot-information header" >Production Information</span>
                <hr/>
                <table  class="highligh-row"  >
                    <tr  >
                        <td  >                   
                             <span class="lot-information"  style="margin-left:25px;" >Line Speed:</span><span >5</span><span>min/pcs.</span>
                        </td>
                    </tr>
                    <tr>
                        <td  >                         
                            <span class="lot-information" style="margin-left:25px;" >Start Date:</span><input type="text" class="easyui-datebox"  /><span class="lot-information" style="margin-left:10px;">Start Time</span>
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
                            <span  style="margin:0px 0px">:</span>
                            <select class="minute " style="width: ;"><option value="0">00</option><option value="5">05</option><option value="10">10</option><option value="15">15</option><option value="20">20</option><option value="25">25</option><option value="30">30</option><option value="35">35</option><option value="40">40</option><option value="45">45</option><option value="50">50</option><option value="55">55</option></select>
                        </td>
                    </tr>
                    <tr >
                        <td >       
                            <span class="lot-information" style="margin-left:25px;"  >Estimate  End Date:</span><span >01/01/2014 20:00</span>
                        </td>
                    </tr>
                </table>
            </div>
	        <div class="page-options-nav button-group" >
                <a class="fancy-button filter-button arrow-down" href="javascript:void(0)">Save annd Print</a> 
                &nbsp;&nbsp;&nbsp;&nbsp;
		        <a  class="fancy-button" href="javascript:void(0)">Cancel</a>
	        </div>
            <div style="width:100%;margin-top: 30px;"></div>
        </div>
    </div>
</asp:Content>
