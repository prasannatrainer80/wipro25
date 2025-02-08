using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading.Tasks;

namespace FileExamples
{
    class Demo
    {
        static void Main(string[] args)
        {
            FileStream fs = new FileStream(@"C:\dotnet_cg\Day4\Layered\EmployProject\EmployProject\Program.cs",
                FileMode.Open,FileAccess.Read);
            StreamReader sr = new StreamReader(fs);
            sr.BaseStream.Seek(0, SeekOrigin.Begin);
            string str = string.Empty;
            while((str=sr.ReadLine()) !=null)
            {
                Console.WriteLine(str);
            }
            sr.Close();
            fs.Close();
        }
    }
}
