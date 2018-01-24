using System;
using System.Web.UI;
using System.ComponentModel;

namespace DFISYS.API.Controls
{
	/// <summary>
	/// Summary description for LanguageLinkButton.
	/// </summary>
	[DefaultProperty("LanguageRef"), 
		ToolboxData("<{0}:TemplateColumn runat=server></{0}:TemplateColumn>")]
	public class TemplateColumn : System.Web.UI.WebControls.TemplateColumn
	{
		public struct LanguageReferences
		{
			public string HeaderText;
			public string FooterText;
		}
	
		public LanguageReferences LanguageRef = new LanguageReferences();

		public override void Initialize()
		{
			base.Initialize ();

			if(LanguageRef.HeaderText != null)
			{
				base.HeaderText = DFISYS.API.Language.GetText(DFISYS.API.Module.GetModuleControl(this.Owner), LanguageRef.HeaderText);
			}

			if(LanguageRef.FooterText != null)
			{
				base.FooterText = DFISYS.API.Language.GetText(DFISYS.API.Module.GetModuleControl(this.Owner), LanguageRef.FooterText);
			}
		}
	}
}
