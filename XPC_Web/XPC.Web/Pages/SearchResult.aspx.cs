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
    public partial class SearchResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string Key = Request.QueryString["key"];

                string strKeyword = Key.Replace('"', ' ');
                strKeyword = strKeyword.Replace("'", " ");
               // string[] strKeys = strKeyword.Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries);
                //string strWhere = getAndCond(strKeys);
                DataTable objTintuc = XpcHelper.SearchNews(strKeyword, 1, 10, 240);
                int Count = 0;
                if (objTintuc != null && objTintuc.Rows.Count > 0)
                {
                    Count = objTintuc.Rows.Count;

                    rptData.DataSource = objTintuc;
                    rptData.DataBind();
                }
               // ltrCatName.Text = "Có " + Count + " kết quả tìm kiếm";
            }
        }
    }
}