using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SealedExample
{
    sealed class Admin
    {
        public void Timing()
        {
            Console.WriteLine("From 9 to 6");
        }

        public void Trainer()
        {
            Console.WriteLine("Trainer Girish...");
        }
    }

    

    abstract class Hr
    {

        public abstract void Show();
    }

    class Pranitha : Hr
    { 

        public override void Show()
        {
            Console.WriteLine("Hello");
        }
    }

    class Demo : Pranitha
    {
        public override void Show()
        {
            Console.WriteLine("Hi");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
        }
    }
}
