using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployEntity
{
    [Serializable]
    public class Employ
    {
        public int Empno { get; set; }
        public string Name { get; set; }
        public string Dept { get; set; }
        public string Desig { get; set; }
        public int Basic { get; set; }

        public override string ToString()
        {
            return "Employ No  " + Empno + " Name " + Name + " Department " + Dept + " Desig  " + Desig + " Basic " + Basic;
        }
    }
}
