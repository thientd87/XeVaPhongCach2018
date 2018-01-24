<%@ Control Language="c#" AutoEventWireup="True" Codebehind="SearchFull.ascx.cs" Inherits="DFISYS.GUI.Share.SearchInputFull.SearchFull" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<script language="javascript">
	var objTextBox;
	var objChkDate;
	var cmbNgay;
	var cmbThang;
	var cmbNam;
	var cmbCate;
	function CheckValid()
	{
		if (cmbCate.value == "0")
		{
			alert('Chuy�n m?c kh�ng ???c ch?n');
			return false;
		} 
		if (objChkDate.checked)
		{
			if (cmbNgay.value == "Ng�y")
			{
				alert('Ng�y t�m ki?m kh�ng ?�ng ??nh d?ng');
				return false;
			}
			if (cmbThang.value == "Th�ng")
			{
				alert('Th�ng t�m ki?m kh�ng ?�ng ??nh d?ng');
				return false;
			}
			if (cmbNam.value == "N?m")
			{
				alert('N?m t�m ki?m kh�ng ?�ng ??nh d?ng');
				return false;
			}
		}
		if (objTextBox.value == "")
		{
			alert('Nh?p kh�a t�m ki?m');
			return false;
		} else return true;
	}
</script>
<link href="Styles/Search.css" type="text/css" rel="stylesheet">
<fieldset class="SearchFull_Panel"><legend class="SearchFull_Header">T�m ki?m n�ng cao</legend>
	<table class="SearchFull_Table" cellSpacing="0" cellPadding="0" width="100%" align="center">
		<tr>
			<td>
				<table cellSpacing="0" cellPadding="0" width="100%" border="0">
					<TBODY>
						<tr>
							<td class="SearchFull_Mode" colSpan="2">Ch? ?? t�m</td>
						</tr>
						<tr>
							<td class="SearchFull_Mode" colSpan="2" style="HEIGHT: 10px">Chuy�n m?c&nbsp;&nbsp;
							<asp:dropdownlist id="cmbCategories" Runat="server" Font-Name="Verdana" Font-Size=11px></asp:dropdownlist>
							</td>
						</tr>
						<tr>
							<td width="50%"><asp:radiobutton id="rdadvanceword" CssClass="labelTextSearch" Runat="server" Checked="True" GroupName="search"
									Text="T�m theo c?m t?"></asp:radiobutton></td>
							<td width="50%"><asp:radiobutton id="rdnewFocus" CssClass="labelTextSearch" Runat="server" GroupName="search" Text="T�m trong nh?ng tin t�m ?i?m"></asp:radiobutton></td>
						</tr>
						<tr>
							<td><asp:radiobutton id="rdnewshot" CssClass="labelTextSearch" Runat="server" GroupName="search" Text="T�m trong nh?ng tin n�ng"></asp:radiobutton></td>
							<td><asp:radiobutton id="rdnewTopHot" CssClass="labelTextSearch" Runat="server" GroupName="search" Text="T�m trong nh?ng tin n�ng nh?t"></asp:radiobutton></td>
						</tr>
						<tr>
							<td>
								<table cellSpacing="0" cellPadding="0" width="100%" border="0">
									<tr>
										<td><asp:radiobutton id="rdDate" CssClass="labelTextSearch" Runat="server" GroupName="search" Text="Theo ng�y th�ng"></asp:radiobutton>&nbsp;
											<asp:dropdownlist id="cmbNgay" Runat="server"></asp:dropdownlist><asp:dropdownlist id="cmbThang" Runat="server"></asp:dropdownlist><asp:dropdownlist id="cmbNam" Runat="server"></asp:dropdownlist></td>
									</tr>
								</table>
							</td>
							<td vAlign="top"><asp:radiobutton id="rdnewHome" CssClass="labelTextSearch" Runat="server" GroupName="search" Text="T�m tr�n trang ch?"></asp:radiobutton></td>
						</tr>
					</TBODY>
				</table>
			</td>
		</tr>
		<tr>
			<td height="50"><asp:label id="lblselect" CssClass="SearchFull_Field" Runat="server">T�m ki?m&nbsp;&nbsp;</asp:label><asp:textbox id="txtSearch" CssClass="txtDetail" Runat="server" Width="150"></asp:textbox>&nbsp;
				<asp:button id="btnSearch" CssClass="SearchButton" Text="Search" runat="server" onclick="btnSearch_Click"></asp:button></td>
		</tr>
	</table>
</fieldset>
