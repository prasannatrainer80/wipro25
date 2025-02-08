using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestExample
{
    class Program
    {
        static void Main(string[] args)
        {
            Employ[] arrEmploy = new Employ[]
            {
                new Accounts(1,"Krishna",95922),
                new Hr(2,"Raghu",99422),
                new Accounts(3,"Goutham",99924),
                new Hr(4,"Ram",99422),
                new Accounts(5,"Radha",91133),
                new Hr(6,"Agni",99224)
            };

            foreach(Employ e in arrEmploy)
            {
                if (e is Accounts)
                {
                    Console.WriteLine(e);
                }
            }
        }
    }
}
