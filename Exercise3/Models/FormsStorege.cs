using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Exercise3.Models
{
   public interface FormsStorege
    {
        void WriteForm(FormModel formModel);
        FormModel[] GetElements();
    }
}
