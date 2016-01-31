<%@ Page Title="Cars" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="Data_Binding_App.Cars" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Literal ID="ltProducer" runat="server" Text="Producer: " />
    <asp:DropDownList ID="ddlProducer" runat="server"
        DataTextField="Name"
        DataValueField="Name"
        OnSelectedIndexChanged="ddlProducer_SelectedIndexChanged"
        AutoPostBack="true">
    </asp:DropDownList>
    <br />
    <asp:Literal ID="ltModel" runat="server" Text="Model: " />
    <asp:DropDownList ID="ddlModel" runat="server">
    </asp:DropDownList>
    <br />
    <asp:Literal ID="ltExtras" runat="server" Text="Extras: " />
    <asp:CheckBoxList ID="cblExtras" runat="server"
        DataTextField="Name"
        DataValueField="Name">
    </asp:CheckBoxList>
    <br />
    <asp:Literal ID="ltEngine" runat="server" Text="Engine type: " />
    <asp:RadioButtonList ID="rblEngine" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    <hr />
    <asp:Literal ID="Result" Mode="Encode" runat="server"></asp:Literal>
</asp:Content>