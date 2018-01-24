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
    public partial class AlbumDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int newsID = Lib.QueryString.AlbumID;
                DataTable dtAlbumDetail = XpcHelper.GetAlbumDetail(newsID, 131);
                if (dtAlbumDetail != null && dtAlbumDetail.Rows.Count > 0)
                {
                    rptAlbumDetail.DataSource = dtAlbumDetail;
                    rptAlbumDetail.DataBind();
                }
            }
        }
    }
}