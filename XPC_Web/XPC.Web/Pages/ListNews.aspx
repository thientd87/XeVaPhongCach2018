<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListNews.aspx.cs" Inherits="XPC.Web.Pages.ListNews" %>

<%@ Register Src="~/GUI/HomeAnhDep.ascx" TagPrefix="uc1" TagName="HomeAnhDep" %>
<%@ Register Src="~/GUI/ListTinDocNhieu.ascx" TagPrefix="uc1" TagName="ListTinDocNhieu" %>
<%@ Register Src="~/GUI/Pagging.ascx" TagPrefix="uc1" TagName="Pagging" %>
<%@ Register Src="~/GUI/Adv.ascx" TagPrefix="uc1" TagName="Adv" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="colLeft">
        <div id="category" class="category">
            <div id="news-top" class="news-block">
                <asp:Literal runat="server" ID="ltrBigPic"></asp:Literal>
                
                <div class="title">
                    <h2 class="bigTitle">
                        <asp:Literal runat="server" ID="ltrBigTitle"></asp:Literal>
                    </h2>                    
                    <p class="datetime">
                        <asp:Literal runat="server" ID="ltrDateTime"></asp:Literal>
                    </p>
                    <p class="sum">
                        <asp:Literal runat="server" ID="ltrBigInitContent"></asp:Literal>
                    </p>
                </div>
            </div>
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
        <uc1:Adv runat="server" id="Adv" AdvID="17"/>
        <uc1:HomeAnhDep runat="server" ID="HomeAnhDep" />
        <uc1:ListTinDocNhieu runat="server" id="ListTinDocNhieu" />
        <div style="height: 15px; width: 100%; float: left;">&nbsp;</div>
        <uc1:Adv runat="server" id="Adv3" AdvID="18" />
        <div style="height: 15px; width: 100%; float: left;">&nbsp;</div>
        <uc1:Adv runat="server" id="Adv4" AdvID="19" />
        <div style="height: 15px; width: 100%; float: left;">&nbsp;</div>
        <uc1:Adv runat="server" id="Adv5" AdvID="20" />
         <div style="height: 15px; width: 100%; float: left;">&nbsp;</div>
        <uc1:Adv runat="server" id="Adv1" AdvID="21" />
         <div style="height: 15px; width: 100%; float: left;">&nbsp;</div>
        <uc1:Adv runat="server" id="Adv2" AdvID="22" />
    </div>
        <div class="clearfix"></div>
 </div>
</asp:Content>
