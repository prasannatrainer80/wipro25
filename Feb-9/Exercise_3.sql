--1

SELECT EMP.EmployeeNumber,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE 0 END)GROSSPAY,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE -EMP.Amount END)NETPAY,
SUM(CASE WHEN EMP.TransValue=-1 THEN EMP.Amount ELSE 0 END)DEDUCTION                            
FROM DBO.tblPayEmployeeparamDetails EMP
GROUP BY EMP.EmployeeNumber
HAVING (SUM(CASE WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='VDA' THEN EMP.Amount END )
	       >
	     SUM(CASE WHEN EMP.ParamCode='BASIC' THEN EMP.Amount END)
	   ) 
 EXCEPT
(SELECT EMP.EmployeeNumber,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE 0 END),
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE -EMP.Amount END),
SUM(CASE WHEN EMP.TransValue=-1 THEN EMP.Amount ELSE 0 END)                               
 FROM DBO.tblPayEmployeeparamDetails EMP
 GROUP BY EMP.EmployeeNumber
 HAVING (
		 SUM(CASE WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='HRA'	THEN EMP.Amount END)
	       >
	     SUM(CASE WHEN EMP.ParamCode='HRA' THEN EMP.Amount END )
        )
 )
 ORDER BY EMP.EmployeeNumber

--OR

select emp.NoteNumber, emp.EmployeeNumber,
    Payments=SUM(case
                        when emp.TransValue=1 then emp.Amount
                        else -emp.Amount         
                    end)
from dbo.tblPayEmployeeparamDetails emp
where emp.EmployeeNumber 
in( select emp1.EmployeeNumber
    from dbo.tblPayEmployeeparamDetails emp1
    where emp1.ParamCode='VDA'
    Except 
    select emp1.EmployeeNumber
    from dbo.tblPayEmployeeparamDetails emp1
    where emp1.ParamCode='HRA'
   )
group by emp.NoteNumber,emp.EmployeeNumber 
order by emp.NoteNumber,emp.EmployeeNumber 

--------------------------------------------------------------
--2

SELECT EMP.EmployeeNumber,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE 0 END)GROSSPAY,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE -EMP.Amount END)NETPAY,
SUM(CASE WHEN EMP.TransValue=-1 THEN EMP.Amount ELSE 0 END)DEDUCTION                            
FROM DBO.tblPayEmployeeparamDetails EMP
GROUP BY EMP.EmployeeNumber
HAVING (SUM(CASE WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='VDA' THEN EMP.Amount END )
	       >
	     SUM(CASE WHEN EMP.ParamCode='BASIC' THEN EMP.Amount END)
	   ) 
 INTERSECT
(SELECT EMP.EmployeeNumber,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE 0 END),
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE -EMP.Amount END),
SUM(CASE WHEN EMP.TransValue=-1 THEN EMP.Amount ELSE 0 END)                               
 FROM DBO.tblPayEmployeeparamDetails EMP
 GROUP BY EMP.EmployeeNumber
 HAVING (
		 SUM(CASE WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='HRA'	THEN EMP.Amount END)
	       >
	     SUM(CASE WHEN EMP.ParamCode='HRA' THEN EMP.Amount END )
        )
 )
 
 
 -----------------------------------------------------------------
 
 --3
 
 SELECT EMP.EmployeeNumber,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE 0 END)GROSSPAY,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE -EMP.Amount END)NETPAY,
SUM(CASE WHEN EMP.TransValue=-1 THEN EMP.Amount ELSE 0 END)DEDUCTION                            
FROM DBO.tblPayEmployeeparamDetails EMP
GROUP BY EMP.EmployeeNumber
HAVING (SUM(CASE WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='VDA' THEN EMP.Amount END )
	       >
	     SUM(CASE WHEN EMP.ParamCode='BASIC' THEN EMP.Amount END)
	   ) 
UNION
(SELECT EMP.EmployeeNumber,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE 0 END),
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE -EMP.Amount END),
SUM(CASE WHEN EMP.TransValue=-1 THEN EMP.Amount ELSE 0 END)                               
 FROM DBO.tblPayEmployeeparamDetails EMP
 GROUP BY EMP.EmployeeNumber
 HAVING (
		 SUM(CASE WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='HRA'	THEN EMP.Amount END)
	       >
	     SUM(CASE WHEN EMP.ParamCode='HRA' THEN EMP.Amount END )
        )
 )
 ORDER BY EMP.EmployeeNumber
 
 
 ----------------------------------------------------------------
 
 --4
 
 
 
 SELECT EMP.EmployeeNumber,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE 0 END)GROSSPAY,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE -EMP.Amount END)NETPAY,
SUM(CASE WHEN EMP.TransValue=-1 THEN EMP.Amount ELSE 0 END)DEDUCTION                            
FROM DBO.tblPayEmployeeparamDetails EMP
GROUP BY EMP.EmployeeNumber
HAVING (SUM(CASE WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='VDA' THEN EMP.Amount END )
	       >
	     SUM(CASE WHEN EMP.ParamCode='BASIC' THEN EMP.Amount END)
	   ) 
UNION
(SELECT EMP.EmployeeNumber,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE 0 END),
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE -EMP.Amount END),
SUM(CASE WHEN EMP.TransValue=-1 THEN EMP.Amount ELSE 0 END)                               
 FROM DBO.tblPayEmployeeparamDetails EMP
 GROUP BY EMP.EmployeeNumber
 HAVING (
		 SUM(CASE WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='HRA'	THEN EMP.Amount END)
	       >
	     SUM(CASE WHEN EMP.ParamCode='HRA' THEN EMP.Amount END )
        )
 )
 

EXCEPT
(SELECT EMP.EmployeeNumber,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE 0 END)GROSSPAY,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE -EMP.Amount END)NETPAY,
SUM(CASE WHEN EMP.TransValue=-1 THEN EMP.Amount ELSE 0 END)DEDUCTION                            
FROM DBO.tblPayEmployeeparamDetails EMP
GROUP BY EMP.EmployeeNumber
HAVING (SUM(CASE WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='VDA' THEN EMP.Amount END )
	       >
	     SUM(CASE WHEN EMP.ParamCode='BASIC' THEN EMP.Amount END)
	   ) 
 INTERSECT
(SELECT EMP.EmployeeNumber,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE 0 END),
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE -EMP.Amount END),
SUM(CASE WHEN EMP.TransValue=-1 THEN EMP.Amount ELSE 0 END)                               
 FROM DBO.tblPayEmployeeparamDetails EMP
 GROUP BY EMP.EmployeeNumber
 HAVING (
		 SUM(CASE WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='HRA'	THEN EMP.Amount END)
	       >
	     SUM(CASE WHEN EMP.ParamCode='HRA' THEN EMP.Amount END )
        )
 )
) 
 ORDER BY EMP.EmployeeNumber
 
 --------------------------------------------------------------------
 
 --5
 
 SELECT EMP.EmployeeNumber,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE 0 END)GROSSPAY,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE -EMP.Amount END)NETPAY,
SUM(CASE WHEN EMP.TransValue=-1 THEN EMP.Amount ELSE 0 END)DEDUCTION                            
FROM DBO.tblPayEmployeeparamDetails EMP
GROUP BY EMP.EmployeeNumber
HAVING (SUM(CASE WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='VDA' THEN EMP.Amount END )
	       >
	     SUM(CASE WHEN EMP.ParamCode='BASIC' THEN EMP.Amount END)
	   ) 
 INTERSECT
(SELECT EMP.EmployeeNumber,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE 0 END),
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE -EMP.Amount END),
SUM(CASE WHEN EMP.TransValue=-1 THEN EMP.Amount ELSE 0 END)                               
 FROM DBO.tblPayEmployeeparamDetails EMP
 GROUP BY EMP.EmployeeNumber
 HAVING (
		 SUM(CASE WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='NFH'	THEN EMP.Amount END)
	       >
	     SUM(CASE WHEN EMP.ParamCode='NFH' THEN EMP.Amount END )
        )
 )
 INTERSECT
 (SELECT EMP.EmployeeNumber,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE 0 END),
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE -EMP.Amount END),
SUM(CASE WHEN EMP.TransValue=-1 THEN EMP.Amount ELSE 0 END)                               
 FROM DBO.tblPayEmployeeparamDetails EMP
 GROUP BY EMP.EmployeeNumber
 HAVING (
		 SUM(CASE WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='LWW'	THEN EMP.Amount END)
	       >
	     SUM(CASE WHEN EMP.ParamCode='LWW' THEN EMP.Amount END )
        )
 )
 EXCEPT
 (SELECT EMP.EmployeeNumber,
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE 0 END),
SUM(CASE WHEN EMP.TransValue=1 THEN EMP.Amount ELSE -EMP.Amount END),
SUM(CASE WHEN EMP.TransValue=-1 THEN EMP.Amount ELSE 0 END)                               
 FROM DBO.tblPayEmployeeparamDetails EMP
 GROUP BY EMP.EmployeeNumber
 HAVING (
		 SUM(CASE WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='PF'	THEN EMP.Amount END)
	       >
	     SUM(CASE WHEN EMP.ParamCode='PF' THEN EMP.Amount END )
        )
 )
 ORDER BY EMP.EmployeeNumber
 
 ------------------------------------------------------------------------
 
 --6
 
 SELECT Dummy.EmployeeNumber
          FROM(
                 SELECT e.EmployeeNumber,
                        SUM(CASE WHEN e.ParamCode='PF' THEN 1 ELSE 0 END)AS PF,
                        SUM(CASE WHEN e.ParamCode='HRA' THEN 1 ELSE 0 END)AS HRA,
                        SUM(CASE WHEN e.ParamCode='VDA' THEN 1 ELSE 0 END)AS VDA
                 FROM dbo.tblPayEmployeeparamDetails e
                 GROUP BY e.EmployeeNumber
              )Dummy
          WHERE Dummy.HRA=0 OR Dummy.PF=0 OR Dummy.VDA=0  
          
-------------------------------------------------------------------------

--7

SELECT EMP.EmployeeNumber,              
      SUM(CASE
          WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='HRA' OR EMP.ParamCode='VDA' 
            THEN EMP.Amount
         
      END ) AS SUM_BASIC_VDA_HRA                 
FROM DBO.tblPayEmployeeparamDetails EMP
GROUP BY EMP.EmployeeNumber
HAVING (
		 SUM(CASE
		  WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='HRA' OR
			   EMP.ParamCode='VDA' OR EMP.ParamCode='PF'
			THEN EMP.Amount
	      END )
	       -
	     SUM(CASE
		  WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='HRA' OR
			   EMP.ParamCode='VDA' 
			THEN EMP.Amount
	      
	      END )
      )=SUM(CASE WHEN EMP.ParamCode='PF'  THEN EMP.Amount END )
 ORDER BY EMP.EmployeeNumber          
 
 ------------------------------------------------------------------------------
 
 --8
 
 SELECT emp.NoteNumber,emp.EmployeeNumber,
       GrossPay=SUM(CASE WHEN emp.TransValue=1 THEN emp.Amount END),       
       NetPay=SUM(CASE WHEN emp.TransValue=1 THEN emp.Amount ELSE -emp.Amount END),       
       Deduction=SUM(CASE WHEN emp.ParamCode='LOANPY' THEN emp.Amount ELSE 0 END),      
       PercentDeductionOnLoan=(SUM(CASE WHEN emp.ParamCode='LOANPY' THEN emp.Amount ELSE 0 END)*100/SUM(CASE WHEN emp.TransValue=1 THEN emp.Amount END))
FROM dbo.tblPayEmployeeparamDetails emp
GROUP BY emp.NoteNumber,emp.EmployeeNumber
HAVING (
		 SUM(CASE
		  WHEN EMP.ParamCode='BASIC' OR EMP.ParamCode='LOANPY'
			THEN EMP.Amount
	      END )
	       -
	     SUM(CASE
		  WHEN EMP.ParamCode='BASIC'
			THEN EMP.Amount	      
	      END )
      )=SUM(CASE WHEN EMP.ParamCode='LOANPY'  THEN EMP.Amount END )
ORDER BY emp.EmployeeNumber

----------------------------------------------------------------------------

--9

SELECT emp.NoteNumber,emp.EmployeeNumber,
       GrossPay=SUM(CASE WHEN emp.TransValue=1 THEN emp.Amount ELSE 0 END),
       
       NetPay=SUM(CASE WHEN emp.TransValue=1 THEN emp.Amount ELSE -emp.Amount END),
       Deduction=SUM(CASE WHEN emp.TransValue=-1 THEN emp.Amount ELSE 0 END),
       PercentDeduction=(SUM(CASE WHEN emp.TransValue=-1 THEN emp.Amount ELSE 0 END)*100/SUM(CASE WHEN emp.TransValue=1 THEN emp.Amount END))
FROM dbo.tblPayEmployeeparamDetails emp

GROUP BY emp.NoteNumber,emp.EmployeeNumber
ORDER BY emp.NoteNumber,emp.EmployeeNumber

----------------------------------------------------------------------

--10

CREATE TABLE dbo.States
  (
     StateCode int,
     StateName varchar(20),
     CONSTRAINT PK_StateID PRIMARY KEY(StateCode)
  )
 
 CREATE TABLE	dbo.Districts
  (
    DistrictCode int,    
    DistrictName varchar(20),  
    StateID int,  
    CONSTRAINT PK_DistrictID PRIMARY KEY(DistrictCode),
    CONSTRAINT FK_DistState FOREIGN KEY(StateID)REFERENCES dbo.States(StateCode)ON DELETE CASCADE ON UPDATE CASCADE
  ) 
  
CREATE TABLE dbo.RevenueDivisions
(
  DivisionID int,  
  DivName varchar(20), 
  DistrictID int, 
  StateID int,  
  CONSTRAINT PK_DivisionID PRIMARY KEY(DivisionID),
  CONSTRAINT FK_DivDistID FOREIGN KEY(DistrictID)REFERENCES dbo.Districts(DistrictCode),
  CONSTRAINT FK_DivStateID FOREIGN KEY(StateID)REFERENCES dbo.States(StateCode)ON DELETE CASCADE ON UPDATE CASCADE
)   

CREATE TABLE School
(
  ID bigint identity,
  SchoolName varchar(50) NOT NULL,
  City varchar(20) NOT NULL,
  DivisionID int,
  DistrictID int,
  StateID int,
  CONSTRAINT PK_SchoolID PRIMARY KEY(ID),
  CONSTRAINT FK_SchoolDiv FOREIGN KEY(DivisionID) REFERENCES dbo.RevenueDivisions(DivisionID),
  CONSTRAINT FK_SchoolDiST FOREIGN KEY(DistrictID) REFERENCES dbo.Districts(DistrictCode),
  CONSTRAINT FK_SchoolState FOREIGN KEY(StateID) REFERENCES dbo.States(StateCode)ON DELETE CASCADE ON UPDATE CASCADE  
)

CREATE TABLE dbo.Student
  (
    studid bigint identity,
    Name varchar(30),
    DOB date check(DOB<GETDATE()),
    Village varchar(20),
    Street varchar(20),    
    DivID int,   
    CONSTRAINT PK_StudID PRIMARY KEY(studid),
    CONSTRAINT FK_DisctID FOREIGN KEY(DivID)REFERENCES dbo.RevenueDivisions(DivisionID)ON DELETE CASCADE ON UPDATE CASCADE
  )
  
  CREATE TABLE dbo.Grade
  (
    GradeID int,
    GradeName varchar(20) NOT NULL,
    CONSTRAINT PK_Grade PRIMARY KEY(GradeID)
  )
  
  CREATE TABLE dbo.Student_School
  (
    StudID bigint,
    SchoolID bigint,
    CONSTRAINT P
 
 