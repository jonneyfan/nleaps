<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ueditor.aspx.cs" ValidateRequest="false"
    Inherits="nleaps.admin.ueditor" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="../res/ueditor/themes/default/ueditor.css" />
    <style>
        .box2 { width:98%; overflow:hidden; }.box21 {width:80% ;float:left; }.box22 { width:250px; float:left;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="RegionPanel1" runat="server"></f:PageManager>
            <div class="box2">
                     <div class="box21">          
                       <object style="width: 100%; height: 100%" id="TANGER_OCX" codeBase="OfficeControl.cab#version=5,0,1,1"
                           classid="clsid:C9BC4DFF-4248-4a3c-8A49-63A7D317F404" name="TANGER_OCX">
                           <param name="_ExtentX" value="25241">
                           <param name="_ExtentY" value="24183">
                           <param name="BorderColor" value="-2147483632">
                           <param name="BackColor" value="-2147483643">
                           <param name="ForeColor" value="-2147483640">
                           <param name="TitlebarColor" value="-2147483632">
                           <param name="TitlebarTextColor" value="-2147483628">
                           <param name="BorderStyle" value="1">
                           <param name="Titlebar" value="1">
                           <param name="Toolbars" value="1">
                           <param name="Caption" value="端州区办公自动化文档控件">
                           <param name="IsShowToolMenu" value="1">
                           <param name="IsNoCopy" value="0">
                           <param name="IsHiddenOpenURL" value="0">
                           <param name="MaxUploadSize" value="0">
                           <param name="Menubar" value="1">
                           <param name="Statusbar" value="1">
                           <param name="FileNew" value="-1">
                           <param name="FileOpen" value="-1">
                           <param name="FileClose" value="-1">
                           <param name="FileSave" value="-1">
                           <param name="FileSaveAs" value="-1">
                           <param name="FilePrint" value="-1">
                           <param name="FilePrintPreview" value="-1">
                           <param name="FilePageSetup" value="-1">
                           <param name="FileProperties" value="-1">
                           <param name="IsStrictNoCopy" value="0">
                           <param name="IsUseUTF8URL" value="0">
                           <param name="MenubarColor" value="13160660">
                           <param name="IsUseControlAgent" value="0">
                           <param name="IsUseUTF8Data" value="0">
                           <param name="IsSaveDocExtention" value="0">
                           <param name="IsDirectConnect" value="0">
                           <param name="SignCursorType" value="0">
                           <param name="IsResetToolbarsOnOpen" value="1">
                           <param name="IsSaveDataIfHasVDS" value="0">
                           <param name="MenuButtonStyle" value="0">
                           <param name="MenuButtonColor" value="16180947">
                           <param name="MenuButtonFrameColor" value="14924434">
                           <param name="MenuBarStyle" value="0">
                          <param name="ProductCaption" value="肇庆市端州区信息服务中心"> 
                          <param name="ProductKey" value="FB6CDC854FC94E621EC8A8D4C65C8D283F6047BC">
                       </object>            
                </div> 
                <div class="box22"> <f:SimpleForm ID="SimpleForm1" BodyPadding="5px" EnableFrame="false" EnableCollapse="true" Width="250px"
                            runat="server" ShowBorder="True" ShowHeader="True"
                            Title="简单表单">

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
                            <Toolbars>
                                <f:Toolbar ID="Toolbar1" runat="server">
                                    <Items>
                                       <%-- <f:Button ID="btnClose" Icon="SystemClose" EnablePostBack="false" runat="server"
                                            Text="关闭">
                                        </f:Button>
                                        <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                                        </f:ToolbarSeparator>
                                        <f:Button ID="btnSaveClose" ValidateForms="SimpleForm1" Icon="SystemSaveClose"
                                            OnClick="btnSaveClose_Click" runat="server" Text="保存后关闭">
                                        </f:Button>--%>
                                    </Items>
                                </f:Toolbar>
                            </Toolbars>
                        </f:SimpleForm></div>
   
        </div>



    </form>
   
</body>
</html>
