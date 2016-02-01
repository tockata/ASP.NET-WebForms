<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpDetails.aspx.cs" Inherits="Data_Binding_App.EmpDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DetailsView ID="dvEmployeeDetails" runat="server"
        ItemType="Data_Binding_App.Employee"
        SelectMethod="dvEmployeeDetails_GetItem">
    </asp:DetailsView>
    <br />
    <asp:HyperLink ID="hlEmployeesPage" runat="server" NavigateUrl="~/Employees.aspx" CssClass="btn btn-info">Back to Employees</asp:HyperLink>
</asp:Content>