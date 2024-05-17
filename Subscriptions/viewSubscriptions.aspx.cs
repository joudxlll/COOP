using joud4400Project.App_Code;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace joud4400Project.Subscriptions
{
    public partial class viewSubscriptions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
        }

        private void BindGridView()
        {
            CRUD myCrud = new CRUD();
            string mySql = "select name, email, phoneNumber, billingInfo, billingFrequency, amount " +
                           "from subscriptions s " +
                           "inner join billingFrequency b ON s.billingFrequencyId = b.billingFrequencyId " +
                           "order by subscriptionId ASC";
            gvSubscriptions.DataSource = myCrud.getDT(mySql);
            gvSubscriptions.DataBind();
        }

        public static void ExportGridToExcel(GridView myGv) // working 1
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Charset = "";
            string FileName = "ExportedReport_" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            myGv.GridLines = GridLines.Both;
            myGv.HeaderStyle.Font.Bold = true;
            myGv.RenderControl(htmltextwrtter);
            HttpContext.Current.Response.Write(strwritter.ToString());
            HttpContext.Current.Response.End();
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            ExportGridToExcel(gvSubscriptions);

        }
    }
}