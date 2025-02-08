using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CaseDemo2
{
    class Demo
    {
        public void Show(string dayName)
        {
            switch(dayName)
            {
                case "Sun":
                    Console.WriteLine("Its Sunday...");
                    break;
                case "Mon":
                    Console.WriteLine("Its Monday...");
                    break;
                case "Tue":
                    Console.WriteLine("Its Tuesday...");
                    break;
                case "Wed":
                    Console.WriteLine("Its Wednesday...");
                    break;
                case "Thu":
                    Console.WriteLine("Its Thursday...");
                    break;
                case "Fri":
                    Console.WriteLine("Its Friday...");
                    break;
                case "Sat":
                    Console.WriteLine("Its Saturday...");
                    break;
                default:
                    Console.WriteLine("Invalid Choice...");
                    break;
            }
        }
        static void Main(string[] args)
        {
            string dayName;
            Console.WriteLine("Enter First 3 chars of DayName   ");
            dayName = Console.ReadLine();
            Demo obj = new Demo();
            obj.Show(dayName);
        }
    }
}
