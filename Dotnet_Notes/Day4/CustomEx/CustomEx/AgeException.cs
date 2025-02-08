using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CustomEx
{
    class AgeException : ApplicationException
    {
        public AgeException(string error) : base(error) { }
    }
}
