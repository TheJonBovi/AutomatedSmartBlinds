<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CurentStatus.aspx.cs" Inherits="SmartBlindsWebApp.CurentStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="jumbotron">
        <h1>Current Status</h1>
        <p class="lead">Oregon Institute of Technology Junior Project</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Project Documentation&nbsp;&nbsp; »</a></p>
    </div>
     <div class="row">
         <div class="col-md-4">
            <h2>Gas Sensor</h2>
            <p>
                Get the current Smart Blinds status and make adjustments</p>
            <p>
               <%-- This is an example od a serice call to the MCU for Data--%>
                This is an example od a serice call to the MCU for Data
            </p>
            <br />
             <p>
                    <asp:Label ID="txtGasSensorStatus" runat="server" Text="Gas Sensor Status"></asp:Label>
             </p>
           
        </div>
         <div class="col-md-4">
            <h2>Temperature Sensor</h2>
            <p>
                Current Temperature: <asp:Label ID="lblCurrentTemp" runat="server" Text="Temperature Sensor Status"></asp:Label></p>
            <p>
                
            </p>
        </div>
         <div class="col-md-4">
            <h2>Proximity Sensor</h2>
            <p>
                Current Proximity Status: <asp:Label runat="server" ID="lblCurrentProxStatus" Text="Great!"></asp:Label></p>
           
        </div>
         <div class="col-md-4">
            <h2>Blinds Vertical</h2>
            <p>
                Current Vertical Location: <asp:Label ID="lblBlindsVertical" runat="server" ></asp:Label></p>
            <p>
                <asp:Button CssClass="btn btn-default" ID="btnAdjustBlindVertical" Text="Adjust Blinds Vertical &raquo;" runat="server" OnClick="btnAdjustBlindVertical_Click" />
                &nbsp;&nbsp;&nbsp; <asp:TextBox runat="server" ID="txtNewBlindVertical" ></asp:TextBox>
            </p>
        </div>
         <div class="col-md-4">
            <h2>Blinds Horizantel</h2>
            <p>
                Current Horizontal Location:  <asp:Label ID="lblBlindHorizontal" runat="server" ></asp:Label></p>
            <p>
                <asp:Button CssClass="btn btn-default" ID="btnAdjistBlindHorizontal" Text="Adjust Blinds Vertical &raquo;" runat="server" OnClick="btnAdjistBlindHorizontal_Click" />
                 &nbsp;&nbsp;&nbsp; <asp:TextBox runat="server" ID="txtNewBlindHorizontal" ></asp:TextBox>
            </p>
        </div>
          <div class="col-md-4">
            <h2>Camera</h2>
            <p>
                Get the current Smart Blinds status and make adjustments</p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Get Current Status, Adjust Blinds&nbsp;&nbsp; &raquo;</a>
            </p>
        </div>
        </div>


</asp:Content>
