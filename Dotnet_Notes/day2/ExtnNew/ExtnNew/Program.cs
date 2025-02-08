using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExtnNew
{
    static class Demo
    {
        public static void Anubhav(this string s)
        {
            Console.WriteLine("Hi I am Anubhav...");
        }

        public static void Prajwal(this string s)
        {
            Console.WriteLine("Hi I am Prajwal...");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            string s = "hello";
            s.Anubhav();
            s.Prajwal();
        }
    }
}
