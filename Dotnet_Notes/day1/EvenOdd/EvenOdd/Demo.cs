using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EvenOdd
{
    class Demo
    {
        public void Check(int n)
        {
            if (n%2==0)
            {
                Console.WriteLine("Even Number...");
            }    
            else
            {
                Console.WriteLine("Odd Number...");
            }
        }
        static void Main(string[] args)
        {
            int n;
            Console.WriteLine("Enter N value  ");
            n = Convert.ToInt32(Console.ReadLine());
            Demo obj = new Demo();
            obj.Check(n);
        }
    }
}
