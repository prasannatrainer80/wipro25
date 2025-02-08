using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz1
{
    class Ex2
    {
        static void Main()
        {
            try
            {
                throw new ArithmeticException("error...");
            } 
            catch(ArithmeticException e)
            {
                Console.WriteLine("Sakshi");
            }
            catch(Exception e)
            {
                Console.WriteLine("Bhavya");
            }
        }
    }
}
