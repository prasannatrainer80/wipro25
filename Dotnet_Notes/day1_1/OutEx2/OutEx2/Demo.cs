using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OutEx2
{
    class Demo
    {
        public void Show(int empno, out string name, out double basic)
        {
            name = string.Empty;
            basic = 0;
            if (empno == 1)
            {
                name = "Aman";
                basic = 94922;
            }
            else if (empno == 2)
            {
                name = "Anubhav";
                basic = 99422;
            }
            else if (empno == 3)
            {
                name = "Sakshi";
                basic = 99421;
            }
            else
            {
                name = "Not Found";
                basic = 0;
            }
        }
        static void Main(string[] args)
        {
            int empno;
            Console.WriteLine("Enter Employ No  ");
            empno = Convert.ToInt32(Console.ReadLine());
            Demo obj = new Demo();
            string name;
            double basic;
            obj.Show(empno, out name, out basic);
            Console.WriteLine("Name is  " +name);
            Console.WriteLine("Basic is  " +basic);
        }
    }
}
