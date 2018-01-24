<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="XPC.Web.Pages.SearchResult" %>
<%@ Register Src="~/GUI/HomeAnhDep.ascx" TagPrefix="uc1" TagName="HomeAnhDep" %>
<%@ Register Src="~/GUI/ListTinDocNhieu.ascx" TagPrefix="uc1" TagName="ListTinDocNhieu" %>
<%@ Register Src="~/GUI/Pagging.ascx" TagPrefix="uc1" TagName="Pagging" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="colLeft">
        <div id="category" class="category">
            <asp:Repeater runat="server" ID="rptData">
                <ItemTemplate>
                    <div class="news-block"><!--7 bai-->
                       <%#Eval("Image") %>
                        <div class="title">
                            <h2><a href="<%#Eval("URL") %>"><%#Eval("News_Title") %></a></h2>                    
                            <p class="datetime"><%#Eval("PublishDate") %></p>
                            <p class="sum"><%#Eval("News_InitContent") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

    <!------>
            <uc1:Pagging runat="server" id="Pagging1" />
</div>
    </div>
    <div class="colRight">
        <uc1:HomeAnhDep runat="server" ID="HomeAnhDep" />
        <uc1:ListTinDocNhieu runat="server" id="ListTinDocNhieu" />
    </div>
        <div class="clearfix"></div>
 </div>
</asp:Content>
