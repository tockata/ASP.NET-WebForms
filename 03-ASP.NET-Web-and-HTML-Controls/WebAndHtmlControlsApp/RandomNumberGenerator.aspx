<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RandomNumberGenerator.aspx.cs" Inherits="WebAndHtmlControlsApp.RandomNumberGenerator" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Random number generation</h1>

    <h2>1. With HTML server controls:</h2>
    <label for="FromNumber" runat="server">From number</label>
    <input id="FromNumber" type="text" runat="server" /><br />
    <label for="ToNumber" runat="server">To number</label>
    <input id="ToNumber" type="text" runat="server" /><br />
    <p id="resultHtml" runat="server" visible="false"></p>
    <input id="SubmitButtonHtml" type="button" runat="server" value="Submit" onserverclick="GenerateRandomNumberHtml" />

    <hr />

    <h2>2. With Web server controls:</h2>
    <asp:Label ID="FromNumberLabel" runat="server">From number</asp:Label>
    <asp:TextBox ID="FromNumberTextBox" runat="server"></asp:TextBox><br />
    <asp:Label ID="ToNumberLabel" runat="server">To number</asp:Label>
    <asp:TextBox ID="ToNumberTextBox" runat="server"></asp:TextBox><br />
    <asp:Literal ID="Result" Mode="Encode" runat="server" Visible="false"></asp:Literal><br />
    <asp:Button ID="SubmitButtonWeb" Text="Submit" runat="server" OnClick="GenerateRandomNumberWeb"/>
</asp:Content>
