<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeTinDocNhieu.ascx.cs" Inherits="XPC.Web.GUI.HomeTinDocNhieu" %>
 <div id="list-tintuc">
    <div class="tabs"><i class="iconWheel"></i><span>Tin mới nhất</span></div>
    <ul>
        <asp:Repeater runat="server" ID="rptTinNhieuNhat">
            <ItemTemplate>
                <li><a href="<%#Eval("URL") %>" title="<%#HttpUtility.HtmlEncode(Eval("News_Title")) %>"><%#Eval("News_Title") %></a></li>
            </ItemTemplate>    
        </asp:Repeater>
    </ul>
</div>
