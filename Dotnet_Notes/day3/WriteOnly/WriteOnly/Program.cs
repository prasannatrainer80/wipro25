using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WriteOnly
{
    class Program
    {
        static void Main(string[] args)
        {
            Employ employ = new Employ();
            employ.Empno = 1;
            employ.Name = "Yash";
            employ.Basic = 88422;

         //   Console.WriteLine(employ.Empno);

            Console.WriteLine(employ);
        }
    }
}
