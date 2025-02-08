using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz1
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] a = new int[] { 1, 2, 3, 4 };
            int x, y;
            x = 5;
            y = 0;
            try
            {
                a[5] = x / y;
            }
            catch(IndexOutOfRangeException e)
            {
                Console.WriteLine("HI");
            }
            catch(DivideByZeroException e)
            {
                Console.WriteLine("Bye");
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                    
            }
        }
    }
}
