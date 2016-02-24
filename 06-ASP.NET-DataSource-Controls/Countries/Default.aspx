<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Countries._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div id="successDiv" runat="server" class="alert alert-success" visible="false">
            <asp:Button ID="successDismissBtn" runat="server" type="button" CssClass="close" Text="x" OnClick="DismissBtn_Click" />
            <strong id="successMessage" runat="server"></strong>
        </div>
        <div id="errorDiv" runat="server" class="alert alert-danger" visible="false">
            <asp:Button ID="errorDismissBtn" runat="server" type="button" CssClass="close" Text="x" OnClick="DismissBtn_Click" />
            <strong id="errorMessage" runat="server"></strong>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <h2>Continents</h2>
            <asp:EntityDataSource ID="EntityDataSourceContinents" runat="server"
                ConnectionString="name=CountriesContext"
                DefaultContainerName="CountriesContext"
                EntitySetName="Continents"
                EnableFlattening="false">
            </asp:EntityDataSource>
            <asp:ListBox ID="lbContinents" runat="server"
                DataSourceID="EntityDataSourceContinents"
                DataTextField="Name"
                DataValueField="Id"
                AutoPostBack="true"></asp:ListBox>
        </div>
        <div class="col-md-6">
            <h2>Countries</h2>
            <asp:EntityDataSource ID="EntityDataSourceCountries" runat="server"
                ConnectionString="name=CountriesContext"
                DefaultContainerName="CountriesContext"
                EntitySetName="Countries"
                EnableFlattening="false"
                EnableInsert="true"
                EnableUpdate="true"
                EnableDelete="true"
                Where="it.ContinentId=@ContinentId">
                <WhereParameters>
                    <asp:ControlParameter Name="ContinentId" Type="Int32" ControlID="lbContinents" />
                </WhereParameters>
            </asp:EntityDataSource>
            <asp:GridView ID="gvCountries" runat="server"
                AutoGenerateColumns="false"
                ItemType="Countries.Country"
                DataKeyNames="Id"
                DataSourceID="EntityDataSourceCountries"
                AllowPaging="true"
                PageSize="5"
                AllowSorting="true"
                ShowFooter="true"
                OnRowCommand="gvCountries_RowCommand"
                SelectedRowStyle-ForeColor="#ffffff"
                SelectedRowStyle-BackColor="#ff9900">
                <Columns>
                    <asp:TemplateField HeaderText="Country name" SortExpression="Name" ItemStyle-CssClass="country-td">
                        <ItemTemplate>
                            <asp:Label ID="ltCountryName" runat="server" Text="<%#: Item.Name %>" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbCountryName" runat="server" Text="<%# BindItem.Name %>" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbNewCountryName" runat="server" /><br />
                            <asp:RequiredFieldValidator ID="rfvCountryName" runat="server"
                                ValidationGroup="InsertNewCountryControls"
                                ControlToValidate="tbNewCountryName"
                                ForeColor="Red"
                                ErrorMessage="Country name can not be empty!">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Population" SortExpression="Population" ItemStyle-CssClass="country-td">
                        <ItemTemplate>
                            <asp:Label ID="ltCountryPopulation" runat="server" Text="<%#: Item.Population %>" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbCountryPopulation" runat="server" Text="<%# BindItem.Population %>" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbNewCountryPopulation" runat="server" /><br />
                            <asp:RequiredFieldValidator ID="rfvCountryPopulation" runat="server"
                                ValidationGroup="InsertNewCountryControls"
                                ControlToValidate="tbNewCountryPopulation"
                                ForeColor="Red"
                                ErrorMessage="Country population can not be empty!">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Language" SortExpression="Language" ItemStyle-CssClass="country-td">
                        <ItemTemplate>
                            <asp:Label ID="ltCountryLanguage" runat="server" Text="<%#: Item.Language %>" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbCountryLanguage" runat="server" Text="<%# BindItem.Language %>" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbNewCountryLanguage" runat="server" /><br />
                            <asp:RequiredFieldValidator ID="rfvCountryLanguage" runat="server"
                                ValidationGroup="InsertNewCountryControls"
                                ControlToValidate="tbNewCountryLanguage"
                                ForeColor="Red"
                                ErrorMessage="Country language can not be empty!">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnSelectCountry" runat="server" CommandName="Select" Text="Select" CssClass="btn btn-info btn-xs" Width="50px" />
                            <asp:Button ID="btnEditCountry" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-primary btn-xs" Width="50px" />
                            <asp:Button ID="btnDeleteCountry" runat="server" CommandName="Delete" CommandArgument="<%# Item.Id %>" OnCommand="btnDeleteCountry_Command" Text="Delete" CssClass="btn btn-danger btn-xs" Width="50px" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdateCountry" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-xs btn-default" />
                            <asp:Button ID="btnCancelCountry" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-xs btn-primary" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btnInsertCountry" runat="server" CommandName="AddNewCountry" CausesValidation="true" ValidationGroup="InsertNewCountryControls" Text="Add country" CssClass="btn btn-success" Width="100%" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    Add new country:<br />
                    Name:
                    <asp:TextBox ID="tbNewCountryName" runat="server" /><br />
                    <asp:RequiredFieldValidator ID="rfvCountryName" runat="server"
                        ValidationGroup="InsertNewCountryControls"
                        ControlToValidate="tbNewCountryName"
                        ForeColor="Red"
                        ErrorMessage="Country name can not be empty!">
                    </asp:RequiredFieldValidator><br />
                    Population
                    <asp:TextBox ID="tbNewCountryPopulation" runat="server" /><br />
                    <asp:RequiredFieldValidator ID="rfvCountryPopulation" runat="server"
                        ValidationGroup="InsertNewCountryControls"
                        ControlToValidate="tbNewCountryPopulation"
                        ForeColor="Red"
                        ErrorMessage="Country population can not be empty!">
                    </asp:RequiredFieldValidator><br />
                    Language:
                    <asp:TextBox ID="tbNewCountryLanguage" runat="server" /><br />
                    <asp:RequiredFieldValidator ID="rfvCountryLanguage" runat="server"
                        ValidationGroup="InsertNewCountryControls"
                        ControlToValidate="tbNewCountryLanguage"
                        ForeColor="Red"
                        ErrorMessage="Country language can not be empty!">
                    </asp:RequiredFieldValidator><br />
                    <asp:Button ID="btnInsertCountry" runat="server" CommandName="AddNewCountry" CausesValidation="true" ValidationGroup="InsertNewCountryControls" Text="Add country" CssClass="btn btn-success" />
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
        <div class="col-md-4">
            <h2>Towns</h2>
            <asp:EntityDataSource ID="EntityDataSourceTowns" runat="server"
                ConnectionString="name=CountriesContext"
                DefaultContainerName="CountriesContext"
                EntitySetName="Towns"
                EnableFlattening="false"
                Where="it.CountryId=@CountryId"
                EnableInsert="true"
                EnableUpdate="true"
                EnableDelete="true"
                OnInserting="EntityDataSourceTowns_Inserting"
                OnInserted="EntityDataSourceTowns_Inserted">
                <WhereParameters>
                    <asp:ControlParameter Name="CountryId" Type="Int32" ControlID="gvCountries" />
                </WhereParameters>
            </asp:EntityDataSource>
            <asp:ListView ID="lvTowns" runat="server"
                ItemType="Countries.Town"
                DataKeyNames="Id"
                DataSourceID="EntityDataSourceTowns"
                OnSorting="lvTowns_Sorting"
                OnItemInserted="lvTowns_ItemInserted">
                <LayoutTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lbSortTownsByName" runat="server"
                                    CommandName="Sort"
                                    CommandArgument="Name"
                                    Text="Sort by name" />
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButton1" runat="server"
                                    CommandName="Sort"
                                    CommandArgument="Population"
                                    Text="Sort by population" />
                            </td>
                        </tr>
                        <span id="itemPlaceholder" runat="server"></span>
                    </table>
                    <br />
                    <asp:DataPager ID="DataPagerTowns" runat="server" PageSize="5">
                        <Fields>
                            <asp:NextPreviousPagerField ShowFirstPageButton="true"
                                ShowNextPageButton="false" ShowPreviousPageButton="false" />
                            <asp:NumericPagerField />
                            <asp:NextPreviousPagerField ShowLastPageButton="true"
                                ShowNextPageButton="false" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                    <br />
                    <asp:LinkButton ID="lbInsertNewTown" runat="server"
                        Text="Insert new town"
                        OnClick="lbInsertNewTown_Click" />
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#: Item.Name %></td>
                        <td><%#: Item.Population %></td>
                        <td>
                            <asp:Button ID="btnEditTown" runat="server" CommandName="Edit" Text="Edit" />
                            <asp:Button ID="btnDeleteTown" runat="server" CommandName="Delete" Text="Delete" />
                        </td>
                    </tr>
                </ItemTemplate>
                <EmptyDataTemplate>
                    No country selected.<br />
                    <asp:LinkButton ID="lbInsertNewTown" runat="server"
                        Text="Insert new town"
                        OnClick="lbInsertNewTown_Click" />
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <div class="insert-town">
                        New town:<br />
                        Town name:
                        <asp:TextBox ID="tbTownName" runat="server" Text="<%# BindItem.Name %>" /><br />
                        <asp:RequiredFieldValidator ID="rfvTownName" runat="server"
                            ControlToValidate="tbTownName"
                            ForeColor="Red"
                            ErrorMessage="Town name can not be empty!">
                        </asp:RequiredFieldValidator><br />
                        Town population:
                        <asp:TextBox ID="tbTownPopulation" runat="server" Text="<%# BindItem.Population %>" /><br />
                        <asp:RequiredFieldValidator ID="rfvTownPopulation" runat="server"
                            ControlToValidate="tbTownPopulation"
                            ForeColor="Red"
                            ErrorMessage="Town population can not be empty!">
                        </asp:RequiredFieldValidator><br />
                        <asp:Button ID="btnInsertTown" runat="server"
                            CommandName="Insert"
                            Text="Insert" />
                        <asp:Button ID="btnCancelTown" runat="server"
                            CommandName="Cancel"
                            OnCommand="btnCancelTown_Command"
                            Text="Cancel"
                            CausesValidation="false" />
                    </div>
                </InsertItemTemplate>

                <EditItemTemplate>
                    Town name:
                    <asp:TextBox ID="tbTownName" runat="server" Text="<%# BindItem.Name %>" /><br />
                    Town population:
                    <asp:TextBox ID="tbTownPopulation" runat="server" Text="<%# BindItem.Population %>" /><br />
                    <asp:Button ID="btnInsertTown" runat="server"
                        CommandName="Update"
                        Text="Update" />
                    <asp:Button ID="btnCancelUpdateTown" runat="server"
                        CommandName="Cancel"
                        Text="Cancel"
                        CausesValidation="false" />
                </EditItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>