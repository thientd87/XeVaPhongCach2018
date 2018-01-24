<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeNoiBatHorizal.ascx.cs" Inherits="XPC.Web.GUI.HomeNoiBatHorizal" %>
<div id="top-news" class="cate_horizontal_home">
    <h2>
        <asp:Literal runat="server" ID="ltrCatName"></asp:Literal>
    </h2> 
    <div class="list-news">
        <asp:Repeater runat="server" ID="rptNewNoiBatMuc">
            <ItemTemplate>
                <div class="news">
                    <%#Eval("Image") %>
                    <div class="title-news title">
                        <h3><a href="<%#Eval("URL") %>" title="<%#HttpUtility.HtmlEncode(Eval("News_Title")) %>"><%#Eval("News_Title") %></a></h3>

                    </div>                 
                    <p class="sum"><%#Eval("News_Initcontent") %></p>
                </div>
            </ItemTemplate>
        </asp:Repeater>                         
    </div><!--end of .list-news-->
</div>
