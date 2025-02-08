using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Threading.Tasks;

namespace SerilizationExample
{
    class Program
    {
        static void Main(string[] args)
        {
            Employ employ = new Employ();
            employ.Empno = 1;
            employ.Name = "Hari Prasad";
            employ.Basic = 99422;

            FileStream fs = new FileStream("d:/files/EmployNew.txt", FileMode.Create, FileAccess.Write);
            BinaryFormatter binformatter = new BinaryFormatter();
            binformatter.Serialize(fs, employ);
            Console.WriteLine("Objects Stored in the File...");
        }
    }
}
