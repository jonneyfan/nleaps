using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class WorkFlow_FormAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //ZWL.Common.PublicMethod.CheckSession();
            ////设置条件字段列表为空
            //ZWL.Common.PublicMethod.SetSessionValue("TiaoJiaoList", "");
            //ZWL.Common.PublicMethod.BindDDL(this.DropDownList3, ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 FormTypeList from ERPFormType")); //绑定表单类别
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //判断名称是否唯一性
        //if (ZWL.Common.PublicMethod.IFExists("FormName", "ERPForm",0, this.TextBox1.Text) == false)
        //{
        //    ZWL.Common.MessageBox.Show(this, "该表单名称已经存在！");
        //    return;
        //}

        //if (this.TextBox1.Text.Trim().Length > 0)
        //{
        //    ZWL.BLL.ERPForm Model = new ZWL.BLL.ERPForm();
        //    Model.ContentStr = this.TxtContent.Text;
        //    Model.FormName = this.TextBox1.Text;
        //    Model.FormType = this.DropDownList3.SelectedItem.Text;
        //    Model.ShiYongUserList = this.TextBox3.Text;
        //    Model.TiaoJianList = ZWL.Common.PublicMethod.GetSessionValue("TiaoJiaoList");
        //    Model.TimeStr = DateTime.Now;
        //    Model.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        //    Model.Add();

        //    //写系统日志
        //    ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        //    MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        //    MyRiZhi.DoSomething = "用户添加表单信息(" + this.TextBox1.Text + ")";
        //    MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        //    MyRiZhi.Add();

        //    ZWL.Common.MessageBox.ShowAndRedirect(this, "表单信息添加成功！", "DesignForm.aspx");
        //}
        //else
        //{
        //    ZWL.Common.MessageBox.Show(this, "表单标题不可以为空！");
        //}
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //if (this.TextBox4.Text.Trim().Length > 0)
        //{
        //    if (ZWL.Common.PublicMethod.GetSessionValue("TiaoJiaoList").Trim() == "")
        //    {
        //        ZWL.Common.PublicMethod.SetSessionValue("TiaoJiaoList", this.TextBox4.Text + this.DropDownList2.SelectedItem.Text);
        //    }
        //    else
        //    {
        //        ZWL.Common.PublicMethod.SetSessionValue("TiaoJiaoList", ZWL.Common.PublicMethod.GetSessionValue("TiaoJiaoList") + "|" + this.TextBox4.Text + this.DropDownList2.SelectedItem.Text);
        //    }
        //    ZWL.Common.PublicMethod.BindDDL(this.DropDownList1, ZWL.Common.PublicMethod.GetSessionValue("TiaoJiaoList"));
        //    this.TextBox4.Text = "";
        //}
        //else
        //{
        //    ZWL.Common.MessageBox.Show(this, "未填写字段名称！");
        //}
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    ZWL.Common.PublicMethod.SetSessionValue("TiaoJiaoList", ZWL.Common.PublicMethod.GetSessionValue("TiaoJiaoList").Replace(this.DropDownList1.SelectedItem.Text, "").Replace("||", "|"));
        //    ZWL.Common.PublicMethod.BindDDL(this.DropDownList1, ZWL.Common.PublicMethod.GetSessionValue("TiaoJiaoList"));
        //}
        //catch
        //{ }
    }
}