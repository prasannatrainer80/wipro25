--1

select emp.DepartmentCode,SUM(emp.PresentBasic) as BasicTotal
from dbo.tblEmployees emp
group by emp.DepartmentCode
having SUM(emp.PresentBasic)>30000
order by emp.DepartmentCode;

--2

select emp.CentreCode,emp.ServiceType,emp.ServiceStatus,
CONVERT(varchar(10),MAX(DATEDIFF(MM,EMP.DOB,GETDATE())/12))+'years '+
CONVERT(varchar(10),MAX(DATEDIFF(MM,EMP.DOB,GETDATE())%12))+'months' as MAX_AGE,
CONVERT(varchar(10),MIN(DATEDIFF(MM,EMP.DOB,GETDATE())/12))+'years '+
CONVERT(varchar(10),MIN(DATEDIFF(MM,EMP.DOB,GETDATE())%12))+'months' as MIN_AGE,            
CONVERT(varchar(10),AVG(DATEDIFF(MM,EMP.DOB,GETDATE())/12))+'years '+
CONVERT(varchar(10),AVG(DATEDIFF(MM,EMP.DOB,GETDATE())%12))+'months' as AVG_AGE
from dbo.tblEmployees emp
group by emp.CentreCode,emp.ServiceType,emp.ServiceStatus
order by emp.CentreCode,emp.ServiceType,emp.ServiceStatus;

--3

select emp.CentreCode,emp.ServiceType,emp.ServiceStatus,
CONVERT(varchar(10),MAX(DATEDIFF(MM,EMP.DOJ,GETDATE())/12))+' years '+
CONVERT(varchar(10),MAX(DATEDIFF(MM,EMP.DOJ,GETDATE())%12))+' months' as MAX_SERVICE,            
CONVERT(varchar(10),MIN(DATEDIFF(MM,EMP.DOJ,GETDATE())/12))+' years '+
CONVERT(varchar(10),MIN(DATEDIFF(MM,EMP.DOJ,GETDATE())%12))+' months' as MIN_SERVICE,            
CONVERT(varchar(10),AVG(DATEDIFF(MM,EMP.DOJ,GETDATE())/12))+' years '+
CONVERT(varchar(10),AVG(DATEDIFF(MM,EMP.DOJ,GETDATE())%12))+' months' as AVG_SERVICE
from dbo.tblEmployees emp
group by emp.CentreCode,emp.ServiceType,emp.ServiceStatus
order by emp.CentreCode,emp.ServiceType,emp.ServiceStatus;

--4

select emp.DepartmentCode,SUM(emp.PresentBasic)
from dbo.tblEmployees emp
group by emp.DepartmentCode
having SUM(emp.PresentBasic)> 3*AVG(emp.PresentBasic);

--5

select emp.DepartmentCode,SUM(emp.PresentBasic)
from EMP_ShriramDB.dbo.tblEmployees emp
group by emp.DepartmentCode
having SUM(emp.PresentBasic)> 2*AVG(emp.PresentBasic)
       and MAX(emp.PresentBasic)>=3*MIN(emp.PresentBasic);
       
--6

select emp.CentreCode
from dbo.tblEmployees emp
group by emp.CentreCode
having MAX(LEN(emp.Name))=2*MIN(LEN(emp.Name));   

--7

select emp.CentreCode,emp.ServiceType,emp.ServiceStatus,            
MAX(DATEDIFF(HH,emp.DOJ,GETDATE())) as MAX_SEVICE ,                        
MIN(DATEDIFF(HH,emp.DOJ,GETDATE())) as MIN_SEVICE,            
AVG(DATEDIFF(HH,emp.DOJ,GETDATE())) as AVG_SEVICE            
from dbo.tblEmployees emp
group by emp.CentreCode,emp.ServiceType,emp.ServiceStatus
order by emp.CentreCode,emp.ServiceType,emp.ServiceStatus;    

--8

select emp.Name
from dbo.tblEmployees emp
where emp.Name like '[ ]%' or emp.Name like '%[ ]';

--9

select emp.Name  
from dbo.tblEmployees emp
where emp.Name like '%[a-z]%[ ][ ]%[a-z]%';

--10

select LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(emp.Name,'.',' '),' ',' %'),'% ',''),'%','') )) as Name                           
from dbo.tblEmployees emp
order by emp.Name;

--11

select DummyTable.FormatedName,LEN(DummyTable.FormatedName)-LEN(REPLACE(DummyTable.FormatedName,' ',''))+1
from 
    (
        select LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(emp.Name,'.',' '),' ',' %'),'% ',''),'%','') )) FormatedName                            
        from dbo.tblEmployees emp
    )DummyTable
    
--12

SELECT DummyTable.FormatedName as Name
FROM (
               select LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(emp.Name,'.',' '),' ',' %'),'% ',''),'%','') )) FormatedName                            
               from dbo.tblEmployees emp
            )DummyTable
WHERE LEFT(DummyTable.FormatedName,1)=RIGHT(DummyTable.FormatedName,1);   

--13

SELECT *
FROM (
        select LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(emp.Name,'.',' '),' ',' %'),'% ',''),'%','') )) FormatedName                            
        from dbo.tblEmployees emp
      )DummyTable  
where LEFT(DummyTable.FormatedName,1)=SUBSTRING(DummyTable.FormatedName,PATINDEX('%[ ]%',DummyTable.FormatedName)+1,1)        
       AND DummyTable.FormatedName LIKE '%[A-Z]%[ ][A-Z]%'; 
       
--14

SELECT *
FROM (
        select LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(emp.Name,'.',' '),' ',' %'),'% ',''),'%','') )) FormatedName                            
        from dbo.tblEmployees emp
    )DummyTable 
    
WHERE lEFT(DummyTable.FormatedName,1)= SUBSTRING(DummyTable.FormatedName,PATINDEX('%[ ][A-Z]%',DummyTable.FormatedName)+1,1) AND     
   lEFT(DummyTable.FormatedName,1)= SUBSTRING(DummyTable.FormatedName,CHARINDEX(' ',DummyTable.FormatedName,CHARINDEX(' ',DummyTable.FormatedName)+1)+1,1)AND
   lEFT(DummyTable.FormatedName,1)= SUBSTRING(DummyTable.FormatedName,CHARINDEX(' ',DummyTable.FormatedName,CHARINDEX(' ',DummyTable.FormatedName,CHARINDEX(' ',DummyTable.FormatedName)+1)+1)+1,1)
   AND
   DummyTable.FormatedName LIKE '%[A-Z]%[ ][A-Z]%'       
   
--15

SELECT DummyTable.S      
      FROM (
               select LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(emp.Name,'.',' '),' ',' %'),'% ',''),'%','') )) S
               from dbo.tblEmployees emp
           )DummyTable             
      WHERE ( LEN(SUBSTRING(DummyTable.S,1,PATINDEX('%[ ]%',DummyTable.S)))>4 AND
              LEFT(DummyTable.S,1)= LEFT(REVERSE(SUBSTRING(DummyTable.S,1,PATINDEX('%[ ]%',DummyTable.S)-1)),1) )                 
               OR              
             (LEN(DummyTable.S)-LEN(REPLACE(DummyTable.S,' ',''))+1 = 2 AND LEFT(SUBSTRING(DummyTable.S, (CHARINDEX(' ',DummyTable.S)+1) ,LEN(DummyTable.S)-CHARINDEX(' ',DummyTable.S)),1) =   LEFT(REVERSE(SUBSTRING(DummyTable.S, (CHARINDEX(' ',DummyTable.S)+1) ,LEN(DummyTable.S)-CHARINDEX(' ',DummyTable.S))),1)   )             
             OR             
              ( LEN(DummyTable.S)-LEN(REPLACE(DummyTable.S,' ',''))+1 = 3 AND LEFT(SUBSTRING(DummyTable.S, (CHARINDEX(' ',DummyTable.S,CHARINDEX(' ',DummyTable.S)+1)+1) ,LEN(DummyTable.S)-CHARINDEX(' ',DummyTable.S,CHARINDEX(' ',DummyTable.S)+1)),1)=LEFT(REVERSE(SUBSTRING(DummyTable.S, (CHARINDEX(' ',DummyTable.S,CHARINDEX(' ',DummyTable.S)+1)+1) ,LEN(DummyTable.S)-CHARINDEX(' ',DummyTable.S,CHARINDEX(' ',DummyTable.S)+1))),1)   )   
              
--16

SELECT emp.PresentBasic
FROM dbo.tblEmployees emp
WHERE ROUND(emp.PresentBasic,-2)=emp.PresentBasic AND emp.PresentBasic<>0;              

--17

select emp.Name,emp.PresentBasic 
from dbo.tblEmployees emp
where FLOOR(emp.PresentBasic/100)=(emp.PresentBasic/100) AND emp.PresentBasic<>0;

--18

select emp.Name,emp.PresentBasic 
from dbo.tblEmployees emp
where (emp.PresentBasic%100)=0 AND emp.PresentBasic<>0;

--19

select emp.Name,emp.PresentBasic 
from dbo.tblEmployees emp
where CEILING(emp.PresentBasic/100)=(emp.PresentBasic/100) AND emp.PresentBasic<>0;

--20

SELECT emp.DepartmentCode,COUNT(emp.PresentBasic),
     COUNT(CASE
        WHEN ROUND(emp.PresentBasic,-2)=emp.PresentBasic AND emp.PresentBasic<>0 THEN emp.PresentBasic
     END)
FROM dbo.tblEmployees emp
GROUP BY emp.DepartmentCode
HAVING COUNT(emp.PresentBasic)=COUNT(CASE
        WHEN ROUND(emp.PresentBasic,-2)=emp.PresentBasic AND emp.PresentBasic<>0 THEN emp.PresentBasic
     END)
     
--21     

SELECT emp.DepartmentCode,COUNT(emp.PresentBasic),
 COUNT(CASE
    WHEN ROUND(emp.PresentBasic,-2)!=emp.PresentBasic AND emp.PresentBasic<>0 THEN emp.PresentBasic
 END)
FROM dbo.tblEmployees emp
GROUP BY emp.DepartmentCode
HAVING COUNT(emp.PresentBasic)=COUNT(CASE
    WHEN ROUND(emp.PresentBasic,-2)!=emp.PresentBasic AND emp.PresentBasic<>0 THEN emp.PresentBasic
 END)
 
--22

select emp.Name,emp.DOB, emp.DOJ DateOfJoining, 
DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))) as EligibleDate,
DATEADD(MONTH,1,DATEADD(DAY,-(DATEPART(dd,DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))-1),DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ)))))As BonusDate,
CONVERT(varchar(max),(DATEDIFF(MONTH,emp.DOB,DATEADD(MONTH,1,DATEADD(DAY,-(DATEPART(dd,DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))-1),DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))))/12))+' years '+
CONVERT(varchar(max),(DATEDIFF(MONTH,emp.DOB,DATEADD(MONTH,1,DATEADD(DAY,-(DATEPART(dd,DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))-1),DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))))%12))+' Months',
DATENAME(dw,DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))As WeekDayName,
DATENAME(Wk,DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))As WeekOfYear,
DATENAME(dy,DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))As DayOfYears,
(DATENAME(DD,DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))/7)+1 As WeekOfMonth         
from dbo.tblEmployees emp
 
 --23
 
 select emp.CentreCode,emp.ServiceType,emp.EmployeeType,
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())%12))+' months' as MIN_SERVICE,            
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())%12))+' months' as MIN_AGE                       
from dbo.tblEmployees emp   
where emp.ServiceType=1 AND emp.EmployeeType=1 AND (DATEDIFF(MM,EMP.DOJ,GETDATE())/12)>=10 AND CONVERT(int,(DATEDIFF(MM,GETDATE(),emp.RetirementDate)/12))>=15 AND DATEDIFF(YEAR,emp.DOB,emp.RetirementDate)>=60 

--24

select emp.CentreCode,emp.ServiceType,emp.EmployeeType,
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())%12))+' months' as MIN_SERVICE,            
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())%12))+' months' as MIN_AGE                       
from dbo.tblEmployees emp   
where emp.ServiceType=1 AND emp.EmployeeType=2 AND (DATEDIFF(MM,EMP.DOJ,GETDATE())/12)>=12 AND CONVERT(int,(DATEDIFF(MM,GETDATE(),emp.RetirementDate)/12))>=14 AND DATEDIFF(YEAR,emp.DOB,emp.RetirementDate)>=55

--25

select emp.CentreCode,emp.ServiceType,emp.EmployeeType,
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())%12))+' months' as MIN_SERVICE,            
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())%12))+' months' as MIN_AGE                       
from dbo.tblEmployees emp   
where emp.ServiceType=1 AND emp.EmployeeType=3 AND (DATEDIFF(MM,EMP.DOJ,GETDATE())/12)>=12 AND CONVERT(int,(DATEDIFF(MM,GETDATE(),emp.RetirementDate)/12))>=12 AND DATEDIFF(YEAR,emp.DOB,emp.RetirementDate)>=55

--26

select emp.CentreCode,emp.ServiceType,emp.EmployeeType,
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())%12))+' months' as MIN_SERVICE,            
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())%12))+' months' as MIN_AGE                       
from dbo.tblEmployees emp   
where (emp.ServiceType=2 OR emp.ServiceType=2 OR emp.ServiceType=4) AND (DATEDIFF(MM,EMP.DOJ,GETDATE())/12)>=15 AND CONVERT(int,(DATEDIFF(MM,GETDATE(),emp.RetirementDate)/12))>=20 AND DATEDIFF(YEAR,emp.DOB,emp.RetirementDate)>=65

--27

SELECT CONVERT(VARCHAR(12),GETDATE(), 103)  -- 25/11/2011
SELECT CONVERT(VARCHAR(12),GETDATE(), 105)  -- 25-11-2011
SELECT CONVERT(VARCHAR(12),GETDATE(), 104)  -- 25.11.2011
SELECT CONVERT(VARCHAR(12),GETDATE(), 106)  -- 25 Nov 2011
 SELECT CONVERT(VARCHAR(12),GETDATE(), 101)  -- 11/25/2011
SELECT CONVERT(VARCHAR(12),GETDATE(), 110)  -- 11-25-2011
SELECT CONVERT(VARCHAR(12),GETDATE(), 100)  -- Nov 25 2011
SELECT CONVERT(VARCHAR(12),GETDATE(), 107)  -- Nov 25, 2011
SELECT CONVERT(VARCHAR(12),GETDATE(), 102)  -- 2011.11.25
SELECT CONVERT(VARCHAR(12),GETDATE(), 111)  -- 2011/11/25
SELECT CONVERT(VARCHAR(12),GETDATE(), 112)  -- 20111125 

--28

SELECT emp.EmployeeNumber,
SUM(CASE WHEN emp.TransValue=1 THEN emp.ActualAmount else -emp.ActualAmount END) As ActualSalary,
SUM(CASE WHEN emp.TransValue=1 THEN emp.Amount else -emp.Amount END)As NetSalary
FROM dbo.tblPayEmployeeparamDetails emp
GROUP BY emp.EmployeeNumber,emp.NoteNumber
having SUM(CASE WHEN emp.TransValue=1 THEN emp.ActualAmount else -emp.ActualAmount END) > SUM(CASE WHEN emp.TransValue=1 THEN emp.Amount else -emp.Amount END)
order by emp.EmployeeNumber