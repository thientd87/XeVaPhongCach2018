<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeAnhDep.ascx.cs" Inherits="XPC.Web.GUI.HomeAnhDep" %>
<div id="anh-dep" class="anhdep">
    <h2>
        <a class="tab-anh" href="/album.htm" target="_blank">Ảnh đẹp</a>
    </h2>
    <div class="list-anh">
        <asp:Repeater runat="server" ID="rptAnhDep">
            <ItemTemplate>
                <%#Eval("Image") %>
            </ItemTemplate>
        </asp:Repeater>        
    </div>
</div>