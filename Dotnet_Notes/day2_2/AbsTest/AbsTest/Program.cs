using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AbsTest
{
    class Program
    {
        static void Main(string[] args)
        {
            Vehicle[] arr = new Vehicle[]
            {
                new Dezire(),
                new Glamor()
            };

            foreach(Vehicle v in arr)
            {
                v.Manufacturer();
                v.Model();
                v.Type();
            }

           
        }
    }
}
