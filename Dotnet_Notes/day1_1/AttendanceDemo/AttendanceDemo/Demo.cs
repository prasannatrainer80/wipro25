using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AttendanceDemo
{
    class Demo
    {
        public void Show(params string[] names)
        {
            foreach(string s in names)
            {
                Console.Write(s+ "  ");
            }
            Console.WriteLine();
        }
        static void Main(string[] args)
        {
            Demo obj = new Demo();
            obj.Show();
            obj.Show("Ashwin");
            obj.Show("Ashwin", "Chanpreet");
            obj.Show("Manish", "Ashwin", "Chanpreet");
            obj.Show("Manish", "Sandra", "Sashwat", "Prajjwal");
        }
    }
}
