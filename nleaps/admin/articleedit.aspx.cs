using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FineUI;
using System.Data.Entity;

//namespace nleaps.admin
//{
//    public partial class articleedit : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {

//        }
//    }
//}


//<#@ template language="c#" HostSpecific="True" #>
//<#@ output extension= "_edit.aspx.cs" #>
//<#
//    TableHost host = (TableHost)(Host);		
//    string ModelSpace = host.NameSpace+".Model."+ host.GetModelClass(host.TableName);
//    string DALSpace= host.NameSpace+".BLL."+ host.GetBLLClass(host.TableName);
//    ColumnInfo identityKey=host.IdentityKey;	
//#>
//using System;
//using System.Data.Entity;
//using System.Linq;
//using FineUI;

namespace nleaps.admin
{
    public partial class articleedit : PageBase
    {
        #region ViewPower
        //protected global::System.Web.UI.HtmlControls.HtmlHead Head1;
        //protected global::System.Web.UI.HtmlControls.HtmlForm form1;
        //protected global::FineUI.PageManager PageManager1;
        //protected global::FineUI.Panel Panel1;
        //protected global::FineUI.Toolbar Toolbar1;
        //protected global::FineUI.Button btnClose;
        //protected global::FineUI.ToolbarSeparator ToolbarSeparator2;
        //protected global::FineUI.Button btnSaveClose;
        //protected global::FineUI.Form SimpleForm1;
       
        //<# int i = 1;#>
        //<# foreach (ColumnInfo c in host.Fieldlist)
        //            { 
        //            string FieldType = CodeCommon.DbTypeToCS(c.TypeName).ToLower();
        //            #>
        //                 protected global::FineUI.FormRow FormRow<#=i++#>;                         
        //                    <# if(FieldType =="bool") { #>
        //                 protected global::FineUI.CheckBox <#=c.ColumnName#>;
        //                     <#} if(FieldType=="datetime") { #>
        //                 protected global::FineUI.DatePicker <#=c.ColumnName#>;                            	
        //                     <#}  #>
        //                     <# if( FieldType !="datetime" && FieldType !="bool")
        //                     { #>
        //                 protected global::FineUI.TextBox <#=c.ColumnName#>;
        //                     <# } #> 
        //           <# } #>   


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
        #endregion

        private void LoadData()
        {
            btnClose.OnClientClick = ActiveWindow.GetHideReference();

            int id = GetQueryIntValue("id");
            //BLL.<#=host.TableName#> db = new BLL.<#=host.TableName#>();
            //Model.<#=host.TableName#> current = db.GetModel(id);
            Article current = DB.Articles.Include(a => a.Parent).Where(a => a.ID == id).FirstOrDefault();
           
            if (current == null)
            {
                // 参数错误，首先弹出Alert对话框然后关闭弹出窗口
                Alert.Show("参数错误！", String.Empty, ActiveWindow.GetHideReference());
                return;
            } 
            // <# foreach (ColumnInfo c in host.Fieldlist)
            //        { 
            // string FieldType = CodeCommon.DbTypeToCS(c.TypeName).ToLower();
            //         if( FieldType =="bool") { #>
            //          <#=c.ColumnName#>.Checked = current.<#=c.ColumnName#>;//type : <#=FieldType#>
            //          <#} #>
            //          <# if(FieldType=="datetime") { #>
            //         <#=c.ColumnName#>.Text = current.<#=c.ColumnName#>.ToString("yyyy-MM-dd HH:mm:ss");//type : <#=FieldType#>
            //         <#}  if(FieldType=="string") { #>                         	
            //            <#=c.ColumnName#>.Text = current.<#=c.ColumnName#>;//type : <#=FieldType#>
            //        <# } 	            
            //        if(FieldType !="string" && FieldType!="bool" && FieldType !="datetime") { #>                            	
            //            <#=c.ColumnName#>.Text = current.<#=c.ColumnName#>.ToString(); //type : <#=FieldType#>
            //        <# } #>
            
            //<# } #>
            tbxTitle.Text = current.Title;
            tbxAuthor.Text = User.Identity.Name;
            DatePicker1.SelectedDate = DateTime.Now;
            HtmlEditor1.Text = current.Content.Trim();

            // 例子 打开一个窗口来选择
            //InitUserRole(current);
        }

     

        #region InitUserRole

        private void InitUserRole(User current)
        {
            // tbSelectedRole.Text = String.Join(",", current.Roles.Select(u => u.Name).ToArray());
            // hfSelectedRole.Text = String.Join(",", current.Roles.Select(u => u.ID).ToArray());

            // 打开编辑角色的窗口
            // string selectRoleURL = String.Format("./user_select_role.aspx?ids=<script>{0}</script>", hfSelectedRole.GetValueReference());
            // tbSelectedRole.OnClientTriggerClick = Window1.GetSaveStateReference(hfSelectedRole.ClientID, tbSelectedRole.ClientID)
                   // + Window1.GetShowReference(selectRoleURL, "选择用户所属的角色");

        }
        #endregion


        #region Events

        protected void btnSaveClose_Click(object sender, EventArgs e)
        {
            int id = GetQueryIntValue("id");
            //BLL.<#=host.TableName#> db = new BLL.<#=host.TableName#>();
            //Model.<#=host.TableName#> model  = db.GetModel(id);
            //<# foreach (ColumnInfo c in host.Fieldlist) {
            //string FieldType = CodeCommon.DbTypeToCS(c.TypeName).ToLower();
            //        if( FieldType =="string")
            //             {   #>
            //            <#= CodeCommon.DbTypeToCS(c.TypeName) #> _<#= c.ColumnName.ToString().ToLower() #> = this.<#=c.ColumnName#>.Text;
            //            <# }  if( FieldType =="bool") { #>
            //            <#= CodeCommon.DbTypeToCS(c.TypeName) #> _<#= c.ColumnName.ToString().ToLower() #> = this.<#=c.ColumnName#>.Checked;
            //             <# } if( FieldType !="string" && FieldType !="bool") { #>
            //            <#= CodeCommon.DbTypeToCS(c.TypeName) #> _<#= c.ColumnName.ToString().ToLower() #> = <#= CodeCommon.DbTypeToCS(c.TypeName) #>.Parse(this.<#=c.ColumnName#>.Text);
            //             <# }
            //         } #>

            //<# foreach (ColumnInfo c in host.Fieldlist)
            //        { #> 
            //               model.<#=c.ColumnName#>  = _<#= c.ColumnName.ToString().ToLower() #>;
            //       <# } #>          

            //db.Update(model);


            PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
        }

        #endregion

    }
}