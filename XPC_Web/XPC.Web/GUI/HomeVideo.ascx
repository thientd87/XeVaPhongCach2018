<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeVideo.ascx.cs" Inherits="XPC.Web.GUI.HomeVideo" %>
<div id="top-video" class="container margin-top15">
                <h2>
                    <asp:Literal runat="server" ID="ltrCatName"></asp:Literal>
                    <span>
                        <button id="leftVideo">&nbsp;</button>
                        <button id="rightVideo">&nbsp;</button>
                    </span>
                </h2>
                <div id="list-video">
                  <div id="list-video-overflow">
                      <asp:Repeater runat="server" ID="rptNewNoiBatMuc">
                          <ItemTemplate>
                              <div class="video">
                                  <%#Eval("Image") %>
                                   <div class="title">
                                      <h3><a href="<%#Eval("URL") %>" title="<%#HttpUtility.HtmlEncode(Eval("News_Title")) %>">
                                              <%#Eval("News_Title") %></a></h3>
                                      <p class="datetime"><%#Eval("PublishDate") %></p>
                                   </div>                       
                               </div>
                          </ItemTemplate>
                      </asp:Repeater>
                   </div>     
                </div><!--end of #list-video-->
            </div><!--end of #top-video-->
            <script>
                $(function () {
                    var over = $("#list-video-overflow");
                    var left = $("#leftVideo");
                    var right = $("#rightVideo");
                    var count_over = 0;
                    var total_video = <%=_TotalVideo%>;
                    left.click(function () {
                        if (count_over > 0) {
                            over.animate({
                                marginLeft: "+=185px"
                            });
                            count_over--;
                        }
                        return false;
                    });
                    right.click(function () {
                        if (count_over < total_video) {
                            over.animate({
                                marginLeft: "-=185px"
                            });
                            count_over++;
                        }
                        return false;
                    });
                });

                
</script>