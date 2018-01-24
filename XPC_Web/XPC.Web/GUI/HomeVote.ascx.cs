using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BO;

namespace XPC.Web.GUI
{
    public partial class HomeVote : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = XpcHelper.GetVoteActive();
            if (dt != null && dt.Rows.Count > 0)
            {
                ltrVote.Text = dt.Rows[0]["Vote_Title"].ToString();

                DataTable dtItem = XpcHelper.GetVoteItem(Convert.ToInt32(dt.Rows[0]["Vote_ID"]));
                this.Page.RegisterHiddenField("vid", dt.Rows[0]["Vote_ID"].ToString());
                rptVote.DataSource = dtItem;
                rptVote.DataBind();
            }
            else
                this.Visible = false;
        }
    }
}