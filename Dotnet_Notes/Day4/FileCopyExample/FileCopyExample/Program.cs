using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace FileCopyExample
{
    class Program
    {
        static void Main(string[] args)
        {
            FileStream src = null;
          
            StreamReader sr = null;
            try
            {
                FileStream tar = new FileStream("d:/cpy.txt", FileMode.Create, FileAccess.Write);
                src = new FileStream(@"C:\dotnet_cg\Day4\Layered\EmployProject\EmployProject\Program.cs", FileMode.Open,
              FileAccess.Read);
                sr = new StreamReader(src);
                StreamWriter sw = new StreamWriter(tar);
                sr.BaseStream.Seek(0, SeekOrigin.Begin);

                string str = string.Empty;
                while ((str = sr.ReadLine()) != null)
                {
                    sw.WriteLine(str);
                }
                sr.Close();
                sw.WriteLine();
                Console.WriteLine("File Copied Successfully...");
            }
            catch(NullReferenceException e)
            {
                Console.WriteLine("object Not Initialized...");
            }
            catch(FileNotFoundException e)
            {
                Console.WriteLine("*** File Not Found ***");
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
          
        }
    }
}
