<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DesignForm.aspx.cs" Inherits="nleaps.WorkFlow.DesignForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" runat="server" BodyPadding="5px" Title="SimpleForm">
            <Items>
                <f:RegionPanel ID="RegionPanel1" runat="server" ShowBorder="False">
                    <Regions>
                        <f:Region runat="server" Position="Left" Split="True" Title="Left Region" Width="200px">
                            <Items>
                                <f:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" SortField="CreateTime" Title="Grid">
                                </f:Grid>
                            </Items>
                        </f:Region>
                        <f:Region runat="server" Title="Center Region">
                            <Items>
                                <f:Grid ID="Grid2" runat="server" Title="Grid">
                                </f:Grid>
                            </Items>
                        </f:Region>
                    </Regions>
                </f:RegionPanel>
            </Items>
        </f:SimpleForm>
    
    </div>
    </form>
</body>
</html>
