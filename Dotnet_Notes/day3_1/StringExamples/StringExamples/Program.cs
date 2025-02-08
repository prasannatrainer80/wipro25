using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StringExamples
{
    class Program
    {
        static void Main(string[] args)
        {
            //string str = "Hello";
            //str.Concat(" World");
            //Console.WriteLine(str);
            string result = string.Concat("World");
            StringBuilder sb = new StringBuilder("Welcome to Dotnet");
            sb.Insert(5, "Girish");
            Console.WriteLine(sb);
            string s1 = "Anubhav", s2 = "Yash", s3 = "Anubhav", s4 = "Sakshi";
            Console.WriteLine(s1.GetHashCode());
            Console.WriteLine(s2.GetHashCode());
            Console.WriteLine(s3.GetHashCode());
            Console.WriteLine(s4.GetHashCode());
        }
    }
}
