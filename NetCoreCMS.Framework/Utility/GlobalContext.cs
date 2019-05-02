﻿/*************************************************************
 *          Project: NetCoreCMS                              *
 *              Web: http://dotnetcorecms.org                *
 *           Author: OnnoRokom Software Ltd.                 *
 *          Website: www.onnorokomsoftware.com               *
 *            Email: info@onnorokomsoftware.com              *
 *        Copyright: OnnoRokom Software Ltd.                 *
 *          License: BSD-3-Clause                            *
 *************************************************************/

using System;
using System.Linq;
using NetCoreCMS.Framework.Modules.Widgets;
using NetCoreCMS.Framework.Modules;
using System.Collections.Generic;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Builder;
using NetCoreCMS.Framework.Core.Models;
using NetCoreCMS.Framework.Themes;

using NetCoreCMS.Framework.Setup;
using System.Collections;
using Microsoft.AspNetCore.Http;
using NetCoreCMS.Framework.Core.Mvc.Extensions;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Reflection;
using NetCoreCMS.Framework.Core.Auth.Handlers;
using System.Text.RegularExpressions;
using Microsoft.Extensions.Caching.Memory;
using NetCoreCMS.Framework.Core.Mvc.Cache;
using NetCoreCMS.Framework.Core.Services;
using System.IO;
using NetCoreCMS.Framework.Core.Mvc.Views;

namespace NetCoreCMS.Framework.Utility
{
    /// <summary>
    /// NetCoreCMS Global Context. This class contains Running WebSite, Theme, Modules and Widgets.
    /// </summary>
    public class GlobalContext
    {
        private static IViewRenderService _viewRenderService;
        
        public static IMemoryCache GlobalCache { get; private set; }
        /// <summary>
        /// WebSite contains running website's basic information like Title, Slogan, Logo Image, Default Language etc.
        /// </summary>
        public static NccWebSite WebSite { get; set; }

        /// <summary>
        /// If from any location of the project set it's value to true for restarting the application
        /// </summary>
        public static bool IsRestartRequired { get; set; }

        /// <summary>
        /// List of all modules are containing at Modules folder inside web project.
        /// </summary>
        public static List<IModule> Modules { get; set; } = new List<IModule>();

        private static Hashtable _moduleDependencies = new Hashtable();

        /// <summary>
        /// Website configurations.
        /// </summary>
        public static IConfiguration Configuration { get; set; }

        public static IConfigurationRoot ConfigurationRoot { get; set; }

        /// <summary>
        /// Environment of current hosting.
        /// </summary>
        public static IHostingEnvironment HostingEnvironment { get; set; }

        /// <summary>
        /// Provide class type from string class name.
        /// </summary>
        /// <param name="className">Class contains in modules.</param>
        /// <returns></returns>
        internal static Type GetTypeContainsInModules(string className)
        {
            var activeModules = GetActiveModules();
            foreach (var item in activeModules)
            {
                var types = item.GetType().Assembly.GetTypes().Where(x => typeof(INccAuthorizationHandler).IsAssignableFrom(x)).ToList();
                foreach (var type in types)
                {
                    if (type != null && type.Name.Equals(className))
                    {
                        return type;
                    }
                }
            }
            return null;
        }
        
        internal static IViewRenderService GetViewRenerService(bool newInstance = false)
        {
            if (newInstance)
            {
                return ServiceProvider.GetService<IViewRenderService>();
            }
             
            if(_viewRenderService == null)
            {
                _viewRenderService = ServiceProvider.GetService<IViewRenderService>();
            }

            return _viewRenderService;
        }

        /// <summary>
        /// Widget list of all active modules widget. It populates when modules are loaded.
        /// </summary>
        public static List<Widget> Widgets { get; set; } = new List<Widget>();

        public static Hashtable WidgetTypes { get; set; } = new Hashtable();

        /// <summary>
        /// List of already placed widgets on different layout zone of theme.
        /// </summary>
        public static List<NccWebSiteWidget> WebSiteWidgets { get; set; } = new List<NccWebSiteWidget>();
        /// <summary>
        /// List of themes contains at Themes folder of web project.
        /// </summary>
        public static List<Theme> Themes { get; set; }

        internal static IModule GetModuleByAssemblyName(AssemblyName assemblyName)
        {
            var module = Modules.Where(x => x.Assembly.GetName().Name == assemblyName.Name).FirstOrDefault();
            return module;
        }

        internal static void SetModuleDependencies(Hashtable moduleDependencies)
        {
            _moduleDependencies = moduleDependencies;
        }

        internal static Hashtable GetModuleDependencies()
        {
            return _moduleDependencies;
        }

        /// <summary>
        /// List of website menus. Which is created from admin panel for website's different location and language.
        /// </summary>
        public static List<NccMenu> Menus { get; set; }
        /// <summary>
        /// Website setup configuration
        /// </summary>
        public static SetupConfig SetupConfig { get; set; }
        /// <summary>
        /// Web root path of web project. ex. wwwroot
        /// </summary>
        public static string WebRootPath { get; set; }
        /// <summary>
        /// Root location of web project.
        /// </summary>
        public static string ContentRootPath { get; set; }
        /// <summary>
        /// Builded web application instance.
        /// </summary>
        public static IApplicationBuilder App { get; set; }
        //public static Theme ActiveTheme { get; set; }

        public string SiteBaseUrl { get; set; }
        public string StartupController { get; set; }

        //public static string CurrentLanguage { get; set; }

        /// <summary>
        /// Return a list of active modules.
        /// </summary>
        /// <returns></returns>
        public static List<IModule> GetActiveModules()
        {
            var query = from m in Modules where m.ModuleStatus == (int)NccModule.NccModuleStatus.Active select m;
            return query.ToList();
        }

        public string StartupAction { get; set; }
        /// <summary>
        /// All registered service and class instance container. Which are used for dependency injection.
        /// </summary>
        public static IServiceCollection Services { get; set; }

        /// <summary>
        /// Short code list of all modules.
        /// </summary>
        public static Hashtable ShortCodes { get; set; }
        /// <summary>
        /// Configured service provider.
        /// </summary>
        public static IServiceProvider ServiceProvider { get; set; }
        /// <summary>
        /// List all widgets of modules.
        /// </summary>
        public static void ListWidgets()
        {
            foreach (var item in Modules)
            {
                Widgets.AddRange(item.Widgets);
            }
        }

        /// <summary>
        /// This method provide logged user ID
        /// </summary>
        /// <returns>retuns long id</returns>
        public static NccUser GetCurrentUser()
        {
            IHttpContextAccessor hca = ServiceProvider?.GetService<IHttpContextAccessor>();
            long? userId = hca?.HttpContext?.User?.GetUserId();
            if (userId == null || userId.Value == 0)
                return null;

            var user = GlobalCache.GetNccUser(userId.Value);
            if(user == null)
            {
                var userService = hca.HttpContext.RequestServices.GetService<INccUserService>();
                if(userService != null)
                {
                    user = userService.Get(userId.Value);
                    //if(user != null)
                    //{
                    //    GlobalCache.SetNccUser(user);
                    //}
                }
            }
            return user;
        }

        /// <summary>
        /// This method provide logged user ID
        /// </summary>
        /// <returns>retuns long id</returns>
        public static long GetCurrentUserId()
        {
            IHttpContextAccessor hca = ServiceProvider?.GetService<IHttpContextAccessor>();
            long? userId = hca?.HttpContext?.User?.GetUserId();
            if (userId == null)
                return 0;
            return userId.Value;
        }

        /// <summary>
        /// Method for getting theme by the name.
        /// </summary>
        /// <param name="themeId"> Theme name which is same as folder name.</param>
        /// <returns>Return the theme object.</returns>
        public static Theme GetThemeByThemeId(string themeId)
        {
            return Themes.Where(x => x.ThemeId == themeId).FirstOrDefault();
        }

        /// <summary>
        /// Provides currently logged user's name.
        /// </summary>
        /// <returns></returns>
        public static string GetCurrentUserName()
        {
            IHttpContextAccessor hca = ServiceProvider?.GetService<IHttpContextAccessor>();
            string userName = hca?.HttpContext?.User?.Identity.Name;
            return userName;
        }

        /// <summary>
        /// Method for getting loaded module by Module ID
        /// </summary>
        /// <param name="moduleName">Id which contains at Module.json config file</param>
        /// <returns>Module instance</returns>
        public static IModule GetModuleByModuleName(string moduleName)
        {
            return Modules.Where(x => x.ModuleName == moduleName).FirstOrDefault();
        }

        /// <summary>
        /// Get Table Name from class
        /// </summary>
        /// <typeparam name="ModelT">Provide your class</typeparam>
        /// <returns></returns>
        public static string GetTableName<ModelT>()
        {
            var type = typeof(ModelT);
            return GetTableName(type);
        }

        public static string GetTableName(Type modelType)
        {
            #region Db Table Prefix
            string dbTablePrefix = "";
            if (WebSite != null && string.IsNullOrEmpty(WebSite.TablePrefix) == false)
            {
                dbTablePrefix = WebSite.TablePrefix;
            }   
            else if(SetupConfig != null && string.IsNullOrEmpty(SetupConfig.TablePrefix) == false)
            {
                dbTablePrefix = SetupConfig.TablePrefix;
            }
            else
            {
                SetupHelper.LoadSetup();
                dbTablePrefix = SetupHelper.TablePrefix;
            }

            if (dbTablePrefix == null || dbTablePrefix.Trim() == "")
                throw new Exception("Could not load setup info.");

            if (dbTablePrefix.EndsWith("_") == false)
                dbTablePrefix = dbTablePrefix.Trim() + "_";
            #endregion

            string moduleTablePrefix = "";
            var moduleName = modelType.Assembly.GetName();
            if (moduleName.Name == "NetCoreCMS.Framework")
            {
                moduleTablePrefix = "core_";
            }
            else if (moduleName.Name.StartsWith("Microsoft.") == true)
            {
                moduleTablePrefix = "ef_";
            }
            else
            {
                var moduleList = Modules;
                foreach (var item in moduleList)
                {
                    if (item.Folder == moduleName.Name)
                    {
                        moduleTablePrefix = item.TablePrefix;
                    }
                }
            }
            if (moduleTablePrefix.Trim() == "")
                moduleTablePrefix = "mod_";
            if (moduleTablePrefix.EndsWith("_") == true)
                moduleTablePrefix = moduleTablePrefix.Substring(0, moduleTablePrefix.Length - 1);

            string model_name = modelType.Name;
            model_name = string.Join('_', Regex.Split(model_name, @"(?=\p{Lu}\p{Ll})|(?<=\p{Ll})(?=\p{Lu})"));
            var tableName = dbTablePrefix + moduleTablePrefix + model_name;
            tableName = tableName.Replace('`', '_');
            if (tableName.Length > 64)
                tableName = tableName.Replace("_", "");
            else
                tableName = tableName.ToLower();
            return tableName;
        }

        /// <summary>
        /// Get Table Name from class
        /// </summary>
        /// <typeparam name="ModelT">Provide your class</typeparam>
        /// <returns></returns>
        public static string GetSettingsKey<ModelT>()
        {
            var type = typeof(ModelT);

            #region Db Table Prefix
            string dbTablePrefix = "ncc_";
            if (WebSite != null)
                dbTablePrefix = WebSite.TablePrefix;
            else
                dbTablePrefix = SetupHelper.TablePrefix;
            if (dbTablePrefix == null || dbTablePrefix.Trim() == "")
                dbTablePrefix = "ncc_";
            if (dbTablePrefix.EndsWith("_") == false)
                dbTablePrefix = dbTablePrefix.Trim() + "_";
            dbTablePrefix = dbTablePrefix.ToUpper(); 
            #endregion

            string moduleName = type.Assembly.GetName().Name.Trim().ToUpper() + "_";

            string model_name = type.Name;
            model_name = string.Join('_', Regex.Split(model_name, @"(?=\p{Lu}\p{Ll})|(?<=\p{Ll})(?=\p{Lu})"));
            var tableName = dbTablePrefix + moduleName + model_name;
            return tableName;
        }

        internal static void SetGlobalCache(IServiceProvider serviceProvider)
        {
            var cache = serviceProvider.GetRequiredService<IMemoryCache>();
            if(cache != null)
            {
                GlobalCache = cache;
            }
        }

        public static string GetResourceFolder()
        {
            var path = Path.Combine(ContentRootPath, "Resources");
            if (HostingEnvironment.IsDevelopment())
            {
                path = Path.Combine(ContentRootPath, "bin", "Debug", "netcoreapp2.0", "Resources");
            }
            return path;
        }
    }
}