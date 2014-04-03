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
    public partial class doc_consult : PageBase
    {
        #region ViewPower

        /// <summary>
        /// 本页面的浏览权限，空字符串表示本页面不受权限控制
        /// </summary>
        public override string ViewPower
        {
            get
            {
                return "CoreDocConsultView";
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
            CheckPowerWithButton("CoreDocConsultNew", btnNew);
            //CheckPowerDeleteWithButton(btnDeleteSelected);

            //ResolveDeleteButtonForGrid(btnDeleteSelected, Grid1);

            btnNew.OnClientClick = Window1.GetShowReference("~/admin/doc_consult_new.aspx", "新增文件查阅");

            // 每页记录数
            Grid1.PageSize = ConfigHelper.PageSize;

            BindGrid();
        }

        private void BindGrid()
        {
            IQueryable<DocConsult> doc = DB.DocConsults;

            // 在职务名称中搜索
            string searchText = ttbSearchMessage.Text.Trim();
            if (!String.IsNullOrEmpty(searchText))
            {
                doc= doc.Where(t =>t.Header.Contains(searchText));
            }

            // 在查询添加之后，排序和分页之前获取总记录数
            Grid1.RecordCount =doc.Count();

            // 排列和分页
            doc = SortAndPage<DocConsult>(doc, Grid1);

            Grid1.DataSource = doc;
            Grid1.DataBind();
        }

        #endregion

        #region Events

        protected void ttbSearchMessage_Trigger2Click(object sender, EventArgs e)
        {
            ttbSearchMessage.ShowTrigger1 = true;
            BindGrid();
        }

        protected void ttbSearchMessage_Trigger1Click(object sender, EventArgs e)
        {
            ttbSearchMessage.Text = String.Empty;
            ttbSearchMessage.ShowTrigger1 = false;
            BindGrid();
        }

        protected void Grid1_PreDataBound(object sender, EventArgs e)
        {
            // 数据绑定之前，进行权限检查
            CheckPowerWithWindowField("CoreDocConsultEdit", Grid1, "editField");
            CheckPowerWithLinkButtonField("CoreDocConsultDelete", Grid1, "deleteField");
        }


        protected void Grid1_Sort(object sender, GridSortEventArgs e)
        {
            Grid1.SortDirection = e.SortDirection;
            Grid1.SortField = e.SortField;
            BindGrid();
        }

        protected void Grid1_PageIndexChange(object sender, GridPageEventArgs e)
        {
            Grid1.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            int DocConsultID = GetSelectedDataKeyID(Grid1);

            if (e.CommandName == "Delete")
            {
                // 在操作之前进行权限检查
                if (!CheckPower("CoreDocConsultDelete"))
                {
                    CheckPowerFailWithAlert();
                    return;
                }

                int userCount = DB.Users.Where(u => u.DocConsults.Any(doc => doc.ID == DocConsultID)).Count();
                if (userCount > 0)
                {
                    Alert.ShowInTop("删除失败!");
                    return;
                }

                DB.DocConsults.Delete(doc => doc.ID == DocConsultID);

                BindGrid();
            }
        }

        protected void Window1_Close(object sender, EventArgs e)
        {
            BindGrid();
        }

        #endregion

    }
}