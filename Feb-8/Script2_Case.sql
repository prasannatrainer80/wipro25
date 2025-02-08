select * from Agent 
GO

select AgentId, FirstName, LastName, City, MaritalStatus
from Agent where MaritalStatus = 0;

GO
select AgentId, FirstName, LastName, City, MaritalStatus,
CASE MaritalStatus 
    WHEN 0 THEN 'Unmarried'
	WHEN 1 THEN 'Married'
END 'Mstat'
from Agent 
GO

select * from Policy
GO


select PolicyID, AppNumber, AnnualPremium, PayMentModelID, ModalPremium,
CASE PayMentModelID
  WHEN 1 THEN 'YEARLY'
  WHEN 2 THEN 'HALF-YEARLY'
  WHEN 3 THEN 'QUARTERLY'
END 
from Policy
GO

