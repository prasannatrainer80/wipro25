--1

select emp.Name
from dbo.tblEmployees emp
where emp.Name not like '%[ ]%';

--2

select emp.Name
from dbo.tblEmployees emp
where emp.Name like '[a-z]%[ ][a-z]%[ ][a-z]%' and emp.Name not like '[a-z]%[ ][a-z]%[ ][a-z]%[ ][a-z]%';

--3

select emp.Name
from dbo.tblEmployees emp
where emp.Name like 'ram[ ]%' or emp.Name like '%[ ]ram' or emp.Name like '%[. ]ram[ ]%';

--4.1

select emp.EmployeeNumber, emp.Name, emp.CentreCode
from dbo.tblEmployees emp
where emp.CentreCode = 65 or emp.CentreCode = 11;

--4.2

select COUNT(*)
from dbo.tblEmployees emp
where (emp.CategoryCode = 65 and emp.CentreCode <> 11) or ((emp.CategoryCode <> 65 and emp.CentreCode = 11));
  
  --OR

select COUNT(*)
from tblEmployees emp
where (emp.CategoryCode = 65 or emp.CentreCode = 11) and ((emp.CategoryCode <> 65 and emp.CentreCode <> 11));  

--4.3

select emp.EmployeeNumber, emp.Name, emp.CentreCode, emp.CategoryCode
from tblEmployees emp
where emp.CategoryCode = 12 and emp.CentreCode = 4;

--4.4

select emp.EmployeeNumber, emp.Name, emp.CentreCode, emp.CategoryCode
from dbo.tblEmployees emp
where (emp.CategoryCode=12 and emp.CentreCode=4)or (emp.CategoryCode=13 and emp.CentreCode=1);

--4.5

select emp.EmployeeNumber, emp.Name
from dbo.tblEmployees emp
where emp.EmployeeNumber = 127 or emp.EmployeeNumber = 64;

--4.6

select emp.EmployeeNumber,emp.Name
from dbo.tblEmployees emp
where (emp.CategoryCode = 127 and emp.CentreCode <> 64) or ((emp.CategoryCode <> 127 and emp.CentreCode = 64));

--4.7

select emp.EmployeeNumber,emp.Name
from dbo.tblEmployees emp
where (emp.CategoryCode = 127 and emp.CentreCode <> 128) or ((emp.CategoryCode <> 127 and emp.CentreCode = 128));

--4.8

select emp.EmployeeNumber, emp.Name
from dbo.tblEmployees emp
where emp.EmployeeNumber = 127 and emp.AreaCode = 64;

--4.9

select emp.EmployeeNumber, emp.Name
from dbo.tblEmployees emp
where emp.EmployeeNumber = 127 and emp.AreaCode = 128;

--5

select *
from dbo.tblCentreMaster;

--6

select distinct emp.EmployeeType
from dbo.tblEmployees emp;

--7.1

select emp.Name, emp.FatherName, emp.DOB, emp.PresentBasic
from dbo.tblEmployees emp
where emp.PresentBasic > 30000;

--7.2

select emp.Name, emp.FatherName, emp.DOB, emp.PresentBasic
from dbo.tblEmployees emp
where emp.PresentBasic < 30000;

--7.3

select emp.Name, emp.FatherName, emp.DOB, emp.PresentBasic
from dbo.tblEmployees emp
where emp.PresentBasic between 3000 and 5000;

--8.1

select *
from dbo.tblEmployees emp
where emp.Name like '%khan';

--8.2

select *
from dbo.tblEmployees emp
where emp.Name like 'chandra%';

--8.3

select emp.Name 
from dbo.tblEmployees emp
where emp.Name like '[a-t][.]Ramesh';