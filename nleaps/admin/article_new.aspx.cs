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
            item.Content = HtmlEditor1.Text;
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
