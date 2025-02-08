using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz1
{
    class Ex1
    {
        static void Main()
        {
           
            try
            {
                throw new ArithmeticException("Hi");
            } catch (Exception e)
            {
                Console.WriteLine("Hello");
            }
        }
    }
}
