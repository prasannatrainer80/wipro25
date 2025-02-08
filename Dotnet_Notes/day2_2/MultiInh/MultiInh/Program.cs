using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MultiInh
{
    interface IOne
    {
        void Name();
    }

    interface ITwo
    {
        void Email();
    }

    class Demo : IOne, ITwo
    {
        public void Email()
        {
            Console.WriteLine("From Demo class");
        }

        public void Name()
        {
            Console.WriteLine("Welcome to Multiple Inheritance");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Demo obj = new Demo();
            obj.Name();
            obj.Email();
        }
    }
}
