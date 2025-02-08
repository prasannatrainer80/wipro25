using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using clsMainProject;
using System.Threading.Tasks;

namespace clsAccessModifiers
{
    public class NewTest
    {
        public void Show()
        {
            Demo obj = new Demo();
            Console.WriteLine(obj.student);
        }
    }
}
