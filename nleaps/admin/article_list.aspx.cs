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
    public partial class article_list : PageBase
    {
        #region ViewPower

        /// <summary>
        /// 本页面的浏览权限，空字符串表示本页面不受权限控制
        /// </summary>
        public override string ViewPower
        {
            get
            {
                return "CoreArticleList";
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
            CheckPowerWithButton("CoreArticleNew", btnNew);
            CheckPowerWithButton("CoreArticleDelete", btnDeleteSelected);


            ResolveDeleteButtonForGrid(btnDeleteSelected, Grid2, "确定要从当前文档分类移除选中的{0}项记录吗？");


            BindGrid1();

            // 默认选中第一个文档分类
            Grid1.SelectedRowIndex = 0;

            // 每页记录数
            Grid2.PageSize = ConfigHelper.PageSize;
            ddlGridPageSize.SelectedValue = ConfigHelper.PageSize.ToString();

            BindGrid2();
        }

        private void BindGrid1()
        {
            List<ArticleCategory> q = ArticleCategoryHelper.ArticleCategorys;

            Grid1.DataSource = q;
            Grid1.DataBind();
        }

        private void BindGrid2()
        {
            int articlecategoryID = GetSelectedDataKeyID(Grid1);

            if (articlecategoryID == -1)
            {
                Grid2.RecordCount = 0;

                Grid2.DataSource = null;
                Grid2.DataBind();
            }
            else
            {
                // 查询 X_Article 表
                IQueryable<Article> q = DB.Articles.Include(a => a.ArticleCategory);

                // 在文档标题中搜索
                string searchText = ttbSearchTitle.Text.Trim();
                if (!String.IsNullOrEmpty(searchText))
                {
                   q =q.Where(a => a.Title.Contains(searchText));
                }

                //过滤选中文档分类下的所有文档
                q = q.Where(a => a.ArticleCategory.ID == articlecategoryID);
                

                // 在查询添加之后，排序和分页之前获取总记录数
                Grid2.RecordCount = q.Count();

                // 排列和分页
                q = SortAndPage<Article>(q, Grid2);

                Grid2.DataSource = q;
                Grid2.DataBind();
            }
        }


        #endregion

        #region Events

        protected void ddlGridPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            Grid2.PageSize = Convert.ToInt32(ddlGridPageSize.SelectedValue);

            BindGrid2();
        }


        #endregion

        #region Grid1 Events

        protected void Grid1_RowClick(object sender, FineUI.GridRowClickEventArgs e)
        {
            BindGrid2();
        }

        #endregion

        #region Grid2 Events

        protected void ttbSearchTitle_Trigger2Click(object sender, EventArgs e)
        {
            ttbSearchTitle.ShowTrigger1 = true;
            BindGrid2();
        }

        protected void ttbSearchTitle_Trigger1Click(object sender, EventArgs e)
        {
            ttbSearchTitle.Text = String.Empty;
            ttbSearchTitle.ShowTrigger1 = false;
            BindGrid2();
        }

        protected void Grid2_PreDataBound(object sender, EventArgs e)
        {
            // 数据绑定之前，进行权限检查
            CheckPowerWithLinkButtonField("CoreArticleDelete", Grid2, "deleteField");
        }

        protected void Grid2_Sort(object sender, GridSortEventArgs e)
        {
            Grid2.SortDirection = e.SortDirection;
            Grid2.SortField = e.SortField;
            BindGrid2();
        }

        protected void Grid2_PageIndexChange(object sender, GridPageEventArgs e)
        {
            Grid2.PageIndex = e.NewPageIndex;
            BindGrid2();
        }

        protected void btnDeleteSelected_Click(object sender, EventArgs e)
        {
            // 在操作之前进行权限检查
            if (!CheckPower("CoreArticleDelete"))
            {
                CheckPowerFailWithAlert();
                return;
            }

            // 从每个选中的行中获取ID（在Grid1中定义的DataKeyNames）
            int articlecategoryID = GetSelectedDataKeyID(Grid1);
            List<int> articleIDs = GetSelectedDataKeyIDs(Grid2);


         

            DB.Articles.Include(a => a.ArticleCategory)
                .Where(a => articleIDs.Contains(a.ID))
                .ToList()
                .ForEach(a => a.ArticleCategory = null);

            DB.SaveChanges();


            // 清空当前选中的项
            Grid2.SelectedRowIndexArray = null;

            // 重新绑定表格
            BindGrid2();
        }


        protected void Grid2_RowCommand(object sender, GridCommandEventArgs e)
        {
            object[] values = Grid2.DataKeys[e.RowIndex];
            int userID = Convert.ToInt32(values[0]);

            if (e.CommandName == "Delete")
            {
                // 在操作之前进行权限检查
                if (!CheckPower("CoreArticleDelete"))
                {
                    CheckPowerFailWithAlert();
                    return;
                }


                int articleID = GetSelectedDataKeyID(Grid1);


                Article article = DB.Articles.Include(a => a.ArticleCategory)
                    .Where(a => a.ID == articleID)
                    .FirstOrDefault();

                if (article != null)
                {
                    article.ArticleCategory = null;

                    DB.SaveChanges();
                }

                BindGrid2();

            }
        }

        protected void Window1_Close(object sender, EventArgs e)
        {
            BindGrid2();
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            int articlecategoryID = GetSelectedDataKeyID(Grid1);
            string addUrl = String.Format("~/admin/article_new.aspx?id={0}", articlecategoryID);

            PageContext.RegisterStartupScript(Window1.GetShowReference(addUrl, "文档添加"));
        }

        #endregion

    }
}
