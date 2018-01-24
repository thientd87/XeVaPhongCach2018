<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Video.aspx.cs" Inherits="XPC.Web.Pages.Video" %>

<%@ Register Src="~/GUI/Pagging.ascx" TagPrefix="uc1" TagName="Pagging" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
         <div id="video">
                <div id="detail-video">
                    <asp:Literal runat="server" ID="ltrBigVideo"></asp:Literal>
                    <div class="title-video">
                        <h2 class="tieude"><asp:Literal runat="server" ID="ltrBigTitle"></asp:Literal></h2>
                        <p class="mota"><asp:Literal runat="server" ID="ltrBigInitContent"></asp:Literal></p>
                        <p class="thongtin"><%--Lượt xem: 0 ---%>Thời gian: <asp:Literal runat="server" ID="ltrDateTime"></asp:Literal></p>
                        <div class="fb-like fb_iframe_widget" data-href="http://xevaphongcach.net/videos/index/2133" data-layout="button" data-action="like" data-show-faces="true" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=&amp;href=http%3A%2F%2Fxevaphongcach.net%2Fvideos%2Findex%2F2133&amp;layout=button&amp;locale=en_US&amp;sdk=joey&amp;share=true&amp;show_faces=true"><span style="vertical-align: bottom; width: 96px; height: 20px;"><iframe name="ffcad592" width="1000px" height="1000px" frameborder="0" allowtransparency="true" scrolling="no" title="fb:like Facebook Social Plugin" src="./Xe và phong cách - Nguyễn Minh Quang - Zife design - Steed 400 độ Bobber_files/like.htm" style="border: none; visibility: visible; width: 96px; height: 20px;" class=""></iframe></span></div>
                    </div>
                </div>

                <div class="block-list">
                    <h2>Video mới nhất</h2>
                    <asp:Repeater runat="server" ID="rptData">
                        <ItemTemplate>
                            <div class="video-vertical">
                                <%#Eval("ImageVideo") %>
                                <div class="title-list">
                                    <h3><a href="<%#Eval("URL") %>"><%#Eval("News_Title") %></a></h3>
                                    <%--<p>Lượt xem: 0</p>--%>
                                    <p>Thời gian: <%#Eval("PublishDate") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                </div>

             <div class="clearfix"></div>
        </div>
    </div>
    <div class="container">
        <div id="video-best">
            <h2>
                <a>Video tổng hợp</a>
            </h2>
            <div id="list-video-style">
                <asp:Repeater runat="server" ID="rptListVideo">
                    <ItemTemplate>
                        <div class="video-style">
                            <%#Eval("ImageVideo") %>
                            <div class="title">
                                <h3><a href="<%#Eval("URL") %>" title="<%#HttpUtility.HtmlEncode(Eval("News_Title")) %>">
                                        <%#Eval("News_Title") %></a></h3>
                                <%--<p class="sum">Lượt xem: 0</p>--%>
                                <p class="sum">Thời gian: <%#Eval("PublishDate") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        <div class="clearfix"></div>           
                    </FooterTemplate>
                </asp:Repeater>
            </div><!--end of #list-video-style-->
            <uc1:Pagging runat="server" ID="Pagging" />
              <div class="clearfix"></div>           
        </div>
    </div>
   
</asp:Content>
