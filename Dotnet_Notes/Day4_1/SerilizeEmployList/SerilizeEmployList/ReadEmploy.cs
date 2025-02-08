using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Threading.Tasks;

namespace SerilizeEmployList
{
    class ReadEmploy
    {
        static void Main()
        {
            FileStream fs = new FileStream("d:/files/EmployList.txt", FileMode.Open, FileAccess.Read);
            BinaryFormatter binf = new BinaryFormatter();
            List<Employ> employList = (List<Employ>)binf.Deserialize(fs);
            foreach(Employ employ in employList)
            {
                Console.WriteLine(employ);
            }
        }
    }
}
