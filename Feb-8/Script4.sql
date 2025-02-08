-- Date Functions 

select GETDATE() 
GO

select convert(varchar,getdate(),1)
select convert(varchar,getdate(),2)
select convert(varchar,getdate(),101)
select convert(varchar,getdate(),103)

/* DatePart() : used to display the specific portion of the given 
date */ 

select datepart(dd,getdate())
select datepart(mm,getdate())
select datepart(yy,getdate())
select datepart(dw,getdate())
select datepart(dy,getdate())
select datepart(wk,getdate())
select datepart(hh,getdate())
select datepart(mi,getdate())
select datepart(ss,getdate())

select convert(varchar,DATEPART(hh,getdate())) + '/' + 
convert(varchar,datepart(mm,getdate())) + '/' + 
convert(varchar,DATEPART(yy,getdate()))
GO

select DATENAME(dw,getdate())
GO

select datename(mm,getdate()) 
GO

/* DateAdd() : used to add no.of day/years/months to the given date */

select dateadd(dd,3,getdate())
select dateadd(mm,3,getdate())
select dateadd(yy,3,getdate())

/* Datediff() : used to display difference between two dates */

select DATEDIFF(dd,'03/09/1995',getdate());
select DATEDIFF(yy,'03/09/1995',getdate());
