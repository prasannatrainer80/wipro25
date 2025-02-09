using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project1
{
    internal class Voting
    {
        public void Check(int age)
        {
            if (age < 18)
            {
                throw new VotingException("You are not Elligible for Voting...");
            }
            Console.WriteLine("You Can Vote...");
        }
        static void Main()
        {
            int age;
            Console.WriteLine("Enter Age  ");
            age = Convert.ToInt32(Console.ReadLine());
            Voting obj = new Voting();
            try
            {
                obj.Check(age);
            }
            catch (VotingException e)
            {
                Console.WriteLine(e.Message);
            }
            catch (Exception e)
            {
                Console.WriteLine($"{e.Message}");
            }
        }
    }
}
