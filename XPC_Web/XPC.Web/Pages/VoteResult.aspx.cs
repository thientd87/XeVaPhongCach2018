using System;
using System.Data;
using BO;

namespace XPC.Web.Pages
{
    public partial class VoteResult : System.Web.UI.Page
    {
        private string[] color = { "red", "yellow", "green", "blue", "pink", "gray", "black", "brown","orange" };

        protected void Page_Load(object sender, EventArgs e)
        {
            int VoteID = 0;
            if (!IsPostBack)
            {
                if(!String.IsNullOrEmpty(Request.QueryString["vid"]))
                {
                    VoteID = Convert.ToInt32(Request.QueryString["vid"]);
                }

                if(VoteID==0)
                {
                    DataTable dt = XpcHelper.GetVoteActive();
                    if (dt != null && dt.Rows.Count > 0)
                        VoteID = Convert.ToInt32(dt.Rows[0]["Vote_ID"]); 
                }


                if (VoteID > 0)
                {
                    DataTable dtItem = XpcHelper.GetVoteItem(VoteID);
                    int TotalRate = XpcHelper.GetVoteTotal(VoteID);
                    if (dtItem != null && dtItem.Rows.Count > 0)
                    {
                        ltrVote.Text = dtItem.Rows[0]["Vote_Title"].ToString();
                        dtItem.Columns.Add("VoteItem_Percent");
                        dtItem.Columns.Add("color");
                        for (int i = 0; i < dtItem.Rows.Count; i++)
                        {
                            dtItem.Rows[i]["VoteItem_Percent"] = TotalRate > 0
                                                                     ? Convert.ToInt32(dtItem.Rows[i]["VoteIt_Rate"]) >
                                                                       0
                                                                           ? (Convert.ToInt32(
                                                                               dtItem.Rows[i]["VoteIt_Rate"])*100/
                                                                              TotalRate) + "%"
                                                                           : "0"
                                                                     : "0";
                            dtItem.Rows[i]["color"] = color[i];
                        }
                        dtItem.AcceptChanges();
                        rptVote.DataSource = dtItem;
                        rptVote.DataBind();
                        ltrTotal.Text = TotalRate.ToString();

                    }

                    //this.Page.RegisterHiddenField("vid", dt.Rows[0]["Vote_ID"].ToString());
                }
            }
        }
    }
}