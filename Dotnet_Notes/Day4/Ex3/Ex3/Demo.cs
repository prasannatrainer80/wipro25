using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ex3
{
    class Demo
    {
        
        static void Main(string[] args)
        {
            int empno;
            Console.WriteLine("Enter Employ No  ");
            empno = Convert.ToInt32(Console.ReadLine());
            Employ employ = new Employ().Search(empno);
            try
            {
                employ.Show();
            }
            catch(NullReferenceException e)
            {
                Console.WriteLine("Employ Record Not Found...");
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
    }
}
