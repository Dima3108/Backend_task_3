using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Exercise3.Models
{
    public class FormModel
    {
        public string name { get; set; }
        public string email { get; set; }
        public DateTime date { get; set; }
        public Pol pol { get; set; }
        public int count_con { get; set; }
        public string biograf { get; set; }
        /// <summary>
        /// Acquainted with the contract
        /// <strong>
        ///( С контрактом ознакомлен )
        /// </strong>
        /// </summary>
        public bool AWTC { get; set; }
        public string []supers{get;set;}
        public int ID { get; set; }
        public override string ToString()
        {
            string s = "";
            if(supers!=null&&supers.Length>0)
            foreach (var i in supers)
                s += i + ":";
            return $"{nameof(name)}:{name}\n{nameof(email)}:{email}\n{nameof(date)}:{date.Date.Day.ToString() + "." + date.Date.Month.ToString() + "." + date.Date.Year.ToString()}\n" +
                $"{nameof(pol)}:{pol.ToString()}\n" +
                $"{nameof(count_con)}:{count_con}\n{nameof(biograf)}:{biograf}\n" +
                $"{nameof(AWTC)}:{AWTC}\n" +
                $"{nameof(supers)}:{s}";


        }
    }
}
