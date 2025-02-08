using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PartialEx
{
    public partial class Employ
    {
        int empno;
        string name;
        double basic;
        public void Show()
        {
            Console.WriteLine("Show Method from Class Employ...");
        }

       
    }
    class Program
    {
        static void Main(string[] args)
        {
            Employ obj = new Employ();
            obj.Show();
            obj.Display();
        }
    }
}
