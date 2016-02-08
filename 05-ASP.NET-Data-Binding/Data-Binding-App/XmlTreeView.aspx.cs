using System;
using System.Text;
using System.Web.UI.WebControls;

namespace Data_Binding_App
{
    public partial class XmlTreeView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void treeViewXmlFoodMenu_SelectedNodeChanged(object sender, EventArgs e)
        {
            TreeView tr = sender as TreeView;
            TreeNodeCollection childNodes = tr.SelectedNode.ChildNodes;

            string innerXml = GetInnerXml(childNodes, 0);

            this.SelectedNodeInnerXml.Text = innerXml;
        }

        private static string GetInnerXml(TreeNodeCollection childNodes, int offSet)
        {
            StringBuilder strBuilder = new StringBuilder();
            string offsetStr = new string(' ', offSet);
            foreach (TreeNode childNode in childNodes)
            {
                strBuilder.Append(offsetStr + childNode.Text + "<br />");
                strBuilder.Append(GetInnerXml(childNode.ChildNodes, offSet + 2));
            }

            return strBuilder.ToString();
        }
    }
}