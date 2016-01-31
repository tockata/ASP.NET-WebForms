namespace Data_Binding_App
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using Data_Binding_App.Models;

    public partial class Cars : Page
    {
        private List<Producer> producers = new List<Producer>
        {
            new Producer { Name = "BMW", Models = new List<string> { "BMW M1", "BMW M2", "BMW M3" } },
            new Producer { Name = "Audi", Models = new List<string> { "A3", "A4", "A5", "A6" } },
            new Producer { Name = "Ford", Models = new List<string> { "Escort", "Siera" } }
        };

        private List<Extra> extras = new List<Extra>
        {
            new Extra { Name = "GPS" },
            new Extra { Name = "Electric mirrors" },
            new Extra { Name = "Imobilizer" },
            new Extra { Name = "DVD" },
            new Extra { Name = "Cruise control" }
        };

        private List<string> engines = new List<string> { "diesel", "gasoline", "bi fuel" };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            this.ddlProducer.DataSource = this.producers;
            this.ddlProducer.DataBind();

            this.ddlModel.DataSource = this.producers[this.ddlProducer.SelectedIndex].Models;
            this.ddlModel.DataBind();

            this.cblExtras.DataSource = this.extras;
            this.cblExtras.DataBind();

            this.rblEngine.DataSource = this.engines;
            this.rblEngine.DataBind();
        }

        protected void ddlProducer_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.ddlModel.DataSource = this.producers[this.ddlProducer.SelectedIndex].Models;
            this.ddlModel.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            StringBuilder searchResult = new StringBuilder();
            searchResult.AppendLine("Producer: " + this.ddlProducer.SelectedItem.Value);
            searchResult.AppendLine("Model: " + this.ddlModel.SelectedItem.Text);

            List<string> selectedExtras = this.cblExtras.Items.Cast<ListItem>()
                .Where(li => li.Selected)
                .Select(li => li.Value)
                .ToList();
            string extras = string.Join(", ", selectedExtras);
            searchResult.AppendLine("Extras: " + extras);
            searchResult.AppendLine("Engine type: " + this.rblEngine.SelectedItem.Text);

            this.Result.Text = searchResult.ToString();
        }
    }
}