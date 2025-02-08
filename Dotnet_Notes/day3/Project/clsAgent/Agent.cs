using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace clsAgent
{
    public class Agent
    {
        public int AgentId { get; set; }
        public string AgentName { get; set; }
        public Gender gender { get; set; }
        public double Premium { get; set; }
        public double Installment { get; set; }

        public override string ToString()
        {
            return "Agent Id " + AgentId + " Agent Name " + AgentName + " Gender " + gender
                + " Premium " + Premium + " Installment  " + Installment;
        }
    }

    
}
