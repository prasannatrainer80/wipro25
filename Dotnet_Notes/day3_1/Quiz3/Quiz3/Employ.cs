﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz3
{
    public class Employ
    {
        int empno;
        string name;
        double basic;

        public override bool Equals(object obj)
        {
           Employ employ = (Employ)obj;
          if (employ.basic==basic && employ.name==name && employ.empno==empno)
          {
                return true;
            }
          return false;
        }

        public Employ(int empno,string name, double basic)
        {
            this.empno = empno;
            this.name = name;
            this.basic = basic;
        }

        public override string ToString()
        {
            return "Employ No " + empno + " Name  " + name + " Basic " + basic;
        }
    }
}
