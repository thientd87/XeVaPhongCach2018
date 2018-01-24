﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopLogAction.ascx.cs" Inherits="Portal.GUI.EditoralOffice.MainOffce.ListUserAction.TopLogAction" %>
<div style="border: solid 1px #d0d0bf; overflow: auto; width: 100%; height: 150px;
	float: right; text-align: left;">
Tổng số trong ngày: <span style="color:Red"><asp:Literal runat="server" ID="ltrCount"></asp:Literal></span>
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="ms-formbody">
    <tr>
        <td>
            <table cellpadding="2" cellspacing="2" border="0" width="100%" class="ms-formbody">
                <tr>
                    <td>
                        <asp:GridView Width="100%" ID="grdListNews" runat="server" HeaderStyle-CssClass="grdHeader"
									BorderWidth="1px" BorderColor="#DFDFDF" RowStyle-CssClass="grdItem" EmptyDataText="<span style='color:Red'><b>Không có bài !</b></span>"
									AlternatingRowStyle-CssClass="grdAlterItem" AutoGenerateColumns="False" AllowPaging="True"
									AllowSorting="true" DataSourceID="objListNewsSource" PageSize="20" >
							<Columns>
							    <asp:TemplateField HeaderText="Hành động" >
									<ItemStyle CssClass="ms-vb-title" HorizontalAlign="center" />
									<ItemTemplate>
										<nobr>
										   <a href="/office/add,publishedlist/<%#Eval("Object_ID")%>.aspx"> <%# Eval("Action")%></a>
										</nobr>
									</ItemTemplate>
									<ItemStyle HorizontalAlign="Left" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Ngày" >
									<ItemStyle CssClass="ms-vb-title" HorizontalAlign="center" />
									<ItemTemplate>
										<nobr>
											<%# ((DateTime)Eval("LogDate")).ToString("dd/MM/yyyy HH:mm")%>
										</nobr>
									</ItemTemplate>
									<ItemStyle Width="70px" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="User" >
									<ItemStyle CssClass="ms-vb-title" HorizontalAlign="center" />
									<ItemTemplate>
										<nobr>
											<%# Eval("UserName")%>
										</nobr>
									</ItemTemplate>
									<ItemStyle Width="70px" />
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Preview" >
									<ItemStyle CssClass="ms-vb-title" HorizontalAlign="center" />
									<ItemTemplate>
										<nobr>
											<a href="javascript:openpreview('/preview/default.aspx?news=<%#Eval("Object_ID")%>',900,700);"> <img src='/images/icons/preview.gif' border="0" /> </a>
										</nobr>
									</ItemTemplate>
									<ItemStyle Width="50"  />
								</asp:TemplateField>
							</Columns>
							<PagerStyle CssClass="paging" HorizontalAlign="left" />
			                <PagerSettings Mode="NumericFirstLast" />
			                <HeaderStyle CssClass="grdHeader" />
			                <RowStyle CssClass="grdItem" />
			                <AlternatingRowStyle CssClass="grdAlterItem" />
					    </asp:GridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</div>
<asp:ObjectDataSource ID="objListNewsSource" runat="server" SelectMethod="GetListLogAction"
	SelectCountMethod="GetListLogActionCount"
	TypeName="Portal.BO.Editoral.UserActionHelper.ActionHelper" 
	EnablePaging="true" MaximumRowsParameterName="PageSize" StartRowIndexParameterName="StartRow">
	<SelectParameters>
	    <asp:Parameter Name="strWhere" Type="string" DefaultValue=""   />
	</SelectParameters>
</asp:ObjectDataSource>