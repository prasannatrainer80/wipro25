using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExtnTest
{
    static class Support
    {
        public static string PosNeg(this Operations ob, int n)
        {

            if (n>=0)
            {
                return "Positive";
            }
            else
            {
                return "Negative";
            }
        }
    }
}
