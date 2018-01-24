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
    public partial class HomeThongTinDoanhNghiep : System.Web.UI.UserControl
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

        protected int _TotalVideo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dtCategory = XpcHelper.GetCategoryDetail(_Cat_ID);
                if (dtCategory != null && dtCategory.Rows.Count > 0)
                {
                    ltrCatName.Text = "<a class=\"tab-video\" href=\"" + dtCategory.Rows[0]["Cat_URL"] + "\" target=\"_blank\">" + dtCategory.Rows[0]["Cat_Name"] + "</a>";
                }
                DataTable dtNoiBatMuc = XpcHelper.GetNewsNoiBatMuc(CatId, Top, 115);
                if (dtNoiBatMuc != null && dtNoiBatMuc.Rows.Count > 0)
                {

                    rptNewNoiBatMuc.DataSource = dtNoiBatMuc;
                    rptNewNoiBatMuc.DataBind();
                    _TotalVideo = dtNoiBatMuc.Rows.Count;
                }
            }
        }
    }
}