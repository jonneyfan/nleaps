<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormAdd.aspx.cs" Inherits="nleaps.WorkFlow.FormAdd" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
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
                            <CKEditor:CKEditorControl ID="CKEditor1" runat="server" Height="300px" BasePath="~/ckeditor">
		                        &lt;p&gt;This is some &lt;strong&gt;sample text&lt;/strong&gt;. You are using &lt;a href="http://ckeditor.com/"&gt;CKEditor&lt;/a&gt;.&lt;/p&gt;
                            </CKEditor:CKEditorControl>
                             </Items>
                        </f:ContentPanel>
                    </Items>
                </f:GroupPanel>
            </Items>
        </f:Panel>
    </form>
     <script src="../js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var editorClientID = '<%= CKEditor1.ClientID %>';
        var containerClientID = '<%= ContentPanel1.ClientID %>';

        F.ready(function () {

            window.setTimeout(function () {
                F(containerClientID).updateLayout();
            }, 500);

        });

        // 更新编辑器内容
        function updateCKEditor(content) {
            var editor = CKEDITOR.instances[editorClientID];
            editor.setData(content);
        }
    </script>
</body>
</html>

