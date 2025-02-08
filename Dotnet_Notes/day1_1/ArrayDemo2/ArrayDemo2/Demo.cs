using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArrayDemo2
{
    class Demo
    {
        static void Main(string[] args)
        {
            int n;
            Console.WriteLine("Enter No.of Strings ");
            n = Convert.ToInt32(Console.ReadLine());
            string[] names = new string[n];
            Console.WriteLine("Enter {0} Strings",n);
            for(int i=0;i<n;i++)
            {
                names[i] = Console.ReadLine();
            }
            Console.WriteLine("Names are  ");
            foreach(string s in names)
            {
                Console.WriteLine(s);
            }
        }
    }
}
