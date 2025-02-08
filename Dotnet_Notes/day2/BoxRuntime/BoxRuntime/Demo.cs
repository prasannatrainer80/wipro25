using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BoxRuntime
{
    class Demo
    {
        public void Show(object ob)
        {
          //  Console.WriteLine(ob.GetType());
            string type = ob.GetType().Name;
          //  Console.WriteLine(type);
           if (type.Equals("Int32"))
            {
                Console.WriteLine("Integer Casting...");
                int x = (Int32)ob;
                Console.WriteLine(x);
            }
           if (type.Equals("Double"))
            {
                Console.WriteLine("Double Casting...");
                double x = (Double)ob;
                Console.WriteLine(x);
            }
           if (type.Equals("String"))
            {
                Console.WriteLine("String Casting...");
                string x = (string)ob;
                Console.WriteLine(x);
            }
        }
        static void Main(string[] args)
        {
            int x = 12;
            double y = 12.5;
            string name = "Hello";
            Demo obj = new Demo();
            obj.Show(x);
            obj.Show(y);
            obj.Show(name);
        }
    }
}
