﻿/*************************************************************
 *          Project: NetCoreCMS                              *
 *              Web: http://dotnetcorecms.org                *
 *           Author: OnnoRokom Software Ltd.                 *
 *          Website: www.onnorokomsoftware.com               *
 *            Email: info@onnorokomsoftware.com              *
 *        Copyright: OnnoRokom Software Ltd.                 *
 *          License: BSD-3-Clause                            *
 *************************************************************/
 
using MediatR;
using NetCoreCMS.Framework.Core.Models;

namespace NetCoreCMS.Framework.Core.Events.Post
{
    public class OnPostCreated : IRequest<NccPost>
    {
        public NccPost Post { get; set; }
        public OnPostCreated(NccPost post)
        {
            Post = post;
        }
    }
}
