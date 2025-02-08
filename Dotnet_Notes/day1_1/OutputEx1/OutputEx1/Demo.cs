using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OutputEx1
{
    class Demo
    {
        public void Show(out int x)
        {
            x = 12;
        }
        static void Main(string[] args)
        {
            int x;
            Demo obj = new Demo();
            obj.Show(out x);
            Console.WriteLine("X value is  " +x);
        }
    }
}
