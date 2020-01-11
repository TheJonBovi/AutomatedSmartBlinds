<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logs.aspx.cs" Inherits="SmartBlindsWebApp.Logs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
       <h2>Logs</h2>
        <h3>Log Date: </h3>


       <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="sysID" DataSourceID="sDSAutoSmartBlinds">
           <Columns>
               <asp:BoundField DataField="sysID" HeaderText="sysID" InsertVisible="False" ReadOnly="True" SortExpression="sysID" />
               <asp:BoundField DataField="userSysID" HeaderText="userSysID" SortExpression="userSysID" />
               <asp:BoundField DataField="logTime" HeaderText="logTime" SortExpression="logTime" />
               <asp:BoundField DataField="tempLog" HeaderText="tempLog" SortExpression="tempLog" />
               <asp:BoundField DataField="proxLog" HeaderText="proxLog" SortExpression="proxLog" />
               <asp:BoundField DataField="ledLog" HeaderText="ledLog" SortExpression="ledLog" />
               <asp:BoundField DataField="pizoLog" HeaderText="pizoLog" SortExpression="pizoLog" />
               <asp:BoundField DataField="gasLog" HeaderText="gasLog" SortExpression="gasLog" />
               <asp:BoundField DataField="cameraLog" HeaderText="cameraLog" SortExpression="cameraLog" />
               <asp:BoundField DataField="sbHorzLog" HeaderText="sbHorzLog" SortExpression="sbHorzLog" />
               <asp:BoundField DataField="sbVertLog" HeaderText="sbVertLog" SortExpression="sbVertLog" />
           </Columns>
       </asp:GridView>
       <asp:SqlDataSource ID="sDSAutoSmartBlinds" runat="server" ConnectionString="<%$ ConnectionStrings:smartblindsdbConnectionString %>" SelectCommand="SELECT * FROM [sbLogs] ORDER BY [logTime] DESC"></asp:SqlDataSource>
   </div>
</asp:Content>


