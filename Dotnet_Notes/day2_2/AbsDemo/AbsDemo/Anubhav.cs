using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AbsDemo
{
    class Anubhav : Training
    {
        public override void Email()
        {
            Console.WriteLine("Email is anubhav@gmail.com");
        }

        public override void Name()
        {
            Console.WriteLine("Name is Anubhav...");
        }
    }
}
