using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WriteOnly
{
    class Employ
    {
        int empno;
        string name;
        double basic;

        public int Empno
        {
            set
            {
                empno = value;
            }
        }

        public string Name
        {
            set
            {
                name = value;
            }
        }

        public double Basic
        {
            set
            {
                basic = value;
            }
        }

        public override string ToString()
        {
            return "Empno " + name + " Name  " + name + " Basic  " + basic;

        }
    }
}
