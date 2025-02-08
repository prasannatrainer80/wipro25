using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FactorialExample
{
    class Demo
    {
        public void Calc(int n)
        {
            int f = 1;
            while (n >=1)
            {
                f = f * n;
                n--;
            }
            Console.WriteLine("Factorial is  " +f);
        }
        static void Main(string[] args)
        {
            int n;
            Console.WriteLine("Enter N value   ");
            n = Convert.ToInt32(Console.ReadLine());
            Demo obj = new Demo();
            obj.Calc(n);
        }
    }
}
