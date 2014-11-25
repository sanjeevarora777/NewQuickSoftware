using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuickWeb.New_Admin
{
    public partial class frmReleaseNote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["aid"] != null)
                {
                    var straid = Request.QueryString["aid"].ToString();
                    if (straid == "1")
                    {
                        hdnReleaseCheck.Value = "1";
                    }
                    else if (straid == "2")
                    {
                        hdnReleaseCheck.Value = "2";
                    }
                }
            }

        }
    }
}