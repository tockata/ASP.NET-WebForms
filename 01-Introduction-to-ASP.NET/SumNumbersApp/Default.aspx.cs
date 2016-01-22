using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SumNumbersApp
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SumButton_Click(object sender, EventArgs e)
        {
            try
            {
                double firstNumber = double.Parse(this.FirstNumberTextBox.Text);
                double secondNumber = double.Parse(this.SecondNumberTextBox.Text);

                double result = firstNumber + secondNumber;
                this.ResultView.Text = result.ToString();
            }
            catch (FormatException ex)
            {
                this.ResultView.Text = ex.Message;
            }
        }

        protected void TextTiPngButton_Click(object sender, EventArgs e)
        {
            this.Response.Redirect(this.TextToPngTextBox.Text + ".img?text=" + this.TextToPngTextBox.Text);
        }
    }
}