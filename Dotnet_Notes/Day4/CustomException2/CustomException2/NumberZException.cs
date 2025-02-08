using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CustomException2
{
    public class NumberZException : ApplicationException
    {
        public NumberZException(string error) : base(error) { }
    }
}
