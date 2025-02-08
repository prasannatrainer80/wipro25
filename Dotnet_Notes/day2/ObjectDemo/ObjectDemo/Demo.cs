using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ObjectDemo
{
    class Demo
    {
        static void Main(string[] args)
        {
            int a = 12;
            double b = 12.5;
            string name = "Hello";

            /* Implementing Boxing */
            object ob1 = a;
            object ob2 = b;
            object ob3 = name;

            /* Implemeting Unboxing */
            int x = (Int32)ob1;
            double y = (Double)ob2;
            string str = (string)ob3;

            Console.WriteLine("X value is  " +x);
            Console.WriteLine("Y value is  " +y);
            Console.WriteLine("Name is  " +str);
        }
    }
}
