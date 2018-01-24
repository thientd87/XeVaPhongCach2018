<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="XPC.Web.Pages.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container">
        <div class="productDetail">
            <div class="productMainInfo">
                <div class="productLeft">
                    <asp:Image runat="server" ID="imgDetail"/>
                </div>
                <div class="productRight">
                    <h1 class="productName"><asp:Literal runat="server" ID="ltrProductTitle"></asp:Literal></h1>
                    <p class="productCode"><b>Code:</b> <asp:Literal runat="server" ID="ltrProductCode"></asp:Literal></p>
                    <p class="btnGia">Giá: <asp:Literal runat="server" ID="ltrGia"></asp:Literal></p>
                    <a href="javascript:void(0)" class="btnMuaHang"><img src="/Images/btnMuaHang.jpg"/></a>
                    <p class="hotLine">Hotline: <asp:Literal runat="server" ID="ltrHotline"></asp:Literal></p>
                     <div class="auto-share-new">
                                <div class="fb-like fb_iframe_widget" data-href="//<%=Request.Url.DnsSafeHost + Request.RawUrl %>" data-layout="button" data-action="like" data-show-faces="true" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=&amp;href=//<%=Request.Url.DnsSafeHost + Request.RawUrl %>&amp;layout=button&amp;locale=en_US&amp;sdk=joey&amp;share=true&amp;show_faces=true">
                                    <span style="vertical-align: bottom; width: 96px; height: 20px;"><iframe name="f282a499b4" width="1000px" height="1000px" frameborder="0" allowtransparency="true" scrolling="no" title="fb:like Facebook Social Plugin" src="//<%=Request.Url.DnsSafeHost + Request.RawUrl %>" style="border: none; visibility: visible; width: 96px; height: 20px;" class=""></iframe></span>
                                </div>
                                <a href="https://twitter.com/share" class="twitter-share-button" style="float:left; display: inline">Tweet</a>
<script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');</script>
                                <!-- Place this tag in your head or just before your close body tag. -->
<script src="https://apis.google.com/js/platform.js" async defer></script>

<!-- Place this tag where you want the +1 button to render. -->
<div class="g-plusone" data-size="medium" data-annotation="inline" data-width="120"  style="float:left; display: inline"></div>
                            </div>
                </div>
                 <div class="clearfix"></div>
            </div>
           <div class="productContent">
               <ul class="product-tab">
                    <li class="active" data-name="product-des">Mô tả</li>
                    <li class="" data-name="product-how-to-use">Hướng dẫn sử dụng</li>
                    <li class="" data-name="product-specification">Thông số kỹ thuật</li>
                </ul>
                <div class="product-des" style="display: block">
                    <asp:Literal runat="server" ID="ltrMota"></asp:Literal>
                </div>
                <div class="product-how-to-use"> <asp:Literal runat="server" ID="ltrHowToUse"></asp:Literal></div>
                <div class="product-specification">
                    <asp:Literal runat="server" ID="ltrThongSoKyThuat"></asp:Literal>
                </div>

           </div>
        </div>    
    </div>
     <script type="text/javascript">
         // $('.product-video,.payment-manual').style("min-height", $(".product-content").height);
         $(".product-tab li").each(function () {
             $(this).click(function () {
                 $(".product-tab li").removeClass('active');
                 $(this).addClass('active');
                 $('.product-des,.product-how-to-use,.product-specification').hide();
                 $('.' + $(this).attr("data-name")).show();
             });
         });
    </script>
    <input type="hidden" id="hidProductID" runat="server" clientidmode="Static"/>
</asp:Content>
