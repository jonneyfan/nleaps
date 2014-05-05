using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using FineUI;

namespace nleaps.admin
{
    public partial class formtype_new : PageBase
    {
        #region ViewPower

        /// <summary>
        /// 本页面的浏览权限，空字符串表示本页面不受权限控制
        /// </summary>
        public override string ViewPower
        {
            get
            {
                return "CoreFormTypeNew";
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

            BindDDL();
        }

        private void BindDDL()
        {
            List<FormType> formtypes = ResolveDDL<FormType>(FormTypeHelper.FormTypes);
            // 绑定到下拉列表（启用模拟树功能）
            ddlParent.EnableSimulateTree = true;
            ddlParent.DataTextField = "Name";
            ddlParent.DataValueField = "ID";
            ddlParent.DataSimulateTreeLevelField = "TreeLevel";
            ddlParent.DataSource = formtypes;
            ddlParent.DataBind();

            // 选中根节点
            ddlParent.SelectedValue = "0";
        }

        #endregion


        #region Events

        private void SaveItem()
        {
            FormType item = new FormType();
            item.Name = tbxName.Text.Trim();
            item.SortIndex = Convert.ToInt32(tbxSortIndex.Text.Trim());

            int parentID = Convert.ToInt32(ddlParent.SelectedValue);
            if (parentID == -1)
            {
                item.Parent = null;
            }
            else
            {
                FormType formtype= Attach<FormType>(parentID);
                item.Parent = formtype;
            }

            DB.FormTypes.Add(item);
            DB.SaveChanges();
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