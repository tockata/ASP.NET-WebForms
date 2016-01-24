<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentsAndCourses.aspx.cs" Inherits="WebAndHtmlControlsApp.StudentsAndCourses" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Students and Courses</h1>
    <h2>Registration:</h2>
    <asp:Label ID="FirstNameLabel" runat="server" Text="First name: " />
    <asp:TextBox ID="FirstNameTextBox" runat="server" /><br />
    <asp:Label ID="LastNameLabel" runat="server" Text="Last name: " />
    <asp:TextBox ID="LastNameTextBox" runat="server" /><br />
    <asp:Label ID="FacultyNumberLabel" runat="server" Text="Faculty number: " />
    <asp:TextBox ID="FacultyNumberTextBox" TextMode="Number" runat="server" /><br />
    <asp:Label ID="UniversityLabel" runat="server" Text="University: " />
    <asp:DropDownList ID="UnivesityDropDown" runat="server" AutoPostBack="true">
        <asp:ListItem Value="1" Text="Sofia University"></asp:ListItem>
        <asp:ListItem Value="2" Text="Veliko Turnovo University"></asp:ListItem>
        <asp:ListItem Value="3" Text="Telerik Academy"></asp:ListItem>
    </asp:DropDownList><br />
    <asp:Label ID="SpecialtyLabel" runat="server" Text="Specialty: " />
    <asp:DropDownList ID="SpecialtyDropDownList" runat="server" AutoPostBack="true">
        <asp:ListItem Value="1" Text="Economics"></asp:ListItem>
        <asp:ListItem Value="2" Text="Law"></asp:ListItem>
        <asp:ListItem Value="3" Text="Software engineer"></asp:ListItem>
    </asp:DropDownList><br />
    <asp:Label ID="CoursesLabel" runat="server" Text="Courses: " />
    <asp:ListBox ID="CoursesListBox" runat="server" SelectionMode="Multiple">
        <asp:ListItem Value="1">C#</asp:ListItem>
        <asp:ListItem Value="2">Java</asp:ListItem>
        <asp:ListItem Value="3">Python</asp:ListItem>
        <asp:ListItem Value="4">High quality code</asp:ListItem>
        <asp:ListItem Value="5">Object oriented programming</asp:ListItem>
    </asp:ListBox><br />
    <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click"/>

    <asp:PlaceHolder ID="StudentInfo" runat="server"></asp:PlaceHolder>
</asp:Content>