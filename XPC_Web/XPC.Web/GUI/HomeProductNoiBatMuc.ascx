<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeProductNoiBatMuc.ascx.cs" Inherits="XPC.Web.GUI.HomeProductNoiBatMuc" %>
<div id="top-news" class="cate_horizontal_home">
    <h2>
        <a class="tab-shopping" href="/shopping.htm" target="_blank">Shopping</a>
    </h2> 
    <div class="list-news">
        <asp:Repeater runat="server" ID="rptNewNoiBatMuc">
            <ItemTemplate>
                <div class="news">
                    <%#Eval("Image") %>
                    <div class="title-news title">
                        <h3><a href="<%#Eval("URL") %>"  target="_blank" title="<%#HttpUtility.HtmlEncode(Eval("ProductName")) %>"><%#Eval("ProductName") %></a></h3>

                    </div>                 
                    <p class="sum"><%#Eval("ProductSumary_En") %></p>
                </div>
            </ItemTemplate>
        </asp:Repeater>                         
    </div><!--end of .list-news-->
</div>