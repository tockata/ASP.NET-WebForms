namespace Countries
{
    using System;
    using System.Linq;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    public partial class _Default : Page
    {
        private CountriesContext context = new CountriesContext();

        public SortDirection ListViewSortDirection
        {
            get
            {
                if (this.ViewState["sortDirection"] == null)
                {
                    this.ViewState["sortDirection"] = SortDirection.Ascending;
                }

                return (SortDirection)this.ViewState["sortDirection"];
            }

            set
            {
                this.ViewState["sortDirection"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void lvTowns_Sorting(object sender, ListViewSortEventArgs e)
        {
            var sortExpression = e.SortExpression;
            var sortDirection = this.ListViewSortDirection.ToString();

            if (sortDirection == "Ascending")
            {
                this.EntityDataSourceTowns.OrderBy = "it." + sortExpression + " ASC";
            }
            else
            {
                this.EntityDataSourceTowns.OrderBy = "it." + sortExpression + " DESC";
            }
        }

        protected void lbInsertNewTown_Click(object sender, EventArgs e)
        {
            this.lvTowns.InsertItemPosition = InsertItemPosition.LastItem;
        }

        protected void lvTowns_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            this.lvTowns.InsertItemPosition = InsertItemPosition.None;
        }

        protected void EntityDataSourceTowns_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            Town newTown = (Town)e.Entity;
            int countryId = Convert.ToInt32(this.gvCountries.SelectedDataKey.Value);
            newTown.CountryId = countryId;
        }

        protected void EntityDataSourceTowns_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            if (e.Exception != null)
            {
                this.errorMessage.InnerText = "You must first select country!";
                this.errorDiv.Visible = true;
                e.ExceptionHandled = true;
                return;
            }
        }

        protected void btnCancelTown_Command(object sender, CommandEventArgs e)
        {
            this.lvTowns.InsertItemPosition = InsertItemPosition.None;
        }

        protected void gvCountries_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddNewCountry")
            {
                Control control = null;
                if (this.gvCountries.FooterRow != null)
                {
                    control = this.gvCountries.FooterRow;
                }
                else
                {
                    control = this.gvCountries.Controls[0].Controls[0];
                }

                try
                {
                    int continentId = Convert.ToInt32(this.lbContinents.SelectedValue);
                    string countryName = ((TextBox)control.FindControl("tbNewCountryName")).Text;
                    int countryPopulation = Convert.ToInt32(((TextBox)control.FindControl("tbNewCountryPopulation")).Text);
                    string countryLanguage = ((TextBox)control.FindControl("tbNewCountryLanguage")).Text;

                    Country newCountry = new Country
                    {
                        Name = countryName,
                        Population = countryPopulation,
                        Language = countryLanguage,
                        ContinentId = continentId
                    };

                    this.context.Countries.Add(newCountry);
                    this.context.SaveChanges();

                    ((TextBox)control.FindControl("tbNewCountryName")).Text = string.Empty;
                    ((TextBox)control.FindControl("tbNewCountryPopulation")).Text = string.Empty;
                    ((TextBox)control.FindControl("tbNewCountryLanguage")).Text = string.Empty;

                    this.successMessage.InnerText = "You successfully added country: " + countryName + "!";
                    this.successDiv.Visible = true;
                }
                catch (Exception ex)
                {
                    this.errorMessage.InnerText = ex.Message;
                    this.errorDiv.Visible = true;
                    return;
                }
            }
        }

        protected void btnDeleteCountry_Command(object sender, CommandEventArgs e)
        {
            int countryId = Convert.ToInt32(e.CommandArgument);
            var countryTowns = this.context.Towns.Where(t => t.CountryId == countryId);
            this.context.Towns.RemoveRange(countryTowns);

            this.context.SaveChanges();
        }

        protected void DismissBtn_Click(object sender, EventArgs e)
        {
            this.successDiv.Visible = false;
            this.errorDiv.Visible = false;
        }
    }
}