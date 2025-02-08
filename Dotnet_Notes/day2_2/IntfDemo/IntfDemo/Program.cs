using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntfDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            ITraining[] arr = new ITraining[]
            {
                new Anubhav(),new Sachin()
            };

            foreach(ITraining i in arr)
                {
                i.Name();
                i.Email();
            }
        }
    }
}
