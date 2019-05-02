/*************************************************************
 *          Project: NetCoreCMS                              *
 *              Web: http://dotnetcorecms.org                *
 *           Author: OnnoRokom Software Ltd.                 *
 *          Website: www.onnorokomsoftware.com               *
 *            Email: info@onnorokomsoftware.com              *
 *        Copyright: OnnoRokom Software Ltd.                 *
 *          License: BSD-3-Clause                            *
 *************************************************************/

using Microsoft.EntityFrameworkCore;
using NetCoreCMS.Framework.Core.Data;
using NetCoreCMS.Framework.Core.Models.ViewModels;
using NetCoreCMS.Framework.Core.Mvc.Models;
using NetCoreCMS.Framework.Core.Mvc.Repository;
using NetCoreCMS.EasyNews.Models;
using NetCoreCMS.EasyNews.Models.Entities;
using System.Collections.Generic;
using System.Linq;
using System;

namespace NetCoreCMS.EasyNews.Repositories
{
    public class NewsRepository : BaseRepository<News, long>
    {
        public NewsRepository(NccDbContext context) : base(context)
        {
        }

        public long Count(bool isActive, string keyword)
        {
            return GetBaseQuery(isActive, keyword).Count();
        }

        public List<News> Load(int from, int total, bool isActive, string keyword, string orderBy, string orderDir)
        {
            var query = GetBaseQuery(isActive, keyword);

            if (orderBy.ToLower() == "name")
            {
                if (orderDir.ToLower() == "asc")
                    query = query.OrderBy(x => x.Name);
                else
                    query = query.OrderByDescending(x => x.Name);
            }

            query = query.OrderByDescending(x => x.CreationDate);
            return query.Skip(from * total).Take(total).ToList();
        }

        #region Helper
        private IQueryable<News> GetBaseQuery(bool isActive, string keyword)
        {
            var baseQuery = Query().Include("Details").Include("CategoryList").Where(x => x.Status != EntityStatus.Deleted);

            if (isActive == true)
            {
                baseQuery = baseQuery.Where(x => x.Status == EntityStatus.Active);
            }
            if (!string.IsNullOrEmpty(keyword))
            {
                baseQuery = baseQuery.Where(x => x.Name.Contains(keyword) || x.Details.Any(y => y.Name.Contains(keyword)));
            }
            return baseQuery;
        } 
        #endregion
    }
}
