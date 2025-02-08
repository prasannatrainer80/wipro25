using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading.Tasks;

namespace FileExample2
{
    class Program
    {
        static void Main(string[] args)
        {
            FileStream fs = new FileStream("d:/demo.txt", FileMode.Create, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs);
            sw.WriteLine("Welcome to C#...");
            sw.WriteLine("Dotnet Files Concept Going On...");
            sw.Flush();
            Console.WriteLine("File Created Successfully...");
        }
    }
}
