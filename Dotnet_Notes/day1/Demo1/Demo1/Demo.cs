using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo1
{
    class Data
    {
        public void Ashwin()
        {
            Console.WriteLine("Hi I am Ashwin...");
        }

        internal void Harshit()
        {
            Console.WriteLine("Hi I am Harshit...");
        }

        private void Anubhav()
        {
            Console.WriteLine("Hi I am Anubhav...");
        }
    }
    class Demo
    {
        static void Main(string[] args)
        {
            Data obj = new Data();
            obj.Ashwin();
            obj.Harshit();
        }
    }
}
