using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FactorsEx
{
    class Factors
    {
        public void Show(int n)
        {
            for(int i=1;i<=n;i++)
            {
                if (n%i==0)
                {
                    Console.WriteLine("Factor  " +i);
                }
            }
        }
        static void Main(string[] args)
        {
            int n;
            Console.WriteLine("Enter N value   ");
            n = Convert.ToInt32(Console.ReadLine());
            Factors obj = new Factors();
            obj.Show(n);
        }
    }
}
