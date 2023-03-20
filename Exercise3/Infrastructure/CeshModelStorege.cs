using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Exercise3.Models;
namespace Exercise3.Infrastructure
{
    public class CeshModelStorege:FormsStorege
    {
        private List<FormModel> models { get; set; }
        public CeshModelStorege()
        {
            models = new List<FormModel>();
        }
        public void WriteForm(FormModel f)
        {
            lock (models)
            {
                models.Add(f);
                models[models.Count - 1].ID = models.Count;
            }
        }
        public FormModel[] GetElements() =>( (models != null) ? models.ToArray() : null);
    }
}
