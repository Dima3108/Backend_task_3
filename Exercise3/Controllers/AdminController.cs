﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
namespace Exercise3.Controllers
{
    public class AdminController:Controller
    {
        public IActionResult Index() => View();
    }
}
