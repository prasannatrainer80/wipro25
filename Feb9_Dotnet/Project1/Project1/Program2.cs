using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project1
{
    internal class Program2
    {
        public void ShowNames()
        {
            List<string> names = new List<string>();
            names.Add("Rajesh");
            names.Add("Manoj");
            names.Add("Srikar");
            names.Add("Nalini");

            foreach (string name in names)
            {
                Console.WriteLine(name);
            }
        }

        static void Main()
        {
            Program2 obj = new Program2(); 
            obj.ShowNames();
        }
    }
}
