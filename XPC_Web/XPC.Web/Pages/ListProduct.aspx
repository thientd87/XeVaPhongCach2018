<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListProduct.aspx.cs" Inherits="XPC.Web.Pages.ListProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="listProduct">
            <asp:Repeater runat="server" ID="rptListPro">
                <ItemTemplate>
                   
                    <div class="productItem <%#((Container.ItemIndex+1)%5==0?"mr0":string.Empty) %>">
                       <%#Eval("Image") %>
                        <a href="<%#Eval("URL") %>" class="productTitle"><%#Eval("ProductName") %>
                        </a>
                     </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="clearfix"></div>
        </div>    
    </div>
</asp:Content>
