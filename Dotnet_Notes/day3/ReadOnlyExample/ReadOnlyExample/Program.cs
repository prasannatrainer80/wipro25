using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReadOnlyExample
{
    class Program
    {
        static void Main(string[] args)
        {
            Employ emp1 = new Employ(1, "Sachin", 99422);

           // emp1.Empno = 66;
            Console.WriteLine(emp1.Empno);
            Console.WriteLine(emp1.Name);
            Console.WriteLine(emp1.Basic);
        }
    }
}
