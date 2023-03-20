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
            file = File.Open(F_NAME, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.Read);
            streamWriter = new StreamWriter(file, System.Text.Encoding.UTF8);
        }
        public void WriteForm(FormModel model)
        {
            streamWriter.WriteLine(JsonSerializer.Serialize(model));
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
