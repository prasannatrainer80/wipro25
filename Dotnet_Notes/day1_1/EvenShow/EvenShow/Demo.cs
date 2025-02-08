using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EvenShow
{
    /// <summary>
    /// Program to Print Even Numbers of Given range
    /// </summary>
    class Demo
    {
        #region ShowMethod
        public void Show(int n)
        {
            int i = 0;
            while(i < n)
            {
                i += 2;
                Console.WriteLine("Even  " +i);
            }
        }

        #endregion ShowMethod

        static void Main(string[] args)
        {
            int n;
            Console.WriteLine("Enter N value  ");
            n = Convert.ToInt32(Console.ReadLine());
            Demo obj = new Demo();
            obj.Show(n);
        }
       
    }
}
