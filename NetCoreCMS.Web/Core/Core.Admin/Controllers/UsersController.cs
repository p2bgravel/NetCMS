﻿/*************************************************************
 *          Project: NetCoreCMS                              *
 *              Web: http://dotnetcorecms.org                *
 *           Author: OnnoRokom Software Ltd.                 *
 *          Website: www.onnorokomsoftware.com               *
 *            Email: info@onnorokomsoftware.com              *
 *        Copyright: OnnoRokom Software Ltd.                 *
 *          License: BSD-3-Clause                            *
 *************************************************************/
 
using Microsoft.Extensions.Logging;
using NetCoreCMS.Framework.Core.Mvc.Controllers;
using Core.Admin.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using NetCoreCMS.Framework.Core.Models;
using NetCoreCMS.Framework.Core.Services.Auth;

using NetCoreCMS.Framework.Core.Mvc.Models;
using Microsoft.AspNetCore.Authorization;
using NetCoreCMS.Framework.Themes;
using NetCoreCMS.Framework.Core.Network;
using NetCoreCMS.Framework.Utility;
using NetCoreCMS.Framework.Core.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using NetCoreCMS.Framework.Core.Mvc.Attributes;
using Microsoft.AspNetCore.Mvc.Rendering;
using Core.Admin.Models.ViewModels.UserAuthViewModels;
using NetCoreCMS.Framework.Core.Auth;
using NetCoreCMS.Framework.Core.Mvc.Views;
using Microsoft.Extensions.Caching.Memory;
using NetCoreCMS.Framework.Core.Mvc.Cache;

namespace Core.Admin.Controllers
{
    [AdminMenu(Name = "Users", Order = 6, IconCls = "fa-users")]
    public class UsersController : NccController
    {
        UserManager<NccUser> _userManager;
        RoleManager<NccRole> _roleManager;
        SignInManager<NccUser> _signInManager;
        NccPermissionService _nccPermissionService;
        NccPermissionDetailsService _nccPermissionDetailsService;
        INccUserService _nccUserService;
        IMemoryCache _cache;

        //IOptions<IdentityCookieOptions> _identityCookieOptions;
        IEmailSender _emailSender;
        ISmsSender _smsSender;
        NccStartupService _startupService;

        public UsersController(
            ILoggerFactory loggerFactory,
            UserManager<NccUser> userManager,
            RoleManager<NccRole> roleManager,
            SignInManager<NccUser> signInManager,
            NccPermissionService nccUserPermissionService,
            NccPermissionDetailsService  nccPermissionDetailsService,
            IEmailSender emailSender,
            ISmsSender smsSender,
            NccStartupService startupService,
            INccUserService nccUserService,
            IMemoryCache memoryCache
            )
        {
            _logger = loggerFactory.CreateLogger<UsersController>();
            _userManager = userManager;
            _roleManager = roleManager;
            _signInManager = signInManager;
            _nccPermissionService = nccUserPermissionService;
            _nccPermissionDetailsService = nccPermissionDetailsService;
            _emailSender = emailSender;
            _smsSender = smsSender;
            _startupService = startupService;
            _nccUserService = nccUserService;
            _cache = memoryCache;
        }

        [AdminMenuItem(Name = "Manage Users", Order = 2, IconCls = "fa-user")]        
        public ActionResult Index(string searchKey="")
        {
            var permissions = _nccPermissionService.LoadAll();
            ViewBag.RoleList = new SelectList(permissions, "Id", "Name");
            searchKey = searchKey ?? "";
            searchKey = searchKey.Trim();
            var users = GetUsersViewModelList(searchKey);
            ViewBag.SearchKey = searchKey;
            return View(users);
        }

        [AdminMenuItem(Name = "New User", Order = 1, IconCls = "fa-user-plus")]
        public ActionResult CreateEdit(string userName = "")
        {
            var activeModules = GlobalContext.GetActiveModules();
            ViewBag.Modules = activeModules;
            var permissions = _nccPermissionService.LoadAll();
            ViewBag.Roles = new SelectList(permissions, "Id", "Name");

            var user = new UserViewModel();
            if (!string.IsNullOrEmpty(userName))
            {
                NccUser nccUser = _nccUserService.GetByUserName(userName);
                user = new UserViewModel(nccUser);
                if (_userManager.IsInRoleAsync(nccUser, "SuperAdmin").Result)
                {
                    user.IsSuperAdmin = true;
                }
                ViewBag.Roles = new SelectList(permissions, "Id", "Name",nccUser.Permissions.Select(x=>x.PermissionId).ToArray());
            }
            return View(user);
        }

        [HttpPost]
        public ActionResult CreateEdit(UserViewModel user, string SendEmail)
        {
            bool isSuccess = false;
            string returnMessage = "User Creation failed";
            if (user.Id > 0 && !string.IsNullOrEmpty(user.Email) && !string.IsNullOrEmpty(user.FullName) && !string.IsNullOrEmpty(user.Mobile))
            {
                var oldUser = _nccUserService.GetNccUser(user.Id);

                oldUser.FullName = user.FullName;
                oldUser.Email = user.Email;
                oldUser.Mobile = user.Mobile;

                oldUser.ExtraDenies.RemoveAll(x => x.ExtraDenyUserId == user.Id);
                oldUser.ExtraPermissions.RemoveAll(x => x.ExtraAllowUserId == user.Id);

                var allowedAdminMenuItems = user.AllowModules.Select(x => new { ModuleId = x.ModuleName, Items = x.AdminMenus.SelectMany(y => y.MenuItems.Where(z => z.IsChecked == true)) });

                var allowedWebSiteMenuItems = user.AllowModules.Select(x => new { ModuleId = x.ModuleName, Items = x.SiteMenus.SelectMany(y => y.MenuItems.Where(z => z.IsChecked == true)) }).ToList();

                foreach (var moduleMenu in allowedAdminMenuItems)
                {
                    foreach (var menuItem in moduleMenu.Items)
                    {
                        oldUser.ExtraPermissions.Add(new NccPermissionDetails()
                        {
                            Action = menuItem.Action,
                            AllowUser = oldUser,
                            Controller = menuItem.Controller,
                            ExtraAllowUserId = oldUser.Id,
                            ModuleName = moduleMenu.ModuleId
                        });
                    }
                }

                foreach (var moduleMenu in allowedWebSiteMenuItems)
                {
                    foreach (var menuItem in moduleMenu.Items)
                    {
                        oldUser.ExtraPermissions.Add(new NccPermissionDetails()
                        {
                            Action = menuItem.Action,
                            AllowUser = oldUser,
                            Controller = menuItem.Controller,
                            ExtraAllowUserId = oldUser.Id,
                            ModuleName = moduleMenu.ModuleId
                        });
                    }
                }

                var deniedAdminMenuItems = user.DenyModules.Select(x => new { ModuleId = x.ModuleName, Items = x.AdminMenus.SelectMany(y => y.MenuItems.Where(z => z.IsChecked == true)) });

                var deniedWebSiteMenuItems = user.DenyModules.Select(x => new { ModuleId = x.ModuleName, Items = x.SiteMenus.SelectMany(y => y.MenuItems.Where(z => z.IsChecked == true)) }).ToList();

                foreach (var moduleMenu in deniedAdminMenuItems)
                {
                    foreach (var menuItem in moduleMenu.Items)
                    {
                        oldUser.ExtraDenies.Add(new NccPermissionDetails()
                        {
                            Action = menuItem.Action,
                            DenyUser = oldUser,
                            Controller = menuItem.Controller,
                            ExtraDenyUserId = oldUser.Id,
                            ModuleName = moduleMenu.ModuleId
                        });
                    }
                }

                foreach (var moduleMenu in deniedWebSiteMenuItems)
                {
                    foreach (var menuItem in moduleMenu.Items)
                    {
                        oldUser.ExtraDenies.Add(new NccPermissionDetails()
                        {
                            Action = menuItem.Action,
                            DenyUser = oldUser,
                            Controller = menuItem.Controller,
                            ExtraDenyUserId = oldUser.Id,
                            ModuleName = moduleMenu.ModuleId
                        });
                    }
                }

                _nccUserService.Update(oldUser);

                if (user.IsSuperAdmin)
                {
                    NccUser userTemp = _userManager.FindByNameAsync(oldUser.UserName).Result;
                    var result = _userManager.AddToRoleAsync(userTemp, NccCmsRoles.SuperAdmin).Result;
                    if (result.Succeeded)
                    {
                        isSuccess = true;
                        returnMessage = " User SuperAdmin Role update successful.";
                    }
                    else
                    {
                        isSuccess = false;
                        returnMessage = result.Errors?.FirstOrDefault()?.Description;
                    }
                }
                else
                {
                    NccUser userTemp = _userManager.FindByNameAsync(oldUser.UserName).Result;
                    var result = _userManager.RemoveFromRoleAsync(userTemp, NccCmsRoles.SuperAdmin).Result;
                    if (result.Succeeded)
                    {
                        isSuccess = true;
                        returnMessage = " User SuperAdmin Role remove successful.";
                    }
                    else
                    {
                        isSuccess = false;
                        returnMessage = result.Errors?.FirstOrDefault()?.Description;
                    }
                }

                isSuccess = true;
                GlobalContext.GlobalCache.SetNccUser(oldUser);
                //return RedirectToAction("Index");
            }
            else if (ModelState.IsValid)
            {
                if (user.Password == user.ConfirmPassword)
                {
                    var nccUser = new NccUser() { Email = user.Email, FullName = user.FullName, UserName = user.UserName, Mobile = user.Mobile, Status = EntityStatus.Active };
                    var result = _userManager.CreateAsync(nccUser, user.Password).Result;

                    var createdUser = _userManager.FindByNameAsync(user.UserName).Result;
                    if (createdUser != null)
                    {
                        if (user.IsSuperAdmin)
                        {
                            NccUser userTemp = _userManager.FindByNameAsync(createdUser.UserName).Result;
                            var temp = _userManager.AddToRoleAsync(userTemp, NccCmsRoles.SuperAdmin).Result;
                            isSuccess = true;
                            returnMessage = "User created successfully.";
                        }
                        else
                        {
                            foreach (var item in user.Roles)
                            {
                                var permission = _nccPermissionService.Get(item);
                                createdUser.Permissions.Add(new NccUserPermission() { Permission = permission, User = createdUser });
                            }

                            createdUser.ExtraPermissions = GetSelectedPermissionDetails(user.AllowModules, createdUser, true);
                            createdUser.ExtraDenies = GetSelectedPermissionDetails(user.DenyModules, createdUser, false);

                            var upResult = _userManager.UpdateAsync(createdUser).Result;
                            if (upResult.Succeeded == false)
                            {
                                returnMessage = "User role assign failed.";
                            }
                            else
                            {
                                GlobalContext.GlobalCache.SetNccUser(createdUser);
                                isSuccess = true;
                                returnMessage = "User created successfully.";
                            }
                        }
                    }
                }
                else
                {
                    returnMessage = "Password does not match.";
                }
            }
            else
            {
                returnMessage = "Please enter all required fields.";
                ModelState.AddModelError("", "Please enter all required fields.");
            }

            if (isSuccess)
            {
                ShowMessage(returnMessage, MessageType.Success, false, true);
                return RedirectToAction("CreateEdit");
            }

            var activeModules = GlobalContext.GetActiveModules();
            ViewBag.Modules = activeModules;
            var permissions = _nccPermissionService.LoadAll();
            ViewBag.Roles = new SelectList(permissions, "Id", "Name");

            ShowMessage(returnMessage, MessageType.Error);
            return View("CreateEdit", user);
        }

        private List<NccPermissionDetails> GetSelectedPermissionDetails(List<ModuleViewModel> modules, NccUser user, bool isExtraAllowPermission)
        { 
            var permissionDetailsList = new List<NccPermissionDetails>();

            foreach (var module in modules)
            {
                foreach (var adminMenu in module.AdminMenus)
                {
                    foreach (var item in adminMenu.MenuItems)
                    {
                        if (item.IsChecked)
                        {
                            var pd = new NccPermissionDetails()
                            {
                                Action = item.Action,
                                Controller = item.Controller,
                                ModuleName = module.ModuleName,
                                Name = adminMenu.Name,                                
                                Order = item.Order,                                
                            };
                            if (isExtraAllowPermission)
                            {
                                pd.AllowUser = user;
                            }
                            else
                            {
                                pd.DenyUser = user;
                            }
                            permissionDetailsList.Add(pd);
                        }
                    }
                }

                foreach (var webSiteMenu in module.SiteMenus)
                {
                    foreach (var item in webSiteMenu.MenuItems)
                    {
                        if (item.IsChecked)
                        {

                            var pd = new NccPermissionDetails()
                            {
                                Action = item.Action,
                                Controller = item.Controller,
                                ModuleName = module.ModuleName,
                                Name = webSiteMenu.Name,
                                Order = item.Order 
                            };
                            if (isExtraAllowPermission)
                            {
                                pd.AllowUser = user;
                            }
                            else
                            {
                                pd.DenyUser = user;
                            }
                            permissionDetailsList.Add(pd);
                        }
                    }
                }
            }
            
            return permissionDetailsList;
        }
        

        private List<UserViewModel> GetUsersViewModelList(string searchKey)
        {
            var users = _nccUserService.Search(searchKey);
            var list = new List<UserViewModel>();
            foreach (var user in users)
            {
                list.Add(GetUserViewModel(user));
            }
            return list;
        }

        private UserViewModel GetUserViewModel(NccUser user)
        {
            var uvm = new UserViewModel();
            uvm.Email = user.Email;
            uvm.FullName = user.FullName;
            uvm.Id = user.Id;
            uvm.Mobile = user.Mobile;
            uvm.RoleNames = string.Join(",", user.Permissions.Select(x => x.Permission.Name).ToList());
            uvm.UserName = user.UserName;
            uvm.AllowModules = GetModules(user, true);
            uvm.DenyModules = GetModules(user, false);
            uvm.Roles = user.Permissions.Select(x => x.PermissionId).ToArray();
            uvm.Status = GetUserStatus(user);
            return uvm;
        }

        private string GetUserStatus(NccUser user)
        {
            
            if (user.LockoutEnabled)
            {
                if(user.LockoutEnd != null)
                {
                    if(user.LockoutEnd > DateTime.Now)
                    {
                        return "Blocked";
                    }
                }
            }

            if (user.IsRequireLogin)
            {
                return "RequireLogin";
            }

            if (GlobalContext.GlobalCache.GetNccUser(user.Id) != null)
            {
                return "Online";
            }

            return "Offline";
        }

        private List<ModuleViewModel> GetModules(NccUser user, bool isAllowModule)
        {
            var activeModules = GlobalContext.GetActiveModules();            
            var modules = new List<ModuleViewModel>();

            foreach (var module in modules)
            {
                var mvm = new ModuleViewModel();
                mvm.ModuleName = module.ModuleName;
                mvm.Name = module.Name;
                mvm.AdminMenus = GetMenus(module.ModuleName, module.AdminMenus, user, isAllowModule, "Admin");
                mvm.SiteMenus = GetMenus(module.ModuleName, module.SiteMenus, user, isAllowModule, "WebSite");
            }
            return modules;
        }

        //private List<MenuViewModel> GetAdminMenus(ModuleViewModel module, NccUser user, bool isExtraAllow)
        //{
        //    var menuList = new List<MenuViewModel>();
        //    foreach (var adminMenu in module.AdminMenus)
        //    {
        //        var amvm = new MenuViewModel();
        //        amvm.Name = adminMenu.Name;
        //        amvm.Order = adminMenu.Order;
        //        amvm.Type = "Admin";
        //        amvm.Url = adminMenu.Url;
        //        foreach (var menuItem in adminMenu.MenuItems)
        //        {
        //            amvm.MenuItems.Add(new MenuItemViewModel() {
        //                Action = menuItem.Action,
        //                Controller = menuItem.Controller,
        //                Name = menuItem.Name,
        //                Order = menuItem.Order,
        //                IsChecked = IsUserMenuChecked(menuItem, user, module.ModuleId, isExtraAllow)
        //            });
        //        }
        //        menuList.Add(amvm);
        //    }            
        //    return menuList;
        //}

        private List<MenuViewModel> GetMenus(string moduleName, List<MenuViewModel> menus, NccUser user, bool isExtraAllow, string type)
        {
            var menuList = new List<MenuViewModel>();
            foreach (var siteMenu in menus)
            {
                var amvm = new MenuViewModel();
                amvm.Name = siteMenu.Name;
                amvm.Order = siteMenu.Order;
                amvm.Type = type;
                amvm.Url = siteMenu.Url;
                foreach (var menuItem in siteMenu.MenuItems)
                {
                    amvm.MenuItems.Add(new MenuItemViewModel()
                    {
                        Action = menuItem.Action,
                        Controller = menuItem.Controller,
                        Name = menuItem.Name,
                        Order = menuItem.Order,
                        IsChecked = IsUserMenuChecked(menuItem, user, moduleName, isExtraAllow)
                    });
                }
                menuList.Add(amvm);
            }
            return menuList;
        }
         
        private bool IsUserMenuChecked(MenuItemViewModel menuItem, NccUser user, string moduleName, bool isExtraAllow)
        {
            if (isExtraAllow)
            {
                return user.ExtraPermissions.Where(
                    x => x.Permission.PermissionDetails.Where(
                        y => y.Action == menuItem.Action
                        && y.Controller == menuItem.Controller
                        && y.ModuleName == moduleName
                        && (y.ExtraAllowUserId == user.Id)
                    ).Count() > 0
                ).Count() > 0;
            }
            else
            {
                return user.ExtraDenies.Where(
                    x => x.Permission.PermissionDetails.Where(
                        y => y.Action == menuItem.Action
                        && y.Controller == menuItem.Controller
                        && y.ModuleName == moduleName
                        && (y.ExtraDenyUserId == user.Id)
                    ).Count() > 0
                ).Count() > 0;
            }
        }

        private List<ModuleViewModel> GetAllowModules(NccUser user)
        {
            var activeModules = GlobalContext.GetActiveModules();
            var modules = new List<ModuleViewModel>();

            foreach (var module in modules)
            {

            }
            return modules;
        }

        [HttpPost]
        public ActionResult BulkOperation(List<long> userIds, string operation)
        {
            var apiResponses = new List<ApiResponse>();
            switch (operation)
            {
                case "Block":
                    apiResponses = BlockUnBlockUsers(userIds,true);
                    break;
                case "UnBlock":
                    apiResponses = BlockUnBlockUsers(userIds, false);
                    break;
                case "ResetPassword":
                    apiResponses = ResetPasswords(userIds);
                    break;
                case "LogoutAll":
                    apiResponses = LogOutAll(userIds);
                    break;                    
                default:
                    break;
            }
            return Json(apiResponses);
        }

        private List<ApiResponse> ResetPasswords(List<long> userIds)
        {
            var apiResponses = new List<ApiResponse>();
            
            foreach (var userId in userIds)
            {
                try
                {
                    var user = _userManager.FindByIdAsync(userId.ToString()).Result;
                    var code = _userManager.GeneratePasswordResetTokenAsync(user).Result;
                    var newPassword = Guid.NewGuid().ToString().Substring(0, 6);
                    var result = _userManager.ResetPasswordAsync(user, code, newPassword).Result;

                    if (result.Succeeded)
                    {
                        GlobalContext.GlobalCache.RemoveNccUserFromCache(user.Id);
                        user.IsRequireLogin = true;
                        _nccUserService.Update(user);

                        var domainName = GlobalContext.WebSite.DomainName;
                        if (string.IsNullOrEmpty(domainName))
                        {
                            domainName = HttpContext.Request.Host.ToString();
                        }

                        if (!domainName.StartsWith("http")) {
                            domainName = "http://" + domainName;
                        }

                        _emailSender.SendEmailAsync(user.Email, "Reset Password", $"Your password reset by Admin. Your new password is: " + newPassword + " <br/> For more info visit: " + domainName).Wait();
                        apiResponses.Add(new ApiResponse()
                        {
                            IsSuccess = true,
                            Message = "Password reset successful for user " + user.UserName + ".",
                        });
                    }
                }
                catch (Exception ex)
                {
                    apiResponses.Add(new ApiResponse()
                    {
                        IsSuccess = false,
                        Message = "Password reset failed for user ID: " + userId + ".",
                    });
                    _logger.LogError(ex.ToString());
                }
            }
            return apiResponses;
        }
         

        private List<ApiResponse> BlockUnBlockUsers(List<long> userIds, bool block)
        {
            var apiResponses = new List<ApiResponse>();
            
            foreach (var userId in userIds)
            {
                try
                {
                    var operation = "block";
                    var user = _userManager.FindByIdAsync(userId.ToString()).Result;

                    if (block == false)
                    {
                        operation = "unblock";
                        var res = _userManager.SetLockoutEnabledAsync(user, false).Result;
                        if (res.Succeeded)
                        {
                            var rsp = _userManager.ResetAccessFailedCountAsync(user).Result;
                            GlobalContext.GlobalCache.RemoveNccUserFromCache(user.Id);
                            apiResponses.Add(new ApiResponse()
                            {
                                IsSuccess = true,
                                Message = "Successfully " + operation + " user " + user.UserName + ".",
                            });
                        }
                        else
                        {
                            _logger.LogWarning("Failed" + operation + " user " + user.UserName + ".");
                        }
                    }
                    else
                    {
                        var result = _userManager.SetLockoutEnabledAsync(user, true).Result;
                        if (result.Succeeded)
                        {
                            _userManager.SetLockoutEndDateAsync(user, DateTime.Now.AddDays(365*200));
                            user.IsRequireLogin = true;
                            GlobalContext.GlobalCache.RemoveNccUserFromCache(user.Id);
                            _nccUserService.Update(user);

                            apiResponses.Add(new ApiResponse()
                            {
                                IsSuccess = true,
                                Message = "Successfully " + operation + " user " + user.UserName + ".",
                            }); 
                        }
                    }
                }
                catch (Exception ex)
                {
                    apiResponses.Add(new ApiResponse()
                    {
                        IsSuccess = false,
                        Message = "Operation failed for user ID: " + userId + ".",
                    });
                    _logger.LogError(ex.ToString());
                }
            }
            return apiResponses;
        }

        private List<ApiResponse> LogOutAll(List<long> userIds)
        {
            var apiResponses = new List<ApiResponse>();

            foreach (var userId in userIds)
            {
                try
                {
                    var user = _userManager.FindByIdAsync(userId.ToString()).Result;
                    
                        GlobalContext.GlobalCache.RemoveNccUserFromCache(user.Id);
                        user.IsRequireLogin = true;
                        _nccUserService.Update(user);                    
                        apiResponses.Add(new ApiResponse()
                        {
                            IsSuccess = true,
                            Message = "Logout successful for user " + user.UserName + ".",
                        });                    
                }
                catch (Exception ex)
                {
                    apiResponses.Add(new ApiResponse()
                    {
                        IsSuccess = false,
                        Message = "Logout failed for user ID: " + userId + ".",
                    });
                    _logger.LogError(ex.ToString());
                }
            }
            return apiResponses;
        }

        [HttpPost]
        public ActionResult ChangeRole(List<long> userIds, long[] roles, string roleOperation)
        {
            var apiResponses = new List<ApiResponse>();            
            try
            {
                var messages = _nccUserService.UpdateUsersPermission(userIds, roles, roleOperation);
                foreach (var item in messages)
                {
                    apiResponses.Add(new ApiResponse() { Message = item.Message, IsSuccess = item.IsSuccess});
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                apiResponses.Add(new ApiResponse() { Message = "Error Occoured", IsSuccess = false });
            }

            return Json(apiResponses);
        }
        
        public ActionResult Update(long userId)
        {
            var user = _userManager.FindByIdAsync(userId.ToString()).Result; 
            if(user == null)
            {
                TempData["ErrorMessage"] = "User not found.";
            }
            return View("CreateEdit", GetUserViewModel(user));
        }

        public ActionResult ForceLgout(long userId, string searchKey)
        {
            searchKey = searchKey ?? "";
            var user = _nccUserService.GetNccUser(userId);
            if(user != null) {
                user.IsRequireLogin = true;
                _nccUserService.Update(user);
                GlobalContext.GlobalCache.RemoveNccUserFromCache(userId);
            }
            return RedirectToAction("Index", new { searchKey = searchKey.Trim() });
        }

    }
}
