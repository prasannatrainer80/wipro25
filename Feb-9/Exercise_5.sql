--1
SELECT X.EmployeeNumber,X.Name,X.DOJ,X.DOB
FROM (
      SELECT E.EmployeeNumber,E.Name,E.DOJ,E.DOB,ROW_NUMBER()OVER(ORDER BY E.EmployeeNumber)AS R
      FROM dbo.tblEmployees E
     )X 
WHERE X.R<=25
 
  -----------------------------------------------------------------------------------------------------------
 
 --2
 
;WITH MAIN 
AS
( SELECT E.EmployeeNumber,E.Name,E.PresentBasic,DENSE_RANK()OVER(ORDER BY E.PresentBasic DESC)AS Levels
  FROM dbo.tblEmployees E
) ,
Levels_CTE(Levels,PBasic)
AS
( SELECT X.Levels,X.PresentBasic
 FROM( SELECT E.EmployeeNumber,E.Name,E.PresentBasic,DENSE_RANK()OVER(ORDER BY E.PresentBasic DESC)AS Levels
       FROM dbo.tblEmployees E)X
 GROUP BY X.Levels,X.PresentBasic
) ,
VDA_CTE(Levels,PBasic,Hike)
 AS
 ( SELECT L1.Levels,L1.PBasic,CONVERT(FLOAT,((10*L1.PBasic)/100))
   FROM Levels_CTE L1
   WHERE L1.Levels=1 
   UNION ALL
   SELECT L2.Levels,L2.PBasic,
   CASE WHEN (L3.Hike+CONVERT(FLOAT,(((10+(L2.Levels-1))*(L3.PBasic-L2.PBasic))/100)))<0 THEN 0
        ELSE (L3.Hike+CONVERT(FLOAT,(((10+(L2.Levels-1))*(L3.PBasic-L2.PBasic))/100)))
   END    
   FROM Levels_CTE L2 JOIN VDA_CTE L3
        ON L2.Levels=L3.Levels+1    
 )
 SELECT M.EmployeeNumber,M.Name,M.PresentBasic,VDA.Levels,VDA.Hike
 FROM MAIN M JOIN VDA_CTE VDA
      ON M.Levels =VDA.Levels
 ORDER BY VDA.Levels      
     OPTION (MAXRECURSION 277)
 
 -----------------------------------------------------------------------------------------------------------

--3

SELECT TAB.EmployeeNumber,TAB.PresentBasic,TAB.RANKS
 FROM (        
       SELECT E.EmployeeNumber,E.PresentBasic,DENSE_RANK()OVER(ORDER BY E.PresentBasic DESC)AS RANKS
       FROM dbo.tblEmployees E   
      )TAB
 WHERE TAB.RANKS<=7  
 
 -----------------------------------------------------------------------------------------------------------
--4
SELECT TAB.EmployeeNumber,TAB.PresentBasic,TAB.RANKS
 FROM (        
       SELECT E.EmployeeNumber,E.PresentBasic,DENSE_RANK()OVER(ORDER BY E.PresentBasic DESC)AS RANKS
       FROM dbo.tblEmployees E         
      )TAB
 WHERE TAB.RANKS=7  
 
 --------------------------------------------------------------------------------------
 
 --5
 
 ;WITH ReportsToCTE(EmployeeID,EmployeeName,ManagerID)
AS
(
   SELECT E1.EmpID,E1.EmpName,E1.ReportsTo
   FROM dbo.Employees_2000_2005 E1
   WHERE E1.ReportsTo IS NULL
   UNION ALL
   SELECT E2.EmpID,E2.EmpName,E2.ReportsTo
   FROM dbo.Employees_2000_2005 E2 JOIN ReportsToCTE CTE
        ON E2.ReportsTo=CTE.EmployeeID
)
SELECT 
       (SELECT E3.EmpName
        FROM dbo.Employees_2000_2005 E3
        WHERE C.ManagerID=E3.EmpID
       )AS ManagerName,
       C.EmployeeName
FROM ReportsToCTE C

--OR

SELECT E2.EmpName AS Manager,E1.EmpName AS Employee
FROM dbo.Employees_2000_2005 E1 LEFT JOIN dbo.Employees_2000_2005 E2
     ON E1.ReportsTo=E2.EmpID
     
-------------------------------------------------------------------------------

--6

;WITH ReportsToCTE(EmployeeID,EmployeeName,ManagerID,Levels)
AS
(
   SELECT E1.EmpID,E1.EmpName,E1.ReportsTo,1
   FROM dbo.Employees_2000_2005 E1
   WHERE E1.ReportsTo IS NULL
   UNION ALL
   SELECT E2.EmpID,E2.EmpName,E2.ReportsTo,CTE.Levels+1
   FROM dbo.Employees_2000_2005 E2 JOIN ReportsToCTE CTE
        ON E2.ReportsTo=CTE.EmployeeID
)
SELECT C.EmployeeID,C.EmployeeName,C.Levels,
       (SELECT E3.EmpName
        FROM dbo.Employees_2000_2005 E3
        WHERE C.ManagerID=E3.EmpID 
       )AS ManagerName
FROM ReportsToCTE C

----------------------------------------------------------------     