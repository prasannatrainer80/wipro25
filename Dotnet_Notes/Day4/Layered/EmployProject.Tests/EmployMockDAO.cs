using EmployEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployProject.Tests
{
    class EmployMockDAO : IEmployDAO
    {
        public List<Employ> ShowEmploy()
        {
            List<Employ> employList = new List<Employ>()
            {
                new Employ{Empno=1,Name="Prathyusha",Dept="Dotnet",Desig="Programmer",Basic=83834},
                new Employ{Empno=2,Name="Rohith",Dept="Dotnet",Desig="Manager",Basic=88354},
                new Employ{Empno=3,Name="Tamanna",Dept="Dotnet",Desig="Expert",Basic=8834},
            };
            return employList;
        }
    }
}
