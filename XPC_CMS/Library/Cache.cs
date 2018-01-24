//Sharpcms.net is licensed under the open source license GPL - GNU General Public License.
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using System.Xml.Xsl;
using System.IO;

namespace DFISYS.SiteSystem {
    public class Cache {
        private System.Web.HttpApplicationState ApplicationState;
        public Cache(System.Web.HttpApplicationState applicationState) {
            ApplicationState = applicationState;
        }
        public Hashtable CacheTable {
            get {
                if (ApplicationState["cache"] == null) {
                    Clean();
                }
                return ApplicationState["cache"] as Hashtable;
            }
        }

        public object this[string key, FileInfo fileDependency] {
            get {
                object value = this[key];
                if (value == null) {
                    return null;
                }

                string fileModified = fileDependency.LastWriteTime.ToString();
                string cacheModifiedKey = FormatModifiedKey(key);
                if (this[cacheModifiedKey] == null || this[cacheModifiedKey].ToString() != fileModified) {
                    return null;
                }

                return value;
            }
            set {
                this[key] = value;

                string fileModified = fileDependency.LastWriteTime.ToString();
                string cacheModifiedKey = FormatModifiedKey(key);
                this[cacheModifiedKey] = fileModified;
            }
        }

        public object this[string key] {
            get {
                return CacheTable[key];
            }
            set {
                CacheTable[key] = value;
            }
        }

        public void Clean() {
            Hashtable cache = new Hashtable();
            ApplicationState["cache"] = cache;
        }

        private string FormatModifiedKey(string key) {
            return string.Format("{0}_filedependency", key);
        }
    }
}
