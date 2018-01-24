<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XPC.Web.Default" %>
<%@ Register Src="~/GUI/HomeTinDocNhieu.ascx" TagPrefix="uc1" TagName="TinDocNhieu" %>
<%@ Register Src="~/GUI/HomeBonBaiNoiBat.ascx" TagPrefix="uc1" TagName="HomeBonBaiNoiBat" %>
<%@ Register Src="~/GUI/HomeNoiBatHorizal.ascx" TagPrefix="uc1" TagName="HomeNoiBatHorizal" %>
<%@ Register Src="~/GUI/HomeVideo.ascx" TagPrefix="uc1" TagName="HomeVideo" %>
<%@ Register Src="~/GUI/HomeNoiBatVertical.ascx" TagPrefix="uc1" TagName="HomeNoiBatVertical" %>
<%@ Register Src="~/GUI/HomeAnhDep.ascx" TagPrefix="uc1" TagName="HomeAnhDep" %>
<%@ Register Src="~/GUI/HomeVote.ascx" TagPrefix="uc1" TagName="HomeVote" %>
<%@ Register Src="~/GUI/HomeThongTinDoanhNghiep.ascx" TagPrefix="uc1" TagName="HomeThongTinDoanhNghiep" %>
<%@ Register Src="~/GUI/Adv.ascx" TagPrefix="uc1" TagName="Adv" %>
<%@ Register Src="~/GUI/HomeProductNoiBatMuc.ascx" TagPrefix="uc1" TagName="HomeProductNoiBatMuc" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="top-news-cate container">
                <uc1:HomeBonBaiNoiBat runat="server" id="HomeBonBaiNoiBat" />
                <uc1:TinDocNhieu runat="server" id="TinDocNhieu" />
                <uc1:Adv runat="server" id="Adv" AdvID="8" ClassName="banner2" />
            </div>
    <div class="clearfix"></div>
            <!--end of #top-news-cate-->
            <div class="container margin-top15">
                <uc1:Adv runat="server" id="Adv1" AdvID="9" ClassName="banner3" />
            </div>
            
            <div class="clearfix"></div>
            <uc1:HomeVideo runat="server" id="HomeVideo" CatId="117" Top="100" />
            <div class="clearfix"></div>
            <div class="container margin-top15">
                <uc1:HomeNoiBatHorizal runat="server" id="HomeNoiBatHorizal" CatId="116" Top="3" />    
                <uc1:HomeAnhDep runat="server" id="HomeAnhDep" />
            <!--end of .anhdep-->                
            </div>   
            <div class="clearfix"></div>
            <div class="container margin-top15">
                <uc1:HomeNoiBatHorizal runat="server" id="HomeNoiBatHorizal1" CatId="118" Top="3" /> 
                <!-- Banner -->
                <uc1:Adv runat="server" id="Adv2" AdvID="10" ClassName="banner4" />
            </div>
            <div class="clearfix"></div>
            <div class="container margin-top15">
                <uc1:HomeNoiBatVertical runat="server" id="HomeNoiBatVertical" CatId="119"  Top="4" />
                <uc1:HomeNoiBatVertical runat="server" id="HomeNoiBatVertical1" CatId="120"  Top="4" />
                <!--end of #top-nhanvat-->        
                <uc1:HomeVote runat="server" id="HomeVote" />
                <div class="fbLikebox">
                <iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FXe-V%25C3%25A0-Phong-C%25C3%25A1ch%2F1436551616572633&amp;width=245&amp;height=200&amp;colorscheme=light&amp;show_faces=true&amp;header=false&amp;stream=false&amp;show_border=true" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:245px; height:165px;" allowTransparency="true"></iframe>    
                </div>
                
                <script type="text/javascript">
                    $(document).ready(function() {
                        adjustHeights("top-thuxe119","top-thuxe120");
                    })
                </script>
            </div>
            <div class="clearfix"></div>
            <div class="container margin-top15">
                <div class="home_left">
                    <uc1:HomeNoiBatHorizal runat="server" id="HomeNoiBatHorizal2" CatId="121" Top="3" /> 
                    <div style="height: 15px; width: 100%; float: left;">&nbsp;</div>
                    <uc1:HomeNoiBatHorizal runat="server" id="HomeNoiBatHorizal3" CatId="122" Top="3" />     
                     <div style="height: 15px; width: 100%; float: left;">&nbsp;</div>
                    <uc1:HomeProductNoiBatMuc runat="server" id="HomeProductNoiBatMuc" />
                </div>
                <div class="home_right">
                    <uc1:Adv runat="server" id="Adv3" AdvID="11" ClassName="banner5" />
                    <div style="height: 15px; width: 100%; float: left;">&nbsp;</div>
                    <uc1:Adv runat="server" id="Adv4" AdvID="12" ClassName="banner6" />
                    <div style="height: 15px; width: 100%; float: left;">&nbsp;</div>
                    <uc1:Adv runat="server" id="Adv5" AdvID="14" ClassName="banner6" />
                     <div style="height: 15px; width: 100%; float: left;">&nbsp;</div>
                    <uc1:Adv runat="server" id="Adv6" AdvID="23" ClassName="banner23" />
                    <uc1:Adv runat="server" id="Adv7" AdvID="24" ClassName="banner24" />
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
        <div class="clearfix"></div>
            <uc1:HomeThongTinDoanhNghiep runat="server" id="HomeThongTinDoanhNghiep" CatId="138" Top="100" />
            <%--<uc1:HomeThongTinDoanhNghiep runat="server" id="HomeThongTinDoanhNghiep1" CatId="138" Top="4" />--%>
            <div class="clearfix"></div>
</asp:Content>

