namespace ServiceExample1
{
    public class EmployDao
    {
        static List<Employ> employList;

        static EmployDao()
        {
            employList = new List<Employ>();
            Employ employ1 = new Employ();
            employ1.Empno = 1;
            employ1.Name = "Keshav";
            employ1.Dept = "Dotnet";
            employ1.Desig = "Programmer";
            employ1.Basic = 88234;

            Employ employ2 = new Employ();
            employ2.Empno = 2;
            employ2.Name = "Charan";
            employ2.Dept = "Java";
            employ2.Desig = "TeamLead";
            employ2.Basic = 91144;

            Employ employ3 = new Employ();
            employ3.Empno = 3;
            employ3.Name = "Rajaneesh";
            employ3.Dept = "Java";
            employ3.Desig = "Programmer";
            employ3.Basic = 90022;

            employList.Add(employ1);
            employList.Add(employ2);
            employList.Add(employ3);
        }

        public List<Employ> ShowEmployDao()
        {
            return employList;
        }

        public string AddEmployDao(Employ employ)
        {
           employList.Add(employ);
            return "Employ Record Inserted...";
        }
        public Employ? SearchEmployDao(int empno)
        {
            Employ? employ = employList.Where(x => x.Empno == empno).FirstOrDefault();
            return employ;
        }
    }
}
