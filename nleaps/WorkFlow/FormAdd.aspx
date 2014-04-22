<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormAdd.aspx.cs" Inherits="nleaps.WorkFlow.FormAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
 <link rel="stylesheet" href="../ueditor/themes/default/ueditor.css" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" BodyPadding="5px" runat="server"
            EnableCollapse="True" Title="添加表单" Width="1000px">
            <Items>
                <f:GroupPanel runat="server" Title="基础信息" ID="GroupPanel1" EnableCollapse="True">
                    <Items>
                        <f:SimpleForm ID="SimpleForm1" runat="server" ShowBorder="False"
                            ShowHeader="False">
                            <Items>
                                <f:TextBox ID="TextBox1" Label="名称" runat="server">
                                </f:TextBox>
                                <f:TextBox ID="TextBox2" Label="名称" runat="server">
                                </f:TextBox>
                                <f:TextBox ID="TextBox3" Label="名称" runat="server">
                                </f:TextBox>
                                <f:TextBox ID="TextBox4" Label="名称" runat="server">
                                </f:TextBox>
                            </Items>
                        </f:SimpleForm>
                        
                            

                        <f:ContentPanel ID="ContentPanel1" runat="server" BodyPadding="5px" Width="900px" Height="500px" EnableFrame="true" EnableCollapse="true"
                            ShowBorder="true"  Title="表单内容"> 
                            <Items>
                             <f:Button ID="Button3" Text="按钮一" CssClass="mright" runat="server">
                        </f:Button>
                            <textarea name="UEditor1" id="UEditor1">
                            </textarea>
                             </Items>
                        </f:ContentPanel>
                    </Items>
                </f:GroupPanel>
            </Items>
        </f:Panel>
    </form>
      <script type="text/javascript">
          window.UEDITOR_HOME_URL = '<%= ResolveUrl("~/ueditor/") %>';
    </script>
    <script src="../js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript">
        var editor;
        var containerClientID = '<%= ContentPanel1.ClientID %>';
        F.ready(function () {
            editor = new UE.ui.Editor({
                initialFrameWidth: '80%',
                initialFrameHeight: 800,
                initialContent: '<p>关于FineUI<br>基于 ExtJS 的开源 ASP.NET 控件库。<br><br>FineUI的使命<br>创建 No JavaScript，No CSS，No UpdatePanel，No ViewState，No WebServices 的网站应用程序。<br><br>支持的浏览器<br>IE 8.0+、Chrome、Firefox、Opera、Safari<br><br>授权协议<br>Apache License 2.0 (Apache)<br><br>相关链接<br>论坛：http://fineui.com/bbs/<br>示例：http://fineui.com/demo/<br>文档：http://fineui.com/doc/<br>下载：http://fineui.codeplex.com/</p>',
                focus: true
            });
            editor.render("UEditor1");

            updateLayout();
        });

        // 更新外部容器的布局
        function updateLayout() {
            editorPromise(editor).then(function () {
                window.setTimeout(function () {
                    F(containerClientID).updateLayout();
                }, 200);
            });
        }

        // 编辑器准备完毕的异步处理函数（只有在编辑器准备完毕后，才能对编辑器进行操作）
        function editorPromise(editor) {
            var dfd = $.Deferred();

            if (editor.isReady) {
                dfd.resolve();
            } else {
                editor.ready(function () {
                    dfd.resolve();
                });
            }

            return dfd.promise();
        }


        // 提交数据之前同步到表单隐藏字段
        F.beforeAjax(function () {
            editor.sync();
        });

        // 更新编辑器内容
        function updateUEditor(content) {
            editorPromise(editor).then(function () {
                editor.setContent(content);
            });
        }
    </script>
 
</body>
</html>

