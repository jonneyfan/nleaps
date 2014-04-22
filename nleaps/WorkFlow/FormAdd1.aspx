<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormAdd1.aspx.cs" Inherits="WorkFlow_FormAdd" %>

<html>
<head>
    <title>广东省健城建设监理有限公司网上办公系统</title>
    
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <link href="../Style/Style.css" type="text/css" rel="STYLESHEET">

    <script type="text/javascript" language="javascript" src="../JS/calendar.js"></script>

    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        .clear {
            clear: both;
        }
    </style>

    <script language="javascript">
    function selectyinzhang(imgidstr)
        {
            
            var wName;
            var RadNum=Math.random();
            wName=window.showModalDialog('../Main/SelectYinZhang.aspx?Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');            
            if(wName==null||wName=="")
            {}
            else
            {        
                //alert(imgidstr);
                imgidstr.src="http://"+window.location.host+"<%=System.Configuration.ConfigurationManager.AppSettings["OARoot"] %>/UploadFile/"+wName;  
            }
        }
  
  function PrintTable()
    {
        document.getElementById("PrintHide") .style.visibility="hidden"    
        print();
        document.getElementById("PrintHide") .style.visibility="visible"    
    }
    
function formset(str)
{
var cValue =parseInt(20000 * Math.random());
//Math.random()

//常规控件
if(str=="1")
{
    UE.getEditor('editor').execCommand('insertHtml','<input id="Text1"  name="'+cValue+'"  type="text"  style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>');
}

if(str=="2")
{
UE.getEditor('editor').execCommand('insertHtml','<textarea id="TextArea1" name="'+cValue+'"   cols="20" rows="2"  style="SCROLLBAR-FACE-COLOR:   #AAAAAA;   SCROLLBAR-HIGHLIGHT-COLOR:   #D8D8D8;  SCROLLBAR-SHADOW-COLOR:   #D8D8D8;   SCROLLBAR-3DLIGHT-COLOR:   #D8D8D8;   SCROLLBAR-ARROW-COLOR:   #D8D8D8;   SCROLLBAR-TRACK-COLOR:   #D8D8D8;   SCROLLBAR-DARKSHADOW-COLOR:   #D8D8D8; border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000 " ></textarea>');

}

if(str=="3")
{
UE.getEditor('editor').execCommand('insertHtml','<input id="Checkbox1"  name="'+cValue+'"   type="checkbox"  />');
}

if(str=="12")
{
UE.getEditor('editor').execCommand('insertHtml','<input id="Text1"  name="'+cValue+'"  type="text"  style="IME-MODE: disabled;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"  onkeypress="var k=event.keyCode; return (k>=48&&k<=57)||k==46" onpaste="return !/\D/.test(clipboardData.getData(\'text\'))"  ondragenter="return false"/>');
}

if(str=="13")
{
var num=Math.random();
UE.getEditor('editor').execCommand('insertHtml','<input id="'+num+'" name="'+cValue+'"  type="text"  onclick="setday(this)"   value=""  style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>');
}

 //<input id="WorkTime" type="text"  onclick="Jscript:var sID ;sID = event.srcElement.id; DateSelect(sID);" />
if(str=="14")
{
var num=Math.random();
UE.getEditor('editor').execCommand('insertHtml','<img class="HerCss" name="img'+cValue+'" id="img'+cValue+'" onclick="selectyinzhang(img'+cValue+');"  src="../images/NoYz.gif" />');
}

//宏控件




if(str=="4")
{
UE.getEditor('editor').execCommand('insertHtml','<input readonly id="Text2" name="'+cValue+'"  type="text" value="宏控件-用户姓名" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>');
}

if(str=="5")
{
UE.getEditor('editor').execCommand('insertHtml','<input readonly id="Text2" name="'+cValue+'"  type="text" value="宏控件-用户部门" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>');
}

if(str=="6")
{
UE.getEditor('editor').execCommand('insertHtml','<input readonly id="Text2"  name="'+cValue+'"   type="text" value="宏控件-用户角色" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>');
}

if(str=="7")
{
UE.getEditor('editor').execCommand('insertHtml','<input readonly id="Text2"  name="'+cValue+'"  type="text" value="宏控件-用户职位" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>');
}


if(str=="8")
{
UE.getEditor('editor').execCommand('insertHtml','<input readonly id="Text2"  name="'+cValue+'"  type="text" value="宏控件-当前时间(日期)" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>');
}

}
    </script>

    <script language="javascript">
    function settiaojian() {
    var ziduanname=document.getElementById("DropDownList1").value.split('[')[0];
    var ziduanleixing=document.getElementById("DropDownList1").value.split('[')[1];
if(ziduanleixing=="常规型]")
{
    UE.getEditor('editor').execCommand('insertHtml','<input id="Text3"  name="'+"TIaoJianZiDuan_"+ziduanname+'"  type="text"  style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>');
}
else
{
    UE.getEditor('editor').execCommand('insertHtml','<input id="Text3"  name="'+"TIaoJianZiDuan_"+ziduanname+'"  type="text"  style="IME-MODE: disabled;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"  onkeypress="var k=event.keyCode; return (k>=48&&k<=57)||k==46" onpaste="return !/\D/.test(clipboardData.getData(\'text\'))"  ondragenter="return false"/>');
}
}
  
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="PrintHide" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
            <tr style="background-image: url(../images/bg_header.gif); background-repeat: repeat-x;
                height: 47px;">
                <td colspan="2">
                    <span style="float: left; background-image: url(../images/main_hl2.gif); width: 15px;
                        background-repeat: no-repeat; height: 47px"></span><span style="padding-right: 10px;
                            padding-left: 10px; float: left; background-image: url(../images/main_hb.gif);
                            padding-bottom: 10px; color: white; padding-top: 10px; background-repeat: repeat-x;
                            height: 47px; text-align: center;">添加表单</span><span style="float: left; background-image: url(../images/main_hr.gif);
                                width: 60px; background-repeat: no-repeat; height: 47px"></span>
                </td>
            </tr>

            <tr>
                <td height="3px" colspan="2" style="background-color: #ffffff">
                </td>
            </tr>
        </table>
        <table style="width: 100%" bgcolor="#999999" border="0" cellpadding="2" cellspacing="1">
            <tr>
                <td align="right" style="width: 170px; height: 25px; background-color: #e1f5fc">
                    表单名称：
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="TextBox1" runat="server" Width="350px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 170px; height: 25px; background-color: #e1f5fc">
                    表单类别：
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:DropDownList ID="DropDownList3" runat="server" Width="350px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 170px; height: 25px; background-color: #e1f5fc">
                    使用范围：
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="TextBox3" runat="server" Width="350px"></asp:TextBox>
                    <img class="HerCss" onclick="var wName;var RadNum=Math.random();wName=window.showModalDialog('../Main/SelectUser.aspx?TableName=ERPUser&LieName=UserName&Radstr='+RadNum,'','dialogWidth:350px;DialogHeight=400px;status:no;help:no;resizable:yes;');if(wName==null){}else{document.getElementById('TextBox3').value=wName;}"
                        src="../images/Button/search.gif" />
                    <span style="color: dimgray">*允许哪些人使用，空白则允许所有人使用</span>
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 170px; height: 25px; background-color: #e1f5fc">
                    条件字段：
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="194px">
                    </asp:DropDownList>
                    <input id="Button3" style="width: 69px" type="button" value="插入字段" onclick="settiaojian()" /><asp:Button
                        ID="Button2" runat="server" OnClick="Button2_Click" Text="删除" Width="38px" />字段名：<asp:TextBox
                            ID="TextBox4" runat="server" Width="85px"></asp:TextBox>
                    类型：<asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>[常规型]</asp:ListItem>
                        <asp:ListItem>[数字型]</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加字段" Width="69px" />
                </td>
            </tr>
            <tr>
                <td align="center" valign="top" style="width: 170px; height: 25px; background-color: #e1f5fc">
                    <strong>标准控件</strong>
                    <hr />
                    <input id="Button4" onclick="formset(1)" style="width: 100px" type="button" value="插入常规输入框" />
                    <br />
                    <input id="Button14" onclick="formset(12)" style="width: 100px" type="button" value="插入数字输入框" />
                    <br />
                    <input id="Button5" onclick="formset(2)" style="width: 100px" type="button" value="插入文本输入框" /><br />
                    <input id="Button15" onclick="formset(13)" style="width: 100px" type="button" value="插入日期选择" /><br />
                    <input id="Button6" onclick="formset(3)" style="width: 100px" type="button" value="插入复选框" /><br />
                    <hr />
                    <strong>宏控件</strong>
                    <hr />
                    <input id="Button7" onclick="formset(4)" style="width: 100px" type="button" value="插入用户姓名" />
                    <br />
                    <input id="Button8" onclick="formset(5)" style="width: 100px" type="button" value="插入用户部门" />
                    <br />
                    <input id="Button9" onclick="formset(6)" style="width: 100px" type="button" value="插入用户角色" />
                    <br />
                    <input id="Button10" onclick="formset(7)" style="width: 100px" type="button" value="插入用户职位" />
                    <br />
                    <input id="Button11" onclick="formset(8)" style="width: 100px" type="button" value="当前时间(日期)" />
                    <hr />
                    <strong>印章控件</strong>
                    <hr />
                    <input id="Button12" onclick="formset(14)" style="width: 100px" type="button" value="插入印章域" />
                </td>
                <td style="padding-left: 5px; height: 25px; background-color: #ffffff">
                    <asp:TextBox ID="TxtContent" runat="server" Style="display: none"></asp:TextBox>
                    <script id="editor" type="text/plain" style="width:99%;height:350px;"></script>
                    <script type="text/javascript">
                        //实例化编辑器
                        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                        UE.getEditor('editor');
                        </script>
                    <br />
                    <span style="color: #ff0000">1.点击左边控件按钮将会把内容插入到编辑器中鼠标的光标所在处，如果鼠标的光标没有在编辑器中将不会插入内容。<br>
                    </span><span style="color: #ff0000">2.页面中存在重复的字段，系统在流程条件判断中将取页面上第一个控件的值。如果第一个控件没有值，系统默认为未取到值。</span>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
