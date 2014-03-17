using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

namespace nleaps.WeiXin
{
    /// <summary>
    /// wx 的摘要说明
    /// </summary>
    public class wx : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            weixin _wx = new weixin();
            string postStr = "";
            if (context.Request.HttpMethod.ToLower() == "post")
            {
                Stream s = System.Web.HttpContext.Current.Request.InputStream;
                byte[] b = new byte[s.Length];
                s.Read(b, 0, (int)s.Length);
                postStr = Encoding.UTF8.GetString(b);
                if (!string.IsNullOrEmpty(postStr)) //请求处理  
                {
                    _wx.Handle(postStr);
                }
            }
            else
            {
                _wx.Auth();
            } 
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