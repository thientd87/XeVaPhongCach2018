<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeNoiBatVertical.ascx.cs" Inherits="XPC.Web.GUI.HomeNoiBatVertical" %>
<div id="top-thuxe<%=CatId %>" class="cate_vertical_home">
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
                        <p class="sum"><%#Eval("News_Initcontent") %></p>
                    </div>                 
                    
                </div>
            </ItemTemplate>
        </asp:Repeater>                        
    </div><!--end of .list-news-->
</div>