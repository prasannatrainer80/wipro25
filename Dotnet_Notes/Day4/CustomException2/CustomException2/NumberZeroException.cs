using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CustomException2
{
    public class NumberZeroException : ApplicationException
    {
        public NumberZeroException(string error) : base(error) { }
    }
}
