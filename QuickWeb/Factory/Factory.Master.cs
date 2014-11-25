using System;
using System.Web.Security;

namespace QuickWeb.Factory
{
    public partial class Factory : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                FormsAuthentication.SignOut();
                Response.Redirect(FormsAuthentication.LoginUrl, false);
            }
            if (!IsPostBack)
            {
                lblUserName.Text = Globals.UserName;
                var ds = BAL.BALFactory.Instance.BL_Branch.ShowBranch(Int32.Parse(Globals.BranchID));
                lblStoreName.Text = ds.Tables[0].Rows[0]["BranchName"].ToString() + ", ";
            }
        }
    }
}