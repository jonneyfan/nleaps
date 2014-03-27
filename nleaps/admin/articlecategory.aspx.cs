using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using System.Data.Entity;
using FineUI;
using EntityFramework.Extensions;

namespace nleaps.admin
{
    public partial class articlecategory : PageBase
    {
        #region ViewPower

        /// <summary>
        /// 本页面的浏览权限，空字符串表示本页面不受权限控制
        /// </summary>
        public override string ViewPower
        {
            get
            {
                return "CoreArticleCategoryView";
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
            // 权限检查
            CheckPowerWithButton("CoreArticleCategoryNew", btnNew);


            btnNew.OnClientClick = Window1.GetShowReference("~/admin/articlecategory_new.aspx", "新增文档分类");

            BindGrid();
        }

        private void BindGrid()
        {
            Grid1.DataSource = ArticleCategoryHelper.ArticleCategorys;
            Grid1.DataBind();
        }

        #endregion

        #region Events

        protected void Grid1_PreDataBound(object sender, EventArgs e)
        {
            // 数据绑定之前，进行权限检查
            CheckPowerWithWindowField("CoreArticleCategoryEdit", Grid1, "editField");
            CheckPowerWithLinkButtonField("CoreArticleCategoryDelete", Grid1, "deleteField");
        }

        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            int articlecategoryID = GetSelectedDataKeyID(Grid1);

            if (e.CommandName == "Delete")
            {
                // 在操作之前进行权限检查
                if (!CheckPower("CoreArticleCategoryDelete"))
                {
                    CheckPowerFailWithAlert();
                    return;
                }

                int childCount = DB.ArticleCategorys.Where(a =>a.Parent.ID == articlecategoryID).Count();
                if (childCount > 0)
                {
                    Alert.ShowInTop("删除失败！请先删除子文档分类！");
                    return;
                }

                DB.ArticleCategorys.Delete<ArticleCategory>(a => a.ID == articlecategoryID);

                ArticleCategoryHelper.Reload();
                BindGrid();
            }
        }

        protected void Window1_Close(object sender, EventArgs e)
        {
            ArticleCategoryHelper.Reload();
            BindGrid();
        }

        #endregion
    }
}