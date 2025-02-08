USE [master]
GO

drop database sqlpractice1
go

/****** Object:  Database [sqlpractice]    Script Date: 24-08-2022 15:25:42 ******/
CREATE DATABASE [sqlpractice1]
go
USE [sqlpractice1]
GO
/****** Object:  Default [defInsBy]    Script Date: 24-08-2022 15:25:44 ******/
CREATE DEFAULT [dbo].[defInsBy] 
AS
system_user
GO
/****** Object:  Default [definson]    Script Date: 24-08-2022 15:25:44 ******/
CREATE DEFAULT [dbo].[definson] 
AS
getdate()
GO
/****** Object:  Rule [genRule]    Script Date: 24-08-2022 15:25:44 ******/
CREATE RULE [dbo].[genRule] 
AS
@gender 
in('Male','Female')
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[PolicyID] [int] IDENTITY(1,1) NOT NULL,
	[AppNumber] [varchar](20) NULL,
	[AppDate] [datetime] NULL,
	[PolicyNumber] [varchar](25) NULL,
	[AnnualPremium] [numeric](9, 2) NULL,
	[PayMentModelID] [int] NULL,
	[ModalPremium] [numeric](9, 2) NULL,
	[InsertedOn] [datetime] NULL,
	[InsertedBy] [varchar](15) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](15) NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [varchar](20) NULL,
 CONSTRAINT [pk_policy] PRIMARY KEY CLUSTERED 
(
	[PolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPolicy]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPolicy](
	[AgentID] [int] NOT NULL,
	[PolicyID] [int] NOT NULL,
	[IsSplitAgent] [int] NULL,
	[InsertedOn] [datetime] NULL,
	[InsertedBy] [varchar](20) NULL,
 CONSTRAINT [pk_ag_ap] PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC,
	[PolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NULL,
	[MI] [varchar](1) NULL,
	[LastName] [varchar](25) NULL,
	[FullName] [varchar](40) NULL,
	[Gender] [varchar](7) NULL,
	[DOB] [datetime] NULL,
	[SSN] [varchar](20) NULL,
	[MaritalStatus] [tinyint] NULL,
	[Address1] [varchar](20) NOT NULL,
	[Address2] [varchar](20) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[ZipCode] [varchar](20) NULL,
	[Country] [varchar](25) NULL,
	[InsertedOn] [datetime] NULL,
	[InsertedBy] [varchar](20) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [varchar](20) NULL,
 CONSTRAINT [pk_agent] PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwAgentPolicy]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwAgentPolicy]
as
select A.AgentID,FirstName,LastName,City,SSN,
IsSplitAgent,PaymentModelID,ModalPremium,AnnualPremium
from Agent A inner Join AgentPolicy AP on
A.AgentID=AP.AgentID Inner Join Policy P
on P.PolicyID=AP.PolicyID
GO
/****** Object:  Table [dbo].[AgentDup]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentDup](
	[AgentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NULL,
	[MI] [varchar](1) NULL,
	[LastName] [varchar](25) NULL,
	[FullName] [varchar](40) NULL,
	[Gender] [varchar](7) NULL,
	[DOB] [datetime] NULL,
	[SSN] [varchar](20) NULL,
	[MaritalStatus] [tinyint] NULL,
	[Address1] [varchar](20) NOT NULL,
	[Address2] [varchar](20) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[ZipCode] [varchar](20) NULL,
	[Country] [varchar](25) NULL,
	[InsertedOn] [datetime] NULL,
	[InsertedBy] [varchar](20) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPart]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPart](
	[AgentID] [int] IDENTITY(1,1) NOT NULL,
	[Address1] [varchar](20) NOT NULL,
	[Address2] [varchar](20) NOT NULL,
	[Gender] [varchar](7) NULL,
	[DOB] [datetime] NULL,
	[Zipcode] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMp]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMp](
	[Empno] [int] NOT NULL,
	[nam] [nvarchar](50) NULL,
	[dept] [nvarchar](50) NULL,
	[desig] [nvarchar](50) NULL,
	[basic] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Empno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emp_Found]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emp_Found](
	[Empno] [int] NOT NULL,
	[nam] [nvarchar](100) NULL,
	[dept] [nvarchar](50) NULL,
	[desig] [nvarchar](50) NULL,
	[basic] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emp_NotFound]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emp_NotFound](
	[Empno] [int] NOT NULL,
	[nam] [nvarchar](100) NULL,
	[dept] [nvarchar](50) NULL,
	[desig] [nvarchar](50) NULL,
	[basic] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpMgr]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpMgr](
	[Empno] [int] NOT NULL,
	[Nam] [varchar](30) NULL,
	[Basic] [numeric](9, 2) NULL,
	[MgrNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Empno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpRawData]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpRawData](
	[Empno] [int] NOT NULL,
	[nam] [nvarchar](50) NULL,
	[dept] [nvarchar](50) NULL,
	[desig] [nvarchar](50) NULL,
	[basic] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emps]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emps](
	[Empno] [int] NOT NULL,
	[Nam] [varchar](30) NULL,
	[Dept] [varchar](30) NULL,
	[Desig] [varchar](30) NULL,
	[basic] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Empno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewTab]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewTab](
	[PolicyID] [int] NOT NULL,
	[AnnualPremium] [numeric](9, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Sno] [int] NOT NULL,
	[Nam] [varchar](30) NULL,
	[Sub1] [int] NULL,
	[Sub2] [int] NULL,
	[Sub3] [int] NULL,
	[Tot] [int] NULL,
	[Aveg] [float] NULL,
	[InsertedOn] [datetime] NULL,
	[InsertedBy] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Sno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp](
	[Eno] [int] NULL,
	[Nam] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempTable]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempTable](
	[PolicyID] [int] IDENTITY(1,1) NOT NULL,
	[AnnualPremium] [numeric](9, 2) NULL,
	[Rank] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[ID] [int] NULL,
	[Nam] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24-08-2022 15:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userName] [varchar](30) NOT NULL,
	[Passcode] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([AgentID], [FirstName], [MI], [LastName], [FullName], [Gender], [DOB], [SSN], [MaritalStatus], [Address1], [Address2], [City], [State], [ZipCode], [Country], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (1, N'lavanya', N'S', N'K', N'Lavanya S K', N'FeMale', CAST(N'1988-12-12T00:00:00.000' AS DateTime), N'335-44-2344', 0, N'LIG B87', N'ASRAO NR', N'SECBAD', N'AP', N'500062', N'INDIA', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Agent] ([AgentID], [FirstName], [MI], [LastName], [FullName], [Gender], [DOB], [SSN], [MaritalStatus], [Address1], [Address2], [City], [State], [ZipCode], [Country], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (2, N'murali', N'S', N'Krishna', N'Murali S Krishna', N'Male', CAST(N'1986-09-03T00:00:00.000' AS DateTime), N'234-44-2335', 1, N'RK HOstel', N'Ameerpet', N'HYDBAD', N'AP', N'500042', N'INDIA', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Agent] ([AgentID], [FirstName], [MI], [LastName], [FullName], [Gender], [DOB], [SSN], [MaritalStatus], [Address1], [Address2], [City], [State], [ZipCode], [Country], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (3, N'raj', N'S', N'KUMAR', N'Raj S kumar', N'Male', CAST(N'1987-12-12T00:00:00.000' AS DateTime), N'345-23-4211', 0, N'MadhaPur', N'Nr Cyber Towers', N'HYDBAD', N'AP', N'509244', N'INDIA', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Agent] ([AgentID], [FirstName], [MI], [LastName], [FullName], [Gender], [DOB], [SSN], [MaritalStatus], [Address1], [Address2], [City], [State], [ZipCode], [Country], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (4, N'srimukha', N'S', N'Manchu', N'Srimukha S Manchu', N'FeMale', CAST(N'1986-09-03T00:00:00.000' AS DateTime), N'231-44-2335', 0, N'NRS', N'Madhapur', N'HYDBAD', N'AP', N'500042', N'INDIA', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Agent] ([AgentID], [FirstName], [MI], [LastName], [FullName], [Gender], [DOB], [SSN], [MaritalStatus], [Address1], [Address2], [City], [State], [ZipCode], [Country], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (5, N'lalitha', N'S', N'B', N'Lalitha S B', N'FeMale', CAST(N'1987-12-21T00:00:00.000' AS DateTime), N'341-23-4211', 0, N'KondaPur', N'Nr Stadium', N'HYDBAD', N'AP', N'509244', N'INDIA', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Agent] ([AgentID], [FirstName], [MI], [LastName], [FullName], [Gender], [DOB], [SSN], [MaritalStatus], [Address1], [Address2], [City], [State], [ZipCode], [Country], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (6, N'rakesh', N'K', N'CHOWDARY', N'Rakesh K Chowdary', N'Male', CAST(N'1986-01-02T00:00:00.000' AS DateTime), N'123-23-2444', 1, N'8th Mile', N'Church Road', N'Detroit', N'MI', N'484555', N'USA', CAST(N'2011-12-12T21:01:41.873' AS DateTime), N'Prasanna', NULL, NULL, NULL, NULL)
INSERT [dbo].[Agent] ([AgentID], [FirstName], [MI], [LastName], [FullName], [Gender], [DOB], [SSN], [MaritalStatus], [Address1], [Address2], [City], [State], [ZipCode], [Country], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (7, N'rama', N'U', N'RAO', N'Rama U Rao', N'Male', CAST(N'1983-01-02T00:00:00.000' AS DateTime), N'223-43-1444', 1, N'5th Mile', N'Ford Street', N'Chicago', N'NY', N'2484555', N'USA', CAST(N'2011-12-12T21:01:41.873' AS DateTime), N'Prasanna', NULL, NULL, NULL, NULL)
INSERT [dbo].[Agent] ([AgentID], [FirstName], [MI], [LastName], [FullName], [Gender], [DOB], [SSN], [MaritalStatus], [Address1], [Address2], [City], [State], [ZipCode], [Country], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (8, N'madhuri', N'S', N'M', N'Madhuri S M', N'FeMale', CAST(N'1989-12-12T00:00:00.000' AS DateTime), N'423-33-2444', 1, N'Beach Street', N'Univ Road', N'NewYork', N'CT', N'5484555', N'USA', CAST(N'2011-12-12T21:01:41.873' AS DateTime), N'Prasanna', NULL, NULL, NULL, NULL)
INSERT [dbo].[Agent] ([AgentID], [FirstName], [MI], [LastName], [FullName], [Gender], [DOB], [SSN], [MaritalStatus], [Address1], [Address2], [City], [State], [ZipCode], [Country], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (16, N'usman', N'H', N'Humayoon', N'Usman H Humayoon', N'Male', CAST(N'1987-01-02T00:00:00.000' AS DateTime), N'123-44-2355', 1, N'8th Mile', N'S Heights', N'Parlin', N'NJ', N'08854', N'USA', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Agent] ([AgentID], [FirstName], [MI], [LastName], [FullName], [Gender], [DOB], [SSN], [MaritalStatus], [Address1], [Address2], [City], [State], [ZipCode], [Country], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (18, N'uma', N'A', N'Aith', N'Uma A Aith', N'Female', CAST(N'1988-01-02T00:00:00.000' AS DateTime), N'123-44-2113', 1, N'klj', N'lkj', N'ljk', N'lkj', N'84345', N'USA', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Agent] ([AgentID], [FirstName], [MI], [LastName], [FullName], [Gender], [DOB], [SSN], [MaritalStatus], [Address1], [Address2], [City], [State], [ZipCode], [Country], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (26, N'Shweta', N'S', N'Srivastav', N'Shweta S Srivastav', N'Female', CAST(N'1987-01-02T00:00:00.000' AS DateTime), N'355-23-5534', 1, N'Rachel Street', N'8th Mile', N'NewYork', N'NJ', N'4838', N'USA', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Agent] ([AgentID], [FirstName], [MI], [LastName], [FullName], [Gender], [DOB], [SSN], [MaritalStatus], [Address1], [Address2], [City], [State], [ZipCode], [Country], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (27, N'Pranay', N'R', N'Poola', N'Pranay Poola', N'Male', CAST(N'1987-01-02T00:00:00.000' AS DateTime), N'323-44-2355', 0, N'lkjlk', N'lkjkj', N'kjjjl', N'klklj', N'48344', N'USA', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Agent] ([AgentID], [FirstName], [MI], [LastName], [FullName], [Gender], [DOB], [SSN], [MaritalStatus], [Address1], [Address2], [City], [State], [ZipCode], [Country], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (28, N'Suhaas', N'S', N'Kandala', N'Suhaas S Kandala', N'Male', CAST(N'2010-01-15T00:00:00.000' AS DateTime), N'123-44-4366', 0, N'lkjljk', N'lkjjkl', N'jkljk', N'akjf', N'83444', N'INDIA', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[AgentPart] ON 

INSERT [dbo].[AgentPart] ([AgentID], [Address1], [Address2], [Gender], [DOB], [Zipcode]) VALUES (1, N'LIG B87', N'ASRAO NR', N'FeMale', CAST(N'1988-12-12T00:00:00.000' AS DateTime), N'500062')
INSERT [dbo].[AgentPart] ([AgentID], [Address1], [Address2], [Gender], [DOB], [Zipcode]) VALUES (2, N'RK HOstel', N'Ameerpet', N'Male', CAST(N'1986-09-03T00:00:00.000' AS DateTime), N'500042')
INSERT [dbo].[AgentPart] ([AgentID], [Address1], [Address2], [Gender], [DOB], [Zipcode]) VALUES (3, N'MadhaPur', N'Nr Cyber Towers', N'Male', CAST(N'1987-12-12T00:00:00.000' AS DateTime), N'509244')
INSERT [dbo].[AgentPart] ([AgentID], [Address1], [Address2], [Gender], [DOB], [Zipcode]) VALUES (4, N'NRS', N'Madhapur', N'FeMale', CAST(N'1986-09-03T00:00:00.000' AS DateTime), N'500042')
INSERT [dbo].[AgentPart] ([AgentID], [Address1], [Address2], [Gender], [DOB], [Zipcode]) VALUES (5, N'KondaPur', N'Nr Stadium', N'FeMale', CAST(N'1987-12-21T00:00:00.000' AS DateTime), N'509244')
INSERT [dbo].[AgentPart] ([AgentID], [Address1], [Address2], [Gender], [DOB], [Zipcode]) VALUES (6, N'8th Mile', N'Church Road', N'Male', CAST(N'1986-01-02T00:00:00.000' AS DateTime), N'484555')
INSERT [dbo].[AgentPart] ([AgentID], [Address1], [Address2], [Gender], [DOB], [Zipcode]) VALUES (7, N'5th Mile', N'Ford Street', N'Male', CAST(N'1983-01-02T00:00:00.000' AS DateTime), N'2484555')
INSERT [dbo].[AgentPart] ([AgentID], [Address1], [Address2], [Gender], [DOB], [Zipcode]) VALUES (8, N'Beach Street', N'Univ Road', N'FeMale', CAST(N'1989-12-12T00:00:00.000' AS DateTime), N'5484555')
INSERT [dbo].[AgentPart] ([AgentID], [Address1], [Address2], [Gender], [DOB], [Zipcode]) VALUES (9, N'8th Mile', N'IBM Road', N'FeMale', CAST(N'1987-01-02T00:00:00.000' AS DateTime), N'484555')
INSERT [dbo].[AgentPart] ([AgentID], [Address1], [Address2], [Gender], [DOB], [Zipcode]) VALUES (10, N'ASRAO NR', N'Good Luck Cafe', N'Male', CAST(N'1980-09-03T00:00:00.000' AS DateTime), N'500 062')
INSERT [dbo].[AgentPart] ([AgentID], [Address1], [Address2], [Gender], [DOB], [Zipcode]) VALUES (16, N'8th Mile', N'S Heights', N'Male', CAST(N'1987-01-02T00:00:00.000' AS DateTime), N'08854')
INSERT [dbo].[AgentPart] ([AgentID], [Address1], [Address2], [Gender], [DOB], [Zipcode]) VALUES (17, N'8th Mile', N'Ford Street', N'Female', CAST(N'1988-01-02T00:00:00.000' AS DateTime), N'84344')
INSERT [dbo].[AgentPart] ([AgentID], [Address1], [Address2], [Gender], [DOB], [Zipcode]) VALUES (18, N'klj', N'lkj', N'Female', CAST(N'1988-01-02T00:00:00.000' AS DateTime), N'84345')
INSERT [dbo].[AgentPart] ([AgentID], [Address1], [Address2], [Gender], [DOB], [Zipcode]) VALUES (22, N'AS RAO nagar', N'Saketh', N'Male', CAST(N'1992-01-02T00:00:00.000' AS DateTime), N'43454')
INSERT [dbo].[AgentPart] ([AgentID], [Address1], [Address2], [Gender], [DOB], [Zipcode]) VALUES (23, N'lkkj', N'ljk', N'Male', CAST(N'1976-01-02T00:00:00.000' AS DateTime), N'564463')
SET IDENTITY_INSERT [dbo].[AgentPart] OFF
GO
INSERT [dbo].[AgentPolicy] ([AgentID], [PolicyID], [IsSplitAgent], [InsertedOn], [InsertedBy]) VALUES (1, 1, 2, CAST(N'2011-12-12T21:01:42.030' AS DateTime), N'MANOJ')
INSERT [dbo].[AgentPolicy] ([AgentID], [PolicyID], [IsSplitAgent], [InsertedOn], [InsertedBy]) VALUES (2, 1, 1, CAST(N'2011-12-12T21:01:42.107' AS DateTime), N'MANOJ')
INSERT [dbo].[AgentPolicy] ([AgentID], [PolicyID], [IsSplitAgent], [InsertedOn], [InsertedBy]) VALUES (2, 3, 1, CAST(N'2011-12-12T21:01:42.107' AS DateTime), N'MANOJ')
INSERT [dbo].[AgentPolicy] ([AgentID], [PolicyID], [IsSplitAgent], [InsertedOn], [InsertedBy]) VALUES (2, 5, 1, CAST(N'2011-12-12T21:01:42.107' AS DateTime), N'MANOJ')
INSERT [dbo].[AgentPolicy] ([AgentID], [PolicyID], [IsSplitAgent], [InsertedOn], [InsertedBy]) VALUES (4, 1, 2, CAST(N'2011-12-12T21:01:42.107' AS DateTime), N'MANOJ')
INSERT [dbo].[AgentPolicy] ([AgentID], [PolicyID], [IsSplitAgent], [InsertedOn], [InsertedBy]) VALUES (4, 3, 1, CAST(N'2011-12-12T21:01:42.123' AS DateTime), N'MANOJ')
INSERT [dbo].[AgentPolicy] ([AgentID], [PolicyID], [IsSplitAgent], [InsertedOn], [InsertedBy]) VALUES (5, 1, 2, CAST(N'2011-12-12T21:01:42.123' AS DateTime), N'MANOJ')
INSERT [dbo].[AgentPolicy] ([AgentID], [PolicyID], [IsSplitAgent], [InsertedOn], [InsertedBy]) VALUES (5, 2, 1, CAST(N'2011-12-12T21:01:42.123' AS DateTime), N'MANOJ')
GO
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (1, N'Manu', N'Dotnet', N'Programmer', 99872)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (2, N'kiran', N'DOTNET', N'programmer', 43211)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (3, N'saikiran', N'JAVA', N'Manager                       ', 60000)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (4, N'Abhishek Anand                      ', N'JAVA                          ', N'Programmer                    ', 38445)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (5, N'satish', N'DOTNET', N'programmer', 44322)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (7, N'kalyan', N'SQL', N'expert', 42233)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (8, N'Naveen Puliveli', N'DOTNET', N'Programmer', 43211)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (10, N'Ari, Sai varshini', N'MVC', N'Expert', 94224)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (11, N'Manikanta Chitined', N'Asp.net MVC', N'Manager', 99992)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (192, N'Sai Akhil', N'Dotnet', N'expert', 94422)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (802, N'Rakesh Ranjan Puhan', N'JAVA', N'Programmer', 84221)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (902, N'Swapna', N'Dotnet', N'Programmer', 88823)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (903, N'Smitha                        ', N'JAVA                          ', N'Programmer                    ', 48344)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (907, N'Ashima                        ', N'JAVA                          ', N'Manager                       ', 66344)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (983, N'Mano', N'Dotnet', N'Programmer', 88234)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (988, N'Sonam Kapoor', N'Asp.net MVC', N'Manager', 99999)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (1001, N'Sakshi Shelke', N'Asp.net MVC', N'Manager', 99999)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (1024, N'Sai Santosh Kumar                     ', N'JAVA                          ', N'Manager                       ', 58855)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (1144, N'Sakshi Dhoka', N'Dotnet MVC', N'Expert', 99145)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (1844, N'Swapna', N'Dotne', N'Programmer', 82333)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (3444, N'Manali Joshi', N'Asp.net', N'Expert', 91919)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9011, N'Swetha Aki', N'Dotnet MVC', N'Manager', 99888)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9014, N'Mahitha', N'Dotnet', N'Programmer', 97222)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9022, N'Rohan Mane', N'Asp.Net MVC', N'expert', 98234)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9032, N'Rushi                         ', N'JAVA                          ', N'Programmer                    ', 48434)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9044, N'Raj', N'Java', N'Programmer', 92344)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9052, N'Swetha', N'Dotnet', N'Programmer', 99234)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9081, N'Swetha', N'Dotnet', N'Programmer', 99211)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9088, N'Moumitha Roy', N'Asp.net', N'Expert', 99913)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9093, N'Mahitha', N'Dotnet', N'Programmer', 99442)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9144, N'Srikanth', N'Dotnet', N'Programmer', 99923)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (11143, N'Sriman', N'Recruitment', N'Manager', 99991)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (90455, N'Mahitha Reddy', N'WCF', N'Expert', 99234)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (90833, N'Ranjan', N'Dotnet', N'Programmer', 99921)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (96522, N'Mahitha Reddy', N'Dotnet', N'Programmer', 99211)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (96523, N'Anand', N'Dotnet', N'Programmer', 98833)
INSERT [dbo].[EMp] ([Empno], [nam], [dept], [desig], [basic]) VALUES (96524, N'Joashb', N'Dotnet', N'Programmer', 99422)
GO
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (1, N'prasanna', N'dotnet', N'trainer', 48585)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (2, N'asharful', N'sql', N'expert', 58844)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (3, N'joveria', N'hr', N'admin', 68666)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (4, N'ali', N'cognos', N'expert', 58333)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (5, N'sharjeel', N'cognos', N'expert', 68684)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (1, N'ashish', N'JAVA', N'programmer', 43444)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (2, N'kiran', N'DOTNET', N'programmer', 43211)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (3, N'saikiran', N'JAVA', N'Manager                       ', 60000)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (4, N'Akhilesh                      ', N'JAVA                          ', N'Programmer                    ', 38445)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (5, N'satish', N'DOTNET', N'programmer', 44322)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (6, N'Ashish                        ', N'JAVA                          ', N'Expert                        ', 48343)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (7, N'kalyan', N'SQL', N'expert', 42233)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (8, N'Sriman', N'DOTNET', N'Programmer', 43211)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (16, N'Harry', N'SQL', N'Expert', 54855)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (198, N'Ashima                        ', N'JAVA                          ', N'Programmer                    ', 48344)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (543, N'Akhilesh                      ', N'JAVA                          ', N'Programmer                    ', 48344)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (802, N'Dattu', N'JAVA', N'Programmer', 84221)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (888, N'Praveen                       ', N'TRAINIG                       ', N'Manager                       ', 43443)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (894, N'Vineeth                       ', N'JAVA                          ', N'Programmer                    ', 43444)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (903, N'Smitha                        ', N'JAVA                          ', N'Programmer                    ', 48344)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (907, N'Ashima                        ', N'JAVA                          ', N'Manager                       ', 66344)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (943, N'Avinash                       ', N'JAVA                          ', N'Programmer                    ', 84834)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (1024, N'Jyothi                        ', N'JAVA                          ', N'Manager                       ', 58855)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9032, N'Rushi                         ', N'JAVA                          ', N'Programmer                    ', 48434)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9321, N'vineeth                       ', N'JAVA                          ', N'programmer                    ', 48344)
INSERT [dbo].[Emp_Found] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9323, N'Ashima                        ', N'JAVA                          ', N'expert                        ', 48844)
GO
INSERT [dbo].[Emp_NotFound] ([Empno], [nam], [dept], [desig], [basic]) VALUES (3, N'SAIKIRAN', N'JAVA', N'Manager', 60000)
INSERT [dbo].[Emp_NotFound] ([Empno], [nam], [dept], [desig], [basic]) VALUES (16, N'HARRY', N'SQL', N'Expert', 54855)
INSERT [dbo].[Emp_NotFound] ([Empno], [nam], [dept], [desig], [basic]) VALUES (802, N'DATTU', N'JAVA', N'Programmer', 84221)
INSERT [dbo].[Emp_NotFound] ([Empno], [nam], [dept], [desig], [basic]) VALUES (907, N'ASHIMA', N'JAVA', N'Manager', 66344)
INSERT [dbo].[Emp_NotFound] ([Empno], [nam], [dept], [desig], [basic]) VALUES (943, N'AVINASH', N'JAVA', N'Programmer', 84834)
INSERT [dbo].[Emp_NotFound] ([Empno], [nam], [dept], [desig], [basic]) VALUES (1024, N'JYOTHI', N'JAVA', N'Manager', 58855)
GO
INSERT [dbo].[EmpMgr] ([Empno], [Nam], [Basic], [MgrNo]) VALUES (1, N'Satish', CAST(34555.00 AS Numeric(9, 2)), NULL)
INSERT [dbo].[EmpMgr] ([Empno], [Nam], [Basic], [MgrNo]) VALUES (2, N'Sireesha', CAST(33222.00 AS Numeric(9, 2)), 1)
INSERT [dbo].[EmpMgr] ([Empno], [Nam], [Basic], [MgrNo]) VALUES (3, N'Prasanna', CAST(23333.00 AS Numeric(9, 2)), 1)
INSERT [dbo].[EmpMgr] ([Empno], [Nam], [Basic], [MgrNo]) VALUES (4, N'Shurthi Reddy', CAST(43333.00 AS Numeric(9, 2)), 3)
INSERT [dbo].[EmpMgr] ([Empno], [Nam], [Basic], [MgrNo]) VALUES (5, N'Harry', CAST(31222.00 AS Numeric(9, 2)), 3)
INSERT [dbo].[EmpMgr] ([Empno], [Nam], [Basic], [MgrNo]) VALUES (7, N'Padmaja', CAST(23333.00 AS Numeric(9, 2)), 2)
INSERT [dbo].[EmpMgr] ([Empno], [Nam], [Basic], [MgrNo]) VALUES (8, N'Mubeena', CAST(21222.00 AS Numeric(9, 2)), 2)
GO
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (1, N'ashish', N'JAVA', N'programmer', 43444)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (2, N'kiran', N'DOTNET', N'programmer', 43211)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (3, N'saikiran', N'JAVA', N'Manager                       ', 60000)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (4, N'Akhilesh                      ', N'JAVA                          ', N'Programmer                    ', 38445)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (5, N'satish', N'DOTNET', N'programmer', 44322)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (6, N'Ashish                        ', N'JAVA                          ', N'Expert                        ', 48343)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (7, N'kalyan', N'SQL', N'expert', 42233)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (8, N'Sriman', N'DOTNET', N'Programmer', 43211)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (16, N'Harry', N'SQL', N'Expert', 54855)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (198, N'Ashima                        ', N'JAVA                          ', N'Programmer                    ', 48344)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (543, N'Akhilesh                      ', N'JAVA                          ', N'Programmer                    ', 48344)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (802, N'Dattu', N'JAVA', N'Programmer', 84221)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (888, N'Praveen                       ', N'TRAINIG                       ', N'Manager                       ', 43443)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (894, N'Vineeth                       ', N'JAVA                          ', N'Programmer                    ', 43444)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (903, N'Smitha                        ', N'JAVA                          ', N'Programmer                    ', 48344)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (907, N'Ashima                        ', N'JAVA                          ', N'Manager                       ', 66344)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (943, N'Avinash                       ', N'JAVA                          ', N'Programmer                    ', 84834)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (1024, N'Jyothi                        ', N'JAVA                          ', N'Manager                       ', 58855)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9032, N'Rushi                         ', N'JAVA                          ', N'Programmer                    ', 48434)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9321, N'vineeth                       ', N'JAVA                          ', N'programmer                    ', 48344)
INSERT [dbo].[EmpRawData] ([Empno], [nam], [dept], [desig], [basic]) VALUES (9323, N'Ashima                        ', N'JAVA                          ', N'expert                        ', 48844)
GO
INSERT [dbo].[Emps] ([Empno], [Nam], [Dept], [Desig], [basic]) VALUES (1, N'Sowjanya', N'Asp', N'Programmer', 48344)
GO
INSERT [dbo].[NewTab] ([PolicyID], [AnnualPremium]) VALUES (1, CAST(232000.00 AS Numeric(9, 2)))
INSERT [dbo].[NewTab] ([PolicyID], [AnnualPremium]) VALUES (4, CAST(192000.00 AS Numeric(9, 2)))
INSERT [dbo].[NewTab] ([PolicyID], [AnnualPremium]) VALUES (5, CAST(150000.00 AS Numeric(9, 2)))
INSERT [dbo].[NewTab] ([PolicyID], [AnnualPremium]) VALUES (6, CAST(122000.00 AS Numeric(9, 2)))
INSERT [dbo].[NewTab] ([PolicyID], [AnnualPremium]) VALUES (8, CAST(22000.00 AS Numeric(9, 2)))
INSERT [dbo].[NewTab] ([PolicyID], [AnnualPremium]) VALUES (9, CAST(20000.00 AS Numeric(9, 2)))
GO
SET IDENTITY_INSERT [dbo].[Policy] ON 

INSERT [dbo].[Policy] ([PolicyID], [AppNumber], [AppDate], [PolicyNumber], [AnnualPremium], [PayMentModelID], [ModalPremium], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (1, N'A001', CAST(N'2010-12-12T00:00:00.000' AS DateTime), N'C001', CAST(232000.00 AS Numeric(9, 2)), 2, CAST(2000.00 AS Numeric(9, 2)), CAST(N'2011-12-12T21:01:41.887' AS DateTime), N'RAKESH', NULL, NULL, NULL, NULL)
INSERT [dbo].[Policy] ([PolicyID], [AppNumber], [AppDate], [PolicyNumber], [AnnualPremium], [PayMentModelID], [ModalPremium], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (2, N'A002', CAST(N'2010-12-12T00:00:00.000' AS DateTime), N'C002', CAST(20000.00 AS Numeric(9, 2)), 1, CAST(12000.00 AS Numeric(9, 2)), CAST(N'2011-12-12T21:01:41.903' AS DateTime), N'RAKESH', NULL, NULL, NULL, NULL)
INSERT [dbo].[Policy] ([PolicyID], [AppNumber], [AppDate], [PolicyNumber], [AnnualPremium], [PayMentModelID], [ModalPremium], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (3, N'A003', CAST(N'2010-12-12T00:00:00.000' AS DateTime), N'C003', CAST(150000.00 AS Numeric(9, 2)), 1, CAST(20000.00 AS Numeric(9, 2)), CAST(N'2011-12-12T21:01:41.903' AS DateTime), N'PRASANNA', NULL, NULL, NULL, NULL)
INSERT [dbo].[Policy] ([PolicyID], [AppNumber], [AppDate], [PolicyNumber], [AnnualPremium], [PayMentModelID], [ModalPremium], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (4, N'A004', CAST(N'2005-01-02T00:00:00.000' AS DateTime), N'P001', CAST(22000.00 AS Numeric(9, 2)), 1, CAST(1000.00 AS Numeric(9, 2)), CAST(N'2011-12-12T21:01:41.933' AS DateTime), N'RAKESH', NULL, NULL, NULL, NULL)
INSERT [dbo].[Policy] ([PolicyID], [AppNumber], [AppDate], [PolicyNumber], [AnnualPremium], [PayMentModelID], [ModalPremium], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (5, N'A005', CAST(N'2009-03-09T00:00:00.000' AS DateTime), N'S231', CAST(122000.00 AS Numeric(9, 2)), 2, CAST(22000.00 AS Numeric(9, 2)), CAST(N'2011-12-12T21:01:41.933' AS DateTime), N'MANOJ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Policy] ([PolicyID], [AppNumber], [AppDate], [PolicyNumber], [AnnualPremium], [PayMentModelID], [ModalPremium], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (6, N'A006', CAST(N'2010-02-12T00:00:00.000' AS DateTime), N'A131', CAST(232000.00 AS Numeric(9, 2)), 2, CAST(21000.00 AS Numeric(9, 2)), CAST(N'2009-01-02T00:00:00.000' AS DateTime), N'MANOJ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Policy] ([PolicyID], [AppNumber], [AppDate], [PolicyNumber], [AnnualPremium], [PayMentModelID], [ModalPremium], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (7, N'A007', CAST(N'2007-09-12T00:00:00.000' AS DateTime), N'P231', CAST(232000.00 AS Numeric(9, 2)), 2, CAST(23000.00 AS Numeric(9, 2)), CAST(N'2011-12-12T21:01:41.933' AS DateTime), N'SAILAJA', NULL, NULL, NULL, NULL)
INSERT [dbo].[Policy] ([PolicyID], [AppNumber], [AppDate], [PolicyNumber], [AnnualPremium], [PayMentModelID], [ModalPremium], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (8, N'A008', CAST(N'2009-03-09T00:00:00.000' AS DateTime), N'S231', CAST(122000.00 AS Numeric(9, 2)), 2, CAST(22000.00 AS Numeric(9, 2)), CAST(N'2010-01-23T00:00:00.000' AS DateTime), N'MANOJ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Policy] ([PolicyID], [AppNumber], [AppDate], [PolicyNumber], [AnnualPremium], [PayMentModelID], [ModalPremium], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy], [DeletedOn], [DeletedBy]) VALUES (9, N'A009', CAST(N'2009-03-09T00:00:00.000' AS DateTime), N'I231', CAST(192000.00 AS Numeric(9, 2)), 1, CAST(24000.00 AS Numeric(9, 2)), CAST(N'2007-01-09T00:00:00.000' AS DateTime), N'MANOJ', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Policy] OFF
GO
INSERT [dbo].[Student] ([Sno], [Nam], [Sub1], [Sub2], [Sub3], [Tot], [Aveg], [InsertedOn], [InsertedBy]) VALUES (1, N'Prasanna', 66, 75, 56, 197, 65, CAST(N'2011-12-20T00:13:08.967' AS DateTime), N'sa')
GO
SET IDENTITY_INSERT [dbo].[TempTable] ON 

INSERT [dbo].[TempTable] ([PolicyID], [AnnualPremium], [Rank]) VALUES (1, CAST(232000.00 AS Numeric(9, 2)), 1)
INSERT [dbo].[TempTable] ([PolicyID], [AnnualPremium], [Rank]) VALUES (6, CAST(232000.00 AS Numeric(9, 2)), 1)
INSERT [dbo].[TempTable] ([PolicyID], [AnnualPremium], [Rank]) VALUES (7, CAST(232000.00 AS Numeric(9, 2)), 1)
INSERT [dbo].[TempTable] ([PolicyID], [AnnualPremium], [Rank]) VALUES (9, CAST(192000.00 AS Numeric(9, 2)), 4)
INSERT [dbo].[TempTable] ([PolicyID], [AnnualPremium], [Rank]) VALUES (3, CAST(150000.00 AS Numeric(9, 2)), 5)
INSERT [dbo].[TempTable] ([PolicyID], [AnnualPremium], [Rank]) VALUES (5, CAST(122000.00 AS Numeric(9, 2)), 6)
INSERT [dbo].[TempTable] ([PolicyID], [AnnualPremium], [Rank]) VALUES (8, CAST(122000.00 AS Numeric(9, 2)), 6)
INSERT [dbo].[TempTable] ([PolicyID], [AnnualPremium], [Rank]) VALUES (4, CAST(22000.00 AS Numeric(9, 2)), 8)
INSERT [dbo].[TempTable] ([PolicyID], [AnnualPremium], [Rank]) VALUES (2, CAST(20000.00 AS Numeric(9, 2)), 9)
SET IDENTITY_INSERT [dbo].[TempTable] OFF
GO
INSERT [dbo].[Users] ([userName], [Passcode]) VALUES (N'Arka', N'Mitra')
INSERT [dbo].[Users] ([userName], [Passcode]) VALUES (N'Lamiya', N'Sanadi')
INSERT [dbo].[Users] ([userName], [Passcode]) VALUES (N'Nikhil', N'Tagad')
INSERT [dbo].[Users] ([userName], [Passcode]) VALUES (N'Pinki', N'Chaudhary')
INSERT [dbo].[Users] ([userName], [Passcode]) VALUES (N'Subham', N'Chowdary')
GO
ALTER TABLE [dbo].[AgentPolicy]  WITH CHECK ADD  CONSTRAINT [fk_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([AgentID])
GO
ALTER TABLE [dbo].[AgentPolicy] CHECK CONSTRAINT [fk_Agent]
GO
ALTER TABLE [dbo].[AgentPolicy]  WITH CHECK ADD  CONSTRAINT [fk_Policy] FOREIGN KEY([PolicyID])
REFERENCES [dbo].[Policy] ([PolicyID])
GO
ALTER TABLE [dbo].[AgentPolicy] CHECK CONSTRAINT [fk_Policy]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [cst_DOB] CHECK  (([DOB]<=getdate()))
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [cst_DOB]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [cst_Fname] CHECK  ((NOT [FirstName] like '%[\^,@,#,$,%,&,*]%'))
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [cst_Fname]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [cst_gender] CHECK  (([gender]='Female' OR [gender]='Male'))
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [cst_gender]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [cst_Lname] CHECK  ((NOT [LastName] like '%[\^,@,#,$,%,&,*]%'))
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [cst_Lname]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [cst_ssn] CHECK  (([SSN] like '[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [cst_ssn]
GO
/****** Object:  StoredProcedure [dbo].[prcAgent]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[prcAgent] @agentid int
as
   declare @firstname varchar(30),@lastname varchar(30),
   @city varchar(30),@ssn varchar(30)
   if exists(select * from Agent where AgentID=@AgentID)
   begin
      select @firstname=FirstName,@LastName=LastName,
      @city=City,@ssn=SSN from Agent where AgentID=@AgentID
      print 'First Name  ' +@firstname
      print 'Last Name  ' +@lastname
      print 'City  ' +@city
      print 'SSN  ' +@ssn
  end
  else
    print 'Sorry Record Not Found...'
GO
/****** Object:  StoredProcedure [dbo].[PrcAgentAll]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PrcAgentAll] @FirstName varchar(40),@Mi varchar(2),  
@LastName varchar(40),@FullName varchar(60),    
@Gender varchar(10),@Dob DateTime,@SSN    
varchar(20),@MaritalStatus tinyint,@Address1 varchar(15),    
@Address2 varchar(15),@City varchar(15),@State varchar(15),  
@ZipCode varchar(15),@Country varchar(15),@AgentID int output,  
@opt int=0    
  as    
if(@opt=2)    
begin  
Insert into Agent(FirstName,MI,LastName,FullName,    
Gender,DOB,SSN,MaritalStatus,Address1,Address2,City,State,ZipCode,Country)    
values(@FirstName,@mi,@lastname,@FullName,@gender,    
 @dob,@ssn,@maritalstatus,@address1,@address2,@city,@state,@zipcode,@country)    
 select @AgentId=SCOPE_IDENTITY()    
end  
if(@opt=4)    
Update Agent set    
FirstName=isnull(@FirstName,FirstName),    
MI=isnull(@mi,MI),    
LastName=isnull(@lastname,LastName),    
Gender=isnull(@gender,Gender),    
DOB=isnull(@dob,DOB),    
SSN=isnull(@ssn,SSN),    
MaritalStatus=isnull(@maritalstatus,MaritalStatus),    
Address1=isnull(@address1,Address1),    
Address2=isnull(@address1,Address2),    
City=isnull(@city,City),    
State=isnull(@state,State),    
ZipCode=isnull(@zipcode,ZipCode),    
Country=isnull(@country,Country)    
 where AgentId=@AgentId    
if(@opt=8)    
delete from Agent where AgentId=@AgentId    
if(@opt=12)    
select FirstName=@FirstName,MI=@MI,LastName=@LastName,Gender=@Gender,DOB=@DOB,SSN=@SSN,MaritalStatus=@MaritalStatus,Address1=@Address1,Address2=@Address2,City=@City,State=@State,ZipCode=@ZipCode,Country=@Country    
 from Agent
where AgentId=AgentId    
if(@opt=10)    
select FirstName=@FirstName,MI=@MI,LastName=@LastName,Gender=@Gender,DOB=@DOB,SSN=@SSN,MaritalStatus=@MaritalStatus,Address1=@Address1,Address2=@Address2,City=@City,State=@State,ZipCode=@ZipCode,Country=@Country    
 from Agent
GO
/****** Object:  StoredProcedure [dbo].[PrcAgentDel]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PrcAgentDel] @AgentID int 
as
   delete from Agent where AgentID=@AgentID
GO
/****** Object:  StoredProcedure [dbo].[prcAgentDisp]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[prcAgentDisp] 
as
   select * from Agent
GO
/****** Object:  StoredProcedure [dbo].[prcAgentIns]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcAgentIns] @AgentID int output, @FirstName varchar(30),@MI
varchar(1),@LastName varchar(30),@FullName varchar(30),
@Gender varchar(10),@DOB DateTime,@SSN varchar(20),
@MaritalStatus int,@Address1 varchar(30),@Address2 
varchar(30),@City varchar(30),@State varchar(10),
@ZipCode varchar(25),@Country varchar(25)
as
    Insert into Agent(FirstName,MI,LastName,FullName,
Gender,DOB,SSN,MaritalStatus,Address1,Address2,City,
State,ZipCode,Country)
   values(@FirstName,@MI,@LastName,@FullName,@Gender,
@DOB,@SSN,@MaritalStatus,@Address1,@Address2,@City,
@State,@ZipCode,@Country)
   select @AgentID=Scope_Identity()
GO
/****** Object:  StoredProcedure [dbo].[prcAgentOut]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcAgentOut] @AgentId int,@FirstName varchar(30)
output,@LastName varchar(30) output,@City varchar(30) output,
@ssn varchar(30) output 
as
    select @FirstName=FirstName,@LastName=LastName,@City=CIty,
   @SSN=SSN from Agent where AgentID=@AgentID
GO
/****** Object:  StoredProcedure [dbo].[prcAgentShow]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prcAgentShow] @AgentID int 
as  
   declare @ret int,@FirstName varchar(30),@LastName varchar(30),
   @city varchar(30),@ssn varchar(30)
   exec @ret=prcAgentOut @AgentID,@FirstName output,@LastName output,
         @city output,@ssn output 
   if (@ret=0)
   begin
     print 'First Name ' +@FirstName
     print 'Last Name  ' +@LastName 
     print 'City  ' +@City 
     print 'SSN   ' +@ssn
   end
   else
    print 'Record Not Found...'
GO
/****** Object:  StoredProcedure [dbo].[PrcAgentUpd]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PrcAgentUpd] @AgentId int,@FirstName varchar(30),
@Mi varchar(1),@LastName varchar(30),@FullName varchar(60),
@gender varchar(10),@dob datetime,@ssn varchar(30),
@MaritalStatus int,@Address1 varchar(30),@Address2 varchar(30),
@City varchar(30),@State varchar(30),@zipcode varchar(30),
@country varchar(30)
as
    update agent set FirstName=IsNull(@FirstName,FirstName),
       @Mi=Isnull(@Mi,MI),LastName=Isnull(@LastName,Lastname),
    @FullName=IsNull(@FullName,FullName),Gender=IsNull(@Gender,Gender),
   DOB=isnull(@Dob,DOB),SSN=IsNull(@SSN,SSN),
   MaritalStatus=IsNull(@MaritalStatus,MaritalStatus),
   Address1=IsNull(@Address1,Address1),
   Address2=IsNull(@Address2,Address2),
   City=IsNull(@City,City),
   State=IsNull(@State,State),
   ZipCode=IsNull(@ZipCode,ZipCode),
   Country=IsNull(@Country,Country)
GO
/****** Object:  StoredProcedure [dbo].[prcCalc]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prcCalc] @a int,@b int
as
   declare @c int
   set @c=@a+@b
   print 'Sum is  ' +convert(varchar(30),@c)
GO
/****** Object:  StoredProcedure [dbo].[prcEmpCount]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prcEmpCount]
AS
BEGIN
 select count(*) cnt from Emp 
END
GO
/****** Object:  StoredProcedure [dbo].[prcEmpDelete]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prcEmpDelete]
				@empno INT
AS
BEGIN
	Delete From Emp where Empno=@empno 
END
GO
/****** Object:  StoredProcedure [dbo].[prcEmpIns]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prcEmpIns] @Empno int,@Nam varchar(30),
@Dept varchar(30),@Desig varchar(30),@bas int
as
   insert into Emps values(@Empno,@Nam,@Dept,@Desig,@bas)
GO
/****** Object:  StoredProcedure [dbo].[prcEmpInsert]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prcEmpInsert]
					@empno INT,
					@name varchar(30),
					@dept varchar(30),
					@desig varchar(30),
					@basic INT
AS
BEGIN
	Insert into EMp values(@empno,@name,@dept,@desig,@basic)
END
GO
/****** Object:  StoredProcedure [dbo].[PrcEmpInsert1]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[PrcEmpInsert1]
					@Empno INT,
					@Name varchar(30),
					@Dept varchar(30),
					@Desig varchar(30), 
					@Basic INT
AS
BEGIN
	Insert into EMp(Empno,nam,dept,desig,basic) 
		values(@Empno,@Name,@Dept,@Desig,@Basic) 
END
GO
/****** Object:  StoredProcedure [dbo].[prcEmpSearch]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prcEmpSearch]
					@empno INT
AS
BEGIN
   select * from Emp where empno=@empno
END

GO
/****** Object:  StoredProcedure [dbo].[PrcEmpSearch1]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[PrcEmpSearch1]
					@empno INT
AS
BEGIN
	Declare @name varchar(30),@dept varchar(30),@desig varchar(30),@basic INT
	If exists(select * from Emp Where Empno=@Empno) 
	BEGIN
		select @name=Nam,
			   @dept=Dept,
			   @desig=Desig,
			   @basic=Basic
		from Emp where Empno=@empno
		Print 'Employ Name  ' +@name 
		print 'Department   ' +@dept 
		Print 'Designation  ' +@desig
		print 'Basic  ' +Convert(varchar(30),@basic)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[prcEmpShow]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prcEmpShow]
AS
BEGIN
   select * from Emp
END
GO
/****** Object:  StoredProcedure [dbo].[PrcEmpTabCount]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[PrcEmpTabCount]
AS
BEGIN
	Declare @count INT
	SELECT @count=COUNT(*) FROM EMP 
	Print 'Total Records are  ' +convert(varchar(10),@count)
END
GO
/****** Object:  StoredProcedure [dbo].[prcEmpUpdate]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prcEmpUpdate]
					@empno INT,
					@name varchar(30),
					@dept varchar(30),
					@desig varchar(30),
					@basic INT
AS
BEGIN
    Update Emp set nam=@name,
				   dept=@dept,
				   desig=@desig,
				   basic=@basic 
				   WHERE Empno=@empno
END;
GO
/****** Object:  StoredProcedure [dbo].[prchello]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prchello]
as
   print 'welcome to sql server sp concept'
GO
/****** Object:  StoredProcedure [dbo].[prcPremDisp]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prcPremDisp]
as 
  declare @maxprem float
  select @maxprem=max(AnnualPremium) from Policy 
  print 'Maximum Premium is  ' +convert(varchar(10),@maxprem)
GO
/****** Object:  StoredProcedure [dbo].[prcSayHello]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prcSayHello]
As
BEGIN
   PRINT 'Welcome to Sql Server Programming...'
END
GO
/****** Object:  StoredProcedure [dbo].[prcSum]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prcSum] 
as
   declare @a int,@b int,@c int
   set @a=12
   set @b=13
   set @c=@a+@b
   print 'Sum is ' +convert(varchar(10),@c)
GO
/****** Object:  StoredProcedure [dbo].[prcTest]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[prcTest]
as
   select * from Emp where empno=1;
GO
/****** Object:  StoredProcedure [dbo].[UspAgentIns]    Script Date: 24-08-2022 15:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UspAgentIns] @FirstName varchar(40),@LastName
 varchar(40),@MI varchar(2),@Gender varchar(10),@Dob DateTime,@SSN
varchar(20),@MaritalStatus tinyint,@Address1 varchar(15),@Address2
varchar(15),@City varchar(15),@State varchar(15),@ZipCode
varchar(15),@Country varchar(15),@AgentID int out,@opt int=0
  as
if(@opt=2)
Insert into Agent(FirstName,MI,LastName,Gender,DOB,SSN,MaritalStatus,Address1,Address2,City,State,ZipCode,Country)
values(@FirstName,@mi,@lastname,@gender,@dob,@ssn,@maritalstatus,@address1,@address2,@city,@state,@zipcode,@country)
 select @AgentId=SCOPE_IDENTITY()

if(@opt=4)
Update Agent set
FirstName=isnull(@FirstName,FirstName),
MI=isnull(@mi,MI),
LastName=isnull(@lastname,LastName),
Gender=isnull(@gender,Gender),
DOB=isnull(@dob,DOB),
SSN=isnull(@ssn,SSN),
MaritalStatus=isnull(@maritalstatus,MaritalStatus),
Address1=isnull(@address1,Address1),
Address2=isnull(@address1,Address2),
City=isnull(@city,City),
State=isnull(@state,State),
ZipCode=isnull(@zipcode,ZipCode),
Country=isnull(@country,Country)
 where AgentId=@AgentId
if(@opt=8)
delete from Agent where AgentId=@AgentId
if(@opt=12)
select FirstName=@FirstName,MI=@MI,LastName=@LastName,Gender=@Gender,DOB=@DOB,SSN=@SSN,MaritalStatus=@MaritalStatus,Address1=@Address1,Address2=@Address2,City=@City,State=@State,ZipCode=@ZipCode,Country=@Country
 from Agent
where AgentId=AgentId
GO
USE [master]
GO
ALTER DATABASE [sqlpractice] SET  READ_WRITE 
GO
