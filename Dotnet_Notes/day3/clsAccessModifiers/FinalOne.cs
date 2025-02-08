using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using clsMainProject;
using System.Threading.Tasks;

namespace clsAccessModifiers
{
    class FinalOne : Demo
    {
        public void Show()
        {
            FinalOne obj = new FinalOne();
            Console.WriteLine(obj.city);
            Console.WriteLine(obj.domain);
            Console.WriteLine(obj.student);
        }
    }
}
