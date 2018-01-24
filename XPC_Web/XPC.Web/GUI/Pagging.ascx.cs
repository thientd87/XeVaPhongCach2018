using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BO;

namespace XPC.Web.GUI
{
    public partial class Pagging : System.Web.UI.UserControl
    {
        #region ATTRIBUTES


        private string currentPage = "1";
        public int PageSize;
        public int Size;
        public int PageIndex = 1;
        string buildLink = "";

        string normalcss = "";
        string activecss = "active";
        int totalPage;
        bool isSearch;
        public string NormalCss { set { normalcss = value; } }
        public string ActiveCss { set { activecss = value; } }
        public int TotalPage { set { totalPage = value; } }
        public bool IsSearch { set { isSearch = value; } }

        #endregion

        public void DoPagging(int pageIndex)
        {
            string css = "";

            currentPage = pageIndex.ToString();
            string __link = "";
            int iCurrentPage = 0;

            if (Utility.IsNumber(currentPage))
                int.TryParse(currentPage, out iCurrentPage);
            else
                iCurrentPage = 1;

            if (iCurrentPage == 0) iCurrentPage = 1;

            ltrPagging.Text = "";

            if (totalPage <= 5)
            {
                if (totalPage != 1)
                {
                    for (int i = 1; i <= totalPage; i++)
                    {
                        css = currentPage == i.ToString() ? activecss : normalcss;
                        __link += BuildLink(i, i.ToString(), css);
                    }
                }
            }
            else
            {
                if (iCurrentPage > 1)
                {
                    __link += BuildLink(1, "Đầu", normalcss);
                }
                else
                {
                    for (int i = 1; i <= 5; i++)
                    {

                        css = currentPage == i.ToString() ? activecss : normalcss;
                        __link += BuildLink(i, i.ToString(), css);
                    }


                    __link += BuildLink(6, "...", normalcss);
                }
                if (iCurrentPage > 1 && iCurrentPage < totalPage)
                {
                    if (iCurrentPage > 2)
                    {

                        __link += BuildLink(iCurrentPage - 2, "...", normalcss);
                    }
                    for (int i = (iCurrentPage - 1); i <= (iCurrentPage + 1); i++)
                    {
                        css = currentPage == i.ToString() ? activecss : normalcss;

                        __link += BuildLink(i, i.ToString(), css);
                    }
                    if (iCurrentPage <= totalPage - 2)
                    {

                        __link += BuildLink(iCurrentPage + 2, "...", normalcss);
                    }
                }
                int intCurrentPage = 0;
                int.TryParse(currentPage, out intCurrentPage);
                if (intCurrentPage == 0) intCurrentPage = 1;
                if (intCurrentPage < totalPage)
                {

                    __link += BuildLink(totalPage, "Cuối", normalcss);
                }
                else
                {

                    __link += BuildLink(totalPage - 4, "...", normalcss);
                    int j = 5;
                    for (int i = totalPage; i >= totalPage - 5; i--)
                    {

                        css = currentPage == (totalPage - j).ToString() ? activecss : normalcss;
                        __link += BuildLink(totalPage - j, (totalPage - j).ToString(), css);
                        j--;
                    }
                }
            }
            ltrPagging.Text = __link;
        }
        private string BuildLink(int page, string TextDisplay, string css)
        {
            if (isSearch)
            {
                buildLink = "<a class=\"{2}\" href='Search.aspx?key={0}&PageIndex={1}'><span>{3}</span></a> &nbsp;";
                return String.Format(buildLink, Request.QueryString["key"], page, css, TextDisplay);
            }
            else if (Lib.QueryString.ThreadID != 0)
            {
                buildLink = "<a class=\"{3}\" href='/dong-su-kien/{0}/{1}/trang-{2}.htm'><span>{4}</span></a> &nbsp;";
                return String.Format(buildLink, Lib.QueryString.ThreadID, Lib.QueryString.CategoryName, page, css, TextDisplay);
            }
            else
            {
                buildLink = "<li class=\"{4}\"><a href='/news/{2}-p{0}c{1}/trang-{3}.htm'><span>{5}</span></a></li>";
                return String.Format(buildLink, Lib.QueryString.ParentCategory, Lib.QueryString.CategoryID, Lib.QueryString.CategoryName, page, css, TextDisplay);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Visible = totalPage > 1;
            this.EnableViewState = false;
        }
    }
}