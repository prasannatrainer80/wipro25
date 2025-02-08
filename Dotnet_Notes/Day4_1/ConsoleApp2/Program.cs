using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Threading.Tasks;

namespace ConsoleApp2
{
    class Program
    {
        static void Main(string[] args)
        {
            FileStream fs = new FileStream("d:/files/EmpTest.txt", FileMode.Open, FileAccess.Read);
            BinaryFormatter binf = new BinaryFormatter();
            Employ employ = (Employ)binf.Deserialize(fs);
            Console.WriteLine(employ);
        }
    }
}
