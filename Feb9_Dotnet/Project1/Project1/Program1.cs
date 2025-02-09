using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project1
{
    internal class Program1
    {
        public void Swap<T>(ref T a, ref T b)
        {
            T t;
            t = a;
            a = b;
            b = t;
        }

        static void Main()
        {
            Program1 obj1 = new Program1();
            int a = 12, b = 13;
            obj1.Swap(ref a, ref b);
            Console.WriteLine("A value is " +a + " B value " +b);
            string s1 = "Aditya", s2 = "Ajay";
            Console.WriteLine("A value " +s1+ " B value " +s2);
            Program1 obj3 = new Program1();
            Boolean f1 = true, f2 = false;
            obj3.Swap(ref f1, ref f2);
            Console.WriteLine("Flag 1  " +f1+ " Flag 2  " +f2 );
        }
    }
}
