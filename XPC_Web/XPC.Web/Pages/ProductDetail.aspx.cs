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
    public partial class ProductDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int productID = Lib.QueryString.ProductID;
                ProductHelper productHelper =  new ProductHelper();
                DataTable dtProduct = productHelper.GetProductByID(productID);
                if (dtProduct != null && dtProduct.Rows.Count > 0)
                {
                    DataRow row = dtProduct.Rows[0];
                    ltrProductTitle.Text = row["ProductName"].ToString();
                    ltrProductCode.Text = row["ProductName_En"].ToString();
                    ltrHotline.Text = row["ProductSumary"] != null ? row["ProductSumary"].ToString() : string.Empty;
                    string imgTo = row["ProductAvatar"] != null ? row["ProductAvatar"].ToString().StartsWith("http:") ? row["ProductAvatar"].ToString() : Utility.ImagesStorageUrl + "/" + row["ProductAvatar"].ToString() : "";
                    imgDetail.ImageUrl = imgTo;
                    imgDetail.Visible = row["ProductAvatar"].ToString().Length > 0;
                    ltrGia.Text = row["CurrencyValue"].ToString();

                    ltrMota.Text = row["ProductVideo"].ToString();
                    ltrHowToUse.Text = row["ProductDescription"].ToString();
                    ltrThongSoKyThuat.Text = row["ProductDescription_En"].ToString();
                    hidProductID.Value = productID.ToString();
                }
            }
        }
    }
}