using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Exercise3.Models;
using Exercise3.Data;
namespace Exercise3.Controllers
{
    public class ReadController:Controller
    {
        
        [HttpPost]
        public IActionResult ReadMessage(FormModel formModel)
        {
            FormDataProvider.sstoregeData.WriteForm(formModel);
            Console.WriteLine(formModel.ToString());
            return Redirect("/Home/Index");
        }

    }
}
