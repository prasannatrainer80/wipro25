-- swith to sqlpractice1 database

use sqlpractice1
go

-- Display list of tables avaialble in current db

select * from INFORMATION_SCHEMA.TABLES
go

-- Display information about Emp Table

sp_help Emp
Go

-- Display all records from Emp table

select * from EMP 
GO

-- Display Empno, Nam, Basic from Emp table

select 
	Empno, Nam, Basic 
from EMP 
GO

-- WHERE Clause : Used to display filtered records from the given table 

-- Dispaly info whose empno is 1 

select * from Emp where empno = 1
GO

-- Display info whose dept is 'Dotnet' 

select * from Emp where dept = 'Dotnet'
Go

-- Display info whose basic > 90000 

select * from Emp where basic >= 90000
GO

-- Between...AND 

select * from Emp where basic between 50000 and 80000
GO

select * from Emp where basic NOT between 50000 and 80000
GO

-- IN Clause : Used to check for multiple values of particular column 

select * from Emp where nam in('Manu','Kesav','Satish','Kalyan','Swapna')
GO

select * from Emp where nam NOT IN('Manu','Kesav','Satish','Kalyan','Swapna')
GO

select * from Emp where DEPT IN('Dotnet','MVC')
GO

-- LIKE operator : Used to display data w.r.t. wild cards 

select * from Emp where nam like 'S%'
GO

select * from Emp where nam like '%A'
GO

-- Order By :  Used to display data w.r.t. Specific field(s) in ascending or 
-- descending order

select * from Emp order by Nam
GO

select * from Emp order by basic desc
GO

select * from Emp Order By Dept, Basic 
GO

select * from Emp order by Dept, Basic DESC
GO


