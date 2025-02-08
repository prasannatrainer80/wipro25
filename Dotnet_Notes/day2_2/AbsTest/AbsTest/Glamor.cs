using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AbsTest
{
    class Glamor : Vehicle
    {
        public override void Model()
        {
            Console.WriteLine("Its from 2021 Model...");
        }

        public override void Type()
        {
            Console.WriteLine("Its 2 wheeler...");
        }
    }
}
