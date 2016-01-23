using System;
using System.Web.UI;

namespace WebAndHtmlControlsApp
{
    public partial class RandomNumberGenerator : Page
    {
        private Random rnd = new Random();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GenerateRandomNumberHtml(object sender, EventArgs e)
        {
            try
            {
                int fromNumber = int.Parse(this.FromNumber.Value);
                int toNumber = int.Parse(this.ToNumber.Value);
                if (fromNumber >= toNumber)
                {
                    throw new FormatException("First number must be smaller than second number");
                }

                int rndNumber = rnd.Next(fromNumber, toNumber);
                this.resultHtml.InnerText = "Random number: " + rndNumber.ToString();
                this.resultHtml.Visible = true;
            }
            catch (FormatException ex)
            {
                this.resultHtml.InnerText = ex.Message;
                this.resultHtml.Visible = true;
            }
        }

        protected void GenerateRandomNumberWeb(object sender, EventArgs e)
        {
            try
            {
                int fromNumber = int.Parse(this.FromNumberTextBox.Text);
                int toNumber = int.Parse(this.ToNumberTextBox.Text);
                if (fromNumber >= toNumber)
                {
                    throw new FormatException("First number must be smaller than second number");
                }

                int rndNumber = rnd.Next(fromNumber, toNumber);
                this.Result.Text = "Random number: " + rndNumber.ToString();
                this.Result.Visible = true;
            }
            catch (FormatException ex)
            {
                this.Result.Text = ex.Message;
                this.Result.Visible = true;
            }
        }
    }
}