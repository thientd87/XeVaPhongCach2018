<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LienHe.aspx.cs" Inherits="XPC.Web.Pages.LienHe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div  style="background: #f1f1f1">
            <div class="lienhe-left">
                <img src="/Images/XPCMap.png"/>
            </div>
            <div class="lienhe-right">
                <div class="form-lienhe">
                    <div class="header-lienhe">
                         <b>Tạp chí Xe và Phong cách</b><br/>
                         Trụ sở tại Hà Nội: Tầng 2, Số 85A Tôn Đức Thắng, Q. Đống Đa, HN<br/>
                        Tel: 04.62.767.399 Fax: 04.62.767.399<br/><br/><br/>
                     </div>
                    <div class="form-row">
                        <div class="form-label">Họ và tên:</div>
                        <div class="form-input"><input type="text" id="txtName" runat="server" /></div>
                    </div>
                    <div class="form-row">
                        <div class="form-label">Email:</div>
                        <div class="form-input"><input type="text" id="txtEmail" runat="server" /></div>
                    </div>
                    <div class="form-row">
                        <div class="form-label">Số điện thoại:</div>
                        <div class="form-input"><input type="text" id="txtTel" runat="server" /></div>
                    </div>
                    <div class="form-row">
                        <div class="form-label">Nội dung:</div>
                        <div class="form-input"><textarea type="text" id="txtContent" runat="server" rows="4" cols="20" name="S1" /></div>
                    </div>
                     <div class="form-row">
                        <div class="form-label">&nbsp;</div>
                        <div class="form-input"><asp:Button runat="server" ID="btnSend" CssClass="btnGui" Text="Gửi" OnClick="btnSenFeedBack_Click" /></div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        
    </div>

</div>

</asp:Content>

