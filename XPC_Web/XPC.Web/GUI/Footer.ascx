<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="XPC.Web.GUI.Footer" %>
     <div id="bottom-menu" class="bottom-menu">
        <ul>
        <li class="active">
            <a href="./Xe và phong cách - Trang chủ_files/Xe và phong cách - Trang chủ.htm">Trang chủ</a></li>
         <asp:Repeater runat="server" ID="rptNewsCat">
                        <ItemTemplate>
                             <li id="li<%#Eval("Cat_ID") %>">
                                <a href="<%#Eval("Cat_URL") %>"><%#Eval("Cat_Name") %></a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
        <li><a href="https://xevaphongcach.net/#">Liên hệ</a></li>
    </ul>
</div><!--end of #bottom-menu-->        
        <div id="footer">
            <div class="col1">
              <asp:Literal runat="server" ID="ltrFooterContent"></asp:Literal>
            </div>
            <div class="col2">
                <asp:Literal runat="server" ID="ltrAddress"></asp:Literal>
            </div>
            <div class="col3">
                <img src="/Images/logoBUzzCom.png"/> <br/>
                Copyright 2013 - Công Ty Cổ Phần Tích Hợp <br/>
                Dịch Vụ Buzzcom
            </div>
    </div>