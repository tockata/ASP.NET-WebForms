namespace Data_Binding_App
{
    using System.ComponentModel;
    using System.Linq;
    using System.Web.Script.Services;
    using System.Web.Services;
    using Models;
    using Newtonsoft.Json;

    /// <summary>
    /// Summary description for EmployeeService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
    [ScriptService]
    public class EmployeeService : WebService
    {
        private NorthwindEntities context = new NorthwindEntities();

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = true)]
        public string GetDetailedEmployeeInfo(int id)
        {
            DetailedEmployeeInfo empInfo = this.context.Employees.Where(emp => emp.EmployeeID == id)
                .Select(emp => new DetailedEmployeeInfo
                {
                    Photo = emp.Photo,
                    Phone = emp.HomePhone,
                    HireDate = emp.HireDate,
                    Address = emp.Address,
                    Notes = emp.Notes
                }).FirstOrDefault();

            var result = JsonConvert.SerializeObject(empInfo);

            return result;
        }
    }
}