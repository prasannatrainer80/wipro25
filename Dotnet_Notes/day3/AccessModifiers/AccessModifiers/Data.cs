using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessModifiers
{
    class Data : Demo
    {
        public void Test()
        {
            Data obj = new Data();
            Console.WriteLine(obj.student);
            Console.WriteLine(obj.city);
            Console.WriteLine(obj.domain);
            Console.WriteLine(obj.topic);
           
        }
    }
}
