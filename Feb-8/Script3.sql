-- String Functions

/* charindex() : Used to display the first occurence of the given character  */

select CHARINDEX('l','hello')
GO

select FirstName,CHARINDEX('a',FirstName) 
from Agent
GO

/* Reverse : Used to display name in reverse Order */

select REVERSE('Hello')
GO

select FirstName, REVERSE(FirstName) from Agent
GO

/* Len : Used to display the length of string */

select len('keshav')
GO

select FirstName, Len(FirstName) 
from Agent 
GO

/* Left : Displays no.of left-side chars */

select firstName, left(FirstName,4) from Agent 
GO

/* Right : Displays no.of right-side chars */

select FirstName,RIGHT(FirstName,4) From Agent 
GO

/* Lower : Displays string in lower case */

/* Upper : Displays string in upper case */ 

select FirstName, Lower(FirstName), Upper(FirstName) from Agent 
GO

/* Substring : Used to display part of the string */

select substring('Welcome to Sql',4,6)
GO

/* Replace : Used to replace a word/char with new word/char in all occurrences */

select REPLACE('Dotnet Training','Dotnet','Sql')
GO




