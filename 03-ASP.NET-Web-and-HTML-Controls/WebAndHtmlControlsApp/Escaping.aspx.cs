using System;
using System.Web.UI;

namespace WebAndHtmlControlsApp
{
    public partial class Escaping : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            this.ResultLabel.Text = Server.HtmlEncode(this.InputTextBox.Text);
            this.ResultTextBox.Text = Server.HtmlEncode(this.InputTextBox.Text);
        }
    }
}