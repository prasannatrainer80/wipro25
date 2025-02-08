using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntfDemo
{
    class Anubhav : ITraining
    {
        public void Email()
        {
            Console.WriteLine("Email is Anubhav@gmail.com");
        }

        public void Name()
        {
            Console.WriteLine("Name is Anuhav...");
        }
    }
}
