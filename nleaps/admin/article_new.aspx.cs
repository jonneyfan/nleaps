using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using System.Data.Entity;
using FineUI;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Text;

namespace nleaps.admin
{
    public partial class article_new : PageBase
    {
        #region ViewPower

        /// <summary>
        /// 本页面的浏览权限，空字符串表示本页面不受权限控制
        /// </summary>
        public override string ViewPower
        {
            get
            {
                return "CoreArticleNew";
            }
        }

        #endregion

        #region Page_Load

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
             
            }
        }

        private void LoadData()
        {
            btnClose.OnClientClick = ActiveWindow.GetHideReference();
            //StringBuilder htmlStr = new StringBuilder();
            //htmlStr.Append("<object id=\"TANGER_OCX\" style=\"width: 100%; height: 400px; border:0px solid #eee;\" codeBase=\"OfficeControl.cab#version=5,0,1,1\"  classid=\"clsid:C9BC4DFF-4248-4a3c-8A49-63A7D317F404\" name=\"TANGER_OCX\">");
            //htmlStr.Append("<param name=\"_ExtentX\" value=\"25241\"><param name=\"_ExtentY\" value=\"24183\"><param name=\"BorderColor\" value=\"-2147483632\"><param name=\"BackColor\" value=\"-2147483643\"><param name=\"ForeColor\" value=\"-2147483640\">");
            //        htmlStr.Append("<param name=\"TitlebarColor\" value=\"-2147483632\">");
            //        htmlStr.Append("<param name=\"TitlebarTextColor\" value=\"-2147483628\">");
            //        htmlStr.Append("<param name=\"BorderStyle\" value=\"1\">");
            //        htmlStr.Append("<param name=\"Titlebar\" value=\"1\">");
            //        htmlStr.Append("<param name=\"Toolbars\" value=\"1\">");
            //        htmlStr.Append("<param name=\"Caption\" value=\"端州区办公自动化文档控件\">");
            //        htmlStr.Append("<param name=\"IsShowToolMenu\"  value=\"1\">");
            //        htmlStr.Append("<param name=\"IsHiddenOpenURL\" value=\"0\">");
            //        htmlStr.Append("<param name=\"MaxUploadSize\" value=\"0\">");
            //        htmlStr.Append("<param name=\"Menubar\" value=\"1\">");
            //        htmlStr.Append("<param name=\"Statusbar\" value=\"1\">");
            //        htmlStr.Append("<param name=\"FileNew\" value=\"-1\">");
            //        htmlStr.Append("<param name=\"FileOpen\" value=\"-1\">");
            //        htmlStr.Append("<param name=\"FileClose\" value=\"-1\">");
            //        htmlStr.Append("<param name=\"FileSave\" value=\"-1\">");
            //        htmlStr.Append("<param name=\"FileSaveAs\"  value=\"1\">");
            //        htmlStr.Append("<param name=\"FilePrint\" value=\"-1\">");
            //        htmlStr.Append("<param name=\"FilePrintPreview\" value=\"-1\">");
            //        htmlStr.Append("<param name=\"FilePageSetup\" value=\"-1\">");
            //        htmlStr.Append("<param name=\"FileProperties\" value=\"-1\">");
            //        htmlStr.Append("<param name=\"IsStrictNoCopy\" value=\"0\">");
            //        htmlStr.Append("<param name=\"IsUseUTF8URL\" value=\"0\">");
            //        htmlStr.Append("<param name=\"MenubarColor\" value=\"13160660\">");
            //        htmlStr.Append("<param name=\"IsUseControlAgent\" value=\"0\">");
            //        htmlStr.Append("<param name=\"IsUseUTF8Data\" value=\"0\">");
            //        htmlStr.Append("<param name=\"IsSaveDocExtention\" value=\"0\">");
            //        htmlStr.Append("<param name=\"IsDirectConnec\t\" value=\"0\">");
            //        htmlStr.Append("<param name=\"SignCursorType\" value=\"0\">");
            //        htmlStr.Append("<param name=\"IsResetToolbarsOnOpen\" value=\"1\">");
            //        htmlStr.Append("<param name=\"IsSaveDataIfHasVDS\" value=\"0\">");
            //        htmlStr.Append("<param name=\"MenuButtonStyle\" value=\"0\">");
            //        htmlStr.Append("<param name=\"MenuButtonColor\" value=\"16180947\">");
            //        htmlStr.Append("<param name=\"MenuButtonFrameColor\" value=\"14924434\">");
            //        htmlStr.Append("<param name=\"MenuBarStyle\" value=\"0\">");
            //       htmlStr.Append("<param name=\"ProductCaption\" value=\"肇庆市端州区信息服务中心\">"); 
            //       htmlStr.Append("<param name=\"ProductKey\" value=\"FB6CDC854FC94E621EC8A8D4C65C8D283F6047BC\"></object>");
          

            //Literal2.Text = htmlStr.ToString(); ;
            BindDLL();
        }

        private void BindDLL()
        {
            List<ArticleCategory> articlecategorys = ResolveDDL<ArticleCategory>(ArticleCategoryHelper.ArticleCategorys);
            // 绑定到下拉列表（启用模拟树功能）
            ddlBox.EnableSimulateTree = true;
            ddlBox.DataTextField = "Name";
            ddlBox.DataValueField = "ID";
            ddlBox.DataSimulateTreeLevelField = "TreeLevel";
            ddlBox.DataSource = articlecategorys;
            ddlBox.DataBind();

            // 选中根节点
            ddlBox.SelectedValue = "0";
            DatePicker1.SelectedDate = DateTime.Now;
            tbxAuthor.Text = User.Identity.Name;
    
        }

     

        #endregion

        #region Events

        private void SaveItem()
        {
            Article item = new Article();
            //item.Content = HtmlEditor1.Text;
            item.Title = tbxTitle.Text.Trim();
            item.CreateTime = DateTime.Now;
            item.UpdateTime = DateTime.Now;
            item.ReleaseDept = tbxReleaseDept.Text.Trim();
            item.Author = tbxAuthor.Text.Trim();
            int parentID = Convert.ToInt32(ddlBox.SelectedValue);

            if (parentID == -1)
            {
                item.ArticleCategory = null;
            }
            else
            {
                ArticleCategory articlecategory = Attach<ArticleCategory>(parentID);
                item.ArticleCategory = articlecategory;
            }


            DB.Articles.Add(item);
            DB.SaveChanges();
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            btnClose.OnClientClick = ActiveWindow.GetHideReference();

        }
    

        protected void btnSaveClose_Click(object sender, EventArgs e)
        {
            SaveItem();

            //Alert.Show("添加成功！", String.Empty, ActiveWindow.GetHidePostBackReference());
            PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
        }
        #endregion



    }
}
