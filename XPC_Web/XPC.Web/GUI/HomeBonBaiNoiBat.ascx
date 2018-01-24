<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeBonBaiNoiBat.ascx.cs" Inherits="XPC.Web.GUI.HomeBonBaiNoiBat" %>
<div id="flash">
                    <div id="bigPic">
                        <asp:Repeater runat="server" ID="rptBigPic">
                            <ItemTemplate>
                                <div class="pic">
                                    <%#Eval("OriginImage") %>
                                    <div class="tieude-bar">
                                        <h1><a href="<%#Eval("URL") %>" title="Xe hơi-bồn tắm"><%#Eval("News_Title") %></a>
                                        </h1>
                                        <p><%#Eval("News_Initcontent") %></p>
                                        <a class="link" href="<%#Eval("URL") %>">
                                            <img src="/images/next_ico.png" alt=""></a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div id="scroll">
                        <ul id="thumbs">
                            <asp:Repeater runat="server" ID="rptThumbs">
                                <ItemTemplate>
                                    <li rel="<%# Container.ItemIndex+1 %>">
                                            <%#Eval("Image") %>
                                        <h5><a href="<%#Eval("URL") %>"><%#Eval("News_Title") %></a></h5>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>