use sqlpractice1
GO

if exists(select * from sysobjects where name='LeaveHistory') 
Drop Table LeaveHistory 
GO

If Exists(select * from sysobjects where name='Employee') 
Drop Table Employee 
GO

Create Table Employee
(
	Empno INT Primary Key, 
	Ename varchar(30),
	Job varchar(30),
	Salary Numeric(9,2),
	Dept varchar(30)
)
GO

Create Table LeaveHistory
(
	LeaveID INT Primary KEY IDENTITY(1,1),
	Empno INT CONSTRAINT FK_LeaveHistory_LeaveID REFERENCES Employee(Empno),
	LeaveStartDate Date,
	LeaveEndDate Date,
	noOfDays INT,
	LeaveReason varchar(30) 
)

Insert into Employee(Empno,Ename,Job,Salary,Dept) 
values(100,'Shivam','SE',88822,'Dotnet'),
(101,'Keshav','TL',99999,'Java'),
(102,'Sravani','SE',89999,'Dotnet') 
GO

Insert into LeaveHistory(Empno,LeaveStartDate,LeaveEndDate,LeaveReason) 
values(100,'02/08/2025','02/10/2025','Going Home'),
(101,'03/09/2025','03/10/2025','Marriage') 
GO