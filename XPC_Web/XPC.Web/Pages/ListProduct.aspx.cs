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
    public partial class ListProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int CatID = Lib.QueryString.CategoryID;
                ProductHelper ph = new ProductHelper();
                DataTable dt = ph.GetProductByCatID_Paged(20,1,CatID);
                if (dt != null && dt.Rows.Count > 0)
                {
                    rptListPro.DataSource = dt;
                    rptListPro.DataBind();
                }
            }
        }
    }
}