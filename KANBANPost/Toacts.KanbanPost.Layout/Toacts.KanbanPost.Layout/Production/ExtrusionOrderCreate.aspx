﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Production.Master" AutoEventWireup="true" CodeBehind="ExtrusionOrderCreate.aspx.cs" Inherits="Toacts.KanbanPost.Layout.Production.Extrusion.ExtrusionOrderCreate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-top: 10px;border-left: 1px solid #cccccc;border-right: 1px solid #cccccc;position: absolute;height: 100%;padding:0px 27px;" >
        <br/>      
        <div class="o-1" style="margin-left: auto;margin-right: auto;width: 930px;">             
	        <div class="page-options-nav" style="margin-top:5px;">
                <a href="../Production/ExtrusionSelection.aspx">Extrusion Process Selection</a> 
                <span>></span>
                <a href="javascript:void(0)">Create Work Order</a>
	        </div>
        </div>  
	    <h1 id="h2" style="float:left;font-size: 23px;color: #264DB1;font-weight: bold;width:100%;margin-bottom: 20px;margin-left:25px;">Create Extrusion Work Order</h1>
        <div style="margin-left:auto;margin-right:auto;width:930px;margin-top:5px;border:solid 1px #cccccc;border-radius: 5px;padding: 5px 0px 40px 0px; ">
            <div style="border-bottom: 1px solid #cccccc;padding: 20px 0px;">
                <span class="lot-information" style="margin-left:25px;" >LOT NO:</span><span class="lot-information data" >XXX-000001</span>
                <span class="lot-information" >PART NO:</span><span class="lot-information data" >XXX-XXX-XXXX</span>
                <span class="lot-information" >PART NAME:</span><span class="lot-information data">XXX-XXXX-XXXXX</span>
                <span class="lot-information" >MODEL NAME:</span><span class="lot-information data">MODEL-01</span>
                <span class="lot-information" >LOT SIZE:</span><span class="lot-information data">1000</span><span>pcs.</span>
            </div>
            <div  style="padding: 20px 0px;margin-bottom:20px;">
                <span class="lot-information" style="margin-left:25px;;font-size:14px;">Production Line:</span>
                <select style="width:120px;">
                  <option value="volvo">Line 01</option>
                  <option value="saab">Line 02</option>
                  <option value="mercedes">Line 03</option>
                  <option value="audi">Line 04</option>
                </select>
                <div class="group-radio" style="margin-top:12px;margin-left:auto;margin-right:auto;width:95%;border: 1px solid #cccccc;border-radius:7px;padding: 20px;">
                    <input type="radio" value="1"/><span>Model Change (30 Min.)</span>
                    <input type="radio"  value="2"/><span>Machine Setup(60 Min.)</span>
                    <input type="radio" value="3"/><span>Other (30 Min.)</span>
                    <input type="radio" value="1"/><span>Material Change (30 Min.)</span>
                    <br />
                    <input type="radio"  value="2"/><span>Role Forming Change (20 Min.)</span>
                </div>
	            <div class="page-options-nav" style="float:right;margin-right:20px;">
                    <span style="margin-left:30px;" >Total Lost time:</span><span  class="lot-information data"  >90</span><span >min.</span>
	            </div>
            </div>
            <div style="width:100%;padding: 15px 0px 10px 0px;border-top:1px solid #cccccc">
                <span class="lot-information" style="margin-left:25px;font-size:14px;" >Production Information</span>
                <div style="padding: 15px 20px;style="margin-left:25px;"" class="prod-information">
                    <span  >Line Speed:</span><span >5</span><span>min/pcs.</span>
                    <br />
                    <span  >Start Date:</span><input type="text" class="easyui-datebox"  /><span>Start Time</span>
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
                        <span style="margin:0px 0px">:</span>45px;
                       <select class="minute " style="width: ;"><option value="0">00</option><option value="5">05</option><option value="10">10</option><option value="15">15</option><option value="20">20</option><option value="25">25</option><option value="30">30</option><option value="35">35</option><option value="40">40</option><option value="45">45</option><option value="50">50</option><option value="55">55</option></select>
                    <br />
                    <span  >Estimate  End Date:</span><span >01/01/2014 20:00</span>
                </div>
            </div>
	        <div class="page-options-nav" style="float:right;margin-right:20px;">
                <a class="fancy-button filter-button arrow-down" href="javascript:void(0)">Save annd Print</a> 
                &nbsp;&nbsp;&nbsp;&nbsp;
		        <a  class="fancy-button" href="javascript:void(0)">Cancel</a>
	        </div>
        </div>
    </div>
</asp:Content>