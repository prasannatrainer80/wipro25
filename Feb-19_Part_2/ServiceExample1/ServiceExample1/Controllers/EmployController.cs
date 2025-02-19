using Microsoft.AspNetCore.Mvc;

namespace ServiceExample1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class EmployController : ControllerBase
    {
        private EmployDao employDao;
        public EmployController()
        {
            employDao = new EmployDao();
        }

        [HttpPost]
        public string Add(Employ employ)
        {
            return employDao.AddEmployDao(employ);
        }
        [HttpGet(Name = "GetEmployInfo")]
        public IEnumerable<Employ> Get()
        {
            return employDao.ShowEmployDao();
        }

        [HttpGet]
        [Route("id")]
        public Employ? GetById(int id)
        {
            return employDao.SearchEmployDao(id);
        }
    }
}
