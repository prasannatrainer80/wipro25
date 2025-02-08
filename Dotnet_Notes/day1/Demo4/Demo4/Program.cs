using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo4
{
    class Program
    {
        static void Main(string[] args)
        {
            int age;
            Console.WriteLine("Enter Your Age   ");
          //  age = Console.ReadLine();
            age = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Age is   " +age);
        }
    }
}
