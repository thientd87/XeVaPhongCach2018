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
    public partial class HomeProductNoiBatMuc : System.Web.UI.UserControl
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

                DataTable dtNoiBatMuc = ProductHelper.GetProductNoiBatMuc(3,175);
                if (dtNoiBatMuc != null)
                {

                    rptNewNoiBatMuc.DataSource = dtNoiBatMuc;
                    rptNewNoiBatMuc.DataBind();
                }
            }
        }
    }
}