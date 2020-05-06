<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartBlindsWebApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Automated Smart Blinds</h1>
        <p class="lead">Oregon Institute of Technology Junior Project</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Project Documentation&nbsp;&nbsp; »</a></p>
    </div>

    <div class="row">
         <div class="col-md-4">
            <h2>Current User</h2>
            <p>
                <asp:Label ID="lblCurrentUser" runat="server" ></asp:Label> </p>
            <p>
                <asp:Button CssClass="btn btn-default" ID="btnChangeUser" runat="server" Text="Change Current User &raquo;" OnClick="btnChangeUser_Click" />&nbsp;&nbsp;
                <asp:DropDownList runat="server" ID="ddlUsersList" DataSourceID="sqldsUserList" DataTextField="fname" DataValueField="fname" ></asp:DropDownList>
                <asp:SqlDataSource ID="sqldsUserList" runat="server" ConnectionString="<%$ ConnectionStrings:csWebDB %>" SelectCommand="SELECT [fname], [lname] FROM [sbUsers]"></asp:SqlDataSource>
                <%--<a class="btn btn-default" href="CurentStatus.aspx">Get Current Status, Adjust Blinds&nbsp;&nbsp; &raquo;</a>--%>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Current Status</h2>
            <p>
                Get the current Smart Blinds status and make adjustments</p>
            <p>
                <a class="btn btn-default" href="CurentStatus.aspx">Get Current Status, Adjust Blinds&nbsp;&nbsp; &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Settings</h2>
            <p>
                Configure Smart Blinds Automation and add/Edit Users</p>
            <p>
                <a class="btn btn-default" href="Settings.aspx">Configure Device and Users&nbsp;&nbsp; &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Activity Log</h2>
            <p>
                Edit and View Log files and settings</p>
            <p>
                <a class="btn btn-default" href="Logs.aspx">View and Edit Log file settings and Reports&nbsp;&nbsp; &raquo;</a>
            </p>
        </div>
        
    </div>
    <asp:SqlDataSource ID="sqldsActiveUser" runat="server" ConnectionString="<%$ ConnectionStrings:smartblindsdbConnectionString %>" SelectCommand="SELECT * FROM [sbUsers] WHERE ([active] = @active)">
        <SelectParameters>
            <asp:Parameter DefaultValue="True" Name="active" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
