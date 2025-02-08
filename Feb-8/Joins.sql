select A.AgentID, FirstName, LastName,City,State,
IsSplitAgent
from Agent A INNER JOIN AgentPolicy AP 
ON A.AgentID = AP.AgentID
GO

select P.PolicyID, AppNumber, ModalPremium, AnnualPremium, IsSplitAgent
From Policy P INNER JOIN AgentPolicy AP 
ON P.PolicyID = AP.PolicyID
GO


select  A.AgentID, FirstName, LastName,City, SSN,
P.PolicyID, AppNumber, ModalPremium, AnnualPremium, PayMentModelID,
IsSplitAgent
from Agent A INNER JOIN AgentPolicy AP 
ON A.AgentID = AP.AgentID 
INNER JOIN Policy P ON P.PolicyID = AP.PolicyID
GO


select  A.AgentID, FirstName, LastName,City, SSN,
P.PolicyID, AppNumber, ModalPremium, AnnualPremium, PayMentModelID,
IsSplitAgent
from Agent A LEFT JOIN AgentPolicy AP 
ON A.AgentID = AP.AgentID 
LEFT JOIN Policy P ON P.PolicyID = AP.PolicyID
GO


select  A.AgentID, FirstName, LastName,City, SSN,
P.PolicyID, AppNumber, ModalPremium, AnnualPremium, PayMentModelID,
IsSplitAgent
from Agent A RIGHT JOIN AgentPolicy AP 
ON A.AgentID = AP.AgentID 
RIGHT JOIN Policy P ON P.PolicyID = AP.PolicyID
GO

select  A.AgentID, FirstName, LastName,City, SSN,
P.PolicyID, AppNumber, ModalPremium, AnnualPremium, PayMentModelID,
IsSplitAgent
from Agent A FULL JOIN AgentPolicy AP 
ON A.AgentID = AP.AgentID 
FULL JOIN Policy P ON P.PolicyID = AP.PolicyID
GO

select * from Agent Cross Join AgentPolicy;
