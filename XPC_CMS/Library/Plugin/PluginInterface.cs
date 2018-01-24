//Sharpcms.net is licensed under the open source license GPL - GNU General Public License.
using System;
using System.Collections.Generic;
using System.Text;
using Portal.SiteSystem.Plugin.Types;
using System.Xml;

namespace Portal.SiteSystem.Plugin
{
    public interface IPlugin
	{
		string Name { get; }
		Process Process { get; set; }

		IPluginHost Host { get; set; }

		void Initialize();
		void Dispose();

		void Handle(string mainEvent);
        void Load(ControlList control, string action, string pathTrail);
	}

    public interface IPlugin2 : IPlugin
    {
        string[] Implements { get; }
        object Invoke(string api, string action, params object[] args);
        void Load(ControlList control, string action, string value, string pathTrail);
    }

    public interface IPluginHost
	{
		AvailablePlugins AvailablePlugins { get; set; }
	}
}