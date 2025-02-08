using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnumExample
{
    enum WeekDays
    {
        SUNDAY,MONDAY,TUESDAY,WEDNESDAY,THURSDAY,FRIDAY,SATURDAY
    }
    class Program
    {
        static void Main(string[] args)
        {
            WeekDays wd = WeekDays.FRIDAY;
            Console.WriteLine(wd);
            Console.WriteLine("Enter DayName ");
            string dayName = Console.ReadLine();
            dayName = dayName.ToUpper();
            WeekDays wd1 = (WeekDays) Enum.Parse(typeof(WeekDays), dayName);
            //WeekDays wd1 =(WeekDays) Enum.Parse(typeof(WeekDays), dayName);
            Console.WriteLine(wd1);
        }
    }
}
