<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="article_new.aspx.cs" Inherits="nleaps.admin.article_new" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="../res/ueditor/themes/default/ueditor.css" />
</head>
<body onload='javascript:document.getElementById("TANGER_OCX").OpenFromURL("1.doc",true);'>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" AutoSizePanelID="Toolbar1"/>

        <f:Panel ID="Panel1" BodyPadding="5px" runat="server" EnableCollapse="true" ShowHeader="false" AutoScroll="true" >
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
                <f:GroupPanel ID="GroupPanel1" runat="server" EnableCollapse="true" Title="概述">
                    <Items>
                        <f:SimpleForm ID="SimpleForm1" runat="server"  ShowBorder="false" ShowHeader="false" BodyPadding="5px" EnableCollapse="true" >
                            <Items>
                                <f:TextBox ID="tbxTitle" Label="标题" runat="server" Required="true" ShowRedStar="true">
                                </f:TextBox>
                                <f:DropDownList Label="分类" AutoPostBack="false" Required="true" EnableSimulateTree="true"
                                    ShowRedStar="true" runat="server" ID="ddlBox" >
                                </f:DropDownList>
                                <f:TextBox ID="tbxReleaseDept" Label="发布单位" runat="server" Required="true" ShowRedStar="true">
                                </f:TextBox>
                                <f:DatePicker ID="DatePicker1" runat="server" Label="发布日期">
                                </f:DatePicker>
                                <f:TextBox ID="tbxAuthor" Label="发布人" runat="server" Readonly="true"></f:TextBox> 
                                 <f:ContentPanel ID="ContentPanel1" runat="server" BodyPadding="5px" EnableFrame="false" EnableCollapse="true"
                    ShowBorder="true" ShowHeader="true" Title="文章内容" Height="400px">
                    <textarea name="UEditor1" id="UEditor1">
                    </textarea>
                    </f:ContentPanel>    
                            </Items>
                        </f:SimpleForm>
                    </Items>
                </f:GroupPanel>
   
            </Items>
        </f:Panel>
         
    </form>
     <script type="text/javascript">
         window.UEDITOR_HOME_URL = '<%= ResolveUrl("~/res/ueditor/") %>';
</script>
<script src="../res/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../res/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="../res/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript">
    var editor;
    var containerClientID = '<%= ContentPanel1.ClientID %>';
F.ready(function () {
    editor = new UE.ui.Editor({
        initialFrameWidth: '100%',
        initialFrameHeight: 250,
        autoHeightEnabled: false,
        initialContent: '<p>FineUI（开源版）<br>基于 ExtJS 的开源 ASP.NET 控件库。<br><br>FineUI的使命<br>创建 No JavaScript，No CSS，No UpdatePanel，No ViewState，No WebServices 的网站应用程序。<br><br>支持的浏览器<br>IE 8.0+、Chrome、Firefox、Opera、Safari<br><br>授权协议<br>Apache License 2.0 (Apache)<br><br>相关链接<br>论坛：http://fineui.com/bbs/<br>示例：http://fineui.com/demo/<br>文档：http://fineui.com/doc/<br>下载：http://fineui.codeplex.com/</p>',
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

