<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AlbumDetail.aspx.cs" Inherits="XPC.Web.Pages.AlbumDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="/Scripts/fancybox/jquery.fancybox.pack.js"></script>
    <link href="/Scripts/fancybox/jquery.fancybox.css" rel="stylesheet" />
    <div class="container">
        <div id="album" class="list-anh" style="margin-top: 20px; margin-left: 20px; float: left;">
        <asp:Repeater runat="server" ID="rptAlbumDetail">
            <ItemTemplate>
                <%#Eval("Image") %>
            </ItemTemplate>
        </asp:Repeater>
    
       
  
    </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).ready(function () {
                $(".list-anh a").fancybox({
                   
                });
            });
        });
    </script>
</asp:Content>
