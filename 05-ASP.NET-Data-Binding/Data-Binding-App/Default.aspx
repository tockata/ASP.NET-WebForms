<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Data_Binding_App._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h3><a runat="server" href="~/Cars">01. Cars</a></h3>
        <h3><a runat="server" href="~/Employees">02. Employees</a></h3>
    </div>
</asp:Content>