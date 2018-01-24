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
    public partial class TopMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtNews = XpcHelper.GetCategoryByParentV2(0, false, 1, 1);
            if (dtNews != null && dtNews.Rows.Count > 0)
            {
                rptNewsCat.DataSource = dtNews;
                rptNewsCat.DataBind();
            }
            int CatID = Lib.QueryString.ParentCategory;
            if (CatID == 0)
                CatID = Lib.QueryString.CategoryID;
            ltrActiveMenu.Text = "<script>ActiveMenu('li" + CatID + "');</script>";
        }

        protected void rptNewsCat_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater rptSubmenu = (Repeater)e.Item.FindControl("rptSubmenu");
            if (rptSubmenu != null)
            {
                DataTable subMenu =
                    XpcHelper.GetCategoryByParentV2(Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "Cat_ID")), false,
                        1, 1);
                if (subMenu != null && subMenu.Rows.Count > 0)
                {
                    rptSubmenu.DataSource = subMenu;
                    rptSubmenu.DataBind();
                }
            }
        }
    }
}