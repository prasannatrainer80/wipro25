using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConEx
{
    class Employ
    {
        int empno;
        string name;
        double basic;

        public override string ToString()
        {
            return "Employ No  " + empno + " Name  " + name + " Basic " + basic;
        }
        static void Main(string[] args)
        {
            Employ e1 = new Employ();
            e1.empno = 1;
            e1.name = "Anubhav";
            e1.basic = 99234;

            Console.WriteLine(e1);
            //Console.WriteLine("Employ No " +e1.empno);
            //Console.WriteLine("Employ Name " +e1.name);
            //Console.WriteLine("Basic  " +e1.basic);
        }
    }
}
