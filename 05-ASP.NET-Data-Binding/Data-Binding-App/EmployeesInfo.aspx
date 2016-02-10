<%@ Page Title="Employees info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeesInfo.aspx.cs" Inherits="Data_Binding_App.EmployeesInfo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="gvEmployyes" runat="server"
        ItemType="Data_Binding_App.Models.ShortEmployeeInfo"
        DataKeyNames="Id"
        AutoGenerateColumns="false"
        AllowPaging="true"
        PageSize="5"
        AllowSorting="true"
        SelectMethod="gvEmployees_GetData"
        OnRowCreated="gvEmployyes_RowCreated">
        <Columns>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <ItemTemplate>
                    <asp:HiddenField ID="empId" runat="server" Value="<%# Item.Id %>" />
                    <%#: Item.Name %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="City">
                <ItemTemplate>
                    <%#: Item.City %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Country" SortExpression="Country">
                <ItemTemplate>
                    <%#: Item.Country %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div id="detailed-data" style="display: none;">
        <dl>
            <dt>Photo: </dt>
            <dd id="dd-photo"></dd>
            <dt>Phone: </dt>
            <dd id="dd-phone"></dd>
            <dt>Hire Date: </dt>
            <dd id="dd-hire-date"></dd>
            <dt>Address: </dt>
            <dd id="dd-address"></dd>
            <dt>Notes:</dt>
            <dd id="dd-notes"></dd>
        </dl>
    </div>
</asp:Content>