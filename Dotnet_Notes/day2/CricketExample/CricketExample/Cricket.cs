using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CricketExample
{
    class Cricket
    {
        static int score;
        public void Incr(int x)
        {
            score += x;
        }
        static void Main(string[] args)
        {
            Cricket fb = new Cricket();
            Cricket sb = new Cricket();
            Cricket ext = new Cricket();

            fb.Incr(52);
            sb.Incr(12);
            ext.Incr(3);

            Console.WriteLine("Total Score  " +Cricket.score);
        }
    }
}
