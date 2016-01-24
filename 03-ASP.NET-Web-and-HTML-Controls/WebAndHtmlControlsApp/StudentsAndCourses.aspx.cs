using System;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebAndHtmlControlsApp
{
    public partial class StudentsAndCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            HtmlGenericControl container = new HtmlGenericControl("div");

            HtmlGenericControl studentName = new HtmlGenericControl("h3");
            studentName.InnerHtml = this.FirstNameTextBox.Text + " " + this.LastNameTextBox.Text;
            container.Controls.Add(studentName);

            HtmlGenericControl facultyNumber = new HtmlGenericControl("p");
            facultyNumber.InnerHtml = "Faculty number: " + this.FacultyNumberTextBox.Text;
            container.Controls.Add(facultyNumber);

            HtmlGenericControl university = new HtmlGenericControl("p");
            facultyNumber.InnerHtml = "University: " + this.UnivesityDropDown.SelectedItem.Text;
            container.Controls.Add(university);

            HtmlGenericControl specialty = new HtmlGenericControl("p");
            specialty.InnerHtml = "Specialty: " + this.SpecialtyDropDownList.SelectedItem.Text;
            container.Controls.Add(specialty);

            HtmlGenericControl courses = new HtmlGenericControl("p");
            ListItemCollection coursesListItems = this.CoursesListBox.Items;
            string coursesStr = string.Empty;
            foreach (ListItem item in coursesListItems)
            {
                if (item.Selected)
                {
                    coursesStr += item.Text + " ";
                }
            }

            courses.InnerHtml = "Courses: " + coursesStr;
            container.Controls.Add(courses);

            this.StudentInfo.Controls.Add(container);
        }
    }
}