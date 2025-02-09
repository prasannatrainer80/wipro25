Declare @age INT 
SET @age=18
print @Age 

Declare @company varchar(30)
set @company='Wipro'
print 'Company is ' +@company


declare 
	@firstNumber INT=12, 
	@secondNumber INT=13,
	@result INT 
BEGIN
   set @result = @firstNumber + @secondNumber
   print 'Sum is ' 
   print @result 
   set @result = @firstNumber - @secondNumber 
   print 'Sub is ' 
   print @result 
   set @result = @firstNumber * @secondNumber 
   print 'Mult is ' 
   print @result 
END 

declare
	@totalRecords INT 
BEGIN
	select @totalRecords=count(*) from Emp
	print 'Total Recods are ' 
	print @totalRecords 
END

declare
	@empno INT= 2,
	@name varchar(30),
	@basic numeric(9,2) 
BEGIN
	select @name=nam, @basic=basic from Emp where empno = @empno
	print 'Student Name ' +@name 
	print 'Salary ' +convert(varchar,@basic)
END
