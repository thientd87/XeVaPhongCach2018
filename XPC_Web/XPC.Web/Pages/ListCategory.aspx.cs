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
    public partial class ListCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProductCategoryHelper  pch = new ProductCategoryHelper();
                DataTable dtListStore = pch.GetListCateParentPagging(1, 6, 224);
                if (dtListStore != null && dtListStore.Rows.Count > 0)
                {
                    rptListStore.DataSource = dtListStore;
                    rptListStore.DataBind();
                }
                
            }
        }
    }
}