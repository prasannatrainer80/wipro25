using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EmployDataLayer;
using EmployEntity;
using NUnit.Framework;
using Moq;
using System.Threading.Tasks;

namespace EmployProject.Tests
{
    [TestFixture]
    public class EmployTest
    {
        [Test]
        public void TestShowEmployFile()
        {
            //EmployDAL dal = new EmployDAL();
            //dal.ReadEmployFileDAL();
            //List<Employ> employList = dal.ShowEmployDAL();
            //Assert.AreEqual(6, employList.Count);

            Mock<IEmployDAO> mockDao = new Mock<IEmployDAO>();
            mockDao.Setup(x => x.ShowEmploy()).Returns(new EmployMockDAO().ShowEmploy());
            Assert.AreEqual(3, mockDao.Object.ShowEmploy().Count);
        }
    }
}
