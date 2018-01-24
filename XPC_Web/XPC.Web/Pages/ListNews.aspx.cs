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
    public partial class ListNews : System.Web.UI.Page
    {
        protected string CatName = string.Empty, CatRSS = string.Empty;
        private int _catID = 31, _pageSize = 10;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int _pageIndex = Lib.QueryString.PageIndex;
                _pageIndex = _pageIndex == 0 ? 1 : _pageIndex;
                _catID = Lib.QueryString.CategoryID;
                //_catID = Lib.QueryString.ParentCategory==0 ? Lib.QueryString.ParentCategory : Lib.QueryString.CategoryID;
                DataTable objCat = XpcHelper.SelectCategory(_catID);
               

                    if (objCat != null && objCat.Rows.Count > 0)
                    {
                        CatName = string.Format("<a title=\"{1}\" href=\"{0}\">{1}</a>", objCat.Rows[0]["Cat_URL"], objCat.Rows[0]["Cat_Name"]);
                        CatRSS = string.Format("<a title=\"{1}\" target=\"_blank\" class=\"rss\" href=\"{0}\"><img src=\"/images/IconRSS.gif\"/></a>", objCat.Rows[0]["RSS_URL"], objCat.Rows[0]["Cat_Name"]);
                        Utility.SetPageHeader(this.Page, objCat.Rows[0]["Cat_Name"].ToString(), objCat.Rows[0]["Cat_Name"] + "-" + ", " + objCat.Rows[0]["Cat_displayURL"], objCat.Rows[0]["Cat_Name"] + ", " + objCat.Rows[0]["Cat_displayURL"], Lib.QueryString.PageIndex > 1);
                        //Đặt SEO cho Facebook
                        Utility.SetFaceBookSEO(this.Page, objCat.Rows[0]["Cat_Name"].ToString(), objCat.Rows[0]["Cat_Name"] + "-" + ", " + objCat.Rows[0]["Cat_displayURL"], System.Configuration.ConfigurationManager.AppSettings["WebDomain"] + "/images/BannerHome.png", System.Configuration.ConfigurationManager.AppSettings["WebDomain"] + "/" + objCat.Rows[0]["Cat_URL"]);
                    }
               

                DataTable objTintuc = XpcHelper.displayGetDanhSachTin(_catID, _pageIndex, _pageSize, 240);

                if (objTintuc != null && objTintuc.Rows.Count > 0)
                {
                    DataRow dtRow = objTintuc.Rows[0];
                    ltrBigPic.Text = Utility.GetThumbNail(dtRow["News_Title"].ToString(), dtRow["URL"].ToString(), dtRow["News_Image"].ToString(), 600);
                       
                    ltrBigTitle.Text = "<a href=\"" + dtRow["URL"] + "\">" + dtRow["News_Title"] + "</a>";
                    ltrDateTime.Text = dtRow["PublishDate"].ToString();
                    ltrBigInitContent.Text = dtRow["News_InitContent"].ToString();

                    DataTable dtData = objTintuc.Clone();
                    for (int i = 1; i < objTintuc.Rows.Count; i++)
                    {
                        dtData.ImportRow(objTintuc.Rows[i]);
                    }

                    rptData.DataSource = dtData;
                    rptData.DataBind();
                }

                Pagging1.TotalPage = XpcHelper.GetDanhSachTin_Count(_catID,_pageSize);
                Pagging1.DoPagging(_pageIndex);
                //Paging1.TotalPage = GVietNamHelper.GetDanhSachTin_Count(_catID, _pageSize);
                //Paging1.DoPagging(_pageIndex);
            }
        }
    }
}