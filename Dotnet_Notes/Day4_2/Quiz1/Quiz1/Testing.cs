using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz1
{
    class Demo
    {
        static Demo()
        {
            Console.WriteLine("Good");
        }
    }
    class Testing
    {
        static Testing()
        {
            Console.WriteLine("Hi");
        }
        Testing()
        {
            Console.WriteLine("Bye");
        }
        static void Main()
        {
            new Testing();
        }
    }
}
