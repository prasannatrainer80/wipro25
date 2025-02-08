using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PartialEx
{
    public partial class Employ
    {
       
        public void Display()
        {
            Console.WriteLine("Display Method from Class Employ...");
        }

        public override string ToString()
        {
            return "Employ No " + empno + " Name " + name + " Basic " + basic; 
        }
    }
}
