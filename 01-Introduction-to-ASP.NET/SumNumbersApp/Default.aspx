<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SumNumbersApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2>Sum of numbers</h2>
        <asp:Label ID="FirstNumberLabel" runat="server" Text="Label">First number: </asp:Label>
        <asp:TextBox ID="FirstNumberTextBox" runat="server"></asp:TextBox><br />
        <asp:Label ID="SecondNumberLabel" runat="server" Text="Label">Second number: </asp:Label>
        <asp:TextBox ID="SecondNumberTextBox" runat="server"></asp:TextBox><br />
        <asp:Button ID="SumButton" runat="server" Text="Sum" OnClick="SumButton_Click"/>

        Result: <asp:TextBox ID="ResultView" runat="server"></asp:TextBox>

        <h2>Text to PNG</h2>
        <asp:TextBox ID="TextToPngTextBox" runat="server"></asp:TextBox>
        <asp:Button ID="TextToPngButton" runat="server" Text="Text to PNG" OnClick="TextTiPngButton_Click" />
    </div>

</asp:Content>
