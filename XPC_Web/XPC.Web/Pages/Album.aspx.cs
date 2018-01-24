using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BO;

namespace XPC.Web.Pages
{
    public partial class Album : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dtAlbums = XpcHelper.GetAllAlbum(151);
                if (dtAlbums != null && dtAlbums.Rows.Count > 0)
                {
                    rptAlbums.DataSource = dtAlbums;
                    rptAlbums.DataBind();
                }
            }
        }
    }
}