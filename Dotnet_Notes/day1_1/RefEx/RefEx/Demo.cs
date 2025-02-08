using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RefEx
{
    class Demo
    {
        public void Incr(ref int x)
        {
            x++;
        }
        static void Main(string[] args)
        {
            int n = 12;
            Demo obj = new Demo();
            obj.Incr(ref n);
            Console.WriteLine("N value  " +n);
        }
    }
}
