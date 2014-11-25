using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;

namespace QuickWeb
{
    public partial class frmLicence : System.Web.UI.Page
    {
        protected string AppTitle = ConfigurationManager.AppSettings["AppTitle"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowData();
            }
        }

        private void ShowData()
        {
            string strResult = string.Empty;
            int NoOfDay = 0;
            SqlConnection sqlconn = new SqlConnection(PrjClass.sqlConStr);            
            ArrayList date = new ArrayList();
            date = DAL.DALFactory.Instance.DAL_DateAndTime.getDateAndTimeAccordingToZoneTime(Globals.BranchID);
            strResult = BAL.BALFactory.Instance.BL_ColorMaster.CheckLicenceDate(Globals.BranchID, sqlconn.Database, date[0].ToString());
            var aryData = strResult.Split(':');
            NoOfDay = Convert.ToInt32(aryData[0].ToString());
            lblRenewalDate.Text = aryData[2].ToString();
            lblDay.Text = aryData[0].ToString();
            lblAmount.Text = aryData[3].ToString();
            lblCurrency.Text = aryData[4].ToString();            

            if (NoOfDay < 0)
            {
                btnContinue.Attributes.Add("style", "display:none");

            }
            else
            {
                btnContinue.Attributes.Add("style", "display:inline");
             var   strStatus = BAL.BALFactory.Instance.BL_ColorMaster.UpdateNotificationDetails(Globals.BranchID, "1");
            }
                   
        }
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Session["UserId"] = Globals.UserId;
            if (Globals.UserType.ToString() != "4")
            {
                Response.Redirect("home.html");
            }
            else
            {
                Response.Redirect("Factory/frmFactoryHome.aspx", false);
            }
        }
    }
}