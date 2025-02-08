using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessModifiers
{
    class Demo
    {
        private string name = "Anubhav";
        public string student = "Sachin";
        internal string topic = "Dotnet Training";
        protected string city = "Bangalore";
        protected internal string domain = "Asp.net MVC Training";

        private void Show()
        {
            Console.WriteLine(name);
            Console.WriteLine(student);
            Console.WriteLine(topic);
            Console.WriteLine(city);
            Console.WriteLine(domain);
        }
    }
}
