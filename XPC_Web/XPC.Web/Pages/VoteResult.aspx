<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteResult.aspx.cs" Inherits="XPC.Web.Pages.VoteResult" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
             <b style=" font-size:20px" ><asp:Literal runat="server" ID="ltrVote"></asp:Literal></b>
             <table cellpadding="3" cellspacing="3" width="100%" border="1px" style="border-collapse: collapse;">
                <asp:Repeater runat="server" ID="rptVote">
                    <ItemTemplate>
                        <tr>
                            <td style="width:200px"><%#Eval("VoteIt_Content").ToString()%></td>
                            <td>
                                <table cellpadding="0" cellspacing="0" width="100%" border="0px" >
                                    <tr>
                                        <td style='width:<%#Eval("VoteItem_Percent")%>; background:<%#Eval("Color")%>'>&nbsp;</td>
                                        <td style="padding-left:5px"><%#Eval("VoteItem_Percent")%></td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width:50px"><%#Eval("VoteIt_Rate")%></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                
                 <tr>
                    <td colspan="2" style=" text-align:right">
                        Tổng số phiếu: 
                        </td>
                        <td>
                        <asp:Literal runat="server" ID="ltrTotal"></asp:Literal>
                        </td>
                 </tr>
             </table>
        </div>
    </div>
    </form>
</body>
</html>

