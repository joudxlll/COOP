using joud4400Project.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Drawing;
using System.IO;

namespace joud4400Project.AboutUs
{
    public partial class sendEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSendMailViaMailMgr_Click(object sender, EventArgs e)
        {
            sendEmail2();
        }

        /// <summary>
        /// updated on Oct 30,2020
        /// 
        /// to do :create a class to insert attached files to db and another one to inert attached files to folder
        /// </summary>
        protected void sendEmail2()
        {
            int intSenderId = 111;
              string senderName = Page.User.Identity.Name;
              senderName = (string.IsNullOrWhiteSpace(senderName)) ? "Admin"  : Page.User.Identity.Name;
            string rtn = "";
            if (string.IsNullOrEmpty(txtSubject.Text) || string.IsNullOrEmpty(txtBody.Text))
            {
                lblMsg.Text = "Please fill Subject & email body";
                lblMsg.ForeColor = Color.Red;
                return;
            }

         //   InsertContactUs(); // to save email in database 
            using (mailMgr myMailMgr = new mailMgr())
            {
                myMailMgr.mySubject = txtSubject.Text + ": " + senderName;
                myMailMgr.myBody = txtBody.Text;

                rtn = myMailMgr.sendEmailViaGmail();
                
                lblMsg.Text = rtn;
                lblMsg.ForeColor = Color.Green; // using System.Drawing above 2/2018
                lblMsg.BackColor = Color.Yellow;
            }
        }

        protected void lblOutputClear_txtSubject(object sender, EventArgs e)
        {
            lblMsg.Text = "";
        }


    }
}