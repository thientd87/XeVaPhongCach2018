using System;
using System.Web;
using BO;

namespace XPC.Web.Pages
{
    public partial class VoteItem : System.Web.UI.Page
    {
        private int VoteID;
        private Random random = new Random();
        private string GenerateRandomCode()
        {
            string s = "";
            for (int i = 0; i < 6; i++)
                s = String.Concat(s, this.random.Next(10).ToString());
            return s;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                btnBieuQuyet.Text = "Biểu quyết";
                HttpContext.Current.Session["CaptchaImageText"] = GenerateRandomCode();
            }
        }

        protected void btnBieuQuyet_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //ok
                ltrScript.Text = "";
                VoteID = Convert.ToInt32(Request.QueryString["voteid"]);
                if (VoteID != 0)
                {
                    XpcHelper.UpdateRateVoteItem(VoteID);
                    ltrAlert.Text = "Bạn đã biểu quyết thành công!";
                    divVote.Visible = false;
                    divOK.Visible = true;
                    ltrScript.Text = "<script type=\"text/javascript\" language=\"javascript\">alert('Bạn đã biểu quyết thành công!');this.close();</script>";
                }
            }
            else
            {
                ltrScript.Text = "<script type=\"text/javascript\" language=\"javascript\">alert('Sai mã xác nhận');</script>";
                
            }
            
        }
    }
}