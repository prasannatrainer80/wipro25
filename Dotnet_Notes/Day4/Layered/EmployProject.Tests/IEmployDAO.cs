using System;
using System.Collections.Generic;
using System.Linq;
using EmployEntity;
using System.Text;
using System.Threading.Tasks;

namespace EmployProject.Tests
{
    public interface IEmployDAO
    {
        List<Employ> ShowEmploy();
    }
}
