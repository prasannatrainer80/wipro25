using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ex3
{
    class Employ
    {
        public int Empno { get; set; }
        public string Name { get; set; }
        public int Basic { get; set; }

        static List<Employ> employList;
        static Employ()
        {

            employList = new List<Employ>() {
                new Employ{Empno=1,Name="Sheelendra",Basic=42455},
                new Employ{Empno=3,Name="Tamanna",Basic=90542},
                new Employ{Empno=2,Name="Sakshi",Basic=91111},
                };
          
        }

        public Employ Search(int empno)
        {
            foreach(Employ employ in employList)
            {
                if (employ.Empno==empno)
                {
                    return employ;
                }
            }
            return null;
        }

        public void Show()
        {
            Console.WriteLine("Employ No  " +Empno);
            Console.WriteLine("Employ Name  " +Name);
            Console.WriteLine("Basic   " +Basic);
        }
    }
}
