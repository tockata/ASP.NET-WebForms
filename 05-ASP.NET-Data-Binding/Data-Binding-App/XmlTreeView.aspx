<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="XmlTreeView.aspx.cs" Inherits="Data_Binding_App.XmlTreeView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:XmlDataSource ID="xmlFoodMenu" runat="server" DataFile="~/App_Data/food-menu.xml"></asp:XmlDataSource>
    <asp:TreeView ID="treeViewXmlFoodMenu" runat="server"
        DataSourceID="xmlFoodMenu"
        OnSelectedNodeChanged="treeViewXmlFoodMenu_SelectedNodeChanged">
        <DataBindings>
            <asp:TreeNodeBinding DataMember="breakfast_menu" Text="Breakfast menu" />
            <asp:TreeNodeBinding DataMember="food" TextField="name" />
            <asp:TreeNodeBinding DataMember="price" TextField="#InnerText" />
            <asp:TreeNodeBinding DataMember="description" TextField="#InnerText" />
            <asp:TreeNodeBinding DataMember="calories" TextField="#InnerText" />
        </DataBindings>
    </asp:TreeView>
    <asp:Label ID="SelectedNodeInnerXml" runat="server"></asp:Label>
</asp:Content>