using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConEmploy
{
    class Program
    {
        static void Main(string[] args)
        {
            Employ e1 = new Employ();
            Console.WriteLine(e1);

            Employ e2 = new Employ(3, "Tamanna", 99224);
            Console.WriteLine(e2);

            Employ[] arr2 = new Employ[]
            {
                new Employ(1,"Tamanna",99923)
            };
            Employ[] arr = new Employ[]
            {
                new Employ(1,"Sachin",88234),
                new Employ(3,"Sakshi",98723),
                new Employ(4,"Prajwal",94224)
            };

            Employ arrEmploy = new Employ(arr);

            arrEmploy.Show();

            Employ emp1 = new Employ(arr2);
            emp1.Show();
        }
    }
}
