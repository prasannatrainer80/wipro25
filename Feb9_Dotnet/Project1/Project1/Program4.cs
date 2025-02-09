using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project1
{
    internal class Program4
    {
        static void Main()
        {
            string s1 = "Hello ";
            s1.Concat("World");
            Console.WriteLine(s1);

            StringBuilder sb = new StringBuilder("Hello ");
            sb.Append("World");
            Console.WriteLine(sb);
        }
    }
}
