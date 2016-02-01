namespace Data_Binding_App
{
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;

    public partial class Employees : System.Web.UI.Page
    {
        private NorthwindEntities context = new NorthwindEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Employee> gvEmployees_GetData()
        {
            return this.context.Employees
                .OrderBy(e => e.FirstName)
                .ThenBy(e => e.LastName);
        }

        protected void gvEmployees_SelectedIndexChanged(object sender, EventArgs e)
        {
            int employeeId = (int)this.gvEmployees.SelectedDataKey.Value;
            var selectedEmployee = this.context.Employees.Where(emp => emp.EmployeeID == employeeId).ToList();

            this.fvEmployeeDetails.DataSource = selectedEmployee;
            this.fvEmployeeDetails.DataBind();
            this.fvEmployeeDetails.Visible = true;
        }
    }
}