using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NamedParams
{
    class Demo
    {
       // Demo demo = new Demo();
        public void Show(string firstName,string lastName, string city, string state)
        {
            Console.WriteLine("First Name " +firstName);
            Console.WriteLine("Last Name " +lastName);
            Console.WriteLine("City  " +city);
            Console.WriteLine("State  " +state);
        }
        static void Main(string[] args)
        {
          
            Demo obj = new Demo();
            // obj.Show("Telangana", "Nalgonda", "Hari", "Prasad");
            obj.Show(state: "Telangana", city: "Nalgonda", firstName: "Hari", lastName: "Prasad");
        }
    }
}
