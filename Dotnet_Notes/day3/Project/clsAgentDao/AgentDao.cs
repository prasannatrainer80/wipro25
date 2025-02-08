using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using clsAgent;
using System.Threading.Tasks;

namespace clsAgentDao
{
    public class AgentDao
    {
        static List<Agent> agentList;

        static AgentDao()
        {
            agentList = new List<Agent>();
        }

        public string DeleteAgent(int agentId)
        {
            Agent agentFound = SearchAgent(agentId);
            if (agentFound!=null)
            {
                agentList.Remove(agentFound);
                return "Agent Record Deleted...";
            }
            return "Agent Record Not Found...";
        }
        public Agent SearchAgent(int agentId)
        {
            Agent agentFound = null;
            foreach(Agent agent in agentList)
            {
                if (agent.AgentId == agentId)
                {
                    agentFound = agent;
                }
            }
            return agentFound;
        }
        public string AddAgent(Agent agent)
        {
            agentList.Add(agent);
            return "Agent Added...";
        }

        public List<Agent> ShowAgent()
        {
            return agentList;
        }
    }
}
