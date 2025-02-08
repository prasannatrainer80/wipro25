using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz3
{
    class Program
    {
        static void Main(string[] args)
        {
            Employ e1 = new Employ(1, "Yash", 99422);
            Employ e2 = new Employ(1, "Yash", 99422);
            Console.WriteLine(e1==e2);
            Console.WriteLine(e1.Equals(e2));
        }
    }
}
