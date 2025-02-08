use sqlpractice1
go

if exists(select * from sysobjects where name='EmployWipro') 
Drop Table EmployWipro 
GO

Create Table EmployWipro
(
   Empno INT Primary Key, 
   Name varchar(30) NOT NULL,
   Gender varchar(30) CONSTRAINT chk_EmployWipro_Gender CHECK(Gender IN('MALE','FEMALE')),
   Dept varchar(30) CONSTRAINT chk_EmployWipro_Dept CHECK(Dept IN('JAVA','SQL','DOTNET')),
   Desig varchar(30) CONSTRAINT chk_EmployWipro_Desig CHECK(Desig IN('ASE','SE','TL')),
   Basic numeric(9,2) CONSTRAINT chk_EmployWipro_Basic CHECK(Basic BETWEEN 1000 and 80000)
)
GO

Insert into EmployWipro(Empno, Name, Gender, Dept, Desig, Basic) 
values(1,'Abhishek','MALE','Dotnet','ASE',56333),
(2,'Harsh','MALE','Java','SE',78888),
(3,'Khushboo','FEMALE','Dotnet','SE',77222),
(4,'Sangeetha','FEMALE','SQL','ASE',52222),
(5,'Shaik','MALE','JAVA','SE',77772) 
GO

select * from EmployWipro 
GO
