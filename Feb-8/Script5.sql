-- Aggregate Functions 

-- sum() : Performs sum opertion on the table field specified 

select sum(basic) from Emp 
GO

-- avg() : Performs avg operation on the table field specified 

select avg(basic) from Emp 
GO


-- max() : displays max value 

select max(basic) from Emp 
Go

-- min() : Displays min value 

select min(basic) from Emp 
GO

-- count(*) : Displays total no.of records from the given table 

select count(*) from Emp
GO

select count(*) from Agent 
GO

select count(*) from Policy 
GO

-- Group By : Used to generate summary reports based on the field specified 

select Dept, sum(basic) from Emp 
GROUP BY Dept
GO

select Dept, count(*) from Emp 
GROUP BY Dept
GO

-- From above query display records whose count of employees greater than 1 

select Dept, count(*) from Emp 
GROUP BY Dept
HAVING COUNT(*) > 1
GO

select Dept, sum(basic) from Emp 
GROUP BY Dept
having sum(basic) > 100000
GO
