using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryProject
{
    internal class BookDao
    {
        static List<Book> booksList;

        static BookDao() {
            booksList = new List<Book>();
        }

        public string AddBook(Book book)
        {
            booksList.Add(book);
            return "book added successfully...";
        }

        public List<Book> GetAllBooks()
        {
            return booksList;
        }

    }
}
