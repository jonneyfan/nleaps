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
    public partial class formtype : PageBase
    {
        #region ViewPower

        /// <summary>
        /// 本页面的浏览权限，空字符串表示本页面不受权限控制
        /// </summary>
        public override string ViewPower
        {
            get
            {
                return "CoreFormTypeView";
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
            CheckPowerWithButton("CoreFormTypeNew",btnNew);


            btnNew.OnClientClick = Window1.GetShowReference("~/admin/formtype_new.aspx", "新增表单类别");

            BindGrid();
        }

        private void BindGrid()
        {
            Grid1.DataSource = FormTypeHelper.FormTypes;
            Grid1.DataBind();
        }

        #endregion

        #region Events

        protected void Grid1_PreDataBound(object sender, EventArgs e)
        {
            // 数据绑定之前，进行权限检查
            CheckPowerWithWindowField("CoreFormTypeEdit", Grid1, "editField");
            CheckPowerWithLinkButtonField("CoreFormTypeDelete", Grid1, "deleteField");
        }

        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            int formtypeID = GetSelectedDataKeyID(Grid1);

            if (e.CommandName == "Delete")
            {
                // 在操作之前进行权限检查
                if (!CheckPower("CoreFormTypeDelete"))
                {
                    CheckPowerFailWithAlert();
                    return;
                }

                int userCount = DB.Users.Where(u => u.FormType.ID == formtypeID).Count();
                if (userCount > 0)
                {
                   Alert.ShowInTop("删除失败！需要先清空属于此表单的用户！");
                    return;
                }

                int childCount = DB.FormTypes.Where(f => f.Parent.ID == formtypeID).Count();
                if (childCount > 0)
                {
                    Alert.ShowInTop("删除失败！请先删除子表单！");
                    return;
                }

                DB.FormTypes.Delete<FormType>(f => f.ID == formtypeID);

                FormTypeHelper.Reload();
                BindGrid();
            }
        }

        protected void Window1_Close(object sender, EventArgs e)
        {
            FormTypeHelper.Reload();
            BindGrid();
        }

        #endregion

    }
}
