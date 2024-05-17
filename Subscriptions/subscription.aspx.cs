using joud4400Project.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joud4400Project.Subscriptions
{
    public partial class subscription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateDdlBillingFrequency();
                bindSubscriptionsGrid();
            }
        }


        protected void populateDdlBillingFrequency()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select billingFrequencyId, billingFrequency from billingFrequency";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);

            ddlBillingFrequency.DataTextField = "billingFrequency";
            ddlBillingFrequency.DataValueField = "billingFrequencyId";
            ddlBillingFrequency.DataSource = dr;
            ddlBillingFrequency.DataBind();
        }

        protected void bindSubscriptionsGrid()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select subscriptionId, name, billingFrequencyId, phoneNumber, email, amount, billingInfo 
                             from subscriptions order by subscriptionId ASC";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);

            gvSubscriptions.DataSource = dr;
            gvSubscriptions.DataBind();
        }

        protected void gvSubscriptions_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int subscriptionId = (int)gvSubscriptions.DataKeys[e.RowIndex].Value;
            deleteSubscription(subscriptionId.ToString());
        }

        protected void deleteSubscription(string subscriptionID)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"delete from subscriptions where subscriptionId = @subscriptionId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@subscriptionId", subscriptionID);

            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn > 0)
            {
                lblSuccess.Text = "Subscription deleted successfully.";
                bindSubscriptionsGrid();
            }
            else
            {
                lblSuccess.Text = "Failed to delete subscription.";
            }
        }

        protected void gvSubscriptions_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                gvSubscriptions.EditIndex = e.NewEditIndex;
                bindSubscriptionsGrid();

            }
            catch (Exception ex)
            {
                lblSuccess.Text = "An error occurred while editing the row: " + ex.Message;
            }
        }

        protected void gvSubscriptions_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                if (gvSubscriptions.EditIndex == e.RowIndex)
                {
                    int subscriptionId = Convert.ToInt32(gvSubscriptions.DataKeys[e.RowIndex].Value);
                    GridViewRow row = gvSubscriptions.Rows[e.RowIndex];
                    TextBox txtName = (TextBox)row.FindControl("txtName");
                    TextBox txtEmail = (TextBox)row.FindControl("txtEmail");
                    TextBox txtPhoneNumber = (TextBox)row.FindControl("txtPhoneNumber");
                    TextBox txtBillingInfo = (TextBox)row.FindControl("txtBillingInfo");
                    TextBox txtAmount = (TextBox)row.FindControl("txtAmount");

                    string name = txtName.Text;
                    string email = txtEmail.Text;
                    string phoneNumber = txtPhoneNumber.Text;
                    string billingInfo = txtBillingInfo.Text;
                    string amount = txtAmount.Text;

                    CRUD myCrud = new CRUD();
                    string mySql = @"update subscriptions set name = @name, email= @email, phoneNumber = @phoneNumber, billingInfo = @billingInfo, amount = @amount where subscriptionId = @subscriptionId";
                    Dictionary<string, object> myPara = new Dictionary<string, object>();
                    myPara.Add("@name", name);
                    myPara.Add("@email", email);
                    myPara.Add("@phoneNumber", phoneNumber);
                    myPara.Add("@billingInfo", billingInfo);
                    myPara.Add("@amount", amount);
                    myPara.Add("@subscriptionId", subscriptionId);

                    int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
                    if (rtn > 0)
                    {
                        lblSuccess.Text = "Row updated successfully.";
                        gvSubscriptions.EditIndex = -1; // Exit edit mode
                        bindSubscriptionsGrid(); // Rebind the GridView
                    }
                    else
                    {
                        lblSuccess.Text = "Failed to update row.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccess.Text = "An error occurred while updating the row: " + ex.Message;
            }
        }

        protected void gvSubscriptions_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSubscriptions.EditIndex = -1;
            bindSubscriptionsGrid();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtName.Text))
            {
                lblName.Text = "Please fill this field";
                lblName.ForeColor = Color.Red;

                return;
            }
            lblName.Text = "";

            if (string.IsNullOrEmpty(txtAmount.Text))
            {
                lblAmount.Text = "Please fill this field";
                lblAmount.ForeColor = Color.Red;
                return;
            }
            lblAmount.Text = "";

            string phoneNumber = txtPhoneNumber.Text.Trim();
            if (!Regex.IsMatch(phoneNumber, @"^\d{7,15}$"))
            {
                lblPhoneNumber.Text = "Please enter a valid phone number";
                lblPhoneNumber.ForeColor = Color.Red;
                return;
            }
            lblPhoneNumber.Text = "";

            CRUD myCrud = new CRUD();
            string mySql = @"insert subscriptions(name,billingFrequencyId,email,phoneNumber,billingInfo,amount)
                                values (@name,@billingFrequencyId,@email,@phoneNumber,@billingInfo,@amount)";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@name", txtName.Text);
            myPara.Add("@billingFrequencyId", ddlBillingFrequency.Text);
            myPara.Add("@email", txtEmail.Text);
            myPara.Add("@phoneNumber", txtPhoneNumber.Text);
            myPara.Add("@billingInfo", txtBillingInfo.Text);
            myPara.Add("@amount", txtAmount.Text);

            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);

            if (rtn > 0)
            {
                lblSuccess.Text = "Data inserted successfully.";
                bindSubscriptionsGrid();
            }

        }


    }
}