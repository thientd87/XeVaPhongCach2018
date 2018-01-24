<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListTinDocNhieu.ascx.cs" Inherits="XPC.Web.GUI.ListTinDocNhieu" %>
<div id="doc-nhieu" class="list-tin-doc-nhieu">
   <h2>
        <a class="tab-anh" href="#" target="_blank">Tin mới nhất</a>
    </h2>
     <div class="list-news">
        <asp:Repeater runat="server" ID="rptTinDocNhieu">
            <ItemTemplate>
                <div class="news">
                    <%#Eval("Image") %>
                    <div class="title-news title">
                        <h3><a href="<%#Eval("URL") %>" title="<%#HttpUtility.HtmlEncode(Eval("News_Title")) %>"><%#Eval("News_Title") %></a></h3>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>    
     </div><!--end of .list-news-->                 
</div>