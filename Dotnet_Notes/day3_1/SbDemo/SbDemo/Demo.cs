using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SbDemo
{
    class Employ
    {
        public int Empno { get; set; }
        public string Name { get; set; }
        public double Basic { get; set; }

        public override string ToString()
        {
            return "Empno " + Empno + " Name " + Name + " Basic " + Basic;
        }
    }
    class Demo
    {
        static StringBuilder sb = new StringBuilder();

        public void AddEmploy()
        {
            Employ employ = new Employ();
            Console.WriteLine("Enter Employ No  ");
            employ.Empno = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Name  ");
            employ.Name = Console.ReadLine();
            Console.WriteLine("Enter Basic " );
            employ.Basic = Convert.ToDouble(Console.ReadLine());
            bool isValid = true;
            if (employ.Empno <= 0)
            {
                sb.Append("Invalid Employ No\r\n");
                isValid = false;
            } 
            if (employ.Name.Length < 3)
            {
                sb.Append("Invalid Name\r\n");
                isValid = false;
            }
            if (employ.Basic <= 0)
            {
                sb.Append("Invalid Basic\r\n");
                isValid = false;
            }
            if (isValid==true)
            {
                Console.WriteLine(employ);
            }
            else
            {
                Console.WriteLine(sb);
            }
        }
        static void Main(string[] args)
        {
            new Demo().AddEmploy();
        }
    }
}
