<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="SmartBlindsWebApp.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="jumbotron">
        <h1>Settings</h1>
        <p class="lead">Oregon Institute of Technology Junior Project</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Project Documentation&nbsp;&nbsp; »</a></p>
    </div>
     <div class="row">
         <div class="col-md-4">
            <h2>Temperature Sensor</h2>
            <p>
                Report Interval </p>
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
          <div class="col-md-4">
            <h2>Users & Profiles</h2>
            <p>
                Configure Users and Profiles settings</p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Users&nbsp;&nbsp; &raquo;</a>
                <br/>
                <br/>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Profiles&nbsp;&nbsp; &raquo;</a>
            </p>
        </div>
        </div>

</asp:Content>
