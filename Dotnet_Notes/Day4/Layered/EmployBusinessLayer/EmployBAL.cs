using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Exceptions;
using EmployEntity;
using EmployDataLayer;
using System.Threading.Tasks;

namespace EmployBusinessLayer
{
    public class EmployBAL
    {
        static StringBuilder sb = new StringBuilder();

        static EmployDAL dal = new EmployDAL();
        public bool ValidateEmploy(Employ employ)
        {
            bool isValid = true;
            if (employ.Empno <= 0)
            {
                sb.Append("Employ No cannot be negative or zero...\r\n");
                isValid = false;
            }
            if (employ.Name.Length < 5)
            {
                sb.Append("Employ Name contains min. 5 characters...\r\n");
                isValid = false;
            }
            if (employ.Dept.Length < 5)
            {
                sb.Append("Employ Department Contains Min 5 characters...\r\n");
                isValid = false;
            }
            if (employ.Desig.Length < 5)
            {
                sb.Append("Employ Designation Contians Min 5 characters...\r\n");
                isValid = false;
            }
            if (employ.Basic < 1000)
            {
                sb.Append("Employ Basic Must be Greater than 1000...\r\n");
                isValid = false;
            }
            if (employ.Basic > 50000)
            {
                sb.Append("Employ Basic Cannot be Greater than 50000...\r\n");
                isValid = false;
            }
            return isValid;
        }

        public string ReadEmployFileBAL()
        {
            return dal.ReadEmployFileDAL();
        }
        public string WriteEmployFileBAL()
        {
            return dal.WriteEmployFileDAL();
        }
        public Employ SearchEmployBAL(int empno)
        {
            return dal.SeachEmployDAL(empno);
        }

        public string DeleteEmployDAL(int empno)
        {
            return dal.DeleteEmployDAL(empno);
        }
        public string AddEmployBAL(Employ employ)
        {
            if (ValidateEmploy(employ)==false)
            {
                throw new EmployException(sb.ToString());
            }
            else
            {
                return dal.AddEmployDAL(employ);
            }
        }

        public List<Employ> ShowEmployBAL()
        {
            return dal.ShowEmployDAL();
        }
    }
}
