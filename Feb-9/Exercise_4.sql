--1

SELECT E.EmployeeNumber,PM.Fromdate,PM.ToDate,E.Name,
D.Description DesignationDescription,
Ser.Description ServiceDescription,
Stat.Description StatusDescription,
OnlyVDA.Amount AS VDAAmount
FROM dbo.tblEmployees E 
                    INNER JOIN (
        SELECT VDA.EmployeeNumber,VDA.NoteNumber,VDA.Amount
        FROM (SELECT PE1.EmployeeNumber,PE1.NoteNumber,PE1.Amount
           FROM dbo.tblPayEmployeeparamDetails PE1
           WHERE PE1.ParamCode='VDA'
          )AS VDA
          LEFT JOIN
          (SELECT PE2.EmployeeNumber,PE2.NoteNumber
           FROM dbo.tblPayEmployeeparamDetails PE2
           WHERE PE2.ParamCode='HRA'
          )AS HRA
          ON VDA.EmployeeNumber=HRA.EmployeeNumber 
             AND VDA.NoteNumber=HRA.NoteNumber
          WHERE HRA.EmployeeNumber IS NULL
                             )AS OnlyVDA  
                   ON E.EmployeeNumber=OnlyVDA.EmployeeNumber 
                   INNER JOIN dbo.tblPayMaster PM
                   ON OnlyVDA.NoteNumber=PM.NoteNumber
                   INNER JOIN dbo.tblDesignations D
                   ON E.DesignationCode=D.DesignationCode
                   INNER JOIN dbo.tblServiceTypes Ser
                   ON E.ServiceType=Ser.ServiceType
                   INNER JOIN dbo.tblServiceStatus Stat
                   ON E.ServiceStatus=Stat.ServiceStatus
  ORDER BY E.EmployeeNumber
-------------------------------------------------------------------------------------------------------------

--2

SELECT E.EmployeeNumber,PM.Fromdate,PM.ToDate,E.Name,
D.Description DesignationDescription,
Ser.Description ServiceDescription,
Stat.Description StatusDescription,
BOTH_VDA_HRA.VAMT AS VDAAmount,
BOTH_VDA_HRA.HAMT AS HRAAmount
FROM dbo.tblEmployees E 
                    INNER JOIN (
        SELECT VDA.EmployeeNumber,VDA.NoteNumber,VDA.VAMT,HRA.HAMT
        FROM (SELECT PE1.EmployeeNumber,PE1.NoteNumber,PE1.Amount AS VAMT
           FROM dbo.tblPayEmployeeparamDetails PE1
           WHERE PE1.ParamCode='VDA'
          )AS VDA
          INNER JOIN
          (SELECT PE2.EmployeeNumber,PE2.NoteNumber,PE2.Amount AS HAMT
           FROM dbo.tblPayEmployeeparamDetails PE2
           WHERE PE2.ParamCode='HRA'
          )AS HRA
          ON VDA.EmployeeNumber=HRA.EmployeeNumber 
             AND VDA.NoteNumber=HRA.NoteNumber          
                             )AS BOTH_VDA_HRA  
                   ON E.EmployeeNumber=BOTH_VDA_HRA.EmployeeNumber 
                   INNER JOIN dbo.tblPayMaster PM
                   ON BOTH_VDA_HRA.NoteNumber=PM.NoteNumber
                   INNER JOIN dbo.tblDesignations D
                   ON E.DesignationCode=D.DesignationCode
                   INNER JOIN dbo.tblServiceTypes Ser
                   ON E.ServiceType=Ser.ServiceType
                   INNER JOIN dbo.tblServiceStatus Stat
                   ON E.ServiceStatus=Stat.ServiceStatus
  ORDER BY E.EmployeeNumber
----------------------------------------------------------------------------

--3

SELECT E.EmployeeNumber,PM.Fromdate,PM.ToDate,E.Name,
D.Description DesignationDescription,
Ser.Description ServiceDescription,
Stat.Description StatusDescription,
VDA_OR_HRA.VAMT AS VDAAmount,
VDA_OR_HRA.HAMT AS HRAAmount
FROM dbo.tblEmployees E 
                    INNER JOIN (
								SELECT EmployeeNumber=CASE WHEN VDA.EmployeeNumber IS NULL THEN HRA.EmployeeNumber ELSE VDA.EmployeeNumber END,
								       NoteNumber=CASE WHEN VDA.NoteNumber IS NULL THEN HRA.NoteNumber ELSE VDA.NoteNumber END,
								VDA.VAMT,HRA.HAMT
								
								FROM (SELECT PE1.EmployeeNumber,PE1.NoteNumber,PE1.Amount AS VAMT
									  FROM dbo.tblPayEmployeeparamDetails PE1
									  WHERE PE1.ParamCode='VDA'
									 )AS VDA
									 FULL OUTER JOIN
									 (SELECT PE2.EmployeeNumber,PE2.NoteNumber,PE2.Amount AS HAMT
									  FROM dbo.tblPayEmployeeparamDetails PE2
									  WHERE PE2.ParamCode='HRA'
									 )AS HRA
								     ON VDA.EmployeeNumber=HRA.EmployeeNumber 
								     AND VDA.NoteNumber=HRA.NoteNumber								  
                             )AS VDA_OR_HRA  
                   ON E.EmployeeNumber=VDA_OR_HRA.EmployeeNumber 
                   INNER JOIN dbo.tblPayMaster PM
                   ON VDA_OR_HRA.NoteNumber=PM.NoteNumber
                   INNER JOIN dbo.tblDesignations D
                   ON E.DesignationCode=D.DesignationCode
                   INNER JOIN dbo.tblServiceTypes Ser
                   ON E.ServiceType=Ser.ServiceType
                   INNER JOIN dbo.tblServiceStatus Stat
                   ON E.ServiceStatus=Stat.ServiceStatus            
  ORDER BY E.EmployeeNumber
--------------------------------------------------------------------------------------------

--4

SELECT E.EmployeeNumber,PM.Fromdate,PM.ToDate,E.Name,
D.Description DesignationDescription,
Ser.Description ServiceDescription,
Stat.Description StatusDescription,
VDA_NFH_LWW_NOT_PF.VAMT AS VDAAmount,
VDA_NFH_LWW_NOT_PF.NAMT AS NFHAmount,
VDA_NFH_LWW_NOT_PF.LAMT AS LWWAmount
FROM dbo.tblEmployees E 
                    INNER JOIN (
								
                                SELECT VDA.EmployeeNumber,VDA.NoteNumber,VDA.VAMT,NFH.NAMT,LWW.LAMT
								FROM (SELECT PE1.EmployeeNumber,PE1.NoteNumber,PE1.Amount AS VAMT
									  FROM dbo.tblPayEmployeeparamDetails PE1
									  WHERE PE1.ParamCode='VDA'
									 )AS VDA
									 INNER JOIN
									 (SELECT PE2.EmployeeNumber,PE2.NoteNumber,PE2.Amount AS NAMT
									  FROM dbo.tblPayEmployeeparamDetails PE2
									  WHERE PE2.ParamCode='NFH'
									 )AS NFH
								     ON VDA.EmployeeNumber=NFH.EmployeeNumber 
								     AND VDA.NoteNumber=NFH.NoteNumber								    
								     INNER JOIN
								     (SELECT PE3.EmployeeNumber,PE3.NoteNumber,PE3.Amount AS LAMT
									  FROM dbo.tblPayEmployeeparamDetails PE3
									  WHERE PE3.ParamCode='LWW'
									 )AS LWW
									 ON VDA.EmployeeNumber=LWW.EmployeeNumber
									 AND VDA.NoteNumber=LWW.NoteNumber
									 LEFT JOIN
									 (SELECT PE4.EmployeeNumber,PE4.NoteNumber
									  FROM dbo.tblPayEmployeeparamDetails PE4
									  WHERE PE4.ParamCode='PF'
									 )AS PF
									 ON VDA.EmployeeNumber=PF.EmployeeNumber
									 AND VDA.NoteNumber=PF.NoteNumber
									 WHERE PF.EmployeeNumber IS NULL						  
                             )AS VDA_NFH_LWW_NOT_PF  
                   ON E.EmployeeNumber=VDA_NFH_LWW_NOT_PF.EmployeeNumber 
                   INNER JOIN dbo.tblPayMaster PM
                   ON VDA_NFH_LWW_NOT_PF.NoteNumber=PM.NoteNumber
                   INNER JOIN dbo.tblDesignations D
                   ON E.DesignationCode=D.DesignationCode
                   INNER JOIN dbo.tblServiceTypes Ser
                   ON E.ServiceType=Ser.ServiceType
                   INNER JOIN dbo.tblServiceStatus Stat
                   ON E.ServiceStatus=Stat.ServiceStatus            
  ORDER BY E.EmployeeNumber

-------------------------------------------------------------------------------------------------------

--5


SELECT E.EmployeeNumber
FROM dbo.tblEmployees E LEFT JOIN (			
									SELECT ED.EmployeeNumber
									FROM dbo.tblPayEmployeeparamDetails ED
									GROUP BY ED.EmployeeNumber
		                           )PAYEDEMPS
    ON E.EmployeeNumber=PAYEDEMPS.EmployeeNumber
WHERE PAYEDEMPS.EmployeeNumber IS NULL		                               
ORDER BY E.EmployeeNumber


-------------------------------------------------------------------------------------------------------

--6

SELECT PE.EmployeeNumber,PM.Fromdate,PM.ToDate,D.Description AS Desig_Desc,SER.Description as Serv_Desc,
       STAT.Description AS Stat_Desc,
       PE.GrossPay AS PayEmp_Gross,PE.Deductions PayEmp_Deduction,PE.NetPay PayEmp_NetPay,
       PARAM_DETAIL.Param_Gross,PARAM_DETAIL.Param_Deduction,PARAM_DETAIL.Param_NetPay,
       PARAM_DETAIL.Param_Basic,PARAM_DETAIL.Param_VDA,PARAM_DETAIL.Param_HRA,PARAM_DETAIL.Pram_Not_Basic_HRA_VDA,
       PARAM_DETAIL.Param_PF,PARAM_DETAIL.Param_OtherDeduction
FROM dbo.tblPayEmployees PE
         INNER JOIN dbo.tblPayMaster PM ON PE.NoteNumber=PM.NoteNumber
         INNER JOIN dbo.tblDesignations D ON PE.DesignationCode=D.DesignationCode
         INNER JOIN dbo.tblServiceTypes SER ON PE.Servicetype=SER.ServiceType
         INNER JOIN dbo.tblServiceStatus STAT ON PE.ServiceStatus=STAT.ServiceStatus
         INNER JOIN         
		( SELECT PED.EmployeeNumber,PED.NoteNumber, Param_Gross=SUM(CASE WHEN PED.TransValue=1 THEN PED.Amount ELSE 0 END),
				Param_Deduction=SUM(CASE WHEN PED.TransValue=-1 THEN PED.Amount ELSE 0 END),
				Param_NetPay=SUM(CASE WHEN PED.TransValue=1 THEN PED.Amount ELSE -PED.Amount END),
				Param_Basic=SUM(CASE WHEN PED.ParamCode='BASIC' THEN PED.Amount ELSE 0 END),
				Param_VDA=SUM(CASE WHEN PED.ParamCode='VDA' THEN PED.Amount ELSE 0 END),
				Param_HRA=SUM(CASE WHEN PED.ParamCode='HRA' THEN PED.Amount ELSE 0 END),
				Pram_Not_Basic_HRA_VDA=SUM(CASE WHEN PED.ParamCode='BASIC' OR PED.ParamCode='HRA' OR PED.ParamCode='VDA' THEN 0 ELSE PED.Amount END),
				Param_PF=SUM(CASE WHEN PED.ParamCode='PF' THEN PED.Amount ELSE 0 END),
				Param_OtherDeduction=SUM(CASE WHEN PED.TransValue=-1 AND PED.ParamCode!='PF' THEN PED.Amount ELSE 0 END)
		  FROM dbo.tblPayEmployeeparamDetails PED    
		  GROUP BY PED.EmployeeNumber,PED.NoteNumber
		 )AS PARAM_DETAIL
		 ON PE.EmployeeNumber=PARAM_DETAIL.EmployeeNumber AND PE.NoteNumber=PARAM_DETAIL.NoteNumber
ORDER BY PE.EmployeeNumber       

-------------------------------------------------------------------------------------------
--7
SELECT EMP.EmployeeNumber,EMP.Name,EMP.PresentBasic
FROM dbo.tblEmployees AS EMP
WHERE EMP.PresentBasic>=( SELECT DISTINCT A.PresentBasic
						  FROM   dbo.tblEmployees AS A
						  GROUP BY EmployeeNumber, PresentBasic
						  HAVING 7 = ( SELECT COUNT(DISTINCT(PresentBasic)) 
						   			   FROM dbo.tblEmployees AS B 
									   WHERE A.PresentBasic <= B.PresentBasic
									 )
						)            

-------------------------------------------------------------------------------------------
--8


SELECT EmployeeNumber,Name, PresentBasic, ( SELECT COUNT(DISTINCT(PresentBasic)) 
                                            FROM dbo.tblEmployees AS B 
                                            WHERE A.PresentBasic <= B.PresentBasic
                                          )Nth_VALUE 
FROM   dbo.tblEmployees AS A
GROUP BY EmployeeNumber,Name,PresentBasic
HAVING 7 = ( SELECT COUNT(DISTINCT(PresentBasic)) 
             FROM dbo.tblEmployees AS B 
             WHERE A.PresentBasic <= B.PresentBasic
           )

-------------------------------------------------------------------------------------------
--9

SELECT EmployeeNumber,Name, PresentBasic, ( SELECT COUNT(DISTINCT(PresentBasic)) 
                                            FROM dbo.tblEmployees AS B 
                                            WHERE A.PresentBasic <= B.PresentBasic
                                          )Nth_VALUE 
FROM   dbo.tblEmployees AS A
GROUP BY EmployeeNumber,Name,PresentBasic
HAVING    ( SELECT COUNT(DISTINCT(PresentBasic)) 
             FROM dbo.tblEmployees AS B 
             WHERE A.PresentBasic <= B.PresentBasic
           ) BETWEEN 8 AND 15


-------------------------------------------------------------------------------------------
--10

SELECT PM.Fromdate,PM.ToDate,E.DepartmentCode,SUM(PE.GrossPay)AS GROSSPAY
FROM dbo.tblPayEmployees PE 
     INNER JOIN dbo.tblPayMaster PM ON PE.NoteNumber=PM.NoteNumber
     INNER JOIN dbo.tblEmployees E ON PE.EmployeeNumber=E.EmployeeNumber 
GROUP BY PM.Fromdate,PM.ToDate,E.DepartmentCode  
HAVING SUM(PE.GrossPay)>30000    
ORDER BY PM.Fromdate,PM.ToDate,SUM(PE.GrossPay)

---------------------------------------------------------------------------------------------------

--11


SELECT DISTINCT EMP.EmployeeNumber,EMP.Name,EMP.Age,EMP.DOB,EMP.MaritalStatus,EMP.DepartmentCode
FROM dbo.tblEmployees EMP 
WHERE EMP.DepartmentCode IN 
    (
	 SELECT DISTINCT E.DepartmentCode
	 FROM dbo.tblPayEmployees PE
		 INNER JOIN(SELECT PM.NoteNumber,DATEPART(MONTH,PM.Fromdate)AS MONTHS FROM dbo.tblPayMaster PM)PAY_MONTH
		 ON PE.NoteNumber=PAY_MONTH.NoteNumber
		 INNER JOIN dbo.tblEmployees E ON PE.EmployeeNumber=E.EmployeeNumber
	 GROUP BY PAY_MONTH.MONTHS,E.DepartmentCode
	 HAVING SUM(PE.GrossPay)>30000    
	)
ORDER BY EMP.EmployeeNumber

------------------------------------------------------------------------------------------

--12

SELECT *
FROM dbo.tblEmployees E
WHERE E.DepartmentCode =
(
  SELECT DISTINCT DEPT.DepartmentCode
  FROM
   ( SELECT E.DepartmentCode,PAY_MONTH.MONTHS,SUM(PE.GrossPay)AS GROSS,AVG(PE.GrossPay)AS GROSS_AGG
 FROM dbo.tblPayEmployees PE
   INNER JOIN(SELECT PM.NoteNumber,DATEPART(MONTH,PM.Fromdate)AS MONTHS FROM dbo.tblPayMaster PM)PAY_MONTH
   ON PE.NoteNumber=PAY_MONTH.NoteNumber
   INNER JOIN dbo.tblEmployees E ON PE.EmployeeNumber=E.EmployeeNumber
 --WHERE E.DepartmentCode=5 AND PAY_MONTH.MONTHS=3  
 GROUP BY PAY_MONTH.MONTHS,E.DepartmentCode
 HAVING SUM(PE.GrossPay)>30000    
   )AS DEPT
  INNER JOIN
  (
    SELECT E.DepartmentCode,PAY_MONTH.MONTHS,PAY_MONTH.CentreCode,AVG(PE.GrossPay)AS CENTER_AGG
 FROM dbo.tblPayEmployees PE
   INNER JOIN(SELECT PM.NoteNumber,PM.CentreCode,DATEPART(MONTH,PM.Fromdate)AS MONTHS FROM dbo.tblPayMaster PM)PAY_MONTH
   ON PE.NoteNumber=PAY_MONTH.NoteNumber
   INNER JOIN dbo.tblEmployees E ON PE.EmployeeNumber=E.EmployeeNumber  
 --WHERE E.DepartmentCode=5 AND PAY_MONTH.MONTHS=3  
   GROUP BY PAY_MONTH.MONTHS,E.DepartmentCode,PAY_MONTH.CentreCode
  )AS CENTER
  ON DEPT.DepartmentCode=CENTER.DepartmentCode AND DEPT.MONTHS=CENTER.MONTHS AND CENTER.CENTER_AGG>2*DEPT.GROSS_AGG
)

----------------------------------------------------------------------------------------------------

--13

SELECT DISTINCT X.EmployeeNumber,X.Fromdate,X.ToDate,SUM(X.GrossPay),SUM(X.Deductions),SUM(X.NetPay),
       SUM(X.BASIC)BASIC,SUM(X.HRA)HRA,SUM(X.VDA)VDA,SUM(X.LWW),SUM(X.ADMNAL)ADMNAL,SUM(X.CNV)CNV,
       SUM(X.BONUS)BONUS,SUM(X.NFH)NFH,SUM(X.PF)PF,SUM(X.ESI)ESI   
FROM 
(
SELECT DISTINCT PM.Fromdate,PM.ToDate,PE.GrossPay,PE.Deductions,PE.NetPay,
       ED.*           
FROM dbo.tblPayMaster PM
     INNER JOIN dbo.tblPayEmployees PE ON PM.NoteNumber=PE.NoteNumber 
     INNER JOIN 
     (
		SELECT E.EmployeeNumber,E.NoteNumber,
		BASIC=SUM(CASE WHEN E.ParamCode='BASIC' THEN E.Amount ELSE 0 END),
		HRA=SUM(CASE WHEN E.ParamCode='HRA' THEN E.Amount ELSE 0 END),
		VDA=SUM(CASE WHEN E.ParamCode='VDA' THEN E.Amount ELSE 0 END),
		LWW=SUM(CASE WHEN E.ParamCode='LWW' THEN E.Amount ELSE 0 END),
		ADMNAL=SUM(CASE WHEN E.ParamCode='ADMNAL' THEN E.Amount ELSE 0 END),
		CNV=SUM(CASE WHEN E.ParamCode='CNV' THEN E.Amount ELSE 0 END),
		BONUS=SUM(CASE WHEN E.ParamCode='BONUS' THEN E.Amount ELSE 0 END),
		NFH=SUM(CASE WHEN E.ParamCode='NFH' THEN E.Amount ELSE 0 END),
		PF=SUM(CASE WHEN E.ParamCode='PF' THEN E.Amount ELSE 0 END),
		ESI=SUM(CASE WHEN E.ParamCode='ESI' THEN E.Amount ELSE 0 END)
		FROM dbo.tblPayEmployeeparamDetails E		
		GROUP BY E.NoteNumber,E.EmployeeNumber		 
     )ED
     ON ED.EmployeeNumber=PE.EmployeeNumber AND PE.NoteNumber=ED.NoteNumber
 )AS X    
GROUP BY X.Fromdate,X.ToDate,X.EmployeeNumber     
ORDER BY X.EmployeeNumber     


------------------------------------------------------------------------------------------------------

--14


SELECT PED.EmployeeNumber,LATEST_DATE.Fromdate,
              LATEST_DATE.ToDate,LATEST_DATE.GrossPay,LATEST_DATE.Deductions,
              LATEST_DATE.NetPay,PED.BASIC,PED.HRA,PED.VDA,PED.LWW,PED.ADMNAL,PED.CNV,
              PED.BONUS,PED.NFH,PED.PF,PED.ESI
       FROM (
				SELECT E.EmployeeNumber,E.NoteNumber,
				BASIC=SUM(CASE WHEN E.ParamCode='BASIC' THEN E.Amount ELSE 0 END),
				HRA=SUM(CASE WHEN E.ParamCode='HRA' THEN E.Amount ELSE 0 END),
				VDA=SUM(CASE WHEN E.ParamCode='VDA' THEN E.Amount ELSE 0 END),
				LWW=SUM(CASE WHEN E.ParamCode='LWW' THEN E.Amount ELSE 0 END),
				ADMNAL=SUM(CASE WHEN E.ParamCode='ADMNAL' THEN E.Amount ELSE 0 END),
				CNV=SUM(CASE WHEN E.ParamCode='CNV' THEN E.Amount ELSE 0 END),
				BONUS=SUM(CASE WHEN E.ParamCode='BONUS' THEN E.Amount ELSE 0 END),
				NFH=SUM(CASE WHEN E.ParamCode='NFH' THEN E.Amount ELSE 0 END),
				PF=SUM(CASE WHEN E.ParamCode='PF' THEN E.Amount ELSE 0 END),
				ESI=SUM(CASE WHEN E.ParamCode='ESI' THEN E.Amount ELSE 0 END)
				FROM dbo.tblPayEmployeeparamDetails E		
				GROUP BY E.NoteNumber,E.EmployeeNumber
             )PED
             INNER JOIN
	        (
				SELECT PE.EmployeeNumber,PE.GrossPay,PE.Deductions,PE.NetPay,
					   MAXDATE.NoteNumber,MAXDATE.Fromdate,MAXDATE.ToDate
				FROM dbo.tblPayEmployees PE
					  INNER JOIN
					  (
						SELECT PM.NoteNumber,PM.Fromdate,PM.ToDate
						FROM dbo.tblPayMaster PM
						WHERE PM.Fromdate IN(
											 SELECT MAX(PM.Fromdate)
											 FROM dbo.tblPayMaster PM
											)
			          )MAXDATE 
			          ON MAXDATE.NoteNumber=PE.NoteNumber    
		        WHERE PE.GrossPay>PE.Deductions AND PE.GrossPay>PE.NetPay                           
            )LATEST_DATE
            ON PED.EmployeeNumber=LATEST_DATE.EmployeeNumber AND PED.NoteNumber=LATEST_DATE.NoteNumber
            
-----------------------------------------------------------------------------------------------------------

--15

SELECT ONLY_CNV.EmployeeNumber
FROM dbo.tblPayEmployees PE INNER JOIN           
                              (
                                SELECT CNV.EmployeeNumber,CNV.NoteNumber,CNV.ParamCode,CNV.Amount
								FROM (SELECT PE1.EmployeeNumber,PE1.NoteNumber,PE1.ParamCode,PE1.Amount
									  FROM dbo.tblPayEmployeeparamDetails PE1
									  WHERE PE1.ParamCode='CNV'
									 )AS CNV
									 LEFT JOIN
									 (SELECT PE2.EmployeeNumber,PE2.NoteNumber
									  FROM dbo.tblPayEmployeeparamDetails PE2
									  WHERE PE2.ParamCode='ESI'
									 )AS ESI
								  ON CNV.EmployeeNumber=ESI.EmployeeNumber 
								     AND CNV.NoteNumber=ESI.NoteNumber
								  WHERE ESI.EmployeeNumber IS NULL 								 
							 )ONLY_CNV  
						ON PE.NoteNumber=ONLY_CNV.NoteNumber AND PE.EmployeeNumber=ONLY_CNV.EmployeeNumber	
						INNER JOIN dbo.tblPayMaster PM
						ON ONLY_CNV.NoteNumber=PM.NoteNumber
WHERE DATEDIFF(DAY,PM.Fromdate,PM.ToDate)>=28						 
GROUP BY ONLY_CNV.EmployeeNumber						

----------------------------------------------------------------------------------------------------------

--16   

SELECT BOTH_CNV_ESI.EmployeeNumber
FROM dbo.tblPayEmployees PE INNER JOIN           
                              (
                                SELECT CNV.EmployeeNumber,CNV.NoteNumber,CNV.ParamCode,CNV.Amount
								FROM (SELECT PE1.EmployeeNumber,PE1.NoteNumber,PE1.ParamCode,PE1.Amount
									  FROM dbo.tblPayEmployeeparamDetails PE1
									  WHERE PE1.ParamCode='CNV'
									 )AS CNV
									 INNER JOIN
									 (SELECT PE2.EmployeeNumber,PE2.NoteNumber
									  FROM dbo.tblPayEmployeeparamDetails PE2
									  WHERE PE2.ParamCode='ESI'
									 )AS ESI
								  ON CNV.EmployeeNumber=ESI.EmployeeNumber 
								     AND CNV.NoteNumber=ESI.NoteNumber								 
							 )BOTH_CNV_ESI 
						ON PE.NoteNumber=BOTH_CNV_ESI.NoteNumber AND PE.EmployeeNumber=BOTH_CNV_ESI.EmployeeNumber	
						INNER JOIN dbo.tblPayMaster PM
						ON BOTH_CNV_ESI.NoteNumber=PM.NoteNumber
WHERE DATEDIFF(DAY,PM.Fromdate,PM.ToDate)>=28						 
GROUP BY BOTH_CNV_ESI.EmployeeNumber	

