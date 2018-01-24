<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopMenu.ascx.cs" Inherits="XPC.Web.GUI.TopMenu" %>
<%@ Register Src="~/GUI/Adv.ascx" TagPrefix="uc1" TagName="Adv" %>

<!--start of #header-->
            <div class="header">
                <a href="/" class="logo">Xe và phong cách</a>
                <div class="bannerTop">
                    <uc1:Adv runat="server" ID="Adv" AdvID="7" ClassName="top-left" />
                    <uc1:Adv runat="server" ID="Adv1" AdvID="13"  ClassName="top-right" />    
                </div>
                
                <%--<a href="#" style="display: block; float: right;"><img src="/images/banner_1.png"></a>--%>
            </div>
            <!--end of #header-->
            <!--start of #top-menu-->
            <div class="menu top-menu">
                <ul>
                    <li id="li0" class="menuItem">
                        <a href="/">Trang chủ</a></li>
                     <asp:Repeater runat="server" ID="rptNewsCat" OnItemDataBound="rptNewsCat_ItemDataBound">
                        <ItemTemplate>
                             <li id="li<%#Eval("Cat_ID") %>" class="menuItem">
                                <a href="<%#Eval("Cat_URL") %>"><%#Eval("Cat_Name") %></a>
                                <asp:Repeater runat="server" ID="rptSubmenu">
                                    <HeaderTemplate>
                                        <ul class="submenu">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li class="subMenuItem"><a href="<%#Eval("Cat_URL") %>"><%#Eval("Cat_Name") %></a></li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <li class="menuItem"><a href="/shopping.htm" style="padding-top: 7px">Shopping <img src="/Images/iconShoppingMenu.png"/></a></li>
                    <li class="menuItem"><a href="/lienhe.htm">Liên hệ</a></li>
                </ul>
            </div>
            <!--end of #top-menu-->
            <!--start of #clock-searchbox-->
            <div class="clock-socialbutton-searchbox container">
                <div class="clock">
                   
                </div>
                <div class="search-box">
                    <input type="text" class="txtSearch" id="txtSearchBox" onkeypress="return TDTEnterPressSearch(event);" value="Tìm kiếm" onfocus="if(this.value=='Tìm kiếm') this.value='';"
                                                                        onblur=" if(this.value=='') this.value='Tìm kiếm';" />
                    <input type="button" id="btnSearch" class="btnSearch" />
                </div>
                <a href="#btnRSS">
                    <div class="btnRSS"></div>
                </a>
               <%-- <div class="btnFB">
                    <div class="fb-like fb_iframe_widget" data-href="<%=Request.Url%>" data-layout="button" data-action="like" data-show-faces="true" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=&amp;href=<%=Request.Url.DnsSafeHost + Request.RawUrl %>&amp;layout=button&amp;locale=en_US&amp;sdk=joey&amp;show_faces=true">
                            
                    </div>
                </div>--%>
            </div>
            <!--end of #clock-searchbox-->

            <!--end of #top-menu-->
<asp:Literal runat="server" ID="ltrActiveMenu"></asp:Literal>