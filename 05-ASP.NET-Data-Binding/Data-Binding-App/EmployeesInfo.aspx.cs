namespace Data_Binding_App
{
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;
    using Data_Binding_App.Models;

    public partial class EmployeesInfo : System.Web.UI.Page
    {
        private NorthwindEntities context = new NorthwindEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public IQueryable<ShortEmployeeInfo> gvEmployees_GetData()
        {
            var employeesInfo = this.context.Employees
                .Select(e => new ShortEmployeeInfo
                {
                    Id = e.EmployeeID,
                    Name = e.FirstName + " " + e.LastName,
                    City = e.City,
                    Country = e.Country
                });

            return employeesInfo;
        }

        public void gvEmployyes_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.CssClass = "emp-row";
            }
        }
    }
}