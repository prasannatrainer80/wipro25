using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExtensionExample
{
    static class Example
    {
        public static int Mult(this Calculation obj, int a,int b)
        {
            return a * b;
        }
    }
}
