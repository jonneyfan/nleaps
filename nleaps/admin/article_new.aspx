<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="article_new.aspx.cs" Inherits="nleaps.admin.article_new" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" AutoSizePanelID="Panel1"/>
        <f:Panel ID="Panel1" BodyPadding="5px" runat="server" EnableCollapse="true" ShowHeader="false">
            <Items>
                <f:GroupPanel ID="GroupPanel1" runat="server" EnableCollapse="true" Title="概述">
                    <Items>
                        <f:SimpleForm ID="SimpleForm1" runat="server"  ShowBorder="false" ShowHeader="false" BodyPadding="5px" EnableCollapse="true">
                            <Items>
                                <f:TextBox ID="tbxTitle" Label="标题" runat="server" Required="true">
                                </f:TextBox>
                                <f:DropDownList Label="分类" AutoPostBack="false" Required="true" EnableSimulateTree="true"
                                    ShowRedStar="true" runat="server" ID="ddlBox">
                                </f:DropDownList>
                            </Items>
                        </f:SimpleForm>
                    </Items>
                </f:GroupPanel>
                <f:GroupPanel ID="GroupPanel2" runat="server" EnableCollapse="true" Title="内容" AutoScroll="true">
                    <Items>
                        <f:SimpleForm ID="SimpleForm2" runat="server"  ShowBorder="false" ShowHeader="false" BodyPadding="5px" EnableCollapse="true" AutoScroll="true">
                            <Items>
                                <f:HtmlEditor runat="server" ID="HtmlEditor1">
                                </f:HtmlEditor>
                                <f:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="关闭" Icon="SystemClose" EnablePostBack="false">
                                </f:Button>
                                <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server"></f:ToolbarSeparator>
                                <f:Button ID="btnSaveClose" runat="server" OnClick="btnSaveClose_Click" Text="保存后关闭"  Icon="SystemSaveClose">
                                </f:Button>
                            </Items>
                        </f:SimpleForm>
                    </Items>
                </f:GroupPanel>
            </Items>
        </f:Panel>
    </form>
</body>
</html>

