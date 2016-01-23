<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Escaping.aspx.cs" Inherits="WebAndHtmlControlsApp.Escaping" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Escaping</h1>
    <asp:Label ID="InputLabel" runat="server" Text="Enter text, tag or script: "></asp:Label>
    <asp:TextBox ID="InputTextBox" runat="server"></asp:TextBox>
    <asp:Button ID="SubmitButton" Text="Submit" runat="server" OnClick="SubmitButton_Click"/>
    <br />
    <p>Result:</p>
    <asp:Label ID="ResultLabel" runat="server"></asp:Label>
    <asp:TextBox ID="ResultTextBox" runat="server"></asp:TextBox>
</asp:Content>
