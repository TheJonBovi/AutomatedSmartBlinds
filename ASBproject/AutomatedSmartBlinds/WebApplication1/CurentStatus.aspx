<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CurentStatus.aspx.cs" Inherits="SmartBlindsWebApp.CurentStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="jumbotron">
        <h1>Current Status</h1>
        <p class="lead">Oregon Institute of Technology Junior Project</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Project Documentation&nbsp;&nbsp; »</a></p>
    </div>
    <table>
        <tr>
            <td>

            </td>
        </tr>
    </table>

    <asp:Table runat="server" ID="tblSensors" >
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>
                1

            </asp:TableHeaderCell>
        </asp:TableHeaderRow>

        <asp:TableRow runat="server" CssClass="row" >
            <asp:TableCell>
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
         
                    </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <div class="col-md-4">
            <h2>Temperature Sensor</h2>
            <p>
                Current Temperature: <asp:Label ID="lblCurrentTemp" runat="server" style="font-size: x-large; color: #66FF33"></asp:Label></p>
            <p>
                
                <asp:Button CssClass="btn btn-default" ID="btnLogTemp" Text="Log Sensor test &raquo;" runat="server" OnClick="btnLogTemp_Click" />
                
            &nbsp;<asp:TextBox runat="server" ID="txtTemplog" ></asp:TextBox>
                <asp:Button CssClass="btn btn-default" ID="btnSetTemp" Text="Set Sensor test &raquo;" runat="server" OnClick="btnSetTemp_Click"/>
                 &nbsp;<asp:TextBox runat="server" ID="txtTempSet" ></asp:TextBox>
                
            </p>
        </div>
            </asp:TableCell>

        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                         <div class="col-md-4">
            <h2>Proximity Sensor</h2>
            <p>
                Current Proximity Status: <asp:Label runat="server" ID="lblCurrentProxStatus" Text="Great!"></asp:Label></p>
           
        </div>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                 <div class="col-md-4">
            <h2>Blinds Vertical</h2>
            <p>
                Current Vertical Location: <asp:Label ID="Label1" runat="server" style="font-size: x-large; color: #66FF33"></asp:Label></p>
            <p>
                <asp:Button CssClass="btn btn-default" ID="Button1" Text="Adjust Blinds Vertical &raquo;" runat="server" OnClick="btnAdjustBlindVertical_Click" />
                &nbsp;&nbsp;&nbsp; Enter numeric value from 0(closed) to 100(open)&nbsp;&nbsp;&nbsp; <asp:TextBox runat="server" ID="TextBox1" Enabled="false" ></asp:TextBox>
                &nbsp;&nbsp;&nbsp; 
            </p>
             <p>
                 Select Preconfigured setting &nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList1" runat="server">
                   
                    <asp:ListItem Value="1024">Full Up</asp:ListItem>
                    <asp:ListItem Value="768">1/4th Down</asp:ListItem>
                    <asp:ListItem Value="512">1/2 Down</asp:ListItem>
                    <asp:ListItem Value="256">3/4th Down</asp:ListItem>
                    <asp:ListItem Value="0">Full Down</asp:ListItem>
                </asp:DropDownList>
            </p>
        </div>
            </asp:TableCell>
        </asp:TableRow>



    </asp:Table>

     <div class="row">
      


         <div class="col-md-4">
            <h2>Blinds Vertical</h2>
            <p>
                Current Vertical Location: <asp:Label ID="lblBlindsVertical" runat="server" style="font-size: x-large; color: #66FF33"></asp:Label></p>
            <p>
                <asp:Button CssClass="btn btn-default" ID="btnAdjustBlindVertical" Text="Adjust Blinds Vertical &raquo;" runat="server" OnClick="btnAdjustBlindVertical_Click" />
                &nbsp;&nbsp;&nbsp; Enter numeric value from 0(closed) to 100(open)&nbsp;&nbsp;&nbsp; <asp:TextBox runat="server" ID="txtNewBlindVertical" Enabled="false" ></asp:TextBox>
                &nbsp;&nbsp;&nbsp; 
            </p>
             <p>
                 Select Preconfigured setting &nbsp;&nbsp;&nbsp; <asp:DropDownList ID="ddlBlindsPreConV" runat="server">
                   
                    <asp:ListItem Value="1024">Full Up</asp:ListItem>
                    <asp:ListItem Value="768">1/4th Down</asp:ListItem>
                    <asp:ListItem Value="512">1/2 Down</asp:ListItem>
                    <asp:ListItem Value="256">3/4th Down</asp:ListItem>
                    <asp:ListItem Value="0">Full Down</asp:ListItem>
                </asp:DropDownList>
            </p>
        </div>
         <div class="col-md-4">
            <h2>Blinds Horizantel</h2>
            <p>
                Current Horizontal Location:  <asp:Label ID="lblBlindHorizontal" runat="server" style="font-size: x-large; color: #66FF33" ></asp:Label></p>
            <p>
                <asp:Button CssClass="btn btn-default" ID="btnAdjistBlindHorizontal" Text="Adjust Blinds Vertical &raquo;" runat="server" OnClick="btnAdjistBlindHorizontal_Click" />
                 &nbsp;&nbsp;&nbsp; Enter numeric value from 0(closed) to 100(open)&nbsp;&nbsp;&nbsp; <asp:TextBox runat="server" ID="txtNewBlindHorizontal" Enabled="false" ></asp:TextBox>
                &nbsp;&nbsp;&nbsp; 
            </p>
             <p>
                 Select Preconfigured setting &nbsp;&nbsp;&nbsp; <asp:DropDownList ID="ddlBlindsPreConH" runat="server">
                     
                    <asp:ListItem Value="150">Full Close Up</asp:ListItem>
                    <asp:ListItem Value="75">Mostly Open</asp:ListItem>
                    <asp:ListItem Value="0">Full Open</asp:ListItem>
                    <asp:ListItem Value="-75">Mostly Closed</asp:ListItem>
                    <asp:ListItem Value="-150">Full Closed Down</asp:ListItem>
                </asp:DropDownList>
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
