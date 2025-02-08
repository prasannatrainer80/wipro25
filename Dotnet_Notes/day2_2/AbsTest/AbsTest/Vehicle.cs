using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AbsTest
{
    abstract class Vehicle
    {
        public abstract void Type();
        public abstract void Model();
        public void Manufacturer()
        {
            Console.WriteLine("Its from Maruthi...");
        }
    }
}
