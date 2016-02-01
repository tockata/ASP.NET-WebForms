namespace Data_Binding_App
{
    using System;
    using System.Web.ModelBinding;

    public partial class EmpDetails : System.Web.UI.Page
    {
        private NorthwindEntities context = new NorthwindEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public Employee dvEmployeeDetails_GetItem([QueryString]int id)
        {
            return this.context.Employees.Find(id);
        }
    }
}