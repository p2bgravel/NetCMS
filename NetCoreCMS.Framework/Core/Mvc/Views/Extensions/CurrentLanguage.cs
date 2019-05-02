﻿/*************************************************************
 *          Project: NetCoreCMS                              *
 *              Web: http://dotnetcorecms.org                *
 *           Author: OnnoRokom Software Ltd.                 *
 *          Website: www.onnorokomsoftware.com               *
 *            Email: info@onnorokomsoftware.com              *
 *        Copyright: OnnoRokom Software Ltd.                 *
 *          License: BSD-3-Clause                            *
 *************************************************************/

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using NetCoreCMS.Framework.i18n;

namespace NetCoreCMS.Framework.Core.Mvc.Views.Extensions
{
    public static class LanguageExtension
    {
        public static string CurrentLanguage(this IHtmlHelper helper)
        {
            var langDetector = new NccLanguageDetector(new HttpContextAccessor() { HttpContext = helper.ViewContext.HttpContext });
            return langDetector.GetCurrentLanguage();
        }
    }
}
