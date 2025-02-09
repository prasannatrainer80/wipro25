--1

GO

CREATE PROCEDURE Bonus_Calculation
AS
	BEGIN
		SELECT E.EmployeeNumber,E.Name,E.PresentBasic,S.ServiceType,S.Description,
			  ( CASE 
				   WHEN S.Description='EMPLOYEE' OR S.Description='CHECKER'
						THEN
						   CASE
							   WHEN 12*E.PresentBasic>=0 AND 12*E.PresentBasic<=60000
									THEN (15*(12*E.PresentBasic))/100
							   WHEN 12*E.PresentBasic>=60001 AND 12*E.PresentBasic<=100000
									THEN 
									  CASE 
										 WHEN ((12*(12*E.PresentBasic))/100)<9000 THEN 9000
										 ELSE (12*(12*E.PresentBasic))/100
									  END
							   ELSE 
									CASE 
									   WHEN 12*E.PresentBasic>=100001 AND ((8*(12*E.PresentBasic))/100)<13800
											THEN 13800
									   ELSE (8*(12*E.PresentBasic))/100 
									END                                             
						   END 
				   ELSE (12*(12*E.PresentBasic))/100         
				END ) AS Bonus
		FROM dbo.tblEmployees E JOIN dbo.tblServiceTypes S
			 ON E.ServiceType=S.ServiceType
	END  
		   
 EXEC Bonus_Calculation
 
GO
----------------------------------------------------------------------------------------------

--2

GO

CREATE PROCEDURE SALARY_CALCULATIONS
AS
BEGIN
	;WITH CTE
	AS
	(
		SELECT E.EmployeeNumber,E.Name,C.CentreName,E.PresentBasic AS Basic,
			   (CASE 
				   WHEN (200 + 0.06*E.PresentBasic)>10000 THEN 10000
				   ELSE (200 + 0.06*E.PresentBasic)
			   END) AS VDA ,
		       
			   (CASE 
				   WHEN C.CentreName='HYDERABAD'
					   THEN 
							CASE 
								WHEN (200 + 0.06*E.PresentBasic)>10000 THEN 0.4*E.PresentBasic + 10000
								ELSE 0.4*E.PresentBasic + (200 + 0.06*E.PresentBasic)
							END    
				   WHEN C.CentreName='NIZAMABAD'
					   THEN 
							CASE 
								WHEN (200 + 0.06*E.PresentBasic)>10000 THEN 0.25*E.PresentBasic + 10000
								ELSE 0.25*E.PresentBasic + (200 + 0.06*E.PresentBasic)
							END           
				   ELSE 0.15*E.PresentBasic
				END) AS HRA ,
		        
			   (CASE 
				   WHEN 0.04*E.PresentBasic > 800
					  THEN 800
				   ELSE 0.04*E.PresentBasic
				END) AS CONVEYANCE,
		        
			   (CASE 
					WHEN (DATEDIFF( YY, E.DOB, GETDATE()) - CASE 
											   WHEN ( MONTH(E.DOB)>MONTH(GETDATE()))
													OR
													(
													  MONTH(E.DOB)=MONTH(GETDATE()) AND
													  DAY(E.DOB)>DAY(GETDATE())
													)	                                         
												THEN 1
											   ELSE 0
											 END   ) < 58
						 THEN 0.1*E.PresentBasic                    
					ELSE 0
				END) AS PF                                  
		FROM dbo.tblEmployees E JOIN dbo.tblCentreMaster C
			 ON E.CentreCode=C.CentreCode
	)
	SELECT C.EmployeeNumber,C.Name,C.CentreName,C.Basic,C.VDA,C.HRA,C.CONVEYANCE,
		   (C.Basic+C.VDA+C.HRA+C.CONVEYANCE) AS GROSS_PAY,C.PF,C.PF AS DEDUCTIONS,
		   (C.Basic+C.VDA+C.HRA+C.CONVEYANCE-C.PF) AS NET_PAY
	FROM CTE C	
END

EXEC SALARY_CALCULATIONS

GO
----------------------------------------------------------------------------------------------

--3
GO

CREATE PROCEDURE TDS_CALCULATIONS   
   AS
     CREATE TABLE #TABLE_SLABS(LOW_LIMIT INT,UP_LIMIT INT,TAX_RATE INT) 
     DECLARE @TABLE_GET_BONUS TABLE(EmpNumber INT,Name VARCHAR(40),PB FLOAT,ST INT,SD VARCHAR(40),BONUS FLOAT)
     DECLARE @TABLE_GET_GROSS TABLE(EmpNumber INT,Name VARCHAR(40),CENTER VARCHAR(40),BASIC FLOAT,VDA FLOAT,HRA FLOAT,CONVEYANCE FLOAT,GROSS FLOAT,PF FLOAT,DEDUCTION FLOAT,NET FLOAT)
     BEGIN        
       
       INSERT INTO #TABLE_SLABS(LOW_LIMIT,UP_LIMIT,TAX_RATE)VALUES
       (0,20000,0),(20001,40000,5),(40001,100000,10),(100001,200000,15),(200001,500000,20),(500001,1000000,30)
       
       INSERT INTO @TABLE_GET_BONUS
       EXEC Bonus_Calculation                     
       INSERT INTO @TABLE_GET_GROSS 
       EXEC SALARY_CALCULATIONS
       
       SELECT TG.EmpNumber,TG.Name,TG.CENTER,TG.BASIC,TG.VDA,TG.HRA,TG.CONVEYANCE,TG.GROSS,TG.PF,TG.DEDUCTION,TG.NET,TB.BONUS AS YEARLY_BONUS,
              (12*(TG.GROSS-TG.PF)+TB.BONUS)AS TDS_AMT,((TS.TAX_RATE*(12*(TG.GROSS-TG.PF)+TB.BONUS))/100) AS YEARLY_TDS
       FROM @TABLE_GET_BONUS TB 
                               JOIN @TABLE_GET_GROSS TG ON TB.EmpNumber=TG.EmpNumber
                               JOIN #TABLE_SLABS TS ON (12*(TG.GROSS-TG.PF)+TB.BONUS)>=TS.LOW_LIMIT AND (12*(TG.GROSS-TG.PF)+TB.BONUS)<=TS.UP_LIMIT        
     END 
    
   EXEC TDS_CALCULATIONS

GO

----------------------------------------------------------------------------------------------
--4

GO

CREATE FUNCTION Bonus_Returns(@EmployeeType VARCHAR(20),@Basic FLOAT)
RETURNS FLOAT
AS
	BEGIN
	    DECLARE @Bonus FLOAT
	    DECLARE @EmpType VARCHAR(20) = @EmployeeType
	    DECLARE @PresentBasic FLOAT = @Basic
		SELECT @Bonus =
			  ( 
			    CASE 
				   WHEN @EmpType='EMPLOYEE' OR @EmpType='CHECKER'
						THEN
						   CASE
							   WHEN 12*@PresentBasic>=0 AND 12*@PresentBasic<=60000
									THEN (15*(12*@PresentBasic))/100
							   WHEN 12*@PresentBasic>=60001 AND 12*@PresentBasic<=100000
									THEN 
									  CASE 
										 WHEN ((12*(12*@PresentBasic))/100)<9000 THEN 9000
										 ELSE (12*(12*@PresentBasic))/100
									  END
							   ELSE 
									CASE 
									   WHEN 12*@PresentBasic>=100001 AND ((8*(12*@PresentBasic))/100)<13800
											THEN 13800
									   ELSE (8*(12*@PresentBasic))/100 
									END                                             
						   END 
				   ELSE (12*(12*@PresentBasic))/100         
				END 
			  )
		
        RETURN(@Bonus)			 
	END  

GO
SELECT E.EmployeeNumber,E.Name,E.PresentBasic,S.ServiceType,S.Description,dbo.Bonus_Returns(S.Description,E.PresentBasic) AS BONUS
FROM dbo.tblEmployees E JOIN dbo.tblServiceTypes S
     ON E.ServiceType=S.ServiceType
     
-----------------------------------------------------------------------------------------

--5

GO

CREATE FUNCTION SALARY_CALCULATIONS_TBL_FUNCTION(@EmpNum INT,@BASIC FLOAT,@Center VARCHAR(20),@BIRTH_DATE DATETIME)
RETURNS @SALARY_TABLE TABLE(EmployeeNumber INT,VDA FLOAT,HAR FLOAT,CONVEYANCE FLOAT,GROSS_PAY FLOAT,PF FLOAT,DEDUCTIONS FLOAT,NET_PAY FLOAT)
AS
BEGIN
    DECLARE @PresentBasic FLOAT = @BASIC
    DECLARE @CenterName VARCHAR(20) = @Center
    DECLARE @DOB DATETIME = @BIRTH_DATE
    DECLARE @EmployeeNumber INT=@EmpNum
    
	;WITH CTE
	AS
	(
		SELECT @EmployeeNumber AS EmployeeNumber,@PresentBasic AS Basic,
			   (CASE 
				   WHEN (200 + 0.06*@PresentBasic)>10000 THEN 10000
				   ELSE (200 + 0.06*@PresentBasic)
			   END) AS VDA ,
		       
			   (CASE 
				   WHEN @CenterName='HYDERABAD'
					   THEN 
							CASE 
								WHEN (200 + 0.06*@PresentBasic)>10000 THEN 0.4*@PresentBasic + 10000
								ELSE 0.4*@PresentBasic + (200 + 0.06*@PresentBasic)
							END    
				   WHEN @CenterName='NIZAMABAD'
					   THEN 
							CASE 
								WHEN (200 + 0.06*@PresentBasic)>10000 THEN 0.25*@PresentBasic + 10000
								ELSE 0.25*@PresentBasic + (200 + 0.06*@PresentBasic)
							END           
				   ELSE 0.15*@PresentBasic
				END) AS HRA ,
		        
			   (CASE 
				   WHEN 0.04*@PresentBasic > 800
					  THEN 800
				   ELSE 0.04*@PresentBasic
				END) AS CONVEYANCE,
		        
			   (CASE 
					WHEN (DATEDIFF( YY, @DOB, GETDATE()) - CASE 
											   WHEN ( MONTH(@DOB)>MONTH(GETDATE()))
													OR
													(
													  MONTH(@DOB)=MONTH(GETDATE()) AND
													  DAY(@DOB)>DAY(GETDATE())
													)	                                         
												THEN 1
											   ELSE 0
											 END   ) < 58
						 THEN 0.1*@PresentBasic                    
					ELSE 0
				END) AS PF                                  
		
	)
	INSERT INTO @SALARY_TABLE(EmployeeNumber,VDA,HAR,CONVEYANCE,GROSS_PAY,PF,DEDUCTIONS,NET_PAY)
	SELECT C.EmployeeNumber,C.VDA,C.HRA,C.CONVEYANCE,
		   SUM(C.Basic+C.VDA+C.HRA+C.CONVEYANCE) AS GROSS_PAY,C.PF,C.PF AS DEDUCTIONS,
		   SUM(C.Basic+C.VDA+C.HRA+C.CONVEYANCE-C.PF) AS NET_PAY
	FROM CTE C
	GROUP BY C.EmployeeNumber,C.VDA,C.HRA,C.CONVEYANCE,C.PF
  RETURN
END


GO

SELECT X.EmployeeNumber,X.Name,X.CentreName,X.PresentBasic,S.VDA,S.HAR,S.CONVEYANCE,S.GROSS_PAY,S.PF,S.DEDUCTIONS,S.NET_PAY
 FROM
  ( SELECT E.EmployeeNumber,E.Name,C.CentreName,E.PresentBasic,E.DOB
    FROM dbo.tblEmployees E JOIN dbo.tblCentreMaster C ON E.CentreCode=C.CentreCode) AS X
                       CROSS APPLY dbo.SALARY_CALCULATIONS_TBL_FUNCTION(X.EmployeeNumber,X.PresentBasic,X.CentreName,X.DOB) AS S     
  
  --OR
  
GO

CREATE FUNCTION SALARY_CALCULATIONS_TBL_FUNCTION1()
RETURNS @SALARY_TABLE TABLE
(EmployeeNumber INT,Name VARCHAR(40),Center VARCHAR(40),Basic FLOAT,VDA FLOAT,HAR FLOAT,CONVEYANCE FLOAT,GROSS_PAY FLOAT,PF FLOAT,DEDUCTIONS FLOAT,NET_PAY FLOAT)
AS
BEGIN
	;WITH CTE
	AS
	(
		SELECT E.EmployeeNumber,E.Name,C.CentreName,E.PresentBasic AS Basic,
			   (CASE 
				   WHEN (200 + 0.06*E.PresentBasic)>10000 THEN 10000
				   ELSE (200 + 0.06*E.PresentBasic)
			   END) AS VDA ,
		       
			   (CASE 
				   WHEN C.CentreName='HYDERABAD'
					   THEN 
							CASE 
								WHEN (200 + 0.06*E.PresentBasic)>10000 THEN 0.4*E.PresentBasic + 10000
								ELSE 0.4*E.PresentBasic + (200 + 0.06*E.PresentBasic)
							END    
				   WHEN C.CentreName='NIZAMABAD'
					   THEN 
							CASE 
								WHEN (200 + 0.06*E.PresentBasic)>10000 THEN 0.25*E.PresentBasic + 10000
								ELSE 0.25*E.PresentBasic + (200 + 0.06*E.PresentBasic)
							END           
				   ELSE 0.15*E.PresentBasic
				END) AS HRA ,
		        
			   (CASE 
				   WHEN 0.04*E.PresentBasic > 800
					  THEN 800
				   ELSE 0.04*E.PresentBasic
				END) AS CONVEYANCE,
		        
			   (CASE 
					WHEN (DATEDIFF( YY, E.DOB, GETDATE()) - CASE 
											   WHEN ( MONTH(E.DOB)>MONTH(GETDATE()))
													OR
													(
													  MONTH(E.DOB)=MONTH(GETDATE()) AND
													  DAY(E.DOB)>DAY(GETDATE())
													)	                                         
												THEN 1
											   ELSE 0
											 END   ) < 58
						 THEN 0.1*E.PresentBasic                    
					ELSE 0
				END) AS PF                                  
		FROM dbo.tblEmployees E JOIN dbo.tblCentreMaster C
			 ON E.CentreCode=C.CentreCode
	)
	INSERT INTO @SALARY_TABLE(EmployeeNumber,Name,Center,Basic,VDA,HAR,CONVEYANCE,GROSS_PAY,PF,DEDUCTIONS,NET_PAY)
	SELECT C.EmployeeNumber,C.Name,C.CentreName,C.Basic,C.VDA,C.HRA,C.CONVEYANCE,
		   SUM(C.Basic+C.VDA+C.HRA+C.CONVEYANCE) AS GROSS_PAY,C.PF,C.PF AS DEDUCTIONS,
		   SUM(C.Basic+C.VDA+C.HRA+C.CONVEYANCE-C.PF) AS NET_PAY
	FROM CTE C
	GROUP BY C.EmployeeNumber,C.Name,C.CentreName,C.Basic,C.VDA,C.HRA,C.CONVEYANCE,C.PF
  RETURN	
END
 
 GO

SELECT *
FROM dbo.SALARY_CALCULATIONS_TBL_FUNCTION1()  
  
  
----------------------------------------------------------------------------------------------------     