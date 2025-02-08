using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz1
{
    class Demo
    {
        int n;
        static void Main(string[] args)
        {
            Demo obj1 = new Demo();
            obj1.n = 12;
            Demo obj2 = obj1;
            obj2.n = 13;
            Console.WriteLine(obj1.n);
            Console.WriteLine(obj1.GetHashCode());
            Console.WriteLine(obj2.GetHashCode());
        }
    }
}
