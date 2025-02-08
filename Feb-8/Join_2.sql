SELECT TOP (1000) [Empno]
      ,[Nam]
      ,[Basic]
      ,[MgrNo]
  FROM [sqlpractice1].[dbo].[EmpMgr]


select E1.Empno 'Manager Id', 
		 E1.Nam 'Manager Name', 
		 E2.Empno 'Employ Id', 
		 E2.Nam 'Employ Name'
  from EmpMgr E1 INNER JOIN EmpMgr E2 
  ON E1.Empno = E2.MgrNo
  GO
