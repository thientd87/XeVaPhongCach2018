<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Album.aspx.cs" Inherits="XPC.Web.Pages.Album" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        
            <asp:Repeater runat="server" ID="rptAlbums">
                <ItemTemplate>
                    <div id="ds-album" class="list-anh album" style="margin-top: 20px;float: left;">
                    <%#Eval("Image") %>
                     <div class="title">
                        <h3><a href="<%#Eval("URL") %>" title="<%#HttpUtility.HtmlEncode(Eval("Name")) %>">
                                <%#Eval("Name") %></a></h3>
                    </div>  
                         </div>
                </ItemTemplate>
            </asp:Repeater>
     
       
             <div class="clearfix"></div>
    </div>
</asp:Content>
