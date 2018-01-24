using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BO;

namespace XPC.Web
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string title = System.Configuration.ConfigurationManager.AppSettings["PageTitle"];
            string description = System.Configuration.ConfigurationManager.AppSettings["decriptionHome"];
            string keyword = System.Configuration.ConfigurationManager.AppSettings["KeywordHome"];
            Utility.SetPageHome(this.Page, description, keyword);
            //Đặt SEO cho Facebook
            Utility.SetFaceBookSEO(this.Page, title, description, System.Configuration.ConfigurationManager.AppSettings["WebDomain"] + "/images/BannerHome.png", System.Configuration.ConfigurationManager.AppSettings["WebDomain"]);
        }
    }
}