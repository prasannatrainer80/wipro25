using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using clsCalculation;
using System.Threading.Tasks;

namespace CalculationExample
{
    class Program
    {
        static void Main(string[] args)
        {
            int a, b, c;
            Console.WriteLine("Enter 2 Numbers ");
            a = Convert.ToInt32(Console.ReadLine());
            b = Convert.ToInt32(Console.ReadLine());
            Calculation obj = new Calculation();
            Console.WriteLine(obj.Sum(a,b));
            Console.WriteLine(obj.Sub(a,b));
            Console.WriteLine(obj.Mult(a,b));
        }
    }
}
