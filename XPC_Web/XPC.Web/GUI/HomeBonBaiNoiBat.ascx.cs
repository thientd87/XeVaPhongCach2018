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
    public partial class HomeBonBaiNoiBat : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dtBonBaiNoiBat = XpcHelper.GetBonBanNoiBat(4,175);
                if (dtBonBaiNoiBat != null && dtBonBaiNoiBat.Rows.Count > 0)
                {
                    rptBigPic.DataSource = dtBonBaiNoiBat;
                    rptBigPic.DataBind();

                    rptThumbs.DataSource = dtBonBaiNoiBat;
                    rptThumbs.DataBind();
                }

            }

        }
    }
}