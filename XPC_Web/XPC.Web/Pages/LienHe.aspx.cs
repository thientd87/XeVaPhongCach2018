using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BO;

namespace XPC.Web.Pages
{
    public partial class LienHe : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSenFeedBack_Click(object sender, EventArgs e)
        {

            XpcHelper.InsertFeedBack(txtName.Value, "1", txtTel.Value, txtEmail.Value,"", "", txtContent.Value);
            Page.RegisterClientScriptBlock("success","<script>alert(\"Cảm ơn bạn đã gửi ý kiến cho chúng tôi! Chúng tôi sẽ phản hồi sớm nhất có thể.\"); window.location.href=\"home.htm\";</script>");
           
        }
    }
}