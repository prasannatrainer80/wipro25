using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReadOnlyExample
{
    class Employ
    {
        int empno;
        string name;
        double basic;

        public Employ(int empno, string name, double basic)
        {
            this.empno = empno;
            this.name = name;
            this.basic = basic;
        }

        #region ReadOnly Properties
        public int Empno
        {
            get
            {
                return empno;
            }
        } 

        public string Name
        {
            get
            {
                return name;
            }
        }

        public double Basic
        {
            get
            {
                return basic;
            }
        }
        #endregion ReadOnly Properties
    }
}
