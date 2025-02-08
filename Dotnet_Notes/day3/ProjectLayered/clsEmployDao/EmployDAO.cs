using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using clsEmploy;
using System.Threading.Tasks;

namespace clsEmployDao
{
    public class EmployDAO
    {
        static List<Employ> employList;

        static EmployDAO()
        {
            employList = new List<Employ>();
        }

        public string AddEmploy(Employ employ)
        {
            employList.Add(employ);
            return "Record Added...";
        }

        public List<Employ> ShowEmploy()
        {
            return employList;
        }
    }
}
