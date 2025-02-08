using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            Employ employ = new Employ();
            employ.Empno = 1;
            employ.Name = "Zaran Mohammad";
            employ.Basic = 99422;

            FileStream fs = new FileStream("d:/files/EmpTest.txt", FileMode.Create, FileAccess.Write);
            BinaryFormatter binf = new BinaryFormatter();
            binf.Serialize(fs, employ);
            Console.WriteLine("Employ Object Stored...");
            fs.Close();
        }
    }
}
