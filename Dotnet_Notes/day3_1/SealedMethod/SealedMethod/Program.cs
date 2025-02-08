using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SealedMethod
{
    abstract class Demo
    {
        public abstract void Show();
    }

    class Test : Demo
    {
        public sealed override void Show()
        {
            Console.WriteLine("From Test...");
        }
    }

    class Data : Test
    {
        public override void Show()
        {
            Console.WriteLine("From Test...");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
        }
    }
}
