<%@ Page Title="Employees" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Data_Binding_App.Employees" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Employees</h3>
    <asp:GridView ID="gvEmployees" runat="server"
        ItemType="Data_Binding_App.Employee"
        DataKeyNames="EmployeeId"
        SelectMethod="gvEmployees_GetData"
        AutoGenerateColumns="false"
        AllowPaging="true"
        PageSize="5"
        OnSelectedIndexChanged="gvEmployees_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="true" HeaderText="Opens details in same page" />
            <asp:TemplateField>
                <HeaderTemplate>
                    <strong>Opens details in new page</strong>
                </HeaderTemplate>
                <ItemTemplate>
                    <a href="EmpDetails.aspx?id=<%# Item.EmployeeID %>"><%#: Item.FirstName + " " + Item.LastName %></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:FormView ID="fvEmployeeDetails" runat="server"
        ItemType="Data_Binding_App.Employee">
        <ItemTemplate>
            <h4>Selected employee details:</h4>
            <asp:Label ID="lbName" runat="server">Name: <%#: Item.FirstName + " " + Item.LastName %></asp:Label><br />
            <asp:Label ID="lbTitle" runat="server">Title: <%#: Item.Title %></asp:Label><br />
            <asp:Label ID="lbBirthDate" runat="server">Birth date: <%#: Item.BirthDate %></asp:Label><br />
            <asp:Label ID="lbHireDate" runat="server">Hire date: <%#: Item.HireDate %></asp:Label><br />
            <asp:Label ID="lbAddress" runat="server">Address: <%#: Item.Address %></asp:Label><br />
            <asp:Label ID="lbCity" runat="server">City: <%#: Item.City %></asp:Label><br />
            <asp:Label ID="lbPhone" runat="server">Home phone: <%#: Item.HomePhone %></asp:Label>
        </ItemTemplate>
    </asp:FormView>
    <hr />
    <h3>All employees in Repeater</h3>
    <asp:Repeater ID="repeaterAllEmployees" runat="server"
        SelectMethod="gvEmployees_GetData"
        ItemType="Data_Binding_App.Employee">
        <ItemTemplate>
            <p><%#: Item.FirstName + " " + Item.LastName %></p>
        </ItemTemplate>
    </asp:Repeater>
    <hr />
    <h3>All employees in ListView</h3>
    <asp:ListView ID="lvAllEmployees" runat="server"
        ItemType="Data_Binding_App.Employee"
        SelectMethod="gvEmployees_GetData">
        <ItemTemplate>
            <p><%#: Item.FirstName + " " + Item.LastName %></p>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>