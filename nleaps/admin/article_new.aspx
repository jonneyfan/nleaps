<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="article_new.aspx.cs" Inherits="nleaps.admin.article_new" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" BodyPadding="5px" runat="server" LabelAlign="Top" EnableFrame="true" EnableCollapse="true"
            Title="表单" Width="850px">
            <Items>
                <f:HtmlEditor runat="server" Label="文本编辑器" ID="HtmlEditor1" Height="250px">
                </f:HtmlEditor>
                <f:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="获取 HTML 编辑器的内容"
                    CssClass="inline">
                </f:Button>
                <f:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="设置 HTML 编辑器的内容">
                </f:Button>
            </Items>
        </f:SimpleForm>
    </form>
</body>
</html>

</html>

