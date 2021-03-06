using System;
using System.Data;
using System.Web.UI.WebControls;
using DFISYS.BO.Editoral.Category;
using DFISYS.BO.Editoral.Newsedit;
using DFISYS.Core.DAL;

namespace DFISYS.GUI.EditoralOffice.MainOffce.editnews {
    public partial class newsassign : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                CategoryHelper.TreebuildAllCat(cboCategory);
                objListNewsSource.SelectParameters[0].DefaultValue = "News_Status=3";
                int catId = 0;
                int.TryParse(Request.QueryString["CatID"], out catId);
                if (catId > 0) {
                    objListNewsSource.SelectParameters[0].DefaultValue += " And Category.Cat_ID = " + catId;
                    cboCategory.SelectedValue = catId.ToString();
                }
            }
        }


         
        protected void cboPage_SelectedIndexChanged(object sender, EventArgs e) {
            grdListNews.PageIndex = Convert.ToInt32(cboPage.SelectedValue);
        }

        protected void btnSearch_Click(object sender, EventArgs e) {
            DFISYS.BO.SearchHelper objhelp = new DFISYS.BO.SearchHelper();
            string keyword = txtKeyword.Text.Trim().Replace("'", "");
            string[] strKeys = keyword.Split(" ".ToCharArray());
            string strKey = objhelp.getAndCond("News_Title,News_Source", strKeys);
            string strCat = cboCategory.SelectedValue;
            string strAndCat = "";
            if (strCat != "0") {

                CategoryRow objCat = CategoryHelper.getCatInfoAsCategoryRow(Convert.ToInt32(strCat));
                if (objCat.Cat_ParentID == 0) {
                    strCat = CategoryHelper.GetChildCatIdByCatParentId(Convert.ToInt32(strCat));
                    if (strCat.Trim() != "")
                        strCat += "," + cboCategory.SelectedValue;
                    else
                        strCat = cboCategory.SelectedValue;
                }
                strAndCat = " AND Category.Cat_ID IN (" + strCat + ")";
            }

            objListNewsSource.SelectParameters[0].DefaultValue = " News_Status=3 AND " + strKey + strAndCat;
            
        }

        protected void cboCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnSearch_Click(null, null);
        }

        
          
    }
}
