using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AbsDemo
{
    class Tanmay : Training
    {
        public override void Email()
        {
            Console.WriteLine("Email is Tanmay@gmail.com");
        }

        public override void Name()
        {
            Console.WriteLine("Hi I am Tanmay...");
        }
    }
}
