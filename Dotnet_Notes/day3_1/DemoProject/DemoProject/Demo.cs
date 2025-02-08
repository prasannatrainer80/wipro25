using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoProject
{
    class First
    {
        public void Show()
        {
            Console.WriteLine("Hi");
        }
    }

    class Second : First
    {
        public void Show()
        {
            Console.WriteLine("Bye");
        }
    }
class Demo {
    static void Main()
        {
            First obj1 = new First();
            Second obj2 = new Second();

            //First first = (First)obj2;
            //first.Show();
            Second second = (Second)obj1;

            //Second obj = new First();
            second.Show();
        }
    }
}
