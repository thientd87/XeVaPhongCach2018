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
    public partial class HomeAnhDep : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dtAnhDep = XpcHelper.GetTopLastestAlbum(12,89);
                if (dtAnhDep != null && dtAnhDep.Rows.Count > 0)
                {
                    rptAnhDep.DataSource = dtAnhDep;
                    rptAnhDep.DataBind();
                }
            }
        }
    }
}