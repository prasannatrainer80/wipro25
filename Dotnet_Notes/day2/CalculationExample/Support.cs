using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using clsCalculation;
using System.Threading.Tasks;

namespace CalculationExample
{
    static class Support
    {
        public static int Mult(this Calculation calc, int a,int b)
        {
            return a * b;
        }
    }
}
