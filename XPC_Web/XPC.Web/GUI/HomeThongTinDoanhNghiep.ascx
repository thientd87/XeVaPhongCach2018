<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeThongTinDoanhNghiep.ascx.cs" Inherits="XPC.Web.GUI.HomeThongTinDoanhNghiep" %>
<div id="thong-tin-doanh-nghiep" class="container margin-top15">
    <h2>
        <asp:Literal runat="server" ID="ltrCatName"></asp:Literal>
        <span>
            <button id="leftTTDN">&nbsp;</button>
            <button id="rightTTDN">&nbsp;</button>
        </span>
    </h2>
    <div class="list-doanh-nghiep">
        <div id="list-ttdn-overflow">
            <asp:Repeater runat="server" ID="rptNewNoiBatMuc">
                <ItemTemplate>
                    <div class="doanh-nghiep">
                        <%#Eval("Image") %>
                        <div class="title">
                            <h3><a href="<%#Eval("URL") %>" title="<%#HttpUtility.HtmlEncode(Eval("News_Title")) %>">
                                    <%#Eval("News_Title") %></a></h3>
                           
                        </div>                       
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    <div class="clearfix"></div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div><!--end of #list-video-->
</div><!--end of #top-video-->

<script>
    $(function () {
        var over = $("#list-ttdn-overflow");
        var left = $("#leftTTDN");
        var right = $("#rightTTDN");
        var count_over = 0;
        var total_video = <%=_TotalVideo%>;
                    left.click(function () {
                        if (count_over > 0) {
                            over.animate({
                                marginLeft: "+=232px"
                            });
                            count_over--;
                        }
                        return false;
                    });
                    right.click(function () {
                        if (count_over < total_video) {
                            over.animate({
                                marginLeft: "-=232px"
                            });
                            count_over++;
                        }
                        return false;
                    });
                });

                
</script>