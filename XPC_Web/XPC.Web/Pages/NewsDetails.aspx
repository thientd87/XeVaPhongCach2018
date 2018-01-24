<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewsDetails.aspx.cs" Inherits="XPC.Web.Pages.NewsDetails" %>
<%@ Import Namespace="BO" %>
<%@ Register Src="~/GUI/HomeAnhDep.ascx" TagPrefix="uc1" TagName="HomeAnhDep" %>
<%@ Register Src="~/GUI/ListTinDocNhieu.ascx" TagPrefix="uc1" TagName="ListTinDocNhieu" %>
<%@ Register Src="~/GUI/Adv.ascx" TagPrefix="uc1" TagName="Adv" %>
<%@ Register Src="~/GUI/HomeThongTinDoanhNghiep.ascx" TagPrefix="uc1" TagName="HomeThongTinDoanhNghiep" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
            <div class="colLeft">
                <div id="detail" class="category">
                    <div class="news-details">                    
                        <div class="title">
                            <h2><asp:Literal runat="server" ID="ltrTitle"></asp:Literal></h2>   
                           
                            <p class="datetime"><asp:Literal runat="server" ID="ltrPublishDate"></asp:Literal> | <a class="print sprite" title="In bài viết" rel="nofollow" onclick="window.print(); return false;" href="#">In bài viết</a></p>
                            
                            <asp:Literal runat="server" ID="ltrRelatedNews"></asp:Literal>

                            <div class="auto-share-new">
                                <%--<div class="fb-like fb_iframe_widget" data-href="//<%=Request.Url.DnsSafeHost + Request.RawUrl %>" data-layout="button" data-action="like" data-show-faces="true" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=&amp;href=//<%=Request.Url.DnsSafeHost + Request.RawUrl %>&amp;layout=button&amp;locale=en_US&amp;sdk=joey&amp;share=true&amp;show_faces=true&amp;data_share=true">
                                    <span style="vertical-align: bottom; width: 96px; height: 20px;"><iframe name="f282a499b4" width="1000px" height="1000px" frameborder="0" allowtransparency="true" scrolling="no" title="fb:like Facebook Social Plugin" src="//<%=Request.Url.DnsSafeHost + Request.RawUrl %>" style="border: none; visibility: visible; width: 96px; height: 20px;" class=""></iframe></span>
                                </div>--%>
                                <div class="fb-like" data-href="//<%=Request.Url.DnsSafeHost + Request.RawUrl %>" data-layout="standard" data-action="like" data-show-faces="false" data-share="true"></div>
                                <a href="https://twitter.com/share" class="twitter-share-button" style="float:left; display: inline">Tweet</a>
<script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');</script>
                                <!-- Place this tag in your head or just before your close body tag. -->
<script src="https://apis.google.com/js/platform.js" async defer></script>

<!-- Place this tag where you want the +1 button to render. -->
<div class="g-plusone" data-size="medium" data-annotation="inline" data-width="120"  style="float:left; display: inline"></div>
                            </div>
                            
                           
                        </div>
                         <asp:Image runat="server" ID="imgBigImage" CssClass="bigImageDetail" Visible="False"/>
                        <div class="content">
                            <span style="font-size:12px"><strong><img src="/Images/logoSmall.png"/>&nbsp;<asp:Literal runat="server" ID="ltrSapo"></asp:Literal></strong></span><br/>
                            <br/>
                            <asp:Literal runat="server" ID="ltrContent"></asp:Literal>    
                        </div>
                        <div class="tags" runat="server" id="divTags">
                            <span class="icon sprite"></span>
                            <asp:Literal runat="server" ID="ltrTags"></asp:Literal>
                        </div>
                        
                        <div class="auto-share-new">
                                <%--<div class="fb-like fb_iframe_widget" data-href="//<%=Request.Url.DnsSafeHost + Request.RawUrl %>" data-layout="button" data-action="like" data-show-faces="true" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=&amp;href=//<%=Request.Url.DnsSafeHost + Request.RawUrl %>&amp;layout=button&amp;locale=en_US&amp;sdk=joey&amp;share=true&amp;show_faces=true&amp;data_share=true">
                                    <span style="vertical-align: bottom; width: 96px; height: 20px;"><iframe name="f282a499b4" width="1000px" height="1000px" frameborder="0" allowtransparency="true" scrolling="no" title="fb:like Facebook Social Plugin" src="//<%=Request.Url.DnsSafeHost + Request.RawUrl %>" style="border: none; visibility: visible; width: 96px; height: 20px;" class=""></iframe></span>
                                </div>--%>
                                <div class="fb-like" data-href="//<%=Request.Url.DnsSafeHost + Request.RawUrl %>" data-layout="standard" data-action="like" data-show-faces="false" data-share="true"></div>
                                <a href="https://twitter.com/share" class="twitter-share-button" style="float:left; display: inline">Tweet</a>
<script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');</script>
                                <!-- Place this tag in your head or just before your close body tag. -->
<script src="https://apis.google.com/js/platform.js" async defer></script>

<!-- Place this tag where you want the +1 button to render. -->
<div class="g-plusone" data-size="medium" data-annotation="inline" data-width="120"  style="float:left; display: inline"></div>
                            </div>

                        <div class="micropost">
                             <fb:comments href="<% = Request.Url.DnsSafeHost+ Request.RawUrl%>" num_posts="100" width="610" ></fb:comments>
                        </div>
        
<%--                         <fieldset runat="server" id="divTinMoiCapNhat">
                            <legend>Tin mới cập nhật</legend>
                            <ul>
                                <asp:Repeater runat="server" ID="rptTinMoiCapNhat">
                                    <ItemTemplate>
                                         <li><a href="<%#Eval("URL") %>"><%#Eval("News_Title") %></a> <span class="time"><%#Eval("PublishDate") %></span></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                            
                                
                            </ul>
                        </fieldset>   --%>      

                        <fieldset>
                            <legend>Các tin đã đăng</legend>
                            <div class="top3-other-news">
                                <asp:Repeater runat="server" ID="rpt3TinKhac">
                                    <HeaderTemplate><ul></HeaderTemplate>
                                    <ItemTemplate>
                                        <li>
                                            <%#Eval("Image") %>
                                            <a href="<%#Eval("URL") %>"><%#Eval("News_Title") %></a>
                                    </li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>                               
                                <div class="clear"></div>
                            </div>
                            <ul>
                                <asp:Repeater runat="server" ID="rptTinKhac">
                                    <ItemTemplate>
                                         <li><a href="<%#Eval("URL") %>"><%#Eval("News_Title") %></a> <span class="time"><%#Eval("PublishDate") %></span></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                            
                                
                            </ul>
                        </fieldset>                    
                    </div>
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
        </div>
     <div class="clearfix"></div>
            <uc1:HomeThongTinDoanhNghiep runat="server" id="HomeThongTinDoanhNghiep" CatId="138" Top="4" />
            <%--<uc1:HomeThongTinDoanhNghiep runat="server" id="HomeThongTinDoanhNghiep1" CatId="138" Top="4" />--%>
            <div class="clearfix"></div>
</asp:Content>
