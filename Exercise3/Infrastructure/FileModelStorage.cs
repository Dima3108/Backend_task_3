using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.IO;
using System.Text.Json;
using System.Text.Json.Serialization;
using Exercise3.Models;
namespace Exercise3.Infrastructure
{
    public class FileModelStorage:FormsStorege
    {
        private FileStream file;
        private StreamWriter streamWriter;
        public const string F_NAME = "data.txt";
        public FileModelStorage()
        {
            file = File.Open(F_NAME, FileMode.OpenOrCreate, FileAccess.Write, FileShare.Read);
            streamWriter = new StreamWriter(file, System.Text.Encoding.UTF8);
        }
        public void WriteForm(FormModel model)
        {
            List<FormModel> m = new List<FormModel>(GetElements().ToList<FormModel>());
            m.Add(model);
            file.Position = 0;
            file.SetLength(0);
            string s = JsonSerializer.Serialize(m.ToArray());
            Console.WriteLine(s);
            streamWriter.WriteLine(s);
            streamWriter.Flush();
            file.Flush();
           // streamWriter.WriteLine(JsonSerializer.Serialize(model));
        }
        public FormModel[] GetElements()
        {
            string cont = "",line="";
            using(Stream s = File.Open(F_NAME, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
            {
                using(StreamReader reader=new StreamReader(s, System.Text.Encoding.UTF8))
                {
                    while ((line = reader.ReadLine()) != null)
                    {
                        cont += line;
                    }
                }
            }
            if (cont == null || cont == "")
                return new FormModel[0];
            FormModel[] m = JsonSerializer.Deserialize<FormModel[]>(cont, options: new JsonSerializerOptions());
            return m;
        }
        ~FileModelStorage()
        {
            // file.Close();
            streamWriter.Flush();
            streamWriter.Close();
        }
    }
}
