using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StaticExample
{
    class Demo
    {
        static int count;
        public void Increment()
        {
            count++;
        }

        public void Show()
        {
            Console.WriteLine(count);
        }
        static void Main(string[] args)
        {
            Demo obj1 = new Demo();
            Demo obj2 = new Demo();
            Demo obj3 = new Demo();
            obj1.Increment();
            obj2.Increment();
            obj3.Increment();
            obj1.Show();
        }
    }
}
