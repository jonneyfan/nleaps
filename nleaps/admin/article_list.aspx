<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="article_list.aspx.cs" Inherits="nleaps.admin.article_list" %>

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
                <f:Region ID="Region1" ShowBorder="false" ShowHeader="false" Margins="0 0 0 0" BodyPadding="5px" Width="200px" Position="Left" Layout="Fit" runat="server">
                    <Items>
                        <f:Grid ID="Grid1" runat="server" ShowBorder="true" ShowHeader="false" EnableCheckBoxSelect="false" DataKeyNames="ID" AllowSorting="false" SortField="Name" SortDirection="DESC" AllowPaging="false" EnableMultiSelect="false" OnRowClick="Grid1_RowClick" EnableRowClickEvent="true">
                            <Columns>
                                <f:RowNumberField></f:RowNumberField>
                                <f:BoundField DataField="Name" ExpandUnusedSpace="true" DataSimulateTreeLevelField="TreeLevel" HeaderText="文章分类"></f:BoundField>
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Region>
                <f:Region ID="Region2" ShowBorder="false" ShowHeader="false" Position="Center" Layout="VBox" BoxConfigAlign="Stretch" BoxConfigPosition="Left" BodyPadding="5px 5px 5px 0" runat="server">
                    <Items>
                        <f:Form ID="Form3" runat="server" Height="36px" BodyPadding="5px" ShowHeader="false" ShowBorder="false" LabelAlign="Right">
                            <Rows>
                                <f:FormRow ID="FormRow2" runat="server">
                                    <Items>
                                        <f:TwinTriggerBox ID="ttbSearchTitle" Width="160px" runat="server" ShowLabel="false"
                                            EmptyText="在文档标题中搜索" Trigger1Icon="Clear" Trigger2Icon="Search" 
                                            ShowTrigger1="false" OnTrigger2Click="ttbSearchTitle_Trigger2Click" 
                                            OnTrigger1Click="ttbSearchTitle_Trigger1Click">
                                        </f:TwinTriggerBox>
                                        <f:Label runat="server">
                                        </f:Label>
                                    </Items>
                                </f:FormRow>
                            </Rows>
                        </f:Form>
                        <f:Grid ID="Grid2" runat="server" BoxFlex="1" ShowBorder="true" ShowHeader="false" EnableCheckBoxSelect="true" DataKeyNames="ID,Name" AllowSorting="true" OnSort="Grid2_Sort" SortField="Name" SortDirection="DESC" AllowPaging="true" IsDatabasePaging="true" OnPreDataBound="Grid2_PreDataBound" OnRowCommand="Grid2_RowCommand" OnPageIndexChange="Grid2_PageIndexChange">
                            <Toolbars>
                                <f:Toolbar ID="Toolbar1" runat="server">
                                    <Items>
                                        <f:Button ID="btnDeleteSelected" Icon="Delete" runat="server" Text="从当前文档分类移除选中的文档" OnClick="btnDeleteSelected_Click">
                                        </f:Button>
                                        <f:ToolbarFill ID="ToolbarFill1" runat="server">
                                        </f:ToolbarFill>
                                        <f:Button ID="btnNew" runat="server" Icon="Add" EnablePostBack="true" OnClick="btnNew_Click" Text="添加文章">
                                        </f:Button>
                                    </Items>
                                </f:Toolbar>
                            </Toolbars>
                            <PageItems>
                                <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                                </f:ToolbarSeparator>
                                <f:ToolbarText ID="ToolbarText1" runat="server" Text="每页记录数：">
                                </f:ToolbarText>
                                <f:DropDownList ID="ddlGridPageSize" Width="80px" AutoPostBack="true" OnSelectedIndexChanged="ddlGridPageSize_SelectedIndexChanged" runat="server">
                                    <f:ListItem Text="10" Value="10"></f:ListItem>
                                    <f:ListItem Text="20" Value="20"></f:ListItem>
                                    <f:ListItem Text="50" Value="50"></f:ListItem>
                                    <f:ListItem Text="100" Value="100"></f:ListItem>
                                </f:DropDownList>
                            </PageItems>
                            <Columns>
                                <f:RowNumberField></f:RowNumberField>
                                <f:BoundField DataField="Title" SortField="Title" Width="300px" HeaderText="标题" TextAlign="Center"></f:BoundField>
                                <f:BoundField DataField="Author" SortField="Author" Width="100px" HeaderText="发布人" ExpandUnusedSpace="true"></f:BoundField>
                                <f:WindowField TextAlign="Center" Width="100px" WindowID="Window1" Icon="Pencil" 
                                    ToolTip="编辑" DataIFrameUrlFields="Id,Name" DataIFrameUrlFormatString="~/admin/article_list_window.aspx?id={0}&name={1}" Title="编辑" IFrameUrl="~/article_edit.aspx" />
                                <f:LinkButtonField ColumnID="deleteField" TextAlign="Center" Icon="Delete" ToolTip="删除此文档" ConfirmText="确定删除此文档？" ConfirmTarget="Top" CommandName="Delete" Width="50px"></f:LinkButtonField>
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:Region>
            </Regions>
        </f:RegionPanel>
        <f:Window ID="Window1" CloseAction="Hide" runat="server" IsModal="true" Hidden="true" Target="Top" EnableResize="true" EnableMaximize="true" EnableIFrame="true" IFrameUrl="about:blank" Width="650px" Height="450px" OnClose="Window1_Close">
        </f:Window>
    </form>
</body>
</html>
