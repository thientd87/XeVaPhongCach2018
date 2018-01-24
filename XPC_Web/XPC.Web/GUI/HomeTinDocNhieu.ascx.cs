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
    public partial class HomeTinDocNhieu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dtTinNhieuNhat = XpcHelper.GetFocusNews(7,57);
                if (dtTinNhieuNhat != null && dtTinNhieuNhat.Rows.Count > 0)
                {
                    rptTinNhieuNhat.DataSource = dtTinNhieuNhat;
                    rptTinNhieuNhat.DataBind();
                }
            }
        }
    }
}