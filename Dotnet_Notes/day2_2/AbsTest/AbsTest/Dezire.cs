using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AbsTest
{
    class Dezire : Vehicle
    {
        public override void Model()
        {
            Console.WriteLine("Its Zxi Model...");
        }

        public override void Type()
        {
            Console.WriteLine("Its 4 wheeler...");
        }
    }
}
