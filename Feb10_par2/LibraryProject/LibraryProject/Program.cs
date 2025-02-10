using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace LibraryProject
{
    internal class Program
    {
        static BookDao bookDao;

        static Program()
        {
            bookDao = new BookDao();
        }
        public static void AddBookMain()
        {
            Book book = new Book();
            Console.WriteLine("Enter Book Id  ");
            book.BookId = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Title  ");
            book.Title = Console.ReadLine();
            Console.WriteLine("Enter Author  ");
            book.Author = Console.ReadLine();
            Console.WriteLine("Enter No.of Copies  ");
            book.NoOfCopies = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine(bookDao.AddBook(book));
        }

        public static void ShowBookMain()
        {
            List<Book> books = bookDao.GetAllBooks();
            foreach (Book book in books)
            {
                Console.WriteLine("Book Id " +book.BookId + 
                    " Book Title " +book.Title + 
                    " Book Author " +book.Author + 
                    "No.Of Copies " +book.NoOfCopies);
            }
        }
        static void Main(string[] args)
        {
            int choice;
            do
            {

                Console.WriteLine("Menu");
                Console.WriteLine("1. Add Book");
                Console.WriteLine("2. Show Book");
                Console.WriteLine("6. Exit");
                Console.WriteLine("Enter Choice  ");
                choice = Convert.ToInt32(Console.ReadLine());
                switch(choice)
                {
                    case 1: AddBookMain(); break;
                    case 2: ShowBookMain(); break;
                    case 6: return;
                }
            } while (choice != 6);
        }
    }
}
