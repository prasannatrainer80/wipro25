using System;
using System.Collections.Generic;
using System.Linq;
using clsAgent;
using clsAgentDao;
using System.Text;
using System.Threading.Tasks;

namespace ProjectLayered
{
    class Program
    {
        public static void DeleteAgent()
        {
            int agentId;
            Console.WriteLine("Enter Agent Id  ");
            agentId = Convert.ToInt32(Console.ReadLine());
            AgentDao dao = new AgentDao();
            Console.WriteLine(dao.DeleteAgent(agentId));
        }
        public static void SearchAgent()
        {
            int agentId;
            Console.WriteLine("Enter Agent Id  ");
            agentId = Convert.ToInt32(Console.ReadLine());
            AgentDao dao = new AgentDao();
            Agent agent = dao.SearchAgent(agentId);
            if (agent!=null)
            {
                Console.WriteLine(agent);
            } else
            {
                Console.WriteLine("Record Not Found...");
            }
        }
        public static void AddAgent()
        {
            Agent agent = new Agent();
            Console.WriteLine("Enter Agent Id  ");
            agent.AgentId = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter AgentName  ");
            agent.AgentName = Console.ReadLine();
            Console.WriteLine("Enter Gender ");
            string gen = Console.ReadLine().ToUpper();
            if (gen.Equals("MALE"))
            {
                agent.gender = Gender.Male;
            }
            if (gen.Equals("FEMALE"))
            {
                agent.gender = Gender.Female;
            }
            Console.WriteLine("Enter Premium   ");
            agent.Premium = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Enter Installment  ");
            agent.Installment = Convert.ToDouble(Console.ReadLine());
            AgentDao dao = new AgentDao();
            Console.WriteLine(dao.AddAgent(agent));
        }

        public static void ShowAgent()
        {
            AgentDao dao = new AgentDao();
            List<Agent> agentList = dao.ShowAgent();
            foreach(Agent agent in agentList)
            {
                Console.WriteLine(agent);
            }
        }
        static void Main(string[] args)
        {
            int choice;
            do
            {
                Console.WriteLine("O P T I O N S ");
                Console.WriteLine("1. Add Agent");
                Console.WriteLine("2. Show Agent");
                Console.WriteLine("3. Search Agent");
                Console.WriteLine("4. Delete Agent");
                Console.WriteLine("5. Exit");
                Console.WriteLine("Enter Your Choice  ");
                choice = Convert.ToInt32(Console.ReadLine());
                switch(choice)
                {
                    case 1:
                        AddAgent();
                        break;
                    case 2:
                        ShowAgent();
                        break;
                    case 3:
                        SearchAgent();
                        break;
                    case 4:
                        DeleteAgent();
                        break;
                    case 5:
                        return;
                    default:
                        Console.WriteLine("Invalid Choice...");
                        break;
                }
            } while (choice != 5);
        }
    }
}
