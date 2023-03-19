using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Exercise3.Models;
namespace Exercise3.Data
{
    public class FormDataProvider
    {
        public static FormsStorege sstoregeData { get;private set; }
        public static void SeedProvider(FormsStorege store) => sstoregeData = store;
    }
}
