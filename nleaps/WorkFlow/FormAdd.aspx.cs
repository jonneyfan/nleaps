using FineUI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace nleaps.WorkFlow
{
    public partial class FormAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            var cValue = Guid.NewGuid().ToString();
            string content = "<input id=\"Text1\"  name=\"'+cValue+'\"  type=\"text\"  style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            var cValue = Guid.NewGuid().ToString();
            string content = "<input readonly id=\"Text2\"  name="+cValue+"  type=\"text\" value=\"宏控件-当前时间(日期)\" style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            var cValue = Guid.NewGuid().ToString();
            string content = "<input readonly id=\"Text2\"  name="+cValue+"  type=\"text\" value=\"宏控件-用户职位\" style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            var cValue = Guid.NewGuid().ToString();
            string content = "<input readonly id=\"Text2\"  name="+cValue+"   type=\"text\" value=\"宏控件-用户角色\" style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button7_Click(object sender, EventArgs e)
        {        
            var cValue = Guid.NewGuid().ToString();
            string content = "<input readonly id=\"Text2\" name="+cValue+"  type=\"text\" value=\"宏控件-用户部门\" style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            var cValue = Guid.NewGuid().ToString();
            string content = "<input readonly id=\"Text2\" name="+cValue+"type=\"text\" value=\"宏控件-用户姓名\" style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            var cValue = Guid.NewGuid().ToString();
            string content = "<input id=\"Checkbox1\"  name="+cValue+"   type=\"checkbox\"  />";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            var cValue = Guid.NewGuid().ToString();
            string content = "";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            var cValue = Guid.NewGuid().ToString();
            string content = "<textarea id=\"TextArea1\" name="+cValue+"   cols=\"20\" rows=\"2\"  style=\"SCROLLBAR-FACE-COLOR:   #AAAAAA;   SCROLLBAR-HIGHLIGHT-COLOR:   #D8D8D8;  SCROLLBAR-SHADOW-COLOR:   #D8D8D8;   SCROLLBAR-3DLIGHT-COLOR:   #D8D8D8;   SCROLLBAR-ARROW-COLOR:   #D8D8D8;   SCROLLBAR-TRACK-COLOR:   #D8D8D8;   SCROLLBAR-DARKSHADOW-COLOR:   #D8D8D8; border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000 \" ></textarea>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var cValue = Guid.NewGuid().ToString();
            string content = "<input id=\"Text1\"  name="+cValue+"  type=\"text\"  style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

         protected void Button2_Click(object sender, EventArgs e)
        {
            var cValue = Guid.NewGuid().ToString();
            string content = "<input id=\"Text1\"  name="+cValue+"  type=\"text\"  style=\"IME-MODE: disabled;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"  onkeypress=\"var k=event.keyCode; return (k>=48&&k<=57)||k==46\" onpaste=\"return !/\\D/.test(clipboardData.getData(\'text\'))\"  ondragenter=\"return false\"/>";
             
             PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

         protected void Button12_Click(object sender, EventArgs e)
         {

         } 
    }
}