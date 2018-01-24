<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteItem.aspx.cs" Inherits="XPC.Web.Pages.VoteItem" %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .boxRegisEmail
        {
            width: 460px;
            overflow: hidden;
            padding: 1px;
        }
        .titleBox
        {
            overflow: hidden;
            padding: 5px;
            font-size: 13px;
            text-align: Center;
        }
        .boxContent
        {
            padding: 10px 0px;
            overflow: hidden;
            color: #888;
            width: 380xp;
        }
        .titleLeft
        {
            float: left;
            width: 140px;
            text-align: left;
            padding-bottom: 5px;
        }
        .inputRight
        {
            float: left;
            height: 130px;
            padding-bottom: 5px;
            text-align: left;
            width: 320px;
        }
        .inputRight input
        {
            width: 290px;
            border: solid 1px #aaa;
            height: 15px;
        }
        .checkItem
        {
            font-size: 12px;
            color: #999999;
            width: 50%;
        }
        .checkItem p
        {
            margin: 0px;
            padding: 0px 0px 0px 20px;
        }
    </style>
    <script type="text/javascript" language="javascript" src="/Scripts/vietpress.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div runat="server" id="divVote" class="boxContent" style="background: #f6f7f8; margin: 0;
        padding: 5px">
        <div class="titleBox">
            <b style="color: #004475; font-size: 20px">Xác nhận biểu quyết</b>
        </div>
        <div style="overflow: hidden; ">
            <div class="titleLeft">
                Nhập mã xác nhận</div>
            <div class="inputRight">
                <recaptcha:RecaptchaControl ID="recaptcha" runat="server" PublicKey="6LdiKM0SAAAAAEUzR9gUGY87kY6avWTsAgojWocc"
                    PrivateKey="6LdiKM0SAAAAAJYCJwvcs-6L2lywUWI8xQgNl1na" />
                <br />
            </div>
        </div>
        <div style="overflow: hidden;">
            <div class="titleLeft">
            </div>
            <div style="">
                <asp:Button Text="" runat="server" ID="btnBieuQuyet" OnClick="btnBieuQuyet_Click" /></div>
        </div>
    </div>
    <div runat="server" id="divOK" visible="false" class="boxContent" style="background: #f6f7f8;
        margin: 0; padding: 5px; text-align: center">
        <asp:Literal runat="server" ID="ltrAlert"></asp:Literal><br />
        <input type="button" value="Close" onclick="window.close();" />
        &nbsp;&nbsp;
        <input type="button" value="Xem kết quả" onclick="ViewResult();this.close()" />
    </div>
    <script type="text/javascript" language="javascript">
        function ViewResult() {
            window.open("/pages/VoteResult.aspx", "VotePage", "width=500px, height=400px");
        }
    </script>
    <asp:Literal runat="server" ID="ltrScript"></asp:Literal>
    </form>
</body>
</html>
