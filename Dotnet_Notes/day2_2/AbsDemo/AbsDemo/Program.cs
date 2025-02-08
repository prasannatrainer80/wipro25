using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AbsDemo
{
    
    class Program
    {
        static void Main(string[] args)
        {
            Training[] arr = new Training[]
            {
                new Anubhav(),
                new Tanmay(),
                new Sachin()
            };

            foreach(Training t in arr)
            {
                t.Name();
                t.Email();
            }
        }
    }
}
