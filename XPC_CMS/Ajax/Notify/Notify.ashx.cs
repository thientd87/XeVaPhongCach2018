﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DFISYS.Ajax.Notify
{
    /// <summary>
    /// Summary description for Notify
    /// </summary>
    public class Notify : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hello World");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}