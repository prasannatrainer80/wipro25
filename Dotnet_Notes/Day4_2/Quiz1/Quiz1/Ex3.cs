using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz1
{
    class Ex3
    {
        static Ex3()
        {
            try
            {
                throw new ArithmeticException("Hi");
            } catch(ArithmeticException e)
            {
                Console.WriteLine("Tricky");
            }
            
        }

        static void Main()
        {
            
        }
    }
}
