using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExtnTest
{
    class Operations
    {
        public string EvenOdd(int x)
        {
            if (x%2==0)
            {
                return "Even";
            }
            else
            {
                return "Odd";
            }
        }
    }
}
