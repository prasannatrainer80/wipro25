using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project1
{
    internal class Ex2
    {
        public void Check(int n)
        {
            if (n < 0)
            {
                throw new DivideByZeroException("Negative nos Not Allowed...");
            } else if (n == 0)
            {
                throw new FormatException("Zero is Invalid Value...");
            } else
            {
                Console.WriteLine("N value is  " +n);
            }
        }
        static void Main()
        {
            Ex2 obj = new Ex2();
            try
            {
                obj.Check(0);
            }
            catch (FormatException e)
            {
                Console.WriteLine(e.Message);
            }
            catch (DivideByZeroException e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}
