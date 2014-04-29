<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormAdd.aspx.cs" Inherits="nleaps.WorkFlow.FormAdd" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .mbutton {
            margin-bottom: 5px;
            width:150px;
        }

</style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="RegionPanel1" runat="server"></f:PageManager>
        <f:RegionPanel ID="RegionPanel1" ShowBorder="false" runat="server">
            <Regions>
                <f:Region ID="Region1" Title="添加按钮" ShowBorder="true" ShowHeader="true" Margins="0 0 0 0" BodyPadding="5px" Width="200px" Position="Left" Layout="Fit" runat="server">
                    <Items>
                        <f:ContentPanel ID="ContentPanel2" runat="server" ShowBorder="false" ShowHeader="false">
                        <f:Label ID="Label2" EncodeText="false" Text="<strong>标准控件</strong>" runat="server"></f:Label>
                                        
                                        <f:Button ID="Button1" Text="插入常规输入框" runat="server" OnClick="Button1_Click"
                                                     CssClass="mbutton"  />
                                        <f:Button ID="Button2" Text="插入数字输入框" runat="server" OnClick="Button2_Click"
                                                     CssClass="mbutton" />
                                        <f:Button ID="Button3" Text="插入文本输入框" runat="server" OnClick="Button3_Click"
                                                     CssClass="mbutton" />
                                        <f:Button ID="Button4" Text="插入日期选择框" runat="server" OnClick="Button4_Click"
                                                     CssClass="mbutton" />
                                        <f:Button ID="Button5" Text="插入复选框" runat="server" OnClick="Button5_Click"
                                                     CssClass="mbutton" />
                                        <hr />
                                        <f:Label ID="Label3" EncodeText="false"  Text="<strong>宏控件</strong>" runat="server"></f:Label>
                                        
                                        <f:Button ID="Button6" Text="插入用户姓名" runat="server" OnClick="Button6_Click"
                                                     CssClass="mbutton" />
                                        <f:Button ID="Button7" Text="插入用户部门" runat="server" OnClick="Button7_Click"
                                                     CssClass="mbutton" />                              
                                        <f:Button ID="Button8" Text="插入用户角色" runat="server" OnClick="Button8_Click"
                                                     CssClass="mbutton" />
                                        <f:Button ID="Button9" Text="插入用户职位" runat="server" OnClick="Button9_Click"
                                                     CssClass="mbutton" />
                                        <f:Button ID="Button10" Text="当前时间(日期)" runat="server" OnClick="Button10_Click"
                                                     CssClass="mbutton" />
                                        <hr />
                                        <f:Label ID="Label1" EncodeText="false"  Text="<strong>印章控件</strong>" runat="server"></f:Label>
                                        
                                        <f:Button ID="Button11" Text="插入印章域" runat="server" OnClick="Button11_Click"
                                                     CssClass="mbutton" />

                    </f:ContentPanel>                      
                    </Items>
                </f:Region>
                <f:Region ID="Region2" Title="基础表单编辑器" ShowBorder="true" ShowHeader="true" Position="Center" Layout="VBox" BoxConfigAlign="Stretch" BoxConfigPosition="Left"  BodyPadding="20px" runat="server" AutoScroll="true">
                    <Items>
                        <f:TextBox ID="tbxTitle" Label="表单名称" Required="true" runat="server">
                </f:TextBox>
                <f:TextBox ID="TextBox1" Label="表单类别" Required="true" runat="server">
                        </f:TextBox>
                <f:TextBox ID="TextBox2" Label="表单范围" Required="true" runat="server">
                        </f:TextBox>
                <f:TextBox ID="TextBox3" Label="条件字段" Required="true" runat="server">
                        </f:TextBox>
                <f:ContentPanel ID="ContentPanel1" runat="server" ShowBorder="false" ShowHeader="false">

                <FCKeditorV2:FCKeditor ID="FCKeditor1" BasePath="~/fckeditor/" Height="400px" Value="" runat="server">
                </FCKeditorV2:FCKeditor>

                </f:ContentPanel>
                    </Items>
                </f:Region>
            </Regions>
        </f:RegionPanel>
 
    </form>
    <script type="text/javascript">
        var editorUniqueID = '<%= FCKeditor1.UniqueID  %>';


        // 提交数据之前同步到表单隐藏字段
        F.beforeAjax(function () {
            var editor = FCKeditorAPI.GetInstance(editorUniqueID);
            editor.UpdateLinkedField();
        });


        // 更新编辑器内容
        function insterFCKEditor(content) {
            var editor = FCKeditorAPI.GetInstance(editorUniqueID);
            editor.InsertHtml(content);
        }
    </script>
</body>
</html>

