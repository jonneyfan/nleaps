<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmDesignFlow.aspx.cs" Inherits="nleaps.WorkFlow.FrmDesignFlow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    

    <title></title>
    <!--[if lt IE 9]>
    <?import namespace="v" implementation="#default#VML" ?>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="GooFlow/codebase/GooFlow2.css"/>
</head>
<body>
     <form id="_FrmDesignFlow" runat="server">
    <f:PageManager ID="pageManager" AutoSizePanelID="pnlMain" runat="server" />
    <f:RegionPanel ID="pnlMain" ShowBorder="false" runat="server">
        <Regions>
            <f:Region ID="regionDesinger" ShowHeader="false" Layout="Fit" Margins="0 0 0 0" Position="Center"
                    runat="server">
                <Toolbars>
                    <f:Toolbar ID="toolbar" Position="Top" runat="server">
                        <Items>
                            <f:Button ID="btnGrid" IconUrl="FlowDesigner/images/icon/grid.gif" Text="栅格" runat="server"
                                OnClientClick="setGrid();" EnablePostBack="false" />
                            <f:ToolbarSeparator runat="server" />
                            <f:Button ID="btnSave" Icon="SystemSave" Text="保存" runat="server" OnClientClick="showXml();"
                                 />
                        </Items>
                    </f:Toolbar>
                </Toolbars>
                <Content>
                    <div id="demo"></div>
                   
                    
                    </Content>
            </f:Region>
            <f:Region ID="regionAttribute" ShowHeader="true" Layout="Fit" Margins="0 0 0 0" Position="right" Title="属性配置"
                    runat="server" Width="325px" EnableCollapse="true" Split="true">
                <Items>
                    <f:TabStrip ID="mainTabStrip" EnableTabCloseMenu="true" ShowBorder="false" runat="server" >
                            <Tabs>
                                <f:Tab ID="Tab1" Title="基本属性" Icon="House" runat="server" >
                                    <Items>
                                    <f:SimpleForm ID="SimpleForm1" ShowBorder="false" ShowHeader="false" 
                                        LabelWidth="75" AutoScroll="true" runat="server" EnableCollapse="True" BodyPadding="5">
                                        <Items>
                                            <f:HiddenField ID="HiddenField1" runat="server" />
                                            <f:HiddenField ID="HiddenField2" runat="server" />
                                            <f:TextBox ID="TextBox1" Label="步&nbsp;聚&nbsp;&nbsp;ID" runat="server" Readonly="true" />
                                            <f:TextBox ID="TextBox2" Label="步聚名称" runat="server" />
                                            <f:TextArea ID="TextArea1" Label="备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注" runat="server" />
                                        </Items>
                                    </f:SimpleForm>
                                   </Items>
                                </f:Tab>
                                <f:Tab ID="Tab2" Title="首页" Icon="House" runat="server">
                                </f:Tab>
                            </Tabs>
                        </f:TabStrip>
                    
                </Items>
            </f:Region>
        </Regions>

    </f:RegionPanel>
    </form>
    <script type="text/javascript" src="GooFlow/codebase/jquery.min.js"></script>
    <script type="text/javascript" src="GooFlow/codebase/GooFunc.js"></script>
    <script type="text/javascript" src="GooFlow/codebase/json2.js"></script>
    <link rel="stylesheet" type="text/css" href="GooFlow/codebase/default.css"/>
    <script type="text/javascript" src="GooFlow/codebase/GooFlow.js"></script>
    <script type="text/javascript">
        var property = {
            width: 1200,
            height: 700,
            toolBtns: ["start round", "end", "task", "node", "chat", "state", "plug", "join", "fork", "complex mix"],
            haveHead: true,
            headBtns: ["new", "open", "save", "undo", "redo", "reload"],//如果haveHead=true，则定义HEAD区的按钮
            haveTool: true,
            haveGroup: true,
            useOperStack: true
        };
        var remark = {
            cursor: "选择指针",
            direct: "转换连线",
            start: "开始结点",
            "end round": "结束结点",
            "task round": "任务结点",
            node: "自动结点",
            chat: "决策结点",
            state: "状态结点",
            plug: "附加插件",
            fork: "分支结点",
            "join": "联合结点",
            "complex mix": "复合结点",
            group: "组织划分框编辑开关"
        };
        var demo;
        F.ready(function () {
            demo = $.createGooFlow($("#demo"), property);
            demo.setNodeRemarks(remark);
            //demo.onItemDel=function(id,type){
            //	return confirm("确定要删除该单元吗?");
            //}
            jsondata = { "title": "newFlow_1", "nodes": { "demo_node_9": { "name": "桂中区", "left": 103, "top": 206, "type": "start round", "width": 24, "height": 24, "alt": true }, "demo_node_1": { "name": "node_1", "left": 380, "top": 148, "type": "complex mix", "width": 86, "height": 24, "alt": true }, "demo_node_2": { "name": "node_2", "left": 388, "top": 223, "type": "complex mix", "width": 86, "height": 24, "alt": true }, "demo_node_3": { "name": "node_3", "left": 416, "top": 301, "type": "complex mix", "width": 86, "height": 24, "alt": true }, "demo_node_4": { "name": "node_4", "left": 688, "top": 219, "type": "end", "width": 86, "height": 24, "alt": true } }, "lines": { "demo_line_5": { "type": "sl", "from": "demo_node_9", "to": "demo_node_1", "name": "", "alt": true }, "demo_line_7": { "type": "sl", "from": "demo_node_1", "to": "demo_node_2", "name": "", "alt": true }, "demo_line_8": { "type": "sl", "from": "demo_node_2", "to": "demo_node_3", "name": "", "alt": true }, "demo_line_9": { "type": "sl", "from": "demo_node_3", "to": "demo_node_4", "name": "", "alt": true }, "demo_line_10": { "type": "sl", "from": "demo_node_2", "to": "demo_node_4", "name": "", "alt": true } }, "areas": {}, "initNum": 11 };
            demo.loadData(jsondata);
        });
        var out;
        function Export() {
            document.getElementById("result").value = JSON.stringify(demo.exportData());
        }
</script>
</body>
</html>
