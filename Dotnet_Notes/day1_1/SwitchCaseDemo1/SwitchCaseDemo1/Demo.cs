using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwitchCaseDemo1
{
    class Demo
    {
        public void Show(int choice)
        {
            switch(choice)
            {
                case 1:
                    Console.WriteLine("Hi I am Anubhav...");
                    break;
                case 2:
                    Console.WriteLine("Hi I am Tamanna Gupta...");
                    break;
                case 3:
                    Console.WriteLine("Hi I am Hari Prasad...");
                    break;
                case 4:
                    Console.WriteLine("HI I am Rohit...");
                    break;
                case 5:
                    Console.WriteLine("Hi I am Sakshi...");
                    break;
                default:
                    Console.WriteLine("Invalid Choice...");
                    break;
            }
        }
        static void Main(string[] args)
        {
            int choice;
            Console.WriteLine("Enter Your Choice   ");
            choice = Convert.ToInt32(Console.ReadLine());
            Demo obj = new Demo();
            obj.Show(choice);
        }
    }
}
