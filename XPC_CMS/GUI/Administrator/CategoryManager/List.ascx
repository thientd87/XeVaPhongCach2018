<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="List.ascx.cs" Inherits="DFISYS.GUI.Administrator.CategoryManager.List" %>
<%@ Register Src="Menu.ascx" TagName="Menu" TagPrefix="uc1" %>
<script language="javascript" src="/scripts/Newslist.js"></script>
<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center" style="margin-top: 10px;">
    <tr>
        <td style="vertical-align: top" width="250px">
            <aside id="sidebar" class="grid_3 pull_9">	
    <div class="box menu"><h2 style="white-space: nowrap">Quản lý chuyên mục <img src="/images/theme/icons/arrow_state_grey_expanded.png" class="toggle"></h2>
    <section>
 
<uc1:Menu ID="Menu1" runat="server" />
  </section></div>
 

</aside>
        </td>
        <td style="vertical-align: top">
        <section id="main" class="grid_9 push_3">
			<article style="float: left;width: 98%;">
			
            <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
                <ProgressTemplate>
                    <div class="loading">
                        Đang tải dữ liệu...</div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <script type="text/javascript" src="/scripts/ajax.js"></script>
            <div id="AlertDiv" class="AlertStyle">
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <h1 style="text-align: center">
                        Quản lý chuyên mục</h1>
                    <div style="width: 98%; float: left; padding: 2px;">
                        <table width="100%" id="tblParentCate">
                            <tr>
                                <td height="10px">
                                </td>
                            </tr>
                            <tr>
                                <td align="left" onmouseover="" onmouseout="">
                                    <h2>
                                        <asp:Label ID="lblParentCatName" runat="server" Text=""></asp:Label>
                                    </h2>
                                </td>
                                <td align="right">
                                    <asp:LinkButton ID="btnGoToRoot" Visible="false" runat="server" OnClick="btnGoToRoot_Click">Trở lại chuyên mục gốc</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td height="10px">
                                </td>
                            </tr>
                        </table>                        
                        <asp:GridView ID="grvCategories" CssClass="gtable sortable" CellPadding="5" OnRowCancelingEdit="grvCategories_RowCancelingEdit"
                            OnRowEditing="grvCategories_RowEditing" OnRowDeleting="grvCategories_RowDeleting"
                            OnSelectedIndexChanged="grvCategories_SelectedIndexChanged" OnRowDataBound="grvCategories_RowDataBound"
                            OnRowUpdating="grvCategories_RowUpdating" DataKeyNames="Cat_ID" runat="server"
                            AllowPaging="false" AutoGenerateColumns="false" Width="100%"  >
                            <Columns>
                                <asp:TemplateField HeaderText="STT">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                       
                                    </ItemTemplate>
                                    <ItemStyle CssClass="valign-middle" Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tên chuyên mục">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnCatName" CommandName="Select" runat="server" Text='<%# Eval("Cat_Name") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtCatName" Text='<%# Eval("Cat_Name") %>' runat="server" TextMode="MultiLine"
                                            CssClass="multiLineTxt"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                                ValidationGroup="EditForm" ErrorMessage="Bạn chưa nhập tên chuyên mục" Display="None"
                                                ControlToValidate="txtCatName" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemStyle CssClass="valign-middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Từ khóa chuyên mục" ItemStyle-Width="160">
                                    <ItemTemplate>
                                        <%# Eval("Cat_KeyWords") %>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtCatKeyWords" Text='<%# Eval("Cat_KeyWords") %>' runat="server"
                                            TextMode="MultiLine" CssClass="multiLineTxt"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ngôn ngữ" ItemStyle-Width="100">
                                    <ItemTemplate>
                                        <%--<asp:Label ID="lbLanguage" runat="server" Text="Label"></asp:Label>--%>
                                        <%# Eval("EditionName")%>
                                    </ItemTemplate>
                                    <%--<EditItemTemplate>
                                    <asp:DropDownList ID="ddlLanguage" runat="server" DataTextField="EditionName" DataValueField="EditionType_ID">
                                    </asp:DropDownList>
                                </EditItemTemplate>--%>
                                <ItemStyle CssClass="valign-middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Hiển thị trên đường dẫn" ItemStyle-Width="160">
                                    <ItemTemplate>
                                        <%# Eval("Cat_DisplayURL")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtCatDisplayURL" Text='<%# Eval("Cat_DisplayURL") %>' runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator2" ValidationGroup="EditForm" Display="None" ControlToValidate="txtCatDisplayURL"
                                            ErrorMessage="Bạn chưa nhập thông tin về đường dẫn" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemStyle CssClass="valign-middle"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Thứ tự hiển thị">
                                    <ItemTemplate>
                                        <%# Eval("Cat_Order") %>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="valign-middle"></ItemStyle>
                                    <EditItemTemplate>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="EditForm"
                                            ErrorMessage="Bạn chưa nhập thứ tự hiển thị" Display="None" ControlToValidate="txtCatOrder"
                                            SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator Display="none" ID="CompareValidator1" runat="server" ValidationGroup="EditForm"
                                            ErrorMessage="Thứ tự hiển thị là số" ControlToValidate="txtCatOrder" Operator="DataTypeCheck"
                                            SetFocusOnError="True" Type="Integer"></asp:CompareValidator>
                                        <asp:TextBox ID="txtCatOrder" Text='<%# Eval("Cat_Order") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Chuyên mục cha">
                                    <ItemTemplate>
                                        <%=ParentName %>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="valign-middle"></ItemStyle>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="cboParentCat" runat="server">
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ẩn">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="Ẩn" Visible='<%# Eval("Cat_isHidden") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="valign-middle"></ItemStyle>
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chkIsHidden" Checked='<%# Eval("Cat_isHidden") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="60" ItemStyle-CssClass="iconEdit">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" CommandName="Edit" ImageUrl="~/Images/Icons/document_edit.gif"
                                            ToolTip="Sửa thông tin chuyên mục" runat="server" />
                                        <asp:HyperLink ID="HyperLink1" ToolTip="Thiết lập layout" NavigateUrl='<%# "/GUI/EditoralOffice/MainOffce/CategoryManager/SetupLayout.aspx?tabref=" + Eval("Cat_ID") %>'
                                            ImageUrl="~/Images/Icons/windows.png" runat="server" Visible="false"></asp:HyperLink>
                                        <asp:ImageButton ID="ImageButton3" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa không?')"
                                            CommandName="Delete" ImageUrl="~/Images/Icons/delete.gif" ToolTip="Xóa chuyên mục"
                                            runat="server" />
                                    </ItemTemplate><ItemStyle CssClass="valign-middle"></ItemStyle>
                                    <EditItemTemplate>
                                        <asp:ImageButton ValidationGroup="EditForm" ID="ImageButton1" CommandName="Update"
                                            ImageUrl="~/Images/Icons/save.gif" ToolTip="Cập nhật thông tin chuyên mục" runat="server" />
                                        <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="EditForm" DisplayMode="BulletList"
                                            ShowMessageBox="true" ShowSummary="true" runat="server" />
                                        <asp:ImageButton ValidationGroup="None" ID="ImageButton2" CommandName="Cancel" ImageUrl="~/Images/Icons/back.png"
                                            ToolTip="Quay trở lại" runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        
                        <table style="margin-top: 10px; padding-bottom: 20px;" class="gtable" cellspacing="5" cellpadding="5">
                            <tr>
                                <th colspan="2" align="center">
                                    Thêm chuyên mục con vào chuyên mục hiện tại
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    Tên chuyên mục
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCatName" runat="server" CssClass="big"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="AddNewForm"
                                        ErrorMessage="Bạn chưa nhập tên chuyên mục" Display="None" ControlToValidate="txtCatName"
                                        SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: middle">
                                    Từ khóa chuyên mục
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCatKeyWord" runat="server" TextMode="MultiLine" CssClass="big"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Ngôn ngữ
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlLanguage" runat="server" DataTextField="EditionName" DataValueField="EditionType_ID"
                                        Enabled="false">
                                    </asp:DropDownList>
                            </tr>
                            <tr>
                                <td>
                                    Hiển thị trên đường dẫn
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCatDisplayURL" CssClass="big" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator2" ValidationGroup="AddNewForm" Display="None" ControlToValidate="txtCatDisplayURL"
                                        ErrorMessage="Bạn chưa nhập thông tin về đường dẫn" SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Thứ tự hiển thị
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCatOrder" CssClass="big" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="AddNewForm"
                                        ErrorMessage="Bạn chưa nhập thứ tự hiển thị" Display="None" ControlToValidate="txtCatOrder"
                                        SetFocusOnError="true" runat="server"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator Display="none" ID="CompareValidator1" runat="server" ValidationGroup="AddNewForm"
                                        ErrorMessage="Thứ tự hiển thị là số" ControlToValidate="txtCatOrder" Operator="DataTypeCheck"
                                        SetFocusOnError="True" Type="Integer"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr style="display: none">
                                <td>
                                    Edition type
                                </td>
                                <td>
                                    <asp:DropDownList ID="cboEditionType" DataSourceID="sqlEditionType" DataTextField="Name"
                                        DataValueField="EditionType_ID" runat="server">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlEditionType" runat="server" ConnectionString="<%$ ConnectionStrings:cms_coreConnectionString %>"
                                        SelectCommand="SELECT [EditionType_ID], [EditionName] + ' [' + [EditionDisplayURL] + ']' as Name FROM [EditionType]">
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr style="display: none">
                                <td>
                                    Áp dụng layout của trang
                                </td>
                                <td>
                                    <asp:DropDownList ID="cboLayout" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="AddNewForm" DisplayMode="BulletList"
                                        ShowMessageBox="false" ShowSummary="true" runat="server" />
                                    <asp:Button ID="btnAddNew" runat="server" CssClass="btnUpdate" ValidationGroup="AddNewForm" Text="Thêm mới"
                                        OnClick="btnAddNew_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            </article>
            </section>
        </td>
        <td width="4">
        </td>
    </tr>
</table>
