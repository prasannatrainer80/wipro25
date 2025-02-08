using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenListDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            Employ[] arr = new Employ[]
            {
                new Employ{Empno=1,Name="Sachin",Basic=5422},
                new Employ{Empno=2,Name="Raj",Basic=99422}
            };
            List<object> data = new List<object>();
            List<Employ> employList = new List<Employ>();
            
            Employ employ1 = new Employ();
            employ1.Empno = 1;
            employ1.Name = "Yash";
            employ1.Basic = 99952;


            Employ employ2 = new Employ();
            employ2.Name = "Sakshi";
            employ2.Empno = 2;
            employ2.Basic = 99422;

            employList.Add(employ1);
            employList.Add(employ2);
            foreach(Employ employ in employList)
            {
                Console.WriteLine("Employ No   " +employ.Empno);
                Console.WriteLine("Employ Name "+employ.Name);
                Console.WriteLine("Basic   " +employ.Basic);
                Console.WriteLine("------------------------------");
            }
        }
    }
}
