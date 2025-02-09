using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project1
{
    internal class Program3
    {
        public void ShowEmploy()
        {
            List<Employ> employList = new List<Employ>();
            Employ employ1 = new Employ();
            employ1.Empno = 1;
            employ1.Name = "Keshav";
            employ1.Basic = 88234;

            Employ employ2 = new Employ();
            employ2.Empno = 2;
            employ2.Name = "Sudha";
            employ2.Basic = 88233;

            Employ employ3 = new Employ();
            employ3.Empno = 3;
            employ3.Name = "Pranav";
            employ3.Basic = 88422;

            employList.Add(employ1);
            employList.Add(employ2);
            employList.Add(employ3);

            Console.WriteLine("Employ List  ");
            foreach(Employ employ in employList)
            {
                Console.WriteLine("Employ No " +employ.Empno + 
                        " Employ Name " +employ.Name + 
                        " Employ Salary " +employ.Basic
                    );
            }
        }

        static void Main()
        {
            new Program3().ShowEmploy();
        }
    }
}
