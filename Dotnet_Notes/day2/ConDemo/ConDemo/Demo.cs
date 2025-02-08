using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConDemo
{
    class Demo
    {
        static Demo()
        {
            Console.WriteLine("Static Constructor...");
        }

        public Demo()
        {
            Console.WriteLine("Instance Constructor...");
        }
        static void Main(string[] args)
        {
            Demo obj = new Demo();
        }
    }
}
