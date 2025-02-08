using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArrayEx
{
    class Demo
    {
        static void Main(string[] args)
        {
            int[] a = new int[] { 12, 5 };
            try
            {
                a[10] = 95;
            }
            catch(IndexOutOfRangeException e)
            {
                Console.WriteLine("Array Size is Small...");
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
    }
}
