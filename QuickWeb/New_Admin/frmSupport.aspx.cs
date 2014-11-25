using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Net;

namespace QuickWeb.New_Admin
{
    public partial class frmSupport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool IsOnCloud = BAL.BALFactory.Instance.BL_ColorMaster.CheckCloud(Globals.BranchID);
                if (IsOnCloud == true)
                {
                    hdnIsCloud.Value = "1";
                }
            }

        }

        protected void lnkRemortSupport_Click(object sender, EventArgs e)
        {  
             bool IsCloud = BAL.BALFactory.Instance.BL_ColorMaster.CheckCloud(Globals.BranchID);
             if (IsCloud == true)
             {
                 string strURL = Server.MapPath("~/Docs/TeamViewerQS_en-idcc2dtdsr.exe");
                 WebClient req = new WebClient();
                 HttpResponse response = HttpContext.Current.Response;
                 response.Clear();
                 response.ClearContent();
                 response.ClearHeaders();
                 response.Buffer = true;
                 response.ContentType = "application/exe";
                 response.AddHeader("Content-Disposition", "attachment;filename=\"TeamViewerQS_en-idcc2dtdsr.exe\"");
                 byte[] data = req.DownloadData(strURL);
                 response.BinaryWrite(data);
                 response.End();
             }
             else
             {
                 var p = new Process();
                 var info = new ProcessStartInfo
                 {
                     FileName = Server.MapPath("~/Docs/TeamViewerQS_en-idcc2dtdsr.exe"),
                     UseShellExecute = false,
                     WindowStyle = ProcessWindowStyle.Normal,
                 };
                 p.StartInfo = info;
                 p.Start();
                 p.WaitForExit();
             }
        }
    }
}