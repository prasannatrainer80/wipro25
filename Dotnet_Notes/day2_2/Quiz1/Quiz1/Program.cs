using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz1
{
    interface IOne
    {
        void Name();
    }

    interface ITwo
    {
        void Name();
    }

    interface IThree
    {
        void Name();
    }

    class Test : IOne, ITwo, IThree
    {
        void IOne.Name()
        {
            Console.WriteLine("From Interface 1");
        }

        void ITwo.Name()
        {
            Console.WriteLine("From Interface 2");
        }

        void IThree.Name()
        {
            Console.WriteLine("From Interface 3");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            IOne obj1 = new Test();
            obj1.Name();
            ITwo obj2 = new Test();
            obj2.Name();
            IThree obj3 = new Test();
            obj3.Name();
        }
    }
}
