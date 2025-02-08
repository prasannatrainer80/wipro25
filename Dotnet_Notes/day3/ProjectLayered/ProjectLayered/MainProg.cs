using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using clsEmploy;
using clsEmployDao;
using System.Threading.Tasks;

namespace ProjectLayered
{
    class MainProg
    {
        public static void AddEmploy()
        {
            Employ employ = new Employ();
            Console.WriteLine("Enter Employ No   ");
            employ.Empno = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Employ Name   ");
            employ.Name = Console.ReadLine();
            Console.WriteLine("Enter Gender   ");
            string gen = Console.ReadLine().ToUpper();
            if (gen.Equals("MALE"))
            {
                employ.gender = Gender.MALE;
            }
            if (gen.Equals("FEMALE"))
            {
                employ.gender = Gender.FEMALE;
            }
            Console.WriteLine("Enter Department  ");
            employ.Dept = Console.ReadLine();
            Console.WriteLine("Enter Designation  ");
            employ.Desig = Console.ReadLine();
            Console.WriteLine("Enter Basic   ");
            employ.Basic = Convert.ToInt32(Console.ReadLine());
            EmployDAO dao = new EmployDAO();
            Console.WriteLine(dao.AddEmploy(employ));
        }

        public static void ShowEmploy()
        {
            EmployDAO dao = new EmployDAO();
            List<Employ> employList = dao.ShowEmploy();
            foreach(Employ employ in employList)
            {
                Console.WriteLine(employ);
            }
        }
        static void Main(string[] args)
        {
            int choice;
            do
            {
                Console.WriteLine("O P T I O N S");
                Console.WriteLine("----------------");
                Console.WriteLine("1. Add Employ");
                Console.WriteLine("2. Show Employ");
                Console.WriteLine("3. Exit");
                Console.WriteLine("Enter Your Choice  ");
                choice = Convert.ToInt32(Console.ReadLine());
                switch(choice)
                {
                    case 1:
                        AddEmploy();
                        break;
                    case 2:
                        ShowEmploy();
                        break;
                    case 3:
                        return;
                    default:
                        Console.WriteLine("Invalid Choice");
                        break;
                }    
            } while (choice != 3);
        } 
    }
}
