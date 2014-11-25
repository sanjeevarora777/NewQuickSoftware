using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Services;
using System.Text;
using System.Threading.Tasks;

using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Formatting;
using Newtonsoft.Json;
using System.Collections;


namespace QuickWeb.Bookings_New
{
    public partial class frmDelivery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtBarcode.Focus();
             //   ShowDataUsingDataTable();
                BindGrid();
            }
        }


        private void BindGrid()
        {
         

            ArrayList date = new ArrayList();
            date = DAL.DALFactory.Instance.DAL_DateAndTime.getDateAndTimeAccordingToZoneTime(Globals.BranchID);
           
            SqlCommand cmd = new SqlCommand();
            DataSet ds = new DataSet();

            cmd.CommandText = "sp_Delivery";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@BranchId", Globals.BranchID);
            cmd.Parameters.AddWithValue("@PageCurrentDate", date[0].ToString());
            cmd.Parameters.AddWithValue("@BookingNumber", "B71");
            cmd.Parameters.AddWithValue("@Flag", 1);
            ds = PrjClass.GetData(cmd);

            if (ds.Tables[0].Rows.Count > 0)
            {

                lblCustomerName.Text = ds.Tables[0].Rows[0]["CustomerName"].ToString();
                lblCustAddress.Text = ds.Tables[0].Rows[0]["CustomerAdress"].ToString();
                lblCustMobile.Text = ds.Tables[0].Rows[0]["CustMobile"].ToString();
                lblEmail.Text = ds.Tables[0].Rows[0]["EmailID"].ToString();
                if (Convert.ToInt32(ds.Tables[0].Rows[0]["LastVisit"].ToString()) < 10)
                {
                    lblLastVisit.Text = ds.Tables[0].Rows[0]["LastVisit"].ToString() + " Day";
                }
                else
                {
                    lblLastVisit.Text = ds.Tables[0].Rows[0]["LastVisit"].ToString() + " Days";
                }
                lblOrderDate.Text = ds.Tables[0].Rows[0]["BookingDate"].ToString();
                lblDueDate.Text = ds.Tables[0].Rows[0]["DeliveryDate"].ToString();

                lblGrossAmount.Text = ds.Tables[0].Rows[0]["Currency"].ToString() + " " + ds.Tables[0].Rows[0]["BookingAmount"].ToString();
                lblNetAmount.Text = ds.Tables[0].Rows[0]["Currency"].ToString() + " " + ds.Tables[0].Rows[0]["NetAmount"].ToString();
                lblPaidAmount.Text = ds.Tables[0].Rows[0]["Currency"].ToString() + " " + ds.Tables[0].Rows[0]["PaymentMade"].ToString();
                lblDueAmount.Text = ds.Tables[0].Rows[0]["Currency"].ToString() + " " + ds.Tables[0].Rows[0]["DuePayment"].ToString();
                lblInvoiceNo.Text = ds.Tables[0].Rows[0]["BookingNumber"].ToString();
                lblDiscount.Text = ds.Tables[0].Rows[0]["DiscountValue"].ToString();
                txtDelQty.Text = ds.Tables[0].Rows[0]["DeliveredQty"].ToString();

                if (ds.Tables[0].Rows[0]["SatisfiedCustomer"].ToString() == "False")
                {
                    chkSatisfiedCustomer.Checked = false;
                }
                else
                {
                    chkSatisfiedCustomer.Checked = true;
                }

                if (ds.Tables[0].Rows[0]["DeliveryWithoutTicket"].ToString() == "False")
                {
                    chkDeliveryWithoutTicket.Checked = false;
                }
                else
                {
                    chkDeliveryWithoutTicket.Checked = true;
                }

                if (ds.Tables[0].Rows[0]["CommunicationMeans"].ToString().ToUpper() == "BOTH")
                {
                    chkEmail.Checked = true;
                    chkSMS.Checked = true;
                }
                else if (ds.Tables[0].Rows[0]["CommunicationMeans"].ToString().ToUpper() == "SMS")
                {
                    chkEmail.Checked = false;
                    chkSMS.Checked = true;
                }
                else if (ds.Tables[0].Rows[0]["CommunicationMeans"].ToString().ToUpper() == "EMAIL")
                {
                    chkEmail.Checked = true;
                    chkSMS.Checked = false;
                }
                else
                {
                    chkEmail.Checked = false;
                    chkSMS.Checked = false;
                }
            }

            if (ds.Tables[1].Rows.Count > 0)
            {
                grdData.DataSource = ds.Tables[1];
                grdData.DataBind();
                if (grdData.Rows.Count > 1)
                {
                    txtTotalGarment.Text = grdData.Rows.Count.ToString();
                }
                else
                {
                    txtTotalGarment.Text = "0";
                }
            }
        
        }


        private void ShowDataUsingDataTable()
        {
            var client = new HttpClient();

            client.BaseAddress = new Uri("http://localhost:9000/");
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            var task = client.GetAsync("api/products/").Result;
            //get results as a string
            var result = task.Content.ReadAsStringAsync().Result;
            //serialize to an object using Newtonsoft.Json nuget package         
            DataTable dtValue = (DataTable)JsonConvert.DeserializeObject(result, (typeof(DataTable)));

            grdData.DataSource = dtValue;
            grdData.DataBind();

            txtTotalGarment.Text = grdData.Rows.Count.ToString();
            //if (!result.Contains("["))
            //{
            //    result = "[" + result + "]";
            //}
        }

        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowIndex == 0)
                    e.Row.Style.Add("height", "50px");
            }
        }

        [WebMethod]
        public static string GetLeftGridByCustomer(string custCode)
        {
            DataTable dt = new DataTable();
         
            StringBuilder strbuilder1 = new StringBuilder();
            int counter = 1;


            string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            string CommandText = "select  'Gents Suit 3 Pcs - COAT Green/ No Starch'  as GarmentDetails ,barcode,'Dry Clean, Alteration' as Service,'Delivered' as status ,'26 /05/2014 5: 10 :58 pm -  ERIC' as ReadyOn,'26 /05/2014 5: 10 :58 pm -  ERIC' as DeliveredOn   from BarcodeTable";

            SqlConnection myConnection = new SqlConnection(con);
            SqlCommand myCommand = new SqlCommand(CommandText, myConnection);

            SqlDataAdapter myAdapter = new SqlDataAdapter();
            myAdapter.SelectCommand = myCommand;
            DataSet myDataSet = new DataSet();
            try
            {
                myConnection.Open();

                myAdapter.Fill(myDataSet);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            finally
            {
                myConnection.Close();
            }




            if (myDataSet.Tables.Count > 0)
            {
                dt = myDataSet.Tables[0];
                foreach (DataRow dtrow in dt.Rows)
                {
                    strbuilder1.Append("<tr><td><input type='CheckBox' ID='chkSelect'/></td><td>" + dtrow["BookingNumber"].ToString() + "</td><td style='display:none' ></td>" + counter + "<td>" + dtrow["BookingDeliveryDate"].ToString() + "</td><td>" + dtrow["Barcode"].ToString() + "</td><td>" + dtrow["Customer"].ToString() + "</td><td>" + dtrow["SubItemName"].ToString() + "</td><td>" + dtrow["IsUrgent"].ToString() + "</td><td>" + dtrow["ItemProcessType"].ToString() + "</td></tr>");
                    counter = counter + 1;
                }
            }
            return strbuilder1.ToString();
        }    
    }
}