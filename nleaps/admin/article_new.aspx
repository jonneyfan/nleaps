<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="article_new.aspx.cs" Inherits="nleaps.admin.article_new" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="../res/ueditor/themes/default/ueditor.css" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="RegionPanel1" runat="server"></f:PageManager>
         <f:Panel ID="Panel2" runat="server"  ShowBorder="false" EnableFrame="false" EnableCollapse="true"
            Layout="HBox" BoxConfigAlign="Stretch" BoxConfigPosition="Start" BoxConfigPadding="5"
            BoxConfigChildMargin="0 5 0 0" ShowHeader="false" 
            Title="添加文档">
            <Items>
            <f:Panel ID="Panel1" Title="面板1" BoxFlex="2" runat="server"
            BodyPadding="5px" ShowBorder="true" ShowHeader="false">
            <Items>
            <f:ContentPanel ID="ContentPanel1" runat="server" BodyPadding="10px" EnableFrame="false" EnableCollapse="true"
                            ShowBorder="false" ShowHeader="true" Title="正文内容" Height="480px">
                            <textarea name="UEditor1" id="UEditor1">
                                    </textarea>
                        </f:ContentPanel>
            </Items>
            </f:Panel>
            
            <f:Panel ID="Panel4" Title="面板3" BoxFlex="1" runat="server"
            BodyPadding="5px" Margin="0" ShowBorder="True" ShowHeader="false">
            <Items>
             <f:SimpleForm ID="SimpleForm1" BodyPadding="5px" EnableFrame="false" EnableCollapse="true"
                            runat="server" ShowBorder="false" ShowHeader="True"
                            Title="表单属性">
                              <Toolbars>
                                <f:Toolbar ID="Toolbar1" runat="server">
                                    <Items>
                                        <f:Button ID="btnClose" Icon="SystemClose" EnablePostBack="false" runat="server"
                                            Text="关闭">
                                        </f:Button>
                                        <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                                        </f:ToolbarSeparator>
                                        <f:Button ID="btnSaveClose" ValidateForms="SimpleForm1" Icon="SystemSaveClose"
                                            OnClick="btnSaveClose_Click" runat="server" Text="保存后关闭">
                                        </f:Button>
                                    </Items>
                                </f:Toolbar>
                            </Toolbars>
                            <Items>
                                <f:TextBox ID="tbxTitle" Label="标题" runat="server" Required="true" ShowRedStar="true">
                                </f:TextBox>
                                <f:DropDownList Label="分类" AutoPostBack="false" Required="true" EnableSimulateTree="true"
                                    ShowRedStar="true" runat="server" ID="ddlBox">
                                </f:DropDownList>
                                <f:TextBox ID="tbxReleaseDept" Label="发布单位" runat="server" Required="true" ShowRedStar="true">
                                </f:TextBox>
                                <f:DatePicker ID="DatePicker1" runat="server" Label="发布日期">
                                </f:DatePicker>
                                <f:TextBox ID="tbxAuthor" Label="发布人" runat="server" Readonly="true"></f:TextBox>
                            </Items>
                          
                        </f:SimpleForm>
            </Items>
            </f:Panel>
            </Items>
            </f:Panel>


    </form>
    <script type="text/javascript">
        window.UEDITOR_HOME_URL = '<%= ResolveUrl("~/res/ueditor/") %>';
    </script>
    <script src="../res/js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../res/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../res/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript">
        var editor;
        var containerClientID = '<%= ContentPanel1.ClientID %>';
        F.ready(function () {
            editor = new UE.ui.Editor({
                initialFrameWidth: '100%',
                initialFrameHeight: 300,
                autoHeightEnabled: false,
                initialContent: '请把需要的文章填写到此框',
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

