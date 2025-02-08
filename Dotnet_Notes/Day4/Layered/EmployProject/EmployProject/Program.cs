using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EmployEntity;
using Exceptions;
using EmployBusinessLayer;
using System.Threading.Tasks;

namespace EmployProject
{
    class Program
    {
        static EmployBAL bal = new EmployBAL();
        public static void AddEmployMain()
        {
            Employ employ = new Employ();
            Console.WriteLine("Enter Employ No   ");
            employ.Empno = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Employ Name  ");
            employ.Name = Console.ReadLine();
            Console.WriteLine("Enter Department  ");
            employ.Dept = Console.ReadLine();
            Console.WriteLine("Enter Designation  ");
            employ.Desig = Console.ReadLine();
            Console.WriteLine("Enter Basic   ");
            employ.Basic = Convert.ToInt32(Console.ReadLine());
            bal.AddEmployBAL(employ);

        }

        public static void SearchEmployMain()
        {
            int empno;
            Console.WriteLine("Enter Employ No  ");
            empno = Convert.ToInt32(Console.ReadLine());
            Employ employ = bal.SearchEmployBAL(empno);
            if (employ!=null)
            {
                Console.WriteLine(employ);
            }
            else
            {
                Console.WriteLine("Record Not Found...");
            }
        }

        public static void DeleteEmployMain()
        {
            int empno;
            Console.WriteLine("Enter Employ No  ");
            empno = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine(bal.DeleteEmployDAL(empno));
        }
        public static void ShowEmployMain()
        {
            List<Employ> employList = bal.ShowEmployBAL();
            foreach(Employ employ in employList)
            {
                Console.WriteLine(employ);
            }
        }

        public static void ReadEmployFileMain()
        {
            bal.ReadEmployFileBAL();
        }
        public static void WriteEmployFileMain()
        {
            bal.WriteEmployFileBAL();
        }

        static void Main(string[] args)
        {
            int choice;
            do
            {
                Console.WriteLine("O P T I O N S ");
                Console.WriteLine("--------------");
                Console.WriteLine("1. Add Employ");
                Console.WriteLine("2. Show Employ");
                Console.WriteLine("3. Search Employ");
                Console.WriteLine("4. Delete Employ");
                Console.WriteLine("5. Write Employ");
                Console.WriteLine("6. Read Employ");
                Console.WriteLine("7. Exit");
                Console.WriteLine("Enter Your Choice   ");
                choice = Convert.ToInt32(Console.ReadLine());
                switch(choice)
                {
                    case 1:
                        try
                        {
                            AddEmployMain();
                        }
                        catch(EmployException e)
                        {
                            Console.WriteLine(e.Message);
                        }
                        catch (Exception e)
                        {
                            Console.WriteLine(e);
                        }
                        break;
                    case 2:
                        ShowEmployMain();
                        break;
                    case 3:
                        SearchEmployMain();
                        break;
                    case 4:
                        DeleteEmployMain();
                        break;
                    case 5:
                        WriteEmployFileMain();
                        break;
                    case 6:
                        ReadEmployFileMain();
                        break;
                    case 7:
                        return;
                }
            } while (choice != 7);
        }
    }
}
