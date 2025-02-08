using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StaticDemo
{
    static class Example
    {
        public static void Show()
        {
            Console.WriteLine("From Show method...");
        }

        public static void Display()
        {
            Console.WriteLine("From Display Method...");
        }
    }
    class Demo
    {
        static void Main(string[] args)
        {
            Example.Show();
            Example.Display();
        }
    }
}
