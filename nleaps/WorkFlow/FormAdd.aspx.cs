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
            this.Button1.Click += Button1_Click;
            this.Button2.Click += Button2_Click;
            this.Button3.Click += Button3_Click;
            this.Button4.Click += Button4_Click;
            this.Button5.Click += Button5_Click;
            this.Button6.Click += Button6_Click;
            this.Button7.Click += Button7_Click;
            this.Button8.Click += Button8_Click;
            this.Button9.Click += Button9_Click;
            this.Button10.Click += Button10_Click;
            this.Button11.Click += Button11_Click;
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            string content = "<input id=\"Text1\"  name=\"'+cValue+'\"  type=\"text\"  style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            string content = "<input id=\"Text1\"  name=\"'+cValue+'\"  type=\"text\"  style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            string content = "<input id=\"Text1\"  name=\"'+cValue+'\"  type=\"text\"  style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            string content = "<input id=\"Text1\"  name=\"'+cValue+'\"  type=\"text\"  style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            string content = "<input id=\"Text1\"  name=\"'+cValue+'\"  type=\"text\"  style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            string content = "<input id=\"Text1\"  name=\"'+cValue+'\"  type=\"text\"  style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            string content = "<input id=\"Text1\"  name=\"'+cValue+'\"  type=\"text\"  style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string content = "<input id=\"Text1\"  name=\"'+cValue+'\"  type=\"text\"  style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string content = "<input id=\"Text1\"  name=\"'+cValue+'\"  type=\"text\"  style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string content = "<input id=\"Text1\"  name=\"'+cValue+'\"  type=\"text\"  style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        }

         protected void Button2_Click(object sender, EventArgs e)
        {
            string content = "<input id=\"Text1\"  name=\"'+cValue+'\"  type=\"text\"  style=\"border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000\"/>";
            PageContext.RegisterStartupScript(String.Format("insterFCKEditor({0});", JsHelper.Enquote(content)));
        } 
    }
}