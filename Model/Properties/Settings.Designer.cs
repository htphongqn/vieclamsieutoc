﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18444
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Model.Properties {
    
    
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "10.0.0.0")]
    internal sealed partial class Settings : global::System.Configuration.ApplicationSettingsBase {
        
        private static Settings defaultInstance = ((Settings)(global::System.Configuration.ApplicationSettingsBase.Synchronized(new Settings())));
        
        public static Settings Default {
            get {
                return defaultInstance;
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=172.28.248.1;Initial Catalog=an_viet_com;User ID=anviet")]
        public string an_viet_comConnectionString {
            get {
                return ((string)(this["an_viet_comConnectionString"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=(local);Initial Catalog=whitesandtravel_com_vn;Persist Security Info=" +
            "True;User ID=cattrang;Password=WvAg36MdkC")]
        public string tuvannetviet_comConnectionString {
            get {
                return ((string)(this["tuvannetviet_comConnectionString"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=hoanvu.dvuthietkeweb.com;Initial Catalog=bdshoanvu_com;Persist Securi" +
            "ty Info=True;User ID=hoanvu")]
        public string bdshoanvu_comConnectionString {
            get {
                return ((string)(this["bdshoanvu_comConnectionString"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=hoanvu.dvuthietkeweb.com;Initial Catalog=bdshoanvu_com;Persist Securi" +
            "ty Info=True;User ID=hoanvu;Password=PtW3gK2aVU")]
        public string bdshoanvu_comConnectionString1 {
            get {
                return ((string)(this["bdshoanvu_comConnectionString1"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=172.28.248.1;Initial Catalog=bdshoanvu_com;Persist Security Info=True" +
            ";User ID=hoanvu")]
        public string bdshoanvu_comConnectionString2 {
            get {
                return ((string)(this["bdshoanvu_comConnectionString2"]));
            }
        }
       
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=172.28.248.1;Initial Catalog=vieclamsieutoc_com;User ID=vieclamsieuto" +
            "c;Password=Dfg1r5g4re1g")]
        public string vieclamsieutoc_comConnectionString2 {
            get {
                return ((string)(this["vieclamsieutoc_comConnectionString2"]));
            }
        }
    }
}