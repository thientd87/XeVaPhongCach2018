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
    public partial class HomeNoiBatHorizal : System.Web.UI.UserControl
    {
        private int _Cat_ID;
        private int _Top;

        public int CatId
        {
            get { return _Cat_ID; }
            set { _Cat_ID = value; }
        }

        public int Top
        {
            get { return _Top; }
            set { _Top = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dtCategory = XpcHelper.GetCategoryDetail(_Cat_ID);
                if (dtCategory != null && dtCategory.Rows.Count > 0)
                {
                    ltrCatName.Text = "<a class=\"tab-news\" href=\"" + dtCategory.Rows[0]["Cat_URL"] + "\">" + dtCategory.Rows[0]["Cat_Name"] + "</a>";
                }
                DataTable dtNoiBatMuc = XpcHelper.GetNewsNoiBatMuc(CatId, Top, 175);
                if (dtNoiBatMuc != null)
                {
                   
                    rptNewNoiBatMuc.DataSource = dtNoiBatMuc;
                    rptNewNoiBatMuc.DataBind();
                }
            }
        }
    }
}