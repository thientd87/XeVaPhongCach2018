using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using BO;

namespace XPC.Web.Services
{
    /// <summary>
    /// Summary description for dangkymuahang
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class dangkymuahang : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod, ScriptMethod]
        public string DangKy(string CusName, string CusAddress, string CusMobile, string CusEmail, string ProductId)
        {
            try
            {
                XpcHelper.DangKyMuaHang(CusName, CusAddress, CusMobile, CusEmail, Convert.ToInt32(ProductId));
                return "Đăng ký thành công. Xin cảm ơn";
            }
            catch (Exception exception)
            {

                return exception.Message;
            }

        }
    }
}
