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
    /// Summary description for dangkyquatang1
    /// </summary>
    [WebService(Namespace = "WebService")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class dangkyquatang : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod, ScriptMethod]
        public string DangKy(string fullname, string address, string email,string phone,string gift)
        {
            try
            {
                XpcHelper.DangKyQuaTang(fullname,email,address,phone,gift);
                return "Đăng ký thành công. Xin cảm ơn";
            }
            catch (Exception exception)
            {

                return exception.Message;
            }
            
        }
    }
}
