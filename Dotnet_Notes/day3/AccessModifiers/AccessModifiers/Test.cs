using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessModifiers
{
    class Test
    {
        public void Show()
        {
            Demo obj = new Demo();
            Console.WriteLine(obj.student);
            Console.WriteLine(obj.topic);
            Console.WriteLine(obj.domain);
        }
    }
}
