using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo5
{
    class Calculation
    {
        public void Sum(int a, int b)
        {
            int c = a + b;
            Console.WriteLine("Sum is   " +c);
        }

        public void Sub(int a, int b)
        {
            int c = a - b;
            Console.WriteLine("Sub is  " +c);
        }
        static void Main(string[] args)
        {
            int a, b;
            Console.WriteLine("Enter 2 Numbers   ");
            a = Convert.ToInt32(Console.ReadLine());
            b = Convert.ToInt32(Console.ReadLine());
            Calculation obj = new Calculation();
            obj.Sum(a, b);
            obj.Sub(a, b);
        }
    }
}
