using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using System.Data.Entity;
using FineUI;

namespace nleaps.admin
{
    public partial class article_edit : PageBase
    {
        #region ViewPower

        /// <summary>
        /// 本页面的浏览权限，空字符串表示本页面不受权限控制
        /// </summary>
        public override string ViewPower
        {
            get
            {
                return "CoreArticleEdit";
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

        }

        private void BindDDL(ArticleCategory current)
        {
            List<ArticleCategory> mys = ResolveDDL<ArticleCategory>(ArticleCategoryHelper.ArticleCategorys, current.ID);

            // 绑定到下拉列表（启用模拟树功能和不可选择项功能）
            ddlBox.EnableSimulateTree = true;
            ddlBox.DataTextField = "Name";
            ddlBox.DataValueField = "ID";
            ddlBox.DataSimulateTreeLevelField = "TreeLevel";
            ddlBox.DataEnableSelectField = "Enabled";
            ddlBox.DataSource = mys;
            ddlBox.DataBind();

            if (current.Parent != null)
            {
                // 选中当前节点的父节点
                ddlBox.SelectedValue = current.Parent.ID.ToString();
            }
        }


        #endregion

        #region Events

        protected void btnSaveClose_Click(object sender, EventArgs e)
        {
            
        }

        #endregion

        protected void btnClose_Click(object sender, EventArgs e)
        {

        }

    }
}