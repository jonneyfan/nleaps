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
                        <f:SimpleForm ID="SimpleForm1" runat="server"  ShowBorder="false" ShowHeader="false" BodyPadding="5px" EnableCollapse="true">
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
                                
                            </Items>
                        </f:SimpleForm>
                    </Items>
                </f:GroupPanel>
            </Items>
        </f:Panel>
    </form>
</body>
</html>

