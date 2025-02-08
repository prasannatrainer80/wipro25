using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Threading.Tasks;

namespace SerilizeEmployList
{
    class Program
    {
        static void Main(string[] args)
        {
            List<Employ> employList = new List<Employ>()
            {
                new Employ{Empno=1,Name="Mani",Basic=94222},
                new Employ{Empno=2,Name="Bhavya",Basic=92242},
                new Employ{Empno=3,Name="Chanpreet",Basic=58864}
            };

            FileStream fs = new FileStream("d:/files/EmployList.txt", FileMode.Create, FileAccess.Write);
            BinaryFormatter binf = new BinaryFormatter();
            binf.Serialize(fs, employList);
            Console.WriteLine("Objects Stored In File...");
        }
    }
}
