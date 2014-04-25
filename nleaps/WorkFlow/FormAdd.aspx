<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormAdd.aspx.cs" Inherits="nleaps.WorkFlow.FormAdd" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="RegionPanel1" runat="server"></f:PageManager>
        <f:RegionPanel ID="RegionPanel1" ShowBorder="false" runat="server">
            <Regions>
                <f:Region ID="Region1" Title="添加按钮" ShowBorder="true" ShowHeader="true" Margins="0 0 0 0" BodyPadding="5px" Width="200px" Position="Left" Layout="Fit" runat="server">
                    <Items>
                        <f:ContentPanel ID="ContentPanel2" runat="server" ShowBorder="false" ShowHeader="false">
                            <table>
                                <tr>
                                    <td align="center" style="width: 200px; height: 25px;">
                                        <br />
                                        <br />
                                        <br />
                                        <strong>标准控件</strong>
                                        <hr />
                                        <f:Button ID="btnChangeEnable" Text="插入常规输入框" runat="server" OnClick="Button2_Click"
                                                     CssClass="inline" />
                                        <input id="Button4" onclick="formset(1)" style="width: 100px" type="button" value="插入常规输入框" />
                                        <br />
                                        <input id="Button14" onclick="formset(12)" style="width: 100px" type="button" value="插入数字输入框" />
                                        <br />
                                        <input id="Button5" onclick="formset(2)" style="width: 100px" type="button" value="插入文本输入框" /><br />
                                        <input id="Button15" onclick="formset(13)" style="width: 100px" type="button" value="插入日期选择" /><br />
                                        <input id="Button6" onclick="formset(3)" style="width: 100px" type="button" value="插入复选框" /><br />
                                        <hr />
                                        <strong>宏控件</strong>
                                        <hr />
                                        <input id="Button7" onclick="formset(4)" style="width: 100px" type="button" value="插入用户姓名" />
                                        <br />
                                        <input id="Button8" onclick="formset(5)" style="width: 100px" type="button" value="插入用户部门" />
                                        <br />
                                        <input id="Button9" onclick="formset(6)" style="width: 100px" type="button" value="插入用户角色" />
                                        <br />
                                        <input id="Button10" onclick="formset(7)" style="width: 100px" type="button" value="插入用户职位" />
                                        <br />
                                        <input id="Button11" onclick="formset(8)" style="width: 100px" type="button" value="当前时间(日期)" />
                                        <hr />
                                        <strong>印章控件</strong>
                                        <hr />
                                        <input id="Button12" onclick="formset(14)" style="width: 100px" type="button" value="插入印章域" />
                                    </td>

                                </tr>
                            
                            </table>
                    </f:ContentPanel>                      
                    </Items>
                </f:Region>
                <f:Region ID="Region2" Title="基础表单编辑器" ShowBorder="true" ShowHeader="true" Position="Center" Layout="VBox" BoxConfigAlign="Stretch" BoxConfigPosition="Left"  BodyPadding="20px" runat="server">
                    <Items>
                        <f:TextBox ID="tbxTitle" Label="文章标题" Required="true" runat="server">
                </f:TextBox>
                <f:TextBox ID="TextBox1" Label="文章标题" Required="true" runat="server">
                        </f:TextBox>
                <f:TextBox ID="TextBox2" Label="文章标题" Required="true" runat="server">
                        </f:TextBox>
                <f:TextBox ID="TextBox3" Label="文章标题" Required="true" runat="server">
                        </f:TextBox>
                <f:ContentPanel ID="ContentPanel1" runat="server" ShowBorder="false" ShowHeader="false">

                <FCKeditorV2:FCKeditor ID="FCKeditor1" BasePath="~/fckeditor/" Height="400px" Value="" runat="server">
                </FCKeditorV2:FCKeditor>

                </f:ContentPanel>
                    </Items>
                </f:Region>
            </Regions>
        </f:RegionPanel>
      
       
        <br />
        <%--<f:Button ID="Button2" runat="server" CssClass="inline" Text="设置 FCKEditor 的值"
            OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="获取 FCKEditor 的值" OnClick="Button1_Click">
        </f:Button>--%>
    </form>
    <script type="text/javascript">
        var editorUniqueID = '<%= FCKeditor1.UniqueID  %>';


        // 提交数据之前同步到表单隐藏字段
        F.beforeAjax(function () {
            var editor = FCKeditorAPI.GetInstance(editorUniqueID);
            editor.UpdateLinkedField();
        });


        // 更新编辑器内容
        function updateFCKEditor(content) {
            var editor = FCKeditorAPI.GetInstance(editorUniqueID);
            editor.SetData(content);
        }
    </script>
</body>
</html>

