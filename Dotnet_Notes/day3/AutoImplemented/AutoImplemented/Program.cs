using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoImplemented
{
    class Program
    {
        static void Main(string[] args)
        {
            Employ employ = new Employ();
            employ.Empno = 1;
            employ.Name = "Saurabh";
            employ.Basic = 99922;

            Console.WriteLine(employ.Empno);
            Console.WriteLine(employ.Name);
            Console.WriteLine(employ.Basic);
        }
    }
}
