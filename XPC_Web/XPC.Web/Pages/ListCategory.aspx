<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListCategory.aspx.cs" Inherits="XPC.Web.Pages.ListCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="listStore">
            <asp:Repeater runat="server" ID="rptListStore">
                <ItemTemplate>
                      <div class="storeItem <%#((Container.ItemIndex+1)%4==0?"mr0":string.Empty) %>">
                        <%#Eval("Image") %>
                        <a href="<%#Eval("Cat_URL") %>" class="storeTitle"><%#Eval("Product_Category_Name") %>
                            <br/><span class="viewmore"><img src="/Images/iconViewMore.png" /> Xem chi tiết</span>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="clearfix"></div>
        </div>    
    </div>
</asp:Content>
